using SalonSamochodowy.ClientMicroservice;
using SalonSamochodowy.OrderMicroservice;
using SalonSamochodowy.Shared;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Windows.Input;

namespace SalonSamochodowy.ServiceMicroservice
{
    public class ServiceViewModel : INotifyPropertyChanged
    {
        private int _clientId = 0;
        private string _nazwisko = String.Empty;
        private string _imie = String.Empty;
        private string _ulica = String.Empty;
        private string _nrDomu = String.Empty;
        private string _nrLokalu = String.Empty;
        private string _pesel = String.Empty;
        private string _miejscowosc = String.Empty;
        private string _kodPocztowy = String.Empty;
        private IClientMicroservice _clientMicroservice;
        private DateTime _dataUrodzenia = DateTime.Today;
        public event PropertyChangedEventHandler PropertyChanged;
        private IServiceMicroservice _serviceMicroservice;

        private string _enteredVIN;
        private ObservableCollection<ServiceCarListItem> _carItems;
        private int _selectedServiceIndex;
        private List<ChooseOptionsListItem> _optionsList;
        private string _opis;
        private int _idPracownik;

        public string Opis
        {
            get { return _opis; }
            set { _opis = value; }
        }

        public List<ChooseOptionsListItem> OptionsList
        {
            get { return _optionsList; }
            set { _optionsList = value; }
        }

        public int SelectedServiceIndex
        {
            get { return _selectedServiceIndex; }
            set 
            { 
                _selectedServiceIndex = value;
                OnPropertyChanged("SelectedServiceIndex");
                OnPropertyChanged("CarIsSelected");
            }
        }

        public int SelectedCarId
        {
            get 
            {
                if(!CarIsSelected)
                {
                    throw new ArgumentException();
                }
                else
                {
                    return CarItems.ElementAt(SelectedServiceIndex).CarId;
                }
            }
        }

        public bool CarIsSelected
        {
            get { return SelectedServiceIndex >= 0 && SelectedServiceIndex < CarItems.Count; }
        }

        public ObservableCollection<ServiceCarListItem> CarItems
        {
            get { return _carItems; }
            set 
            { 
                _carItems = value;
                OnPropertyChanged("CarItems");
            }
        }

        public string EnteredVIN
        {
            get { return _enteredVIN; }
            set 
            { 
                _enteredVIN = value;
                OnPropertyChanged("EnteredVIN");
            }
        }


        public ServiceViewModel(IClientMicroservice client, int clientId, IServiceMicroservice service, int idPracownik)
        {
            _clientMicroservice = client;
            var clientInfo = _clientMicroservice.GetClientInfoById(clientId);
            MapViewModelToServiceVM(clientInfo, this);
            CarItems = new ObservableCollection<ServiceCarListItem>();
            _serviceMicroservice = service;
            EnteredVIN = String.Empty;
            AddServiceCommand = new RelayCommand(x => ExecuteAddServiceCommand(), x => CanExecuteAddServiceCommand());
            Opis = "--- Wprowadź opis zlecenia ---";
            _idPracownik = idPracownik;
        }

        private void MapViewModelToServiceVM(ClientViewModel model, ServiceViewModel svm)
        {
            svm.ClientId = model.ClientId;
            svm.Nazwisko = model.Nazwisko;
            svm.Imie = model.Imie;
            svm.Ulica = model.Ulica;
            svm.NrDomu = model.NrDomu;
            svm.NrLokalu = model.NrLokalu;
            svm.Pesel = model.Pesel;
            svm.Miejscowosc = model.Miejscowosc;
            svm.KodPocztowy = model.KodPocztowy;
            svm.DataUrodzenia = model.DataUrodzenia;
        }

        public int ClientId
        {
            get { return _clientId; }
            set
            {
                _clientId = value;
            }
        }

        public string Imie
        {
            get { return _imie; }
            set 
            { 
                _imie = value;
                OnPropertyChanged("Imie");
            }
        }
        
        public string Ulica
        {
            get { return _ulica; }
            set
            {
                _ulica = value;
                OnPropertyChanged("Ulica");
            }
        }
        
        public string NrDomu
        {
            get { return _nrDomu; }
            set
            {
                _nrDomu = value;
                OnPropertyChanged("NrDomu");
            }
        }

        public string NrLokalu
        {
            get { return _nrLokalu; }
            set
            {
                _nrLokalu = value;
                OnPropertyChanged("NrLokalu");
            }
        }

        public string Miejscowosc
        {
            get { return _miejscowosc; }
            set
            {
                _miejscowosc = value;
                OnPropertyChanged("Miejscowosc");
            }
        }

        public string KodPocztowy
        {
            get { return _kodPocztowy; }
            set
            {
                _kodPocztowy = value;
                OnPropertyChanged("KodPocztowy");
            }
        }

        public DateTime DataUrodzenia
        {
            get
            { 
                return _dataUrodzenia; 
            }
            set
            {
                _dataUrodzenia = value;
                OnPropertyChanged("DataUrodzenia");
            }
        }

        public string Nazwisko
        {
            get { return _nazwisko; }
            set
            {
                _nazwisko = value;
                OnPropertyChanged("Nazwisko");
            }
        }

        public string Pesel
        {
            get { return _pesel; }
            set 
            { 
                _pesel = value;
                OnPropertyChanged("Pesel");
            }
        }

        protected void OnPropertyChanged(string name)
        {
            PropertyChangedEventHandler handler = PropertyChanged;
            if (handler != null)
            {
                handler(this, new PropertyChangedEventArgs(name));
            }

            if(name.Equals("EnteredVIN"))
            {
                CarItems.Clear();
                var carsVIN = _serviceMicroservice.GetCarsByVIN(EnteredVIN);

                foreach(KeyValuePair<int,string> l in carsVIN)
                {
                    CarItems.Add(new ServiceCarListItem(l.Value, l.Key));
                }
            }
        }

        #region Commands

        private ICommand _addServiceCommand;

        public ICommand AddServiceCommand
        {
            get { return _addServiceCommand; }
            set
            {
                _addServiceCommand = value;
                OnPropertyChanged("AddServiceCommand");
            }
        }

        public void ExecuteAddServiceCommand()
        {
            _serviceMicroservice.AddService(_idPracownik,1,SelectedCarId,Opis,OptionsList);
            MessageBox.Show("Zlecenie serwisowe dodano pomyślnie.");
        }

        public bool CanExecuteAddServiceCommand()
        {
            return CarIsSelected;
        }

        #endregion
    }
}
