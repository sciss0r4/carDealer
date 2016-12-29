using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalonSamochodowy.Shared.Constants
{
    public static class DatabaseParams
    {
        public static string _connectionString = @"Server=KRYSTIAN;Database=Salon;Trusted_Connection=True;";
        
        private const int _databaseTimeout = 140;

        public static int DatabaseTimeout
        {
            get { return _databaseTimeout; }
        } 

        public static string ConnectionString
        {
            get { return _connectionString; }
        }
    }
}
