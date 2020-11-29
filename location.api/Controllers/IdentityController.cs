using location.api.Auth;
using location.core.Commands;
using location.core.Common;
using Microsoft.AspNetCore.Mvc;
using System.Linq;
using System.Threading.Tasks;

namespace location.api.Controllers
{
    public class IdentityController : Controller
    {
        private readonly IIdentityService _identityService;

        public IdentityController(IIdentityService identityService)
        {
            _identityService = identityService;
        }

        [HttpPost(Routes.Identity.Register)]
        public async Task<IActionResult> Register([FromBody] UserRegistrationCommand command)
        {
            if (!ModelState.IsValid)
                return ReturnInvalidModalState();

            var authResponse = await _identityService.RegisterAsync(command.Email, command.Password);

            if (!authResponse.Success)
                return ReturnFailureResponse(authResponse);

            return Ok(new AuthSuccessResponse
            {
                Token = authResponse.Token
            });
        }

        [HttpPost(Routes.Identity.Login)]
        public async Task<IActionResult> Login([FromBody] UserLoginCommand command)
        {
            var authResponse = await _identityService.LoginAsync(command.Email, command.Password);

            if (!authResponse.Success)
                return ReturnFailureResponse(authResponse);

            return Ok(new AuthSuccessResponse
            {
                Token = authResponse.Token
            });
        }

        private IActionResult ReturnFailureResponse(AuthenticationResult authResponse)
            => BadRequest(error: new AuthFailureResponse { ErrorMessages = authResponse.ErrorMessages });

        private IActionResult ReturnInvalidModalState()
            => BadRequest(error: new AuthFailureResponse
            {
                ErrorMessages = ModelState.Values.SelectMany(x => x.Errors.Select(y => y.ErrorMessage))
            });
    }
}
