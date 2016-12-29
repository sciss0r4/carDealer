using Microsoft.Practices.Unity;
using SalonSamochodowy.ClientViews;
using SalonSamochodowy.OrderViews;
using SalonSamochodowy.ViewModel;
using SalonSamochodowy.CarViews;
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
using SalonSamochodowy.ServiceViews;

namespace SalonSamochodowy
{
    /// <summary>
    /// Interaction logic for SellerWindow.xaml
    /// </summary>
    public partial class SellerWindow : Window
    {
        public SellerWindow()
        {
            InitializeComponent();

            ZalogowanyJako = "Zalogowany Jako: Nieznany";
            AddOrderButton.IsEnabled = false;
        }

        private SellerViewModel _sellerViewModel;
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

        [Dependency]
        public SellerViewModel ViewModel
        {
            get { return _sellerViewModel; }
            set {
                _sellerViewModel = value;
                DataContext = value;
            }
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            var clientWindow = App.Container.Resolve<AddClient>();
            clientWindow.ShowDialog();

            // Refresh ListBox
            _sellerViewModel.ClientSearchText = _sellerViewModel.ClientSearchText;
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            var orderWindow = new AddOrder(_sellerViewModel.SelectedClientId);
            orderWindow.ViewModel.IdPracownik = _sellerViewModel.IdPracownik;
            orderWindow.ShowDialog();
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            var carMenagerWindow = new CarManagerWindow();
            carMenagerWindow.ShowDialog();
        }

        private void ClientListBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if(ViewModel.SelectedListBoxIndex >= 0 && ViewModel.SelectedListBoxIndex < ViewModel.SearchedClients.Count)
            {
                AddOrderButton.IsEnabled = true;
                AddServiceButton.IsEnabled = true;
            }
            else
            {
                AddOrderButton.IsEnabled = false;
                AddServiceButton.IsEnabled = false;
            }
        }

        private void AddServiceButton_Click(object sender, RoutedEventArgs e)
        {
            var serviceWindow = new AddService(_sellerViewModel.SelectedClientId, _sellerViewModel.IdPracownik);
            serviceWindow.ShowDialog();
        }

        private void Logout_click(object sender, RoutedEventArgs e)
        {
            var mainWindow = App.Container.Resolve<MainWindow>();
            mainWindow.Show();
            this.Close();
        }

        private void Exit_click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
