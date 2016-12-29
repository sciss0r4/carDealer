using SalonSamochodowy.ClientMicroservice;
using Microsoft.Practices.Unity;
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

namespace SalonSamochodowy.ClientViews
{
    /// <summary>
    /// Interaction logic for ClientDetails.xaml
    /// </summary>
    public partial class ClientDetails : Window
    {
        private IClientMicroservice _clientMicroservice;
        public ClientViewModel ViewModel
        {
            set { DataContext = value; }
        }

        public ClientDetails(int clientId)
        {
            _clientMicroservice = App.Container.Resolve<IClientMicroservice>();
            ViewModel = _clientMicroservice.GetClientInfoById(clientId);
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
