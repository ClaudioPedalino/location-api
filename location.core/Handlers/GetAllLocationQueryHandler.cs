using location.core.Common;
using location.core.Models;
using location.core.Queries;
using location.entities;
using MediatR;
using Microsoft.Extensions.Caching.Memory;
using Newtonsoft.Json;
using Serilog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;

namespace location.core.Handlers
{
    public class GetAllLocationQueryHandler : IRequestHandler<GetAllLocationQuery, IEnumerable<ProvinceLocationModel>>
    {
        private readonly IHttpClientFactory _httpFactory;
        private readonly ILogger _logger;
        private readonly IMemoryCache _memoryCache;

        public GetAllLocationQueryHandler(IHttpClientFactory httpFactory, ILogger logger, IMemoryCache memoryCache)
        {
            _httpFactory = httpFactory ?? throw new ArgumentNullException(nameof(httpFactory));
            _logger = logger ?? throw new ArgumentNullException(nameof(logger));
            _memoryCache = memoryCache ?? throw new ArgumentNullException(nameof(memoryCache));
        }

        public async Task<IEnumerable<ProvinceLocationModel>> Handle(GetAllLocationQuery request, CancellationToken cancellationToken)
        {
            HttpClient client = _httpFactory.CreateClient("LocationServiceUrl");

            Data content = await GetAllProvincesFromService(client, _logger);

            if (content == null || content.Total == 0)
            {
                _logger.Error($"Service  {client.BaseAddress + Routes.LocationClient_GetAllProvinces}   return without data");
                return null;
            }

            ///START TESTING IN MEMORT CACHE
            MemoryCacheEntryOptions cacheExpirationOptions = new MemoryCacheEntryOptions
            {
                AbsoluteExpiration = DateTime.Now.AddMinutes(20),
                Priority = CacheItemPriority.Normal
            };

            var cachedResponse = _memoryCache.Set("get-all-provinces-cached",
                                                  content.Provincias
                                                         .Select(x =>
                                                             new ProvinceLocationModel(x.Nombre,
                                                                                       x.Centroide.Lat,
                                                                                       x.Centroide.Lon))
                                                         .OrderBy(x => x.Province),
                                                  cacheExpirationOptions);
            ///END TESTING IN MEMORT CACHE

            return content.Provincias
                .Select(x =>
                    new ProvinceLocationModel(x.Nombre,
                                              x.Centroide.Lat,
                                              x.Centroide.Lon))
                .OrderBy(x => x.Province);
        }


        private async Task<Data> GetAllProvincesFromService(HttpClient client, ILogger _logger)
        {
            HttpResponseMessage response = await client.GetAsync(client.BaseAddress + Routes.LocationClient_GetAllProvinces);
            var valid = ValidateResponse(client, response, _logger);
            if (!valid)
            {
                return null;
            }

            return await GetContent(response);
        }

        private static async Task<Data> GetContent(HttpResponseMessage response)
        {
            string responseBody = await response.Content.ReadAsStringAsync();

            return JsonConvert.DeserializeObject<Data>(responseBody);
        }

        private static bool ValidateResponse(HttpClient client, HttpResponseMessage response, ILogger _logger)
        {
            response.EnsureSuccessStatusCode();

            if (!response.IsSuccessStatusCode && !response.StatusCode.Equals(HttpStatusCode.OK))
            {
                _logger.Error($"Error al llamar al servicio {client.BaseAddress}{Routes.LocationClient_GetAllProvinces}");
                return false;
            }
            return true;
        }
    }
}
