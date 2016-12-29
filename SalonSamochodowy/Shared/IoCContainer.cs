using SalonSamochodowy.DatabaseAccess;
using SalonSamochodowy.SampleMicroservice;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalonSamochodowy.Shared
{
    internal class IoCContainer
    {
        private readonly ISampleMicroservice _sampleService;

        public ISampleMicroservice SampleMicroservice
        {
            get { return _sampleService; }
        }

        public IoCContainer(ISampleMicroservice sampleService)
        {
            _sampleService = sampleService;
        }
    }
}
