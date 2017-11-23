using System;

namespace GeopositionService.Models
{
    public class GeoPositionResult
    {
        private GeoPositionResult(long vin, GeoPosition geoPosition)
        {
            Vin = vin;
            TimestampUtc = geoPosition.TimestampUtc;
            Latitude = geoPosition.Latitude;
            Longitude = geoPosition.Longitude;
        }

        public static GeoPositionResult Create(long vin, GeoPosition pos)
        {
            return new GeoPositionResult(vin, pos);
        }

        public long Vin { get; private set; }

        public long TimestampUtc { get; private set; }

        public double Latitude { get; private set; }

        public double Longitude { get; private set; }
    }
}