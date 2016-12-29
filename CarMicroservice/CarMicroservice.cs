using SalonSamochodowy.Shared.Constants;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SalonSamochodowy.CarMicroservice.Models;

namespace SalonSamochodowy.CarMicroservice
{
    /**
     *@Author Szymon Ligocki <s.ligocki@outlook.com>
     **/
    public class CarMicroservice : ICarMicroservice
    {
        public void AddCar(CarViewModel model) 
        {
            using (var data = new DatabaseAccess.DatabaseAccess(DatabaseParams.ConnectionString, DatabaseParams.DatabaseTimeout))
            {
                data.ProcedureName = SprocNames.AddCar;
                FillCarModelParameters(data, model);
                data.ExecuteAndReturnDataTable();
            }
        }

        public Dictionary<int, string> GetAllCarBodies()
        {
            DataTable dt;

            using (var data = new DatabaseAccess.DatabaseAccess(DatabaseParams.ConnectionString, DatabaseParams.DatabaseTimeout))
            {
                data.ProcedureName = SprocNames.GetAllCarBodies;
                dt = data.ExecuteAndReturnDataTable();
            }

            var brands = new Dictionary<int, string>();

            foreach (DataRow row in dt.Rows)
            {
                brands.Add((int)row["idNadwozie"], row["typ"].ToString());
            }

            return brands;
        }

        public Dictionary<int, string> GetAllCarModelsWithBrands()
        {
            DataTable dt;

            using (var data = new DatabaseAccess.DatabaseAccess(DatabaseParams.ConnectionString, DatabaseParams.DatabaseTimeout))
            {
                data.ProcedureName = SprocNames.GetAllCarModelsWithBrands;
                dt = data.ExecuteAndReturnDataTable();
            }

            var brands = new Dictionary<int, string>();

            foreach (DataRow row in dt.Rows)
            {
                brands.Add((int)row["idModel"], row["nazwaModelu"].ToString());
            }

            return brands;
        }

        public Dictionary<int, string> GetAllCarStatuses()
        {
            DataTable dt;

            using (var data = new DatabaseAccess.DatabaseAccess(DatabaseParams.ConnectionString, DatabaseParams.DatabaseTimeout))
            {
                data.ProcedureName = SprocNames.GetAllCarStatuses;
                dt = data.ExecuteAndReturnDataTable();
            }

            var brands = new Dictionary<int, string>();

            foreach (DataRow row in dt.Rows)
            {
                brands.Add((int)row["idStatusPojazdu"], row["statusPojazdu"].ToString());
            }

            return brands;
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

        public Dictionary<int, string> GetEnginesForModelId(int modelId)
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

        private void FillCarModelParameters(DatabaseAccess.DatabaseAccess data, CarViewModel model)
        {
            AddParameter(model.RzeczywistyIdLakieru, "@idLakier", SqlDbType.Int, data);
            AddParameter(model.RzeczywistyIdSilnika, "@idSilnik", SqlDbType.Int, data);
            AddParameter(model.RzeczywistyIdNadwozia, "@idNadwozie", SqlDbType.Int, data);
            AddParameter(1, "@idKonfiguracjaPojazdu", SqlDbType.Int, data);
            AddParameter(model.RzeczywistyIdModelu, "@idModel", SqlDbType.Int, data);
            AddParameter(model.RzeczywistyIdStatusu, "@idStatusPojazdu", SqlDbType.Int, data);

            AddParameter(model.VIN, "@VIN", SqlDbType.NVarChar, data);
            AddParameter(model.RokProdukcji, "@rokProdukcji", SqlDbType.DateTime, data);
            AddParameter(model.Przebieg, "@przebieg", SqlDbType.Int, data);
            AddParameter(model.KrajProdukcji, "@krajProdukcji", SqlDbType.NVarChar, data);
            AddParameter(model.Cena, "@cena", SqlDbType.NVarChar, data);
        }

        private void AddParameter(object param, string paramName, SqlDbType dbType, DatabaseAccess.DatabaseAccess data)
        {
            if (param != null)
            {
                data.AddParameter(paramName, dbType, param);
            }
        }

        public void DeleteCar(String VIN) 
        {
            using (var data = new DatabaseAccess.DatabaseAccess(DatabaseParams.ConnectionString, DatabaseParams.DatabaseTimeout))
            {
                AddParameter(VIN, "@VIN", SqlDbType.NVarChar, data);
                data.ProcedureName = SprocNames.DeleteCar;
                data.ExecuteAndReturnDataTable();
            }
        }

        public void ModifyCar(CarViewModel model) 
        {
            throw new NotImplementedException();
            //TODO
        }

        public Dictionary<string, string> GetAllCars() 
        {
            DataTable dt;

            using (var data = new DatabaseAccess.DatabaseAccess(DatabaseParams.ConnectionString, DatabaseParams.DatabaseTimeout))
            {
                data.ProcedureName = SprocNames.GetAllCars;
                dt = data.ExecuteAndReturnDataTable();
            }

            return GetVINsFromDatabaseResult(dt);
        }

        private Dictionary<string, string> GetVINsFromDatabaseResult(DataTable dt)
        {
            var carVinDict = new Dictionary<string, string>();

            foreach (DataRow row in dt.Rows)
            {
                String name = row["nazwaMarki"].ToString() + " "
                    + row["nazwaModelu"].ToString() + " "
                    + row["nazwaKodowa"].ToString();
                
                carVinDict.Add(row["VIN"].ToString(), name);
            }
            return carVinDict;
        }

    }
}
