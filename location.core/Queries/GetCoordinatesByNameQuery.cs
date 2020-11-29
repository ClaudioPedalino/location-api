using location.core.Models;
using MediatR;
using System.Collections.Generic;

namespace location.core.Queries
{
    public class GetCoordinatesByNameQuery : IRequest<IEnumerable<ProvinceLocationModel>>
    {

        public string ProvinceName { get; set; }
        //public ProvinciasEnum ProvinceName { get; set; }
    }
}
