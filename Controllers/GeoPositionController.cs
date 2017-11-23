using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using GeopositionService.Models;
using GeopositionService.Repositories;
using Microsoft.AspNetCore.Mvc;

namespace GeopositionService.Controllers
{

    [Route("api/[controller]")]
    public class GeoPositionController : Controller
    {
        private readonly IGeoPositionRepository _geoRepo;

        public GeoPositionController(IGeoPositionRepository geoRepo)
        {
            _geoRepo = geoRepo;
        }

        // GET api/values/5
        [HttpGet("{vin}")]
        public IActionResult Get(long vin)
        {
            if (vin <= 0)
                return BadRequest(String.Format("Invalid VIN provided: {0}", vin));

            var currentGeoPositionForVin = _geoRepo.GetGeoPositionForVin(vin);

            return Ok(GeoPositionResult.Create(vin, currentGeoPositionForVin));
        }
    }
}
