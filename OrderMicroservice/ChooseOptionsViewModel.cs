using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalonSamochodowy.OrderMicroservice
{
    public class ChooseOptionsViewModel : INotifyPropertyChanged
    {
        private Dictionary<int, string> _optionsIdNames;
        private List<string> _optionsNames;
        private IOrderMicroservice _orderMicroservice;
        private ObservableCollection<ChooseOptionsListItem> _listItems;

        public ObservableCollection<ChooseOptionsListItem> ListItems
        {
            get { return _listItems; }
            set 
            { 
                _listItems = value;
                OnPropertyChanged("ListItems");
            }
        }

        public List<string> OptionsNames
        {
            get { return _optionsNames; }
            set 
            { 
                _optionsNames = value;
                OnPropertyChanged("OptionsNames");
            }
        }

        public ChooseOptionsViewModel(IOrderMicroservice orderMicroservice)
        {
            _orderMicroservice = orderMicroservice;
            _optionsIdNames = _orderMicroservice.GetAllConfigurationOptions();
            _listItems = new ObservableCollection<ChooseOptionsListItem>();

            foreach(KeyValuePair<int,string> option in _optionsIdNames)
            {
                ChooseOptionsListItem listItem = new ChooseOptionsListItem(false,option.Value,option.Key);
                _listItems.Add(listItem);
            }
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
