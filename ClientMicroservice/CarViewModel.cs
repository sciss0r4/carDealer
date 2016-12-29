using SalonSamochodowy.Shared;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalonSamochodowy.CarMicroservice.Models
{

    /**
     *@Author Szymon Ligocki 
     **/
    class CarViewModel : INotifyPropertyChanged
    {
        private string _VIN = String.Empty;
        private string _rokProdukcji = String.Empty;
        private int _przebieg = 0;
        private string _krajProdukcji = String.Empty;
        private string _cena = String.Empty;
        public event PropertyChangedEventHandler PropertyChanged;

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

        //@Override 
        protected void OnPropertyChanged(string name)
        {
            PropertyChangedEventHandler handler = PropertyChanged;
            if (handler != null)
            {
                handler(this, new PropertyChangedEventArgs(name));
            }
        }

        #region Commands

        //private ICommand _addCarCommand;
        //private ICommand _removeCarCommand;
        //private ICommand _findCarCommand;
        //private ICommand _modifyCarCommand;

        #endregion

    }
}
