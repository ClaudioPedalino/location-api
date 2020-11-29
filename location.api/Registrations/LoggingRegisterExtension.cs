using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Serilog;

namespace location.api.Registrations
{
    public static class LoggingRegisterExtension
    {
        public static IServiceCollection AddLogging(this IServiceCollection services, IConfiguration _configuration)
        {
            services.AddSingleton<Serilog.ILogger>(opt =>
            {
                return new LoggerConfiguration().WriteTo.
                    PostgreSQL(_configuration["ConnectionStrings:PostgreSql"],
                                _configuration["ConnectionStrings:LogTable"],
                                restrictedToMinimumLevel: Serilog.Events.LogEventLevel.Debug,
                                needAutoCreateTable: true)
                    .WriteTo.Seq("http://localhost:5341")
                    .CreateLogger();
            });

            return services;
        }
    }
}
