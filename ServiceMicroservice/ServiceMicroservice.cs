using SalonSamochodowy.Shared.Constants;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalonSamochodowy.ServiceMicroservice
{
    public class ServiceMicroservice : IServiceMicroservice
    {
        public Dictionary<int, string> GetCarsByVIN(string vin)
        {
            DataTable dt;

            using (var data = new DatabaseAccess.DatabaseAccess(DatabaseParams.ConnectionString, DatabaseParams.DatabaseTimeout))
            {
                data.ProcedureName = SprocNames.GetCarsByVIN;
                data.AddParameter("@VIN", SqlDbType.NVarChar, vin);
                dt = data.ExecuteAndReturnDataTable();
            }

            var cars = new Dictionary<int, string>();

            foreach (DataRow row in dt.Rows)
            {
                cars.Add((int)row["idCar"], row["carName"].ToString());
            }

            return cars;
        }

        public void AddService(int idPracownik, int idTypZlecenia, int idPojazd, string opis, List<OrderMicroservice.ChooseOptionsListItem> options)
        {
            DataTable dt;

            DataTable idOptionsList = new DataTable("ConfigList");
            idOptionsList.Columns.Add("Id", typeof(Int32));
            var optionsId = options.Select(x=>x.OptionId);

            foreach (int i in optionsId)
            {
                idOptionsList.Rows.Add(i);
            }

            using (var data = new DatabaseAccess.DatabaseAccess(DatabaseParams.ConnectionString, DatabaseParams.DatabaseTimeout))
            {
                data.ProcedureName = SprocNames.AddService;
                data.AddParameter("@idPracownik", SqlDbType.Int, idPracownik);
                data.AddParameter("@idTypZlecenia", SqlDbType.Int, idTypZlecenia);
                data.AddParameter("@idPojazd", SqlDbType.Int, idPojazd);
                data.AddParameter("@opis", SqlDbType.NVarChar, opis);
                data.AddParameter("@optionsList", SqlDbType.Structured, idOptionsList);
                dt = data.ExecuteAndReturnDataTable();
            }
        }


        public Dictionary<int, string> GetAllServices()
        {
            DataTable dt;

            using (var data = new DatabaseAccess.DatabaseAccess(DatabaseParams.ConnectionString, DatabaseParams.DatabaseTimeout))
            {
                data.ProcedureName = SprocNames.GetAllServices;
                dt = data.ExecuteAndReturnDataTable();
            }

            var cars = new Dictionary<int, string>();

            foreach (DataRow row in dt.Rows)
            {
                cars.Add((int)row["idService"], row["serviceQuery"].ToString());
            }

            return cars;
        }
    }
}
