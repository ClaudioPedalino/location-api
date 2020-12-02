using location.core.Common;
using location.core.Services.Interfaces;
using Microsoft.AspNetCore.Mvc;
using OpenTracing;
using Serilog;
using System;
using System.Diagnostics;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

namespace location.api.Controllers.Custom
{
    [Route("testroute")]
    [ApiController]
    public abstract class CustomBaseController : ControllerBase
    {
        private readonly ITransactionService _transactionService;
        private readonly ILogger _logger;

        protected CustomBaseController(ITransactionService transactionService, ILogger logger)
        {
            _transactionService = transactionService ?? throw new ArgumentNullException(nameof(transactionService));
            _logger = logger ?? throw new ArgumentNullException(nameof(logger));
        }

        [HttpOptions()]
        public async Task LoggingData([FromQuery] Stopwatch watch, ISpan span)
        {
            var transactionData = await _transactionService.CreateTransactionAsync(
                                                                User.Claims.FirstOrDefault(i => i.Type == "id").Value,
                                                                User.FindFirst(ClaimTypes.NameIdentifier)?.Value,
                                                                HttpContext.Connection.RemoteIpAddress.ToString(),
                                                                RequestHelper.GetRequestDuration(watch));

            _logger.Information(TemplateTransactionFormat.GetTemplateTransaction(transactionData));
            span.Log(TemplateTransactionFormat.GetTemplateTransaction(transactionData));
        }
    }
}
