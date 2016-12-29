using Microsoft.Practices.Unity;
using SalonSamochodowy.CarMicroservice.Models;
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

namespace SalonSamochodowy.CarViews
{
    /// <summary>
    /// Interaction logic for AddCarWindow.xaml
    /// </summary>
    public partial class AddCarWindow : Window
    {

        [Dependency]
        public CarViewModel ViewModel
        {
            set 
            { 
                DataContext = value;
            }
        }
        public AddCarWindow()
        {
            InitializeComponent();
            ViewModel = new CarViewModel(App.Container.Resolve<ICarMicroservice>());
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
