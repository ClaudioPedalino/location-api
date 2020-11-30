using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using OpenTracing;
using OpenTracing.Util;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace location.api.Registrations
{
    public static class TraicingRegisterExtension
    {
        public static IServiceCollection AddTraicing(this IServiceCollection services, IConfiguration _configuration)
        {
            var jaegerServiceName = _configuration.GetSection("JaegerConfig:JAEGER_SERVICE_NAME");
            var jaegerAgentHost = _configuration.GetSection("JaegerConfig:JAEGER_SERVICE_NAME");
            var jaegerAgentPort = _configuration.GetSection("JaegerConfig:JAEGER_AGENT_PORT");
            var jaegerSamplerType = _configuration.GetSection("JaegerConfig:JAEGER_SAMPLER_TYPE");

            services.AddSingleton<ITracer>(t =>
            {
                Environment.SetEnvironmentVariable(jaegerServiceName.Key, jaegerServiceName.Value);
                Environment.SetEnvironmentVariable(jaegerAgentHost.Key, jaegerAgentHost.Value);
                Environment.SetEnvironmentVariable(jaegerAgentPort.Key, jaegerAgentPort.Value);
                Environment.SetEnvironmentVariable(jaegerSamplerType.Key, jaegerSamplerType.Value);

                var loggerFactory = new LoggerFactory();

                var config = Jaeger.Configuration.FromEnv(loggerFactory);
                var tracer = config.GetTracer();

                if (!GlobalTracer.IsRegistered())
                {
                    // Allows code that can't use DI to also access the tracer.
                    GlobalTracer.Register(tracer);
                }

                return tracer;
            });


            return services;
        }
    }
}
