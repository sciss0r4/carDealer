using SalonSamochodowy.LoginMicroservice.Constants;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalonSamochodowy.LoginMicroservice
{
    public interface ILoginMicroservice
    {
        bool UserExists(string userName);
        bool PasswordIsCorrect(string userName, string password);

        UserData GetUserData(string userName, string password);
    }
}
