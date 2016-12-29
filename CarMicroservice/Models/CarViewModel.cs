using SalonSamochodowy.Shared;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Windows.Input;

namespace SalonSamochodowy.CarMicroservice.Models
{
    /**
     *@Author Szymon Ligocki <s.ligocki@outlook.com>
     **/
    public class CarViewModel : INotifyPropertyChanged
    {
        private string _VIN = String.Empty;
        private string _rokProdukcji = String.Empty;
        private int _przebieg = 0;
        private string _krajProdukcji = String.Empty;
        private string _cena = String.Empty;
        private IList<string> _nadwoziaSamochodow;
        private Dictionary<int, string> _nadwoziaIdSamochodow;
        private int _wybranyIdNadwozia;
        private IList<string> _modeleSamochodow;
        private Dictionary<int, string> _modeleIdSamochodow;
        private int _wybranyIdModelu;
        private IList<string> _statusySamochodow;
        private Dictionary<int, string> _statusyIdSamochodow;
        private int _wybranyIdStatusu;
        private IList<string> _lakierySamochodow;
        private Dictionary<int, string> _lakieryIdSamochodow;
        private int _wybranyIdLakieru;
        private IList<string> _silnikiSamochodow;
        private Dictionary<int, string> _silnikiIdSamochodow;
        private int _wybranyIdSilnika;
        private int _idKonfiguracjaPojazdu;

        public int RzeczywistyIdNadwozia
        {
            get 
            { 
                if(WybranoNadwozie)
                {
                    return _nadwoziaIdSamochodow.ElementAt(_wybranyIdNadwozia).Key;
                }
                else
                {
                    return -1;
                }
            }
        }

        public int RzeczywistyIdModelu
        {
            get
            {
                if (WybranoModel)
                {
                    return _modeleIdSamochodow.ElementAt(_wybranyIdModelu).Key;
                }
                else
                {
                    return -1;
                }
            }
        }

        public int RzeczywistyIdStatusu
        {
            get
            {
                if (WybranoStatus)
                {
                    return _statusyIdSamochodow.ElementAt(_wybranyIdStatusu).Key; 
                }
                else
                {
                    return -1;
                }
            }
        }

        public int RzeczywistyIdLakieru
        {
            get
            {
                if (WybranoLakier)
                {
                    return _lakieryIdSamochodow.ElementAt(_wybranyIdLakieru).Key;
                }
                else
                {
                    return -1;
                }
            }
        }

        public int RzeczywistyIdSilnika
        {
            get
            {
                if (WybranoSilnik)
                {
                    return _silnikiIdSamochodow.ElementAt(_wybranyIdSilnika).Key;
                }
                else
                {
                    return -1;
                }
            }
        }

        private ICarMicroservice _carMicreservice;
        public event PropertyChangedEventHandler PropertyChanged;

        public CarViewModel(ICarMicroservice client)
        {
            _carMicreservice = client;
            _nadwoziaIdSamochodow = _carMicreservice.GetAllCarBodies();
            NadwoziaSamochodow = _nadwoziaIdSamochodow.Values.ToList();
            _modeleIdSamochodow = _carMicreservice.GetAllCarModelsWithBrands();
            ModeleSamochodow = _modeleIdSamochodow.Values.ToList();
            _statusyIdSamochodow = _carMicreservice.GetAllCarStatuses();
            StatusySamochodow = _statusyIdSamochodow.Values.ToList();
            WybranyIdModelu = -1;
            WybranyIdLakieru = -1;
            _wybranyIdSilnika = -1;


            AddCarCommand = new RelayCommand(x => ExecuteAddCar(), x => CanExecuteAddUser());
        }

        public string VIN
        {
            get { return _VIN; }
            set
            {
                _VIN = value;
                OnPropertyChanged("VIN");
            }
        }

        public string RokProdukcji
        {
            get { return _rokProdukcji; }
            set
            {
                _rokProdukcji = value;
                OnPropertyChanged("RokProdukcji");
            }
        }

        public int Przebieg
        {
            get { return _przebieg; }
            set
            {
                _przebieg = value;
                OnPropertyChanged("Przebieg");
            }
        }

        public string KrajProdukcji
        {
            get { return _krajProdukcji; }
            set
            {
                _krajProdukcji = value;
                OnPropertyChanged("KrajProdukcji");
            }
        }

        public string Cena
        {
            get { return _cena; }
            set
            {
                _cena = value;
                OnPropertyChanged("Cena");
            }
        }

        public int IdKonfiguracjaPojazdu
        {
            get { return _idKonfiguracjaPojazdu; }
            set
            {
                _idKonfiguracjaPojazdu = value;
                OnPropertyChanged("IdKonfiguracjaPojazdu");
            }
        }

