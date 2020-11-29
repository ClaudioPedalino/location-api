using location.core.Common;
using location.core.Models;
using location.core.Queries;
using location.entities;
using MediatR;
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

        public GetAllLocationQueryHandler(IHttpClientFactory httpFactory, ILogger logger)
        {
            _httpFactory = httpFactory ?? throw new ArgumentNullException(nameof(httpFactory));
            _logger = logger ?? throw new ArgumentNullException(nameof(logger));
        }

        public async Task<IEnumerable<ProvinceLocationModel>> Handle(GetAllLocationQuery request, CancellationToken cancellationToken)
        {
            HttpClient client = _httpFactory.CreateClient("LocationServiceUrl");

            Data content = await GetAllProvincesFromService(client);

            if (content == null || content.Total == 0)
            {
                _logger.Error($"Service  {client.BaseAddress + Routes.LocationClient_GetAllProvinces}   return without data");
                return null;
            }

            return content.Provincias
                .Select(x =>
                    new ProvinceLocationModel(x.Nombre,
                                              x.Centroide.Lat,
                                              x.Centroide.Lon))
                .OrderBy(x => x.Province);
        }


        private async Task<Data> GetAllProvincesFromService(HttpClient client)
        {
            HttpResponseMessage response = await client.GetAsync(client.BaseAddress + Routes.LocationClient_GetAllProvinces);
            var valid = ValidateResponse(client, response);
            if (!valid)
            {
                return null;
            }

            return await GetContent(response, default(Data));
        }

        private static async Task<T> GetContent<T>(HttpResponseMessage response, T defaultValue)
        {
            string responseBody = await response.Content.ReadAsStringAsync();

            return JsonConvert.DeserializeObject<T>(responseBody);
        }

        private static bool ValidateResponse(HttpClient client, HttpResponseMessage response)
        {
            response.EnsureSuccessStatusCode();

            if (!response.IsSuccessStatusCode && !response.StatusCode.Equals(HttpStatusCode.OK))
            {
                Console.WriteLine($"Error al llamar al servicio {client.BaseAddress}{Routes.LocationClient_GetAllProvinces}");
                return false;
            }
            return true;
        }
    }
}
