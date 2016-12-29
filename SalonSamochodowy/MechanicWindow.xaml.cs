using Microsoft.Practices.Unity;
using SalonSamochodowy.ServiceMicroservice;
using SalonSamochodowy.ViewModel;
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

namespace SalonSamochodowy
{
    /// <summary>
    /// Interaction logic for MechanicWindow.xaml
    /// </summary>
    public partial class MechanicWindow : Window
    {
        private string _zalogowanyJako;

        public string ZalogowanyJako
        {
            get { return _zalogowanyJako; }
            set
            {
                var cocatenated = String.Concat("Zalogowany jako: ", value);
                _zalogowanyJako = cocatenated;
                ZalogowanyJakoMenu.Header = cocatenated;
            }
        }

        private MechanicViewModel _mechanicViewModel;

        [Dependency]
        public MechanicViewModel ViewModel
        {
            get { return _mechanicViewModel; }
            set
            {
                _mechanicViewModel = value;
                DataContext = value;
            }
        }

        public MechanicWindow()
        {
            InitializeComponent();
            ViewModel = new MechanicViewModel(App.Container.Resolve<IServiceMicroservice>());
        }
    }
}
