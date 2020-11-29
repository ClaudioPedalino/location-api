using location.core.Common.Enums;
using location.data;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace location.api.Registrations
{
    public static class DataRegisterExtension
    {
        public static IServiceCollection AddDatabase(this IServiceCollection services, IConfiguration _configuration)
        {
            if (UsingPostgre(_configuration))
                services.AddDbContext<DataContext>(options => options
                    .UseNpgsql(_configuration.GetConnectionString("PostgreSql")));
            if (UsingLocalDb(_configuration))
                services.AddDbContext<DataContext>(options => options
                    .UseInMemoryDatabase(databaseName: "LocalDb"));

            return services;
        }

        private static bool UsingLocalDb(IConfiguration _configuration)
            => _configuration.GetSection("DataProvider:UsingLocalDb").Value.ToString().ToLower()
                .Equals(BooleanEnum.True.ToString().ToLower());

        private static bool UsingPostgre(IConfiguration _configuration)
            => _configuration.GetSection("DataProvider:UsingPostgre").Value.ToString().ToLower()
                .Equals(BooleanEnum.True.ToString().ToLower());
    }
}
