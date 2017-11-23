namespace GeopositionService.Models
{
    public class GeoPosition
    {
        private GeoPosition(double lat, double lon, long timestampUtc)
        {
            Latitude = lat;
            Longitude = lon;
            TimestampUtc = timestampUtc;
        }

        public static GeoPosition Create(double lat, double lon, long timestampUtc)
        {
            return new GeoPosition(lat, lon, timestampUtc);
        }
        public double Latitude { get; private set; }

        public double Longitude { get; private set; }

        public long TimestampUtc { get; private set; }
    }
}