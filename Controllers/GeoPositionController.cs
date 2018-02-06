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

        [HttpGet("{vin}")]
        public IActionResult Get(string vin)
        {
            if (string.IsNullOrWhiteSpace(vin))
                return BadRequest(String.Format("Invalid VIN provided: {0}", vin));

            if (vin.Length != 17 && vin.Length != 7)
                throw new ArgumentOutOfRangeException("vin", vin, "length of provided VIN must be either 7 or 17");

            var currentGeoPositionForVin = _geoRepo.GetGeoPositionForVin(vin);

            return Ok(GeoPositionResult.Create(vin, currentGeoPositionForVin));
        }
    }
}
