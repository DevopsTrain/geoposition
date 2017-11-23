using GeopositionService.Models;

namespace GeopositionService.Repositories
{
    public interface IGeoPositionRepository
    {
         GeoPosition GetGeoPositionForVin(string vin);
    }
}