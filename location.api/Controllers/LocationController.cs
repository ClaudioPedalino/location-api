using location.core.Common;
using location.core.Models;
using location.core.Queries;
using location.core.Services.Interfaces;
using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Serilog;
using System;
using System.Diagnostics;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace location.api.Controllers
{
    [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [Route(Routes.Location.LocationController)]
    [ApiController]
    public class LocationController : ControllerBase
    {
        private readonly IMediator _mediator;
        private readonly ILogger _logger;
        private readonly ITransactionService _transactionService;

        public LocationController(IMediator mediator, ILogger logger, ITransactionService transactionService)
        {
            _mediator = mediator;
            _logger = logger;
            _transactionService = transactionService;
        }


        [HttpGet(Routes.Location.Get_All_Locations)]
        [Authorize()]
        //[AllowAnonymous]
        public async Task<ActionResult<ProvinceLocationModel>> GetAllLocationAsync()
        {
            var watch = new Stopwatch();
            watch.Start();
            try
            {
                var response = await _mediator.Send(new GetAllLocationQuery());

                var transactionData = await _transactionService.CreateTransactionAsync(
                                                User.Claims.FirstOrDefault(i => i.Type == "id").Value,
                                                User.FindFirst(ClaimTypes.NameIdentifier)?.Value,
                                                HttpContext.Connection.RemoteIpAddress.ToString(),
                                                RequestHelper.GetRequestDuration(watch));

                _logger.Information(TemplateTransactionFormat.GetTemplateTransaction(transactionData));

                return Ok(response);
            }
            catch (Exception ex)
            {
                _logger.Error(ex, $"Operation failed into [Controller]: {Routes.Location.LocationController} \n  [Endpoint]: {Routes.Location.Get_All_Locations} with message: {ex.Message}");
                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }

        [HttpGet(Routes.Location.Get_Coordinates_By_Name)]
        [Authorize()]
        //[AllowAnonymous]
        public async Task<ActionResult<ProvinceLocationModel>> GetCoordinatesByNameAsync([FromQuery] GetCoordinatesByNameQuery request)
        {
            var watch = new Stopwatch();
            watch.Start();
            try
            {
                var response = await _mediator.Send(request);

                var transactionData = await _transactionService.CreateTransactionAsync(
                                                User.Claims.FirstOrDefault(i => i.Type == "id").Value,
                                                User.FindFirst(ClaimTypes.NameIdentifier)?.Value,
                                                HttpContext.Connection.RemoteIpAddress.ToString(),
                                                RequestHelper.GetRequestDuration(watch));

                _logger.Information(TemplateTransactionFormat.GetTemplateTransaction(transactionData));

                return Ok(response);
            }
            catch (Exception ex)
            {
                _logger.Error(ex, $"Operation failed into [Controller]: {Routes.Location.LocationController} \n  [Endpoint]: {Routes.Location.Get_Coordinates_By_Name} with message: {ex.Message}");
                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }


    }
}
