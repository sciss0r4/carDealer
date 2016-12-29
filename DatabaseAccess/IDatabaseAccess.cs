using System;
using System.Data;
namespace SalonSamochodowy.DatabaseAccess
{
    public interface IDatabaseAccess
    {
        void AddParameter(string parameterName, SqlDbType parameterType, object value);

        int CommandTimeout { get; set; }

        string ConnectionString { get; set; }

        void Dispose();

        DataTable ExecuteAndReturnDataTable();

        string ProcedureName { get; set; }
    }
}
