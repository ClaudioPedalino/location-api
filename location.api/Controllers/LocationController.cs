using location.api.Controllers.Custom;
using location.core.Common;
using location.core.Models;
using location.core.Queries;
using location.core.Services.Interfaces;
using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Caching.Memory;
using OpenTracing;
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
    public class LocationController : CustomBaseController
    {
        private readonly ITransactionService _transactionService;
        private readonly ITracer _tracer;
        private readonly IMemoryCache _memoryCache;
        private readonly ILogger _logger;
        private readonly IMediator _mediator;

        public LocationController(ITransactionService transactionService, 
                                  ITracer tracer,
                                  IMemoryCache memoryCache,
                                  ILogger logger,
                                  IMediator mediator) 
                                  : base(transactionService, logger)
        {
            _transactionService = transactionService ?? throw new ArgumentNullException(nameof(transactionService));
            _tracer = tracer ?? throw new ArgumentNullException(nameof(tracer));
            _memoryCache = memoryCache ?? throw new ArgumentNullException(nameof(memoryCache));
            _logger = logger ?? throw new ArgumentNullException(nameof(logger));
            _mediator = mediator ?? throw new ArgumentNullException(nameof(mediator));
        }

        #region Endpoint Description
        /// <summary>
        /// Get all location from third service integrated
        /// </summary>
        /// <returns></returns>
        #endregion
        [ProducesResponseType(200)]
        [ProducesResponseType(500)]
        [ProducesResponseType(401)]
        [Produces("application/json", Type = typeof(ProvinceLocationModel))]
        [HttpGet(Routes.Location.Get_All_Locations)]
        [Authorize()]
        //[AllowAnonymous]
        public async Task<ActionResult<ProvinceLocationModel>> GetAllLocationAsync()
        {
            var watch = new Stopwatch();
            watch.Start();

            var operationName = $"GET::{Routes.Location.LocationController}/{Routes.Location.Get_All_Locations}";
            using (var scope = _tracer.BuildSpan(operationName).StartActive(finishSpanOnDispose: true))
            {
                var span = scope.Span;
                try
                {
                    if (_memoryCache.Get("get-all-provinces-cached") != null)
                    {
                        await LoggingData(watch, span);
                        return Ok(_memoryCache.Get("get-all-provinces-cached"));
                    }
                    else
                    {
                        var response = await _mediator.Send(new GetAllLocationQuery());
                        await LoggingData(watch, span);
                        return Ok(response);
                    }
                }
                catch (Exception ex)
                {
                    _logger.Error(ex, $"Operation failed into [Controller]: {Routes.Location.LocationController} \n  [Endpoint]: {Routes.Location.Get_All_Locations} with message: {ex.Message}");
                    span.Log($"Operation failed into [Controller]: {Routes.Location.LocationController} \n  [Endpoint]: {Routes.Location.Get_All_Locations} with message: {ex.Message}");
                    return StatusCode(StatusCodes.Status500InternalServerError);
                }

            }
        }


        #region Endpoint Description
        /// <summary>
        /// Get a list of provinces by name, depends of the restriction search coincidence level. (configurable in appsettings.json)
        /// </summary>
        /// <param name="request">Provide the province's name to search</param>
        /// <returns></returns>
        #endregion
        [ProducesResponseType(200)]
        [ProducesResponseType(500)]
        [ProducesResponseType(401)]
        [Produces("application/json", Type = typeof(ProvinceLocationModel))]
        [HttpGet(Routes.Location.Get_Coordinates_By_Name)]
        [Authorize()]
        //[AllowAnonymous]
        public async Task<ActionResult<ProvinceLocationModel>> GetCoordinatesByNameAsync([FromQuery] GetCoordinatesByNameQuery request)
        {
            var watch = new Stopwatch();
            watch.Start();

            var operationName = $"GET::{Routes.Location.LocationController}/{Routes.Location.Get_Coordinates_By_Name}";

            using (var scope = _tracer.BuildSpan(operationName).StartActive(finishSpanOnDispose: true))
            {
                var span = scope.Span;
                
                try
                {
                    var response = await _mediator.Send(request);
                    await LoggingData(watch, span);
                    return Ok(response);
                }
                catch (Exception ex)
                {
                    _logger.Error(ex, $"Operation failed into [Controller]: {Routes.Location.LocationController} \n  [Endpoint]: {Routes.Location.Get_Coordinates_By_Name} with message: {ex.Message}");
                    span.Log($"Operation failed into [Controller]: {Routes.Location.LocationController} \n  [Endpoint]: {Routes.Location.Get_Coordinates_By_Name} with message: {ex.Message}");
                    return StatusCode(StatusCodes.Status500InternalServerError);
                }
            }
        }

    }
}
