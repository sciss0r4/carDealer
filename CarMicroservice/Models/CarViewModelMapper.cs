using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalonSamochodowy.CarMicroservice.Models
{
    class CarViewModelMapper : ICarViewModelMapper
    {
        private ICarMicroservice _carMicroservice;
        public CarViewModelMapper(ICarMicroservice carMicroservice)
        {
            _carMicroservice = carMicroservice;
        }

        public CarViewModel MapFromDataRow(DataRow dt)
        {
            var cvm = new CarViewModel(_carMicroservice);
            cvm.VIN = dt["VIM"].ToString();
            cvm.Przebieg = (int)dt["przebieg"];
            cvm.Cena = dt["cena"].ToString();
            cvm.KrajProdukcji = dt["krajProdukcji"].ToString();
            cvm.RokProdukcji = dt["rokProdukcji"].ToString();
            return cvm;
        }
    }
}
