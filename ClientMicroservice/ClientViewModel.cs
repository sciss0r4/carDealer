using SalonSamochodowy.Shared;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Windows.Input;

namespace SalonSamochodowy.ClientMicroservice
{

    public class ClientViewModel : INotifyPropertyChanged
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

        public ClientViewModel(IClientMicroservice client)
        {
            _clientMicroservice = client;
            AddUserCommand = new RelayCommand(x => ExecuteAddUser(), x => CanExecuteAddUser());
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
        }

        #region Commands

        private ICommand _addUserCommand;

        public ICommand AddUserCommand
        {
            get
            {
                return _addUserCommand;
            }
            internal set
            {
                _addUserCommand = value;
                OnPropertyChanged("AddUserCommand");
            }
        }

        public void ExecuteAddUser()
        {
            if(ValidateClientModel.Validate(this))
            {
                _clientMicroservice.AddClient(this);
                MessageBox.Show("Uzytkownik dodany pomyślnie!");
            }
            else
            {
                MessageBox.Show("Formularz zawiera błędne pola!");
            }
        }

        public bool CanExecuteAddUser()
        {
            return true;
        }

        #endregion
    }
}
