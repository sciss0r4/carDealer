using SalonSamochodowy.SampleMicroservice.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalonSamochodowy.SampleMicroservice
{
    public interface ISampleMicroservice
    {
        ClientInfoModel GetSomethingFromDatabase(int input);
    }
}
