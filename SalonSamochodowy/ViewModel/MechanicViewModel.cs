using SalonSamochodowy.ServiceMicroservice;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalonSamochodowy.ViewModel
{
    public class MechanicViewModel : INotifyPropertyChanged
    {
        private ObservableCollection<MechanicListItem> _mechanicServiceList = new ObservableCollection<MechanicListItem>();

        public ObservableCollection<MechanicListItem> MechanicServiceList
        {
            get { return _mechanicServiceList; }
            set 
            {
                _mechanicServiceList = value;
                OnPropertyChanged("MechanicServiceList");
            }
        }

        private IServiceMicroservice _servMicro;

        public MechanicViewModel(IServiceMicroservice micro)
        {
            _servMicro = micro;
            var serviceDict = _servMicro.GetAllServices();
            MechanicServiceList.Clear();
            MechanicServiceList = MapServiceDictToObserv(serviceDict);
        }

        private ObservableCollection<MechanicListItem> MapServiceDictToObserv(Dictionary<int,string> input)
        {
            var temp = new ObservableCollection<MechanicListItem>();

            foreach (KeyValuePair<int, string> l in input)
            {
                temp.Add(new MechanicListItem(l.Key, l.Value));
            }

            return temp;
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
