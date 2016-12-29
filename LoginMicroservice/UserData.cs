using SalonSamochodowy.LoginMicroservice.Constants;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalonSamochodowy.LoginMicroservice
{
    public struct UserData
    {
        public Permissions Permissions {get;set;}
        public string Name {get;set;}
        public int PracownikId {get;set;}
    }
}
