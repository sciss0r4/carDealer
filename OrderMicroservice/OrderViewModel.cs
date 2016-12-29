using GalaSoft.MvvmLight.Messaging;
using SalonSamochodowy.ClientMicroservice;
using SalonSamochodowy.Shared;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace SalonSamochodowy.OrderMicroservice
{
    public class OrderViewModel : INotifyPropertyChanged
    {
        private int _idKlienta;
        private string _imieKlienta;
        private string _nazwiskoKlienta;
        private string _peselKlienta;
        private string _miejscowoscKlienta;
        private string _ulicaKlienta;
        private string _nrDomuKlienta;
        private string _nrLokaluKlienta;
        private string _kodPocztowyKlienta;
        private DateTime _dataUrodzeniaKlienta;
        private IList<string> _markiSamochodow;
        private Dictionary<int, string> _markiIdSamochodow;
        private int _wybranyIndeksMarki;
        private Dictionary<int, string> _modeleIdSamochodow;
        private IList<string> _modeleSamochodow;
        private int _wybranyIndeksModelu;
        private Dictionary<int, string> _lakieryIdSamochodow;
        private IList<string> _lakierySamochodow;
        private int _wybranyIndeksLakieru;
        private Dictionary<int, string> _nadwoziaIdSamochodow;
        private IList<string> _nadwoziaSamochodow;
        private int _wybranyIndeksNadwozia;
        private Dictionary<int, string> _silnikiIdSamochodow;
        private IList<string> _silnikiSamochodow;
        private int _wybranyIndeksSilnika;
        private IOrderMicroservice _orderMicroservice;
        private List<ChooseOptionsListItem> _optionsList;
        private string _optionsString;
        private int _idPracownik;

        public int IdPracownik
        {
            get { return _idPracownik; }
            set { _idPracownik = value; }
        }

        public int IdKlienta
        {
            get { return _idKlienta; }
        }

        public int WybraneIdModelu
        {
            get 
            {
                if (WybranoModel)
                    return _modeleIdSamochodow.ElementAt(WybranyIndeksModelu).Key;
                else
                    return -1;
            }
        }

        public int WybraneIdNadwozia
        {
            get
            {
                if (WybranoWszystkieOpcje)
                    return _nadwoziaIdSamochodow.ElementAt(WybranyIndeksNadwozia).Key;
                else
                    return -1;
            }
        }

        public int WybraneIdLakieru
        {
            get
            {
                if (WybranoWszystkieOpcje)
                    return _lakieryIdSamochodow.ElementAt(WybranyIndeksLakieru).Key;
                else
                    return -1;
            }
        }

        public int WybraneIdSilnika
        {
            get
            {
                if (WybranoWszystkieOpcje)
                    return _silnikiIdSamochodow.ElementAt(WybranyIndeksSilnika).Key;
                else
                    return -1;
            }
        }

        public string OptionsString
        {
            get { return _optionsString; }
            set 
            { 
                _optionsString = value;
                OnPropertyChanged("OptionsString");
            }
        }

        public List<ChooseOptionsListItem> OptionsList
        {
            get { return _optionsList; }
            set 
            { 
                _optionsList = value;
                OnPropertyChanged("OptionsList");
            }
        }
        public event PropertyChangedEventHandler PropertyChanged;

        public void UpdateCarOptions(List<ChooseOptionsListItem> optionsList)
        {
            OptionsList = optionsList.Where(x => x.Checked).ToList();
        }

        public string ImieKlienta
        {
            get { return _imieKlienta; }
            set { _imieKlienta = value; }
        }

        public string NazwiskoKlienta
        {
            get { return _nazwiskoKlienta; }
            set { _nazwiskoKlienta = value; }
        }

        public string PeselKlienta
        {
            get { return _peselKlienta; }
            set { _peselKlienta = value; }
        }

        public string MiejscowoscKlienta
        {
            get { return _miejscowoscKlienta; }
            set { _miejscowoscKlienta = value; }
        }

        public string UlicaKlienta
        {
            get { return _ulicaKlienta; }
            set { _ulicaKlienta = value; }
        }

        public string NrDomuKlienta
        {
            get { return _nrDomuKlienta; }
            set { _nrDomuKlienta = value; }
        }

        public string NrLokaluKlienta
        {
            get { return _nrLokaluKlienta; }
            set { _nrLokaluKlienta = value; }
        }

        public string KodPocztowyKlienta
        {
            get { return _kodPocztowyKlienta; }
            set { _kodPocztowyKlienta = value; }
        }

        public DateTime DataUrodzeniaKlienta
        {
            get { return _dataUrodzeniaKlienta; }
            set { _dataUrodzeniaKlienta = value; }
        }

        public IList<string> MarkiSamochodow
        {
            get { return _markiSamochodow; }
            set { _markiSamochodow = value; }
        }

        public int WybranyIndeksMarki
        {
            get { return _wybranyIndeksMarki; }
            set
            {
                _wybranyIndeksMarki = value;
                OnPropertyChanged("WybranyIndeksMarki");
                OnPropertyChanged("WybranoMarke");
            }
        }

        public bool WybranoMarke
        {
            get { return WybranyIndeksMarki >= 0 && WybranyIndeksMarki < MarkiSamochodow.Count; }
            set
            {
                OnPropertyChanged("WybranoMarke");
            }
        }

        public int WybranyIndeksModelu
        {
            get { return _wybranyIndeksModelu; }
            set
            {
                _wybranyIndeksModelu = value;
                OnPropertyChanged("WybranyIndeksModelu");
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
            get { return WybranyIndeksModelu >= 0 && WybranyIndeksModelu < ModeleSamochodow.Count; }
            set
            {
                OnPropertyChanged("WybranoModel");
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

        public int WybranyIndeksLakieru
        {
            get { return _wybranyIndeksLakieru; }
            set
            {
                _wybranyIndeksLakieru = value;
                OnPropertyChanged("WybranyIndeksLakieru");
                OnPropertyChanged("WybranoWszystkieOpcje");
            }
        }

        public IList<string> NadwoziaSamochodow
        {
            get { return _nadwoziaSamochodow; }
            set
            {
                _nadwoziaSamochodow = value;
                OnPropertyChanged("NadwoziaSamochodow");
            }
        }

        public int WybranyIndeksNadwozia
        {
            get { return _wybranyIndeksNadwozia; }
            set
            {
                _wybranyIndeksNadwozia = value;
                OnPropertyChanged("WybranyIndeksNadwozia");
                OnPropertyChanged("WybranoWszystkieOpcje");
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
        public int WybranyIndeksSilnika
        {
            get { return _wybranyIndeksSilnika; }
            set
            {
                _wybranyIndeksSilnika = value;
                OnPropertyChanged("WybranyIndeksSilnika");
                OnPropertyChanged("WybranoWszystkieOpcje");
            }
        }

        public bool WybranoWszystkieOpcje
        {
            get 
            {
                return (WybranyIndeksNadwozia >= 0 && WybranyIndeksNadwozia < NadwoziaSamochodow.Count) &&
                    (WybranyIndeksSilnika >= 0 && WybranyIndeksSilnika < SilnikiSamochodow.Count) &&
                    (WybranyIndeksLakieru >= 0 && WybranyIndeksLakieru < LakierySamochodow.Count);
            }
        }

        public OrderViewModel(ClientViewModel clientViewModel, IOrderMicroservice ovm)
        {
            _orderMicroservice = ovm;
            ImieKlienta = clientViewModel.Imie;
            NazwiskoKlienta = clientViewModel.Nazwisko;
            PeselKlienta = clientViewModel.Pesel;
            MiejscowoscKlienta = clientViewModel.Miejscowosc;
            UlicaKlienta = clientViewModel.Ulica;
            NrLokaluKlienta = clientViewModel.NrLokalu;
            NrDomuKlienta = clientViewModel.NrDomu;
            KodPocztowyKlienta = clientViewModel.KodPocztowy;
            DataUrodzeniaKlienta = clientViewModel.DataUrodzenia;
            _markiIdSamochodow = _orderMicroservice.GetAllBrands();
            MarkiSamochodow = _markiIdSamochodow.Values.ToList();
            WybranyIndeksMarki = -1;
            WybranyIndeksModelu = -1;
            WybranyIndeksLakieru = -1;
            WybranyIndeksNadwozia = -1;
            WybranyIndeksSilnika = -1;
            AddOrderCommand = new RelayCommand(x => ExecuteAddOrder(), x => CanExecuteAddOrder());
            OptionsList = new List<ChooseOptionsListItem>();
            _idKlienta = clientViewModel.ClientId;
        }

        protected void OnPropertyChanged(string name)
        {
            if (name == "WybranyIndeksMarki" && WybranoMarke)
            {
                var idMarki = _markiIdSamochodow.ElementAt(WybranyIndeksMarki).Key;
                _modeleIdSamochodow = _orderMicroservice.GetModelsForBrandId(idMarki);
                ModeleSamochodow = _modeleIdSamochodow.Values.ToList();
                WybranyIndeksModelu = -1;
                WybranyIndeksLakieru = -1;
                WybranyIndeksNadwozia = -1;
                WybranyIndeksSilnika = -1;
            }

            if (name == "WybranyIndeksModelu" && WybranoModel)
            {
                var idModelu = _modeleIdSamochodow.ElementAt(WybranyIndeksModelu).Key;
                _lakieryIdSamochodow = _orderMicroservice.GetPaintsForModelId(idModelu);
                LakierySamochodow = _lakieryIdSamochodow.Values.ToList();
                WybranyIndeksLakieru = -1;

                _nadwoziaIdSamochodow = _orderMicroservice.GetAllCarBodies();
                NadwoziaSamochodow = _nadwoziaIdSamochodow.Values.ToList();
                WybranyIndeksNadwozia = -1;

                _silnikiIdSamochodow = _orderMicroservice.GetEngineFullNamesForModelId(idModelu);
                SilnikiSamochodow = _silnikiIdSamochodow.Values.ToList();
                WybranyIndeksSilnika = -1;
            }

            if (name == "OptionsList")
            {
                if (OptionsList.Count == 0)
                {
                    OptionsString = "---Brak---";
                }
                else
                {
                    OptionsString = String.Empty;
                    for (int i = 0; i < OptionsList.Count;++i )
                    {
                        OptionsString += OptionsList[i].OptionName;

                        if (i != OptionsList.Count - 1)
                        {
                            OptionsString += " *** ";
                        }
                    }
                }
            }

            PropertyChangedEventHandler handler = PropertyChanged;
            if (handler != null)
            {
                handler(this, new PropertyChangedEventArgs(name));
            }
        }

        #region Commands

        private ICommand _addOrderCommand;

        public ICommand AddOrderCommand
        {
            get { return _addOrderCommand; }
            set 
            { 
                _addOrderCommand = value;
                OnPropertyChanged("AddOrderCommand");
            }
        }
        public void ExecuteAddOrder()
        {
            Messenger.Default.Send(new NotificationMessage("AddCurrentOrder"));
        }

        public bool CanExecuteAddOrder()
        {
            return WybranoWszystkieOpcje;
        }


        #endregion
    }
}
