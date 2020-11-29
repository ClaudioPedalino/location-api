using location.core.Common;
using location.core.Common.Extensions;
using location.core.Services.Interfaces;
using location.entities;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;

namespace location.core.Services
{
    public class GetLocationService : IGetLocationService
    {

        private readonly IHttpClientFactory _httpFactory;

        public GetLocationService(IHttpClientFactory httpFactory)
        {
            _httpFactory = httpFactory;
        }

        public List<Provincia> FilterProvinceRequestedByName_Strict(string request, List<Provincia> content)
        {
            return content.Where(x => x.Nombre.Equals(request)).ToList();
        }
        public List<Provincia> FilterProvinceRequestedByName_Flexible(string request, List<Provincia> content)
        {
            return content.Where(x => x.Nombre.RemoveAccents().Lowered().Equals(request.RemoveAccents().Lowered())).ToList();
        }

        public List<Provincia> FilterProvinceRequestedByName_Like(string request, List<Provincia> content)
        {
            return content.Where(x => x.Nombre.RemoveAccents().Lowered().Contains(request.RemoveAccents().Lowered())).ToList();
        }

        public async Task<Data> GetAllProvincesFromService()
        {
            HttpClient client = _httpFactory.CreateClient("LocationServiceUrl");

            HttpResponseMessage response = await client.GetAsync(client.BaseAddress + Routes.LocationClient_GetAllProvinces);
            var valid = ValidateResponse(client, response);
            if (!valid)
            {
                return null;
            }

            return await GetContent(response, default(Data));
        }

        public async Task<T> GetContent<T>(HttpResponseMessage response, T defaultValue)
        {
            string responseBody = await response.Content.ReadAsStringAsync();

            return JsonConvert.DeserializeObject<T>(responseBody);
        }

        public bool ValidateResponse(HttpClient client, HttpResponseMessage response)
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
