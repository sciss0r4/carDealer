using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalonSamochodowy.OrderMicroservice
{
    public interface IOrderMicroservice
    {
        void AddOrder(OrderViewModel orderVM, int idPojazd);

        Dictionary<int, string> GetModelsForBrandId(int brandId);

        Dictionary<int, string> GetAllBrands();

        Dictionary<int, string> GetPaintsForModelId(int modelId);

        Dictionary<int, string> GetAllCarBodies();

        Dictionary<int,string> GetEngineFullNamesForModelId(int modelId);

        Dictionary<int, string> GetAllConfigurationOptions();

        Dictionary<int, string> GetOrdersForClientId (int clientId);

        DataTable GetMatchingCars(int modelId, int bodyId, int paintId, int engineId, List<int> configList);

        OrderModel GetOrderData(int orderId);

        List<int> GetCarOptionsForCarID(int carID);
    }
}
