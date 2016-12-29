using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalonSamochodowy.ViewModel
{
    public class MechanicListItem : INotifyPropertyChanged
    {
        private string _serviceQuery;

        public string ServiceQuery
        {
            get { return _serviceQuery; }
            set { _serviceQuery = value; }
        }

        private int _serviceId;

        public int ServiceId
        {
            get { return _serviceId; }
            set { _serviceId = value; }
        }

        public MechanicListItem(int id, string query)
        {
            ServiceId = id;
            ServiceQuery = query;
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
