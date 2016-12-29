using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalonSamochodowy.DatabaseAccess
{
    public class DatabaseAccess : IDatabaseAccess, IDisposable
    {
        private SqlCommand _command;
        private string _connectionString;

        public DatabaseAccess(string connectionString, int timeout)
        {
            _command = new SqlCommand();
            _command.CommandTimeout = timeout;
            _connectionString = connectionString;
        }

        #region Properties

        public int CommandTimeout
        {
            get { return _command.CommandTimeout; }
            set { _command.CommandTimeout = value; }
        }

        public string ProcedureName
        {
            get { return _command.CommandText; }
            set { _command.CommandText = value; }
        }

        public string ConnectionString
        {
            get { return _connectionString; }
            set { _connectionString = value; }
        }

        #endregion

        #region Public Methods

        public DataTable ExecuteAndReturnDataTable()
        {
            using(var connection = new SqlConnection(ConnectionString))
            {
                try
                {
                    PrepareCommandForExecution(connection);

                    using(var adapter = new SqlDataAdapter(_command))
                    {
                        DataTable dt = new DataTable();
                        adapter.Fill(dt);
                        return dt;
                    }
                }
                finally
                {
                    _command.Connection.Close();
                }
            }
        }

        public void AddParameter(string parameterName, SqlDbType parameterType, object value)
        {
            _command.Parameters.Add(parameterName,parameterType).Value = value;
        }

        private SqlCommand PrepareCommandForExecution(SqlConnection connection)
        {
            try
            {
                _command.Connection = connection;
                _command.CommandType = CommandType.StoredProcedure;
                _command.CommandTimeout = CommandTimeout;
                _command.Connection.Open();

                return _command;
            }
            finally
            {
                _command.Connection.Close();
            }
        }

        #endregion

        #region Dispose

        ~DatabaseAccess()
        {
            Dispose(false);
        }

        public void Dispose()
        {
            Dispose(true);
        }

        protected virtual void Dispose(bool disposing)
        {
            if (disposing)
            {
                _command.Connection.Dispose();
                _command.Dispose();
            }
        }

        #endregion
    }
}
