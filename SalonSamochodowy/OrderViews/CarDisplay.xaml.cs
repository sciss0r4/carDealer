using SalonSamochodowy.OrderMicroservice;
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
using GalaSoft.MvvmLight.Messaging;

namespace SalonSamochodowy.OrderViews
{
    /// <summary>
    /// Interaction logic for CarDisplay.xaml
    /// </summary>
    public partial class CarDisplay : Window
    {
        private OrderViewModel _ovm;
        private CarDisplayViewModel _cdm;
        public bool AddedOrderFinal { get; set; }


        public CarDisplay(OrderViewModel ovm)
        {
            InitializeComponent();
            _ovm = ovm;
            _cdm = new CarDisplayViewModel(_ovm, App.Container.Resolve<IOrderMicroservice>());
            this.DataContext = _cdm;
            Messenger.Default.Register<NotificationMessage>(this, NotificationMessageReceived);
            AddedOrderFinal = false;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void Window_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            if (this.IsVisible && _cdm.MatchingCars.Rows.Count == 0)
            {
                MessageBox.Show("Nie znaleziono pojazdu o podanych kryteriach.");
            }
        }

        private void NotificationMessageReceived(NotificationMessage obj)
        {
            var message = obj.Notification.ToString();

            if(message == "DodanoZamowienie")
            {
                AddedOrderFinal = true;
                this.Close();
            }
        }
    }
}
