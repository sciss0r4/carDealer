using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalonSamochodowy.ServiceMicroservice
{
    public class ServiceCarListItem : INotifyPropertyChanged
    {
        public int CarId {get;set;}
        public string CarName { get; set; }

        public ServiceCarListItem(string carName, int carId)
        {
            CarName = carName;
            CarId = carId;
        }

        public event PropertyChangedEventHandler PropertyChanged;

        protected void OnPropertyChanged(string name)
        {
            PropertyChangedEventHandler handler = PropertyChanged;
            if (handler != null)
            {
                handler(this, new PropertyChangedEventArgs(name));
            }
        }
    }
}
