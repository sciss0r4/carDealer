using SalonSamochodowy.CarMicroservice;
using SalonSamochodowy.CarMicroservice.Models;
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
    public class DeleteCarViewModel : INotifyPropertyChanged
    {
        private ObservableCollection<string> _searchedCars;
        private Dictionary<string, string> _searchedCarsDict;
        private ICarMicroservice _carMicroservice;
        private int _selectedListBoxIndex;

        public DeleteCarViewModel(ICarMicroservice carMicroservice)
        {
    
            _carMicroservice = carMicroservice;
            _searchedCarsDict = _carMicroservice.GetAllCars();
            SearchedCars = new ObservableCollection<string>();
            foreach(KeyValuePair<string, string> entry in _searchedCarsDict)
            {
                String name = entry.Key + " : " + entry.Value;
                SearchedCars.Add(name);
            }
            DeleteCarCommand = new RelayCommand(x => ExecuteDeleteCommand(), x => CarExecuteDeleteCommand());
        }

        public string SelectedCarId
        {
            get { return _searchedCarsDict.ElementAt(SelectedListBoxIndex).Key; }
        }

        public ObservableCollection<string> SearchedCars
        {
            get { return _searchedCars; }
            set
            {
                _searchedCars = value;
                OnPropertyChanged("SearchedCars");
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

        private ICommand _deleteCarCommand; 

        public ICommand DeleteCarCommand
        {
            get { return _deleteCarCommand; }
            set
            {
                _deleteCarCommand = value;
                OnPropertyChanged("DeleteCarCommand");
            }
        }

        public void ExecuteDeleteCommand()
        {
            _carMicroservice.DeleteCar(SelectedCarId);
            _searchedCars.RemoveAt(_selectedListBoxIndex);
        }

        public bool CarExecuteDeleteCommand()
        {
            return IsCarSelected;
        }

        public bool IsCarSelected
        {
            get { return SelectedListBoxIndex >= 0 && SelectedListBoxIndex < SearchedCars.Count; }
        }

        public int SelectedListBoxIndex
        {
            get { return _selectedListBoxIndex; }
            set
            {
                _selectedListBoxIndex = value;
                OnPropertyChanged("SelectedListBoxIndex");
                OnPropertyChanged("IsCarSelected");
            }
        }

    }
}
