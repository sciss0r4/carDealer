using GalaSoft.MvvmLight.Messaging;
using Microsoft.Practices.Unity;
using SalonSamochodowy.DatabaseAccess;
using SalonSamochodowy.LoginMicroservice;
using SalonSamochodowy.LoginMicroservice.Constants;
using SalonSamochodowy.SampleMicroservice;
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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace SalonSamochodowy
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private LoginViewModel _lvm;
        [Dependency]
        public LoginViewModel ViewModel
        {
            set 
            { 
                DataContext = value;
                _lvm = value;
            }
        }

        public MainWindow()
        {
            Messenger.Default.Register<NotificationMessage>(this, NotificationMessageReceived);
            InitializeComponent();
        }

        private void NotificationMessageReceived(NotificationMessage obj)
        {
            var message = obj.Notification.ToString();
            var messageValues = message.Split(';');

            if (messageValues[0] == Permissions.Seller.ToString())
            {
                var sellerWindow = App.Container.Resolve<SellerWindow>();
                sellerWindow.ZalogowanyJako = messageValues[1];
                sellerWindow.ViewModel.IdPracownik = Int32.Parse(messageValues[2]);
                sellerWindow.Show();
                this.Close();
                return;
            }
            else if(messageValues[0] == Permissions.Boss.ToString())
            {
                var bossWindow = App.Container.Resolve<BossWindow>();
                bossWindow.ZalogowanyJako = messageValues[1];
                bossWindow.Show();
                this.Close();
                return;
            }
            else if (messageValues[0] == Permissions.Administrator.ToString())
            {
                var adminWindow = App.Container.Resolve<AdminWindow>();
                adminWindow.ZalogowanyJako = messageValues[1];
                adminWindow.Show();
                this.Close();
                return;
            }
            else if (messageValues[0] == Permissions.Mechanic.ToString())
            {
                var mechanicWindow = App.Container.Resolve<MechanicWindow>();
                mechanicWindow.ZalogowanyJako = messageValues[1];
                mechanicWindow.Show();
                this.Close();
                return;
            }
        }

        private void PassBox_PasswordChanged(object sender, RoutedEventArgs e)
        {
            _lvm.Password = PassBox.Password;
        }

        private void TextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            Shared.Constants.DatabaseParams._connectionString = String.Format(@"Server={0};Database=Salon;Trusted_Connection=True;",txtBox.Text);
        }
    }
}