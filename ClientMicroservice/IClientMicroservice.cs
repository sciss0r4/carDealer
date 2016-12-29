using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalonSamochodowy.ClientMicroservice
{
    public interface IClientMicroservice
    {
        void AddClient(ClientViewModel model);

        /// <summary>
        /// String.Empty as parameter - returns all clients
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        Dictionary<int,string> GetClientsNamesByPattern(ClientViewModel model);

        ClientViewModel GetClientInfoById(int clientId);
    }
}
