using SalonSamochodowy.LoginMicroservice.Constants;
using SalonSamochodowy.Shared;
using SalonSamochodowy.Shared.Constants;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalonSamochodowy.LoginMicroservice
{
    public class LoginMicroservice : ILoginMicroservice
    {
        public bool UserExists(string userName)
        {
            using (var data = new DatabaseAccess.DatabaseAccess(DatabaseParams.ConnectionString, DatabaseParams.DatabaseTimeout))
            {
                data.ProcedureName = SprocNames.UserExists;
                data.AddParameter("@userName", SqlDbType.NVarChar, userName);
                var dt = data.ExecuteAndReturnDataTable();

                return dt.Rows.Count > 0;
            }
        }

        public bool PasswordIsCorrect(string userName, string password)
        {
            using (var data = new DatabaseAccess.DatabaseAccess(DatabaseParams.ConnectionString, DatabaseParams.DatabaseTimeout))
            {
                data.ProcedureName = SprocNames.PasswordIsCorrect;
                data.AddParameter("@userName", SqlDbType.NVarChar, userName);
                data.AddParameter("@password", SqlDbType.NVarChar, password);
                var dt = data.ExecuteAndReturnDataTable();

                return dt.Rows.Count > 0;
            }
        }


        public UserData GetUserData(string userName, string password)
        {
            DataTable dt;
            using (var data = new DatabaseAccess.DatabaseAccess(DatabaseParams.ConnectionString, DatabaseParams.DatabaseTimeout))
            {
                data.ProcedureName = SprocNames.GetUserPermissionsAndName;
                data.AddParameter("@userName", SqlDbType.NVarChar, userName);
                data.AddParameter("@password", SqlDbType.NVarChar, password);
                dt = data.ExecuteAndReturnDataTable();
            }

            UserData ud = new UserData();

            ud.Permissions = (Permissions)dt.Rows[0]["idPoziomUprawnien"];
            ud.Name = dt.Rows[0]["name"].ToString();
            ud.PracownikId = (int)dt.Rows[0]["idPracownik"];

            return ud;
        }
    }
}
