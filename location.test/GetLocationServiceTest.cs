using location.core.Models;
using location.core.Services;
using location.test.Mock;
using Microsoft.Extensions.DependencyInjection;
using NSubstitute;
using Serilog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using Xunit;

namespace location.test
{
    public class GetLocationServiceTest
    {
        private readonly IHttpClientFactory _httpFactory;
        private readonly ILogger _logger;

        public GetLocationServiceTest()
        {
            _httpFactory = Substitute.For<IHttpClientFactory>();
            _logger = Substitute.For<ILogger>();
        }
        
        #region Testing_Strict_Search
        [Fact]
        public void Should_Get_Province_BY_Strict_Search()
        {
            var response = MockApiResponse.MockData_Provinces.Where(x => x.Nombre == "Córdoba").First();
            var service = new GetLocationService(_httpFactory, _logger);

            var result = service.FilterProvinceRequestedByName_Strict("Córdoba", MockApiResponse.MockData_Provinces);

            Assert.NotNull(result);
            Assert.Equal(response.Nombre, result.Select(x => x.Nombre).First());
        }

        [Fact]
        public void Should_Get_NO_Province_BY_Strict_Search()
        {
            var response = MockApiResponse.MockData_Provinces.Where(x => x.Nombre == "Córdoba");
            var service = new GetLocationService(_httpFactory, _logger);

            var result = service.FilterProvinceRequestedByName_Strict("cordoba", MockApiResponse.MockData_Provinces);

            Assert.NotNull(result);
            Assert.NotEqual(response.Count(), result.Count);
        }
        #endregion



        #region Testing_Flexible_Search
        [Fact]
        public void Should_Get_Province_BY_Flexible_Search_With_Whole_Word()
        {
            var response = MockApiResponse.MockData_Provinces.Where(x => x.Nombre == "Córdoba").First();
            var service = new GetLocationService(_httpFactory, _logger);

            var result = service.FilterProvinceRequestedByName_Flexible("Córdoba", MockApiResponse.MockData_Provinces);

            Assert.NotNull(result);
            Assert.Equal(response.Nombre, result.Select(x => x.Nombre).First());
        }

        [Fact]
        public void Should_Get_Province_BY_Flexible_Search_Ignore_CapitalLetter()
        {
            var response = MockApiResponse.MockData_Provinces.Where(x => x.Nombre == "Córdoba").First();
            var service = new GetLocationService(_httpFactory, _logger);

            var result = service.FilterProvinceRequestedByName_Flexible("córdoba", MockApiResponse.MockData_Provinces);

            Assert.NotNull(result);
            Assert.Equal(response.Nombre, result.Select(x => x.Nombre).First());
        }

        [Fact]
        public void Should_Get_Province_BY_Flexible_Search_Case_Insensitive()
        {
            var response = MockApiResponse.MockData_Provinces.Where(x => x.Nombre == "Buenos Aires").First();
            var service = new GetLocationService(_httpFactory, _logger);

            var result = service.FilterProvinceRequestedByName_Flexible("buenos aires", MockApiResponse.MockData_Provinces);

            Assert.NotNull(result);
            Assert.Equal(response.Nombre, result.Select(x => x.Nombre).First());
        }

        [Fact]
        public void Should_Get_Province_BY_Flexible_Search_Ignore_Accent()
        {
            var response = MockApiResponse.MockData_Provinces.Where(x => x.Nombre == "Córdoba").First();
            var service = new GetLocationService(_httpFactory, _logger);

            var result = service.FilterProvinceRequestedByName_Flexible("Cordoba", MockApiResponse.MockData_Provinces);

            Assert.NotNull(result);
            Assert.Equal(response.Nombre, result.Select(x => x.Nombre).First());
        }

        [Fact]
        public void Should_Get_NO_Province_BY_Flexible_Search()
        {
            var response = MockApiResponse.MockData_Provinces.Where(x => x.Nombre == "Córdoba");
            var service = new GetLocationService(_httpFactory, _logger);

            var result = service.FilterProvinceRequestedByName_Strict("cordo", MockApiResponse.MockData_Provinces);

            Assert.NotNull(result);
            Assert.NotEqual(response.Count(), result.Count);
        }
        #endregion

        #region Testing_Like_Search
        [Fact]
        public void Should_Get_Provinces_List_BY_Like_Search()
        {
            var response = MockApiResponse.MockData_Provinces.Where(x => x.Nombre.Contains("San"));
            var service = new GetLocationService(_httpFactory, _logger);

            var result = service.FilterProvinceRequestedByName_Like("san", MockApiResponse.MockData_Provinces);

            Assert.NotNull(result);
            Assert.Equal(response.Count(), result.Count);
        }

        [Fact]
        public void Should_Get_Provinces_List_BY_Like_Search_Case_Insensitive()
        {
            var response = MockApiResponse.MockData_Provinces.Where(x => x.Nombre.Contains("Buenos Aires"));
            var service = new GetLocationService(_httpFactory, _logger);

            var result = service.FilterProvinceRequestedByName_Like("buenos aires", MockApiResponse.MockData_Provinces);

            Assert.NotNull(result);
            Assert.Equal(response.Count(), result.Count);
        }
        #endregion
    }
}
