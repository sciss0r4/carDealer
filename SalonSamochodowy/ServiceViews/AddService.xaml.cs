using SalonSamochodowy.ClientMicroservice;
using SalonSamochodowy.ServiceMicroservice;
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
using SalonSamochodowy.OrderViews;
using SalonSamochodowy.OrderMicroservice;

namespace SalonSamochodowy.ServiceViews
{
    /// <summary>
    /// Interaction logic for AddService.xaml
    /// </summary>
    public partial class AddService : Window
    {
        private ServiceViewModel _svm;

        public ServiceViewModel ViewModel
        {
            set 
            { 
                DataContext = value;
                _svm = value;
            }
        }
        public AddService(int clientId, int idPracownik)
        {
            InitializeComponent();
            ViewModel = new ServiceViewModel(App.Container.Resolve<IClientMicroservice>(), clientId, App.Container.Resolve<IServiceMicroservice>(), idPracownik);
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            var chooseOptions = new ChooseOptions(_svm.SelectedCarId);
            chooseOptions.ShowDialog();
            _svm.OptionsList = chooseOptions.ViewModel.ListItems.Where(x => x.Checked).ToList();
        }
    }
}
