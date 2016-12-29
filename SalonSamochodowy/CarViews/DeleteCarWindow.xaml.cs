using Microsoft.Practices.Unity;
using System;
using System.Collections.Generic;
using SalonSamochodowy.ViewModel;
using SalonSamochodowy.CarMicroservice;
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
    /// Interaction logic for DeleteCarWindow.xaml
    /// </summary>
    public partial class DeleteCarWindow : Window
    {
        private DeleteCarViewModel _deleteCarViewModel;

        [Dependency]
        public DeleteCarViewModel ViewModel
        {
            set 
            {
                DataContext = value;
                _deleteCarViewModel = value;
            }
        }

        public DeleteCarWindow()
        {
            InitializeComponent();
            ViewModel = new DeleteCarViewModel(App.Container.Resolve<ICarMicroservice>());
        }

    }
}
