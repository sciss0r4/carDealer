using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalonSamochodowy.ClientMicroservice
{
    class ClientViewModelMapper : IClientViewModelMapper
    {
        private IClientMicroservice _clientMicroservice;
        public ClientViewModelMapper(IClientMicroservice clientMicroservice)
        {
            _clientMicroservice = clientMicroservice;
        }

        public ClientViewModel MapFromDataRow(DataRow dt, int clientId)
        {
            var cvm = new ClientViewModel(_clientMicroservice);
            cvm.ClientId = clientId;
            cvm.Nazwisko = dt["nazwisko"].ToString();
            cvm.Imie = dt["imie"].ToString();
            cvm.Pesel = dt["PESEL"].ToString();
            cvm.Ulica = dt["ulica"].ToString();
            cvm.NrDomu = dt["nrDomu"].ToString();
            cvm.NrLokalu = dt["nrLokalu"].ToString();
            cvm.Miejscowosc = dt["miejscowość"].ToString();
            cvm.KodPocztowy = dt["kodPocztowy"].ToString();
            cvm.DataUrodzenia = DateTime.Parse(dt["dataUrodzenia"].ToString());
            return cvm;
        }
    }
}
