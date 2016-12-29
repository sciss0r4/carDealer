using SalonSamochodowy.CarMicroservice;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using Microsoft.Practices.Unity;
using System.Collections.ObjectModel;
using SalonSamochodowy.ServiceMicroservice;
using System.ComponentModel;
using SalonSamochodowy.OrderMicroservice;

namespace SalonSamochodowy.CarViews
{
    /// <summary>
    /// Interaction logic for ShowCarWindow.xaml
    /// </summary>
    public partial class ShowCarWindow : Window, INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;
        public ObservableCollection<string> Cars
        {
            get;
            set;
        }

        private List<int> CarRefs;

        public ObservableCollection<string> Wyposaz
        {
            get;
            set;
        }

        public int SelectedCarIndex
        {
            get { return MainListBox.SelectedIndex; }
        }

        private IOrderMicroservice _orderx;

        public ShowCarWindow(IServiceMicroservice car, IOrderMicroservice mic)
        {
            InitializeComponent();
            Cars = new ObservableCollection<string>();
            var vins = car.GetCarsByVIN(String.Empty);
            var keys = vins.Values;
            CarRefs = vins.Keys.ToList();

            foreach(var c in keys)
            {
                Cars.Add(c);
            }
            
            MainListBox.ItemsSource = Cars;
            _orderx = mic;
        }

        protected void OnPropertyChanged(string name)
        {
            PropertyChangedEventHandler handler = PropertyChanged;
            if (handler != null)
            {
                handler(this, new PropertyChangedEventArgs(name));
            }
        }

        private void MainListBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Wyposaz = new ObservableCollection<string>();

            if (SelectedCarIndex >= 0 && SelectedCarIndex < Cars.Count)
            {
                var zet = _orderx.GetCarOptionsForCarID(CarRefs[SelectedCarIndex]);
                List<string> ex = new List<string>();

                foreach(var x in zet)
                {
                    switch(x)
                    {
                        case 1: ex.Add("Podgrzewane Fotele"); break;
                        case 2: ex.Add("Elektryczne Lusterka"); break;
                        case 3: ex.Add("Klimatyzacja"); break;
                        case 4: ex.Add("Fabryczne radio"); break;
                        case 5: ex.Add("Światła do jazdy dziennej"); break;
                        default: ex.Add("Nieznane"); break;
                    }
                }

                WyposazListBox.ItemsSource = ex;
            }
        }
    }
}
