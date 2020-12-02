using FluentValidation;
using FluentValidation.AspNetCore;
using location.api.Auth;
using location.api.Registrations;
using location.core.PipelineBehaviors;
using location.core.Services;
using location.core.Services.Interfaces;
using location.core.Validations;
using location.data;
using MediatR;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Server.Kestrel.Core;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json.Converters;
using OpenTracing;
using OpenTracing.Util;
using Polly;
using System;

namespace location.api
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        public void ConfigureServices(IServiceCollection services)
        {
            services.Configure<KestrelServerOptions>(opt => { opt.AllowSynchronousIO = true; });
            services.AddMetrics();
            
            services.AddHttpClient(Configuration);

            services.AddMemoryCache();

            services
                .AddControllers()
                .AddNewtonsoftJson(options =>
                    options.SerializerSettings.Converters.Add(new StringEnumConverter()))
                .AddFluentValidation(fv => fv.RegisterValidatorsFromAssemblyContaining<UserLoginCommandValidator>());

            services.AddDefaultIdentity<IdentityUser>()
                .AddEntityFrameworkStores<DataContext>();

            services.AddDatabase(Configuration);

            services.AddLogging(Configuration);

            services
                .AddMediatR(AppDomain.CurrentDomain.Load("location.core"));

            services.AddIdentity(Configuration);

            services.AddTraicing(Configuration);

            services.AddScoped<IIdentityService, IdentityService>();
            services.AddTransient<ITransactionService, TransactionService>();
            services.AddTransient<IGetLocationService, GetLocationService>();

            services.AddSwagger();

        }


        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });

            app.UseSwagger();
            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint("/swagger/v1/swagger.json", "Location Api");
            });
        }

    }
}
