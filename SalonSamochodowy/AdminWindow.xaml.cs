using GalaSoft.MvvmLight.Messaging;
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

namespace SalonSamochodowy
{
    /// <summary>
    /// Interaction logic for AdminWindow.xaml
    /// </summary>
    public partial class AdminWindow : Window
    {
        public AdminWindow()
        {
            InitializeComponent();

            ZalogowanyJako = "Zalogowany Jako: Nieznany";
        }

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

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            var addWorkerWindow = App.Container.Resolve<AdminViews.AddWorker>();
            addWorkerWindow.Show();
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            var addUserWindow = App.Container.Resolve<AdminViews.AddUserWindow>();
            addUserWindow.Show();
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            var addUserWindow = App.Container.Resolve<AdminViews.AddSalonWindow>();
            addUserWindow.Show();
        }
    }
}
