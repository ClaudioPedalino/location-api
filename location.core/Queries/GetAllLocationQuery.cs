using location.core.Models;
using MediatR;
using System.Collections.Generic;

namespace location.core.Queries
{
    public class GetAllLocationQuery : IRequest<IEnumerable<ProvinceLocationModel>>
    {
    }
}
