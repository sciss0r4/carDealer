using SalonSamochodowy.Shared.Constants;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalonSamochodowy.ClientMicroservice
{
    public class ClientMicroservice : IClientMicroservice
    {
        public void AddClient(ClientViewModel model)
        {
            using (var data = new DatabaseAccess.DatabaseAccess(DatabaseParams.ConnectionString, DatabaseParams.DatabaseTimeout))
            {
                data.ProcedureName = SprocNames.AddClient;
                FillClientModelParameters(data, model);
                data.ExecuteAndReturnDataTable();
            }
        }

        public Dictionary<int,string> GetClientsNamesByPattern(ClientViewModel model)
        {
            DataTable dt;

            using (var data = new DatabaseAccess.DatabaseAccess(DatabaseParams.ConnectionString, DatabaseParams.DatabaseTimeout))
            {
                data.ProcedureName = SprocNames.GetClientsNamesByPattern;
                AddParameter(model.Imie, "@imie", SqlDbType.NVarChar, data);
                AddParameter(model.Miejscowosc, "@miejscowosc", SqlDbType.NVarChar, data);
                AddParameter(model.Nazwisko, "@nazwisko", SqlDbType.NVarChar, data);
                AddParameter(model.Ulica, "@ulica", SqlDbType.NVarChar, data);
                AddParameter(model.Pesel, "@pesel", SqlDbType.NVarChar, data);
                dt = data.ExecuteAndReturnDataTable();
            }

            return GetNamesFromDatabaseResult(dt);
        }

        public ClientViewModel GetClientInfoById(int clientId)
        {
            DataTable dt;
            using (var data = new DatabaseAccess.DatabaseAccess(DatabaseParams.ConnectionString, DatabaseParams.DatabaseTimeout))
            {
                data.ProcedureName = SprocNames.GetClientInfoById;
                AddParameter(clientId, "@id", SqlDbType.Int, data);
                dt = data.ExecuteAndReturnDataTable();
            }

            IClientViewModelMapper cvmm = new ClientViewModelMapper(this);
            return cvmm.MapFromDataRow(dt.Rows[0], clientId);
        }

        private void FillClientModelParameters(DatabaseAccess.DatabaseAccess data, ClientViewModel model)
        {
            if(ValidateClientModel.Validate(model))
            {
                AddParameter(model.DataUrodzenia, "@dataUrodzenia", SqlDbType.DateTime, data);
                AddParameter(model.Imie, "@imie", SqlDbType.NVarChar, data);
                AddParameter(model.KodPocztowy, "@kodPocztowy", SqlDbType.NVarChar, data);
                AddParameter(model.Miejscowosc, "@miejscowosc", SqlDbType.NVarChar, data);
                AddParameter(model.Nazwisko, "@nazwisko", SqlDbType.NVarChar, data);
                AddParameter(model.NrDomu, "@nrDomu", SqlDbType.NVarChar, data);
                AddParameter(model.NrLokalu, "@nrLokalu", SqlDbType.NVarChar, data);
                AddParameter(model.Ulica, "@ulica", SqlDbType.NVarChar, data);
                AddParameter(model.Pesel, "@pesel", SqlDbType.NVarChar, data);
            }
            else
            {
                throw new ArgumentException("Client microservice: Client information is not valid!");
            }
            
        }

        private void AddParameter(object param, string paramName, SqlDbType dbType, DatabaseAccess.DatabaseAccess data)
        {
            if (param != null)
            {
                data.AddParameter(paramName, dbType, param);
            }
        }

        private Dictionary<int,string> GetNamesFromDatabaseResult(DataTable databaseResult)
        {
            var clientNamesDict = new Dictionary<int, string>();

            foreach(DataRow row in databaseResult.Rows)
            {
                clientNamesDict.Add((int)row["idKlient"], row["clientName"].ToString());
            }

            return clientNamesDict;
        }
    }
}
