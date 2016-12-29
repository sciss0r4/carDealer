using SalonSamochodowy.ClientMicroservice;
using SalonSamochodowy.ClientViews;
using SalonSamochodowy.OrderMicroservice;
using SalonSamochodowy.OrderViews;
using SalonSamochodowy.Shared;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace SalonSamochodowy.ViewModel
{
    public class SellerViewModel : INotifyPropertyChanged
    {
        private string _clientSearchText = String.Empty;
        private ObservableCollection<string> _searchedClients;
        private Dictionary<int, string> _searchedClientsDictionary;
        private IClientMicroservice _clientMicroservice;
        private int _selectedListBoxIndex;
        private int _selectedOrderIndex;
        private int _idPracownik;
        private IOrderMicroservice _orderMicroservice;

        private ObservableCollection<OrdersListItem> _listItems;
        public ObservableCollection<OrdersListItem> ListItems
        {
            get { return _listItems; }
            set
            {
                _listItems = value;
                OnPropertyChanged("ListItems");
            }
        }

        public int IdPracownik
        {
            get { return _idPracownik; }
            set { _idPracownik = value; }
        }

        public int SelectedListBoxIndex
        {
            get { return _selectedListBoxIndex; }
            set 
            { 
                _selectedListBoxIndex = value;
                OnPropertyChanged("SelectedListBoxIndex");
                OnPropertyChanged("IsClientSelected");
            }
        }

        public int SelectedOrderIndex
        {
            get { return _selectedOrderIndex; }
            set
            {
                _selectedOrderIndex = value;
                OnPropertyChanged("SelectedOrderIndex");
                OnPropertyChanged("IsOrderSelected");
            }
        }

        public SellerViewModel(IClientMicroservice clientMicroservice, IOrderMicroservice orderMicroservice)
        {
            _clientMicroservice = clientMicroservice;
            _searchedClientsDictionary = GetClientsByPattern(String.Empty);
            SearchedClients = new ObservableCollection<string>(_searchedClientsDictionary.Values.ToList());
            ClientDetailsCommand = new RelayCommand(x => ExecuteDetailsCommand(), x => CanExecuteDetailsCommand());
            OrderDetailsCommand = new RelayCommand(x => ExecuteOrdersCommand(), x => CanExecuteOrdersCommand());
            _listItems = new ObservableCollection<OrdersListItem>();
            _orderMicroservice = orderMicroservice;
            SelectedListBoxIndex = SelectedListBoxIndex;
        }

        public int SelectedClientId
        {
            get { return _searchedClientsDictionary.ElementAt(SelectedListBoxIndex).Key; }
        }

        public int SelectedOrderId
        {
            get { return ListItems.ElementAt(SelectedOrderIndex).OrderId; }
        }

        public bool IsClientSelected
        {
            get { return SelectedListBoxIndex >= 0 && SelectedListBoxIndex < SearchedClients.Count; }
        }

        public bool IsOrderSelected
        {
            get { return SelectedOrderIndex >= 0 && SelectedOrderIndex < ListItems.Count; }
        }

        public ObservableCollection<string> SearchedClients
        {
            get { return _searchedClients; }
            set 
            {
                _searchedClients = value;
                OnPropertyChanged("SearchedClients");
            }
        }
        public event PropertyChangedEventHandler PropertyChanged;

        public string ClientSearchText
        {
            get { return _clientSearchText; }
            set 
            { 
                _clientSearchText = value;
                OnPropertyChanged("ClientSearchText");
            }
        }

        protected void OnPropertyChanged(string name)
        {
            if(name.Equals("ClientSearchText"))
            {
                _searchedClientsDictionary = GetClientsByPattern(ClientSearchText);
                SearchedClients = new ObservableCollection<string>(_searchedClientsDictionary.Values.ToList());
            }

            if (name.Equals("SelectedListBoxIndex") && IsClientSelected)
            {
                var orders = _orderMicroservice.GetOrdersForClientId(SelectedClientId);
                var obs = new ObservableCollection<OrdersListItem>();

                foreach(var o in orders)
                {
                    obs.Add(new OrdersListItem(o.Value, o.Key));
                }

                ListItems = obs;
            }

            PropertyChangedEventHandler handler = PropertyChanged;
            if (handler != null)
            {
                handler(this, new PropertyChangedEventArgs(name));
            }
        }

        #region Service Methods

        private Dictionary<int,string> GetClientsByPattern(string pattern)
        {
            ClientViewModel cvm = new ClientViewModel(_clientMicroservice);
            cvm.Imie = pattern;
            cvm.Nazwisko = pattern;
            cvm.Pesel = pattern;
            cvm.Ulica = pattern;
            cvm.Miejscowosc = pattern;
            return _clientMicroservice.GetClientsNamesByPattern(cvm);
        }

        #endregion

        #region Commands

        private ICommand _clientDetailsCommand;

        public ICommand ClientDetailsCommand
        {
            get { return _clientDetailsCommand; }
            set 
            { 
                _clientDetailsCommand = value;
                OnPropertyChanged("ClientDetailsCommand");
            }
        }

        public void ExecuteDetailsCommand()
        {
            var clientDetailsWindow = new ClientDetails(SelectedClientId);
            clientDetailsWindow.ShowDialog();
        }

        public bool CanExecuteDetailsCommand()
        {
            return IsClientSelected;
        }

        private ICommand _orderDetailsCommand;

        public ICommand OrderDetailsCommand
        {
            get { return _orderDetailsCommand; }
            set
            {
                _orderDetailsCommand = value;
                OnPropertyChanged("OrderDetailsCommand");
            }
        }

        public void ExecuteOrdersCommand()
        {
            var orderDetailsWindow = new OrderDetails(SelectedOrderId);
            orderDetailsWindow.ShowDialog();
        }

        public bool CanExecuteOrdersCommand()
        {
            return IsOrderSelected;
        }

        #endregion
    }
}
