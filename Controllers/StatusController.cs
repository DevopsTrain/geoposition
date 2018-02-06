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
    public class StatusController : Controller
    {
        [HttpGet]
        [Route("live")]
        public IActionResult GetLive()
        {
            return Ok();
        }

        [HttpGet]
        [Route("readiness")]
        public IActionResult GetReadiness()
        {
            return Ok();
        }
    }
}
