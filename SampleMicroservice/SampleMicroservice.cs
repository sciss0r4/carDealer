using SalonSamochodowy.DatabaseAccess;
using SalonSamochodowy.SampleMicroservice.Models;
using SalonSamochodowy.Shared;
using SalonSamochodowy.Shared.Constants;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalonSamochodowy.SampleMicroservice
{
    public class SampleMicroservice : ISampleMicroservice
    {
        public ClientInfoModel GetSomethingFromDatabase(int input)
        {
            using (var data = new DatabaseAccess.DatabaseAccess(DatabaseParams.ConnectionString, DatabaseParams.DatabaseTimeout))
            {
                int workerId = 1;

                data.ProcedureName = SprocNames.GetWorker;
                data.AddParameter("@WorkerId", SqlDbType.Int, workerId);
                var dt = data.ExecuteAndReturnDataTable();
            }

            throw new NotImplementedException("Got Something From Database method is not implemented yet in Sample Microservice.");
        }

        public SampleMicroservice()
        {
        }
    }
}
