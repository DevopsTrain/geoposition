using System;
using System.Collections.Generic;
using GeopositionService.Models;

namespace GeopositionService.Repositories
{
    public class DummyGeoPositionRepository : IGeoPositionRepository
    {
        private static Tuple<double, double>[] _coordinates;

        static DummyGeoPositionRepository()
        {
            _coordinates = new Tuple<double, double>[] {
                Tuple.Create(48.13117, 11.60628),
                Tuple.Create(48.14307, 11.60690),
                Tuple.Create(48.16317, 11.58430),
                Tuple.Create(48.16938, 11.52819),
                Tuple.Create(48.19360, 11.57050),
                Tuple.Create(48.13942, 11.48995),
                Tuple.Create(48.09843, 11.55949),
                Tuple.Create(48.08816, 11.57102),
                Tuple.Create(48.09180, 11.65280),
                Tuple.Create(48.13152, 11.69258)
            };
        }

        public GeoPosition GetGeoPositionForVin(long vin)
        {
            var rand = new Random();
            var index = rand.Next(0, _coordinates.Length - 1);
            var coord = _coordinates[index];

            return GeoPosition.Create(coord.Item1, coord.Item2, DateTime.UtcNow.Ticks);
        }
    }
}