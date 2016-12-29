using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalonSamochodowy.SampleMicroservice
{
    public static class Constants
    {
        private const string _connectionString = "connectionString";

        private const int _databaseTimeout = 140;

        private const string _getWorkerSprocName = "UpdateWorkOrderDetails";

        public static int DatabaseTimeout
        {
            get { return _databaseTimeout; }
        } 


        public static string ConnectionString
        {
            get { return _connectionString; }
        }

        public static string GetWorkerSprocName
        {
            get { return _getWorkerSprocName; }
        }
    }
}
