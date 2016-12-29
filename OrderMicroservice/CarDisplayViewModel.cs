using GalaSoft.MvvmLight.Messaging;
using SalonSamochodowy.Shared;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Windows.Input;

namespace SalonSamochodowy.OrderMicroservice
{
    public class CarDisplayViewModel : INotifyPropertyChanged
    {
        private OrderViewModel _ovm;
        private IOrderMicroservice _orderMicroservice;
        private DataTable _matchingCars;
        private int _selectedCarIndex;

        public int SelectedCarIndex
        {
            get { return _selectedCarIndex; }
            set 
            { 
                _selectedCarIndex = value;
                OnPropertyChanged("SelectedCarIndex");
            }
        }

        public DataTable MatchingCars
        {
            get { return _matchingCars; }
            set { _matchingCars = value; }
        }

        public CarDisplayViewModel(OrderViewModel ovm, IOrderMicroservice orderMicro)
        {
            _ovm = ovm;
            SelectedCarIndex = -1;
            _orderMicroservice = orderMicro;
            _matchingCars = _orderMicroservice.GetMatchingCars(_ovm.WybraneIdModelu,_ovm.WybraneIdNadwozia,_ovm.WybraneIdLakieru,_ovm.WybraneIdSilnika,_ovm.OptionsList.Select(x => x.OptionId).ToList());
            AddOrderCommand = new RelayCommand(x => ExecuteAddOrder(), x => CanExecuteAddOrder());
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

        #region Commands

        private ICommand _addOrderCommand;

        public ICommand AddOrderCommand
        {
            get
            {
                return _addOrderCommand;
            }
            internal set
            {
                _addOrderCommand = value;
                OnPropertyChanged("AddOrderCommand");
            }
        }

        public void ExecuteAddOrder()
        {
            int idPojazd = (int)MatchingCars.Rows[SelectedCarIndex]["idPojazd"];
            _orderMicroservice.AddOrder(_ovm, idPojazd);
            string zam = "DodanoZamowienie";
            Messenger.Default.Send(new NotificationMessage(zam));
        }

        public bool CanExecuteAddOrder()
        {
            var matchingCount = _matchingCars.Rows.Count;
            return matchingCount > 0 && SelectedCarIndex >= 0 && SelectedCarIndex < matchingCount;
        }

        #endregion
    }
}
