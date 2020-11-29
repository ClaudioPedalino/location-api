using System.Collections.Generic;

namespace location.core.Common
{
    public class AuthFailureResponse
    {
        public IEnumerable<string> ErrorMessages { get; set; }
    }
}
