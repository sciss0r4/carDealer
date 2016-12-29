using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SalonSamochodowy.CarMicroservice.Models;

namespace SalonSamochodowy.CarMicroservice
{
    /**
     *@Author Szymon Ligocki <s.ligocki@outlook.com>
     **/
    public interface ICarMicroservice
    {
        void AddCar(CarViewModel model);
        void DeleteCar(String VIN);
        void ModifyCar(CarViewModel model);
        Dictionary<string, string> GetAllCars();
        Dictionary<int, string> GetAllCarBodies();
        Dictionary<int, string> GetAllCarModelsWithBrands();
        Dictionary<int, string> GetAllCarStatuses();
        Dictionary<int, string> GetPaintsForModelId(int modelId);
        Dictionary<int, string> GetEnginesForModelId(int modelId);
    }
}
