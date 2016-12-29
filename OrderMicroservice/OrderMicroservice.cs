using SalonSamochodowy.Shared.Constants;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalonSamochodowy.OrderMicroservice
{
    public class OrderMicroservice : IOrderMicroservice
    {
        public void AddOrder(OrderViewModel orderVM, int idPojazd)
        {
            using (var data = new DatabaseAccess.DatabaseAccess(DatabaseParams.ConnectionString, DatabaseParams.DatabaseTimeout))
            {
                data.ProcedureName = SprocNames.AddOrder;
                data.AddParameter("@clientId", SqlDbType.Int, orderVM.IdKlienta);
                data.AddParameter("@workerId", SqlDbType.Int, orderVM.IdPracownik);
                data.AddParameter("@carId", SqlDbType.Int, idPojazd);
                data.ExecuteAndReturnDataTable();
            }
        }

        public Dictionary<int,string> GetAllBrands()
        {
            DataTable dt;

            using (var data = new DatabaseAccess.DatabaseAccess(DatabaseParams.ConnectionString, DatabaseParams.DatabaseTimeout))
            {
                data.ProcedureName = SprocNames.GetAllBrands;
                dt = data.ExecuteAndReturnDataTable();
            }

            var brands = new Dictionary<int, string>();

            foreach(DataRow row in dt.Rows)
            {
                brands.Add((int)row["idMarka"], row["nazwaMarki"].ToString());
            }

            return brands;
        }


        public Dictionary<int, string> GetModelsForBrandId(int brandId)
        {
            DataTable dt;

            using (var data = new DatabaseAccess.DatabaseAccess(DatabaseParams.ConnectionString, DatabaseParams.DatabaseTimeout))
            {
                data.ProcedureName = SprocNames.GetModelsForBrandId;
                data.AddParameter("@brandId", SqlDbType.Int, brandId);
                dt = data.ExecuteAndReturnDataTable();
            }

            var models = new Dictionary<int, string>();

            foreach(DataRow row in dt.Rows)
            {
                models.Add((int)row["idModel"], row["nazwaModelu"].ToString());
            }

            return models;
        }


        public Dictionary<int, string> GetPaintsForModelId(int modelId)
        {
            DataTable dt;

            using (var data = new DatabaseAccess.DatabaseAccess(DatabaseParams.ConnectionString, DatabaseParams.DatabaseTimeout))
            {
                data.ProcedureName = SprocNames.GetPaintsForModelId;
                data.AddParameter("@modelId", SqlDbType.Int, modelId);
                dt = data.ExecuteAndReturnDataTable();
            }

            var paints = new Dictionary<int, string>();

            foreach (DataRow row in dt.Rows)
            {
                paints.Add((int)row["idLakier"], row["typLakieru"].ToString());
            }

            return paints;
        }


        public Dictionary<int, string> GetAllCarBodies()
        {
            DataTable dt;

            using (var data = new DatabaseAccess.DatabaseAccess(DatabaseParams.ConnectionString, DatabaseParams.DatabaseTimeout))
            {
                data.ProcedureName = SprocNames.GetAllCarBodies;
                dt = data.ExecuteAndReturnDataTable();
            }

            var bodies = new Dictionary<int, string>();

            foreach (DataRow row in dt.Rows)
            {
                bodies.Add((int)row["idNadwozie"], row["typ"].ToString());
            }

            return bodies;
        }


        public Dictionary<int, string> GetEngineFullNamesForModelId(int modelId)
        {
            DataTable dt;

            using (var data = new DatabaseAccess.DatabaseAccess(DatabaseParams.ConnectionString, DatabaseParams.DatabaseTimeout))
            {
                data.ProcedureName = SprocNames.GetEngineFullNamesForModelId;
                data.AddParameter("@modelId", SqlDbType.Int, modelId);
                dt = data.ExecuteAndReturnDataTable();
            }

            var engines = new Dictionary<int, string>();

            foreach (DataRow row in dt.Rows)
            {
                engines.Add((int)row["idSilnik"], row["engineFullName"].ToString());
            }

            return engines;
        }


        public Dictionary<int, string> GetAllConfigurationOptions()
        {
            DataTable dt;

            using (var data = new DatabaseAccess.DatabaseAccess(DatabaseParams.ConnectionString, DatabaseParams.DatabaseTimeout))
            {
                data.ProcedureName = SprocNames.GetAllConfigurationOptions;
                dt = data.ExecuteAndReturnDataTable();
            }

            var options = new Dictionary<int, string>();

            foreach (DataRow row in dt.Rows)
            {
                options.Add((int)row["idOpcjaKonfiguracji"], row["nazwaOpcji"].ToString());
            }

            return options;
        }


        public DataTable GetMatchingCars(int modelId, int bodyId, int paintId, int engineId, List<int> configList)
        {
            DataTable dt;

            DataTable idConfigList = new DataTable("ConfigList");
            idConfigList.Columns.Add("Id", typeof(Int32));

            foreach(int i in configList)
            {
                idConfigList.Rows.Add(i);
            }

            using (var data = new DatabaseAccess.DatabaseAccess(DatabaseParams.ConnectionString, DatabaseParams.DatabaseTimeout))
            {
                data.ProcedureName = SprocNames.GetMatchingCars;
                data.AddParameter("@modelId", SqlDbType.Int, modelId);
                data.AddParameter("@bodyId", SqlDbType.Int, bodyId);
                data.AddParameter("@paintId", SqlDbType.Int, paintId);
                data.AddParameter("@engineId", SqlDbType.Int, engineId);
                data.AddParameter("@configList", SqlDbType.Structured, idConfigList);
                dt = data.ExecuteAndReturnDataTable();
            }

            return dt;
        }


        public Dictionary<int, string> GetOrdersForClientId(int clientId)
        {
            DataTable dt;

            using (var data = new DatabaseAccess.DatabaseAccess(DatabaseParams.ConnectionString, DatabaseParams.DatabaseTimeout))
            {
                data.ProcedureName = SprocNames.GetOrdersForClientId;
                data.AddParameter("@clientId", SqlDbType.Int, clientId);
                dt = data.ExecuteAndReturnDataTable();
            }

            var options = new Dictionary<int, string>();

            foreach (DataRow row in dt.Rows)
            {
                options.Add((int)row["idZamówienie"], row["nazwaZamowienia"].ToString());
            }

            return options;
        }


        public OrderModel GetOrderData(int orderId)
        {
            DataTable dt;

            using (var data = new DatabaseAccess.DatabaseAccess(DatabaseParams.ConnectionString, DatabaseParams.DatabaseTimeout))
            {
                data.ProcedureName = SprocNames.GetOrderData;
                data.AddParameter("@orderId", SqlDbType.Int, orderId);
                dt = data.ExecuteAndReturnDataTable();
            }

            OrderModelMapper omm = new OrderModelMapper();
            return omm.MapFromDataRow(dt.Rows[0], orderId);
        }


        public List<int> GetCarOptionsForCarID(int carID)
        {
            DataTable dt;

            using (var data = new DatabaseAccess.DatabaseAccess(DatabaseParams.ConnectionString, DatabaseParams.DatabaseTimeout))
            {
                data.ProcedureName = SprocNames.GetCarOptionsForCarID;
                data.AddParameter("@carId", SqlDbType.Int, carID);
                dt = data.ExecuteAndReturnDataTable();
            }

            var options = new List<int>();

            foreach (DataRow row in dt.Rows)
            {
                options.Add((int)row["idOpcjaKonfiguracji"]);
            }

            return options;
        }
    }
}