        public IList<string> NadwoziaSamochodow
        {
            get { return _nadwoziaSamochodow; }
            set { _nadwoziaSamochodow = value; }
        }

        public int WybranyIdNadwozia
        {
            get { return _wybranyIdNadwozia; }
            set
            {
                _wybranyIdNadwozia = value;
                OnPropertyChanged("WybranyIdNadwozia");
                OnPropertyChanged("WybranoNadwozie");
            }
        }

        public bool WybranoNadwozie
        {
            get { return WybranyIdNadwozia >= 0 && WybranyIdNadwozia < NadwoziaSamochodow.Count; }
            set
            {
                OnPropertyChanged("WybranoNadwozie");
            }
        }

        public bool WybranoLakier
        {
            get { return WybranyIdLakieru >= 0 && WybranyIdLakieru < LakierySamochodow.Count; }
        }

        public bool WybranoSilnik
        {
            get { return WybranyIdSilnika >= 0 && WybranyIdSilnika < SilnikiSamochodow.Count; }
        }

        public int WybranyIdModelu
        {
            get { return _wybranyIdModelu; }
            set
            {
                _wybranyIdModelu = value;
                OnPropertyChanged("WybranyIdModelu");
                OnPropertyChanged("WybranoModel");
            }
        }

        public IList<string> ModeleSamochodow
        {
            get { return _modeleSamochodow; }
            set
            {
                _modeleSamochodow = value;
                OnPropertyChanged("ModeleSamochodow");
            }
        }

        public bool WybranoModel
        {
            get { return WybranyIdModelu >= 0 && WybranyIdModelu < ModeleSamochodow.Count; }
            set
            {
                OnPropertyChanged("WybranoModel");
            }
        }

        public IList<string> StatusySamochodow
        {
            get { return _statusySamochodow; }
            set
            {
                _statusySamochodow = value;
                OnPropertyChanged("StatusySamochodow");
            }
        }

        public int WybranyIdStatusu
        {
            get { return _wybranyIdStatusu; }
            set
            {
                _wybranyIdStatusu = value;
                OnPropertyChanged("WybranyIdStatusu");
                OnPropertyChanged("WybranoStatus");
            }
        }

        public bool WybranoStatus
        {
            get { return WybranyIdStatusu >= 0 && WybranyIdStatusu < StatusySamochodow.Count; }
            set
            {
                OnPropertyChanged("WybranoStatus");
            }
        }

        public IList<string> LakierySamochodow
        {
            get { return _lakierySamochodow; }
            set
            {
                _lakierySamochodow = value;
                OnPropertyChanged("LakierySamochodow");
            }
        }

        public int WybranyIdLakieru
        {
            get { return _wybranyIdLakieru; }
            set
            {
                _wybranyIdLakieru = value;
                OnPropertyChanged("WybranyIdLakieru");
            }
        }

        public IList<string> SilnikiSamochodow
        {
            get { return _silnikiSamochodow; }
            set
            {
                _silnikiSamochodow = value;
                OnPropertyChanged("SilnikiSamochodow");
            }
        }

        public int WybranyIdSilnika
        {
            get { return _wybranyIdSilnika; }
            set
            {
                _wybranyIdSilnika = value;
                OnPropertyChanged("WybranyIdSilnika");
            }
        }

        //@Override 
        protected void OnPropertyChanged(string name)
        {
            if (name == "WybranyIdModelu" && WybranoModel)
            {
                var idModelu = _modeleIdSamochodow.ElementAt(WybranyIdModelu).Key;
                _lakieryIdSamochodow = _carMicreservice.GetPaintsForModelId(idModelu);
                LakierySamochodow = _lakieryIdSamochodow.Values.ToList();
             
                _silnikiIdSamochodow = _carMicreservice.GetEnginesForModelId(idModelu);
                SilnikiSamochodow = _silnikiIdSamochodow.Values.ToList();
            }

            PropertyChangedEventHandler handler = PropertyChanged;
            if (handler != null)
            {
                handler(this, new PropertyChangedEventArgs(name));
            }
        }

        #region Commands

        private ICommand _addCarCommand;

        public ICommand AddCarCommand
        {
            get
            {
                return _addCarCommand;
            }
            internal set
            {
                _addCarCommand = value;
                OnPropertyChanged("AddCarCommand");
            }
        }

        public void ExecuteAddCar()
        {
            if (ValidateCarModel.Validate(this))
            {
                _carMicreservice.AddCar(this);
                MessageBox.Show("Samochód dodany pomyślnie!");
            }
            else
            {
                MessageBox.Show("Wprowadzono nieprawidłowe dane!");
            }
        }

        public bool CanExecuteAddUser()
        {
            return true;
        }

        //private ICommand _removeCarCommand;
        //private ICommand _findCarCommand;
        //private ICommand _modifyCarCommand;

        #endregion

    }
}
