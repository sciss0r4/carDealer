using SalonSamochodowy.OrderMicroservice;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalonSamochodowy.ServiceMicroservice
{
    public interface IServiceMicroservice
    {
        Dictionary<int,string> GetCarsByVIN(string vin);

        Dictionary<int, string> GetAllServices();

        void AddService(int idPracownik, int idTypZlecenia, int idPojazd, string opis, List<ChooseOptionsListItem> options);
    }
}
