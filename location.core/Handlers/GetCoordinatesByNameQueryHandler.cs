using location.core.Common.Extensions;
using location.core.Models;
using location.core.Queries;
using location.core.Services.Interfaces;
using location.entities;
using MediatR;
using Microsoft.Extensions.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;

namespace location.core.Handlers
{
    public class GetCoordinatesByNameQueryHandler : IRequestHandler<GetCoordinatesByNameQuery, IEnumerable<ProvinceLocationModel>>
    {
        private readonly IHttpClientFactory _httpFactory;
        private readonly IGetLocationService _getLocationService;
        private readonly IConfiguration _configuration;

        public GetCoordinatesByNameQueryHandler(IHttpClientFactory httpFactory,
                                                IGetLocationService getLocationService,
                                                IConfiguration configuration)
        {
            _httpFactory = httpFactory ?? throw new System.ArgumentNullException(nameof(httpFactory));
            _getLocationService = getLocationService ?? throw new System.ArgumentNullException(nameof(getLocationService));
            _configuration = configuration ?? throw new System.ArgumentNullException(nameof(configuration));
        }

        public async Task<IEnumerable<ProvinceLocationModel>> Handle(GetCoordinatesByNameQuery request, CancellationToken cancellationToken)
        {
            if (string.IsNullOrWhiteSpace(request.ProvinceName))
                return new List<ProvinceLocationModel>() { new ProvinceLocationModel("No parameter given") };

            Data content = await _getLocationService.GetAllProvincesFromService();
            //var a = 0;
            //var test = 2 / a;
            var provinceRequested = GetCoincidence(request, content.Provincias);
            return provinceRequested != null && provinceRequested.Count > 0
                ? provinceRequested
                    .Select(x =>
                        new ProvinceLocationModel(
                            x.Nombre,
                            x.Centroide.Lat,
                            x.Centroide.Lon))
                    .ToList()
                : new List<ProvinceLocationModel>() { new ProvinceLocationModel("No results") };
        }

        private List<Provincia> GetCoincidence(GetCoordinatesByNameQuery request, List<Provincia> content)
        {
            List<Provincia> requestedList;
            if (IsStrictSearch())
                requestedList = _getLocationService.FilterProvinceRequestedByName_Strict(request.ProvinceName.ToString(), content);
            else if (IsFlexibleSearch())
                requestedList = _getLocationService.FilterProvinceRequestedByName_Flexible(request.ProvinceName.ToString(), content);
            else if (IsLikeSearch())
                requestedList = _getLocationService.FilterProvinceRequestedByName_Like(request.ProvinceName.ToString(), content);
            else
                requestedList = new List<Provincia>();
            return requestedList;
        }

        private bool IsLikeSearch() => _configuration.GetValue<string>("MatchingConstraintLevelEnum:Like").ToBoolean();
        private bool IsFlexibleSearch() => _configuration.GetValue<string>("MatchingConstraintLevelEnum:Flexible").ToBoolean();
        private bool IsStrictSearch() => _configuration.GetValue<string>("MatchingConstraintLevelEnum:Stirct").ToBoolean();
    }
}
