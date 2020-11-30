using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Polly;
using System;

namespace location.api.Registrations
{
    public static class HttpClientRegisterExtension
    {
        public static IServiceCollection AddHttpClient(this IServiceCollection services, IConfiguration _configuration)
        {
            var retryTimes = int.Parse(_configuration.GetSection("RetryPolicyConfig:RetryTimes").Value);
            var retryDelay = TimeSpan.FromMilliseconds(int.Parse(_configuration.GetSection("RetryPolicyConfig:RetryDelay_InMiliseconds").Value));

            services
                .AddHttpClient("LocationServiceUrl", client =>
                {
                    client.BaseAddress = new Uri(_configuration.GetValue<string>("LocationServiceUrl"));
                    client.DefaultRequestHeaders.Add("Accept", "application/json");
                })
                .AddTransientHttpErrorPolicy(policy =>
                    policy.WaitAndRetryAsync(retryTimes, _ => retryDelay));


            return services;
        }
    }
}
