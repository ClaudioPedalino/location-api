using location.entities;
using System.Collections.Generic;
using System.Net.Http;
using System.Threading.Tasks;

namespace location.core.Services.Interfaces
{
    public interface IGetLocationService
    {
        List<Provincia> FilterProvinceRequestedByName_Strict(string request, List<Provincia> content);
        List<Provincia> FilterProvinceRequestedByName_Flexible(string request, List<Provincia> content);
        List<Provincia> FilterProvinceRequestedByName_Like(string request, List<Provincia> content);
        Task<Data> GetAllProvincesFromService();
        Task<T> GetContent<T>(HttpResponseMessage response, T defaultValue);
        bool ValidateResponse(HttpClient client, HttpResponseMessage response);
    }
}