using GalaSoft.MvvmLight.Messaging;
using Microsoft.Practices.Unity;
using SalonSamochodowy.ClientMicroservice;
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

namespace SalonSamochodowy.OrderViews
{
    /// <summary>
    /// Interaction logic for AddOrder.xaml
    /// </summary>
    public partial class AddOrder : Window
    {
        private OrderViewModel _orderViewModel;
        private IClientMicroservice _clientMicroservice;

        [Dependency]
        public OrderViewModel ViewModel
        {
            get { return _orderViewModel; }
            set 
            { 
                DataContext = value;
                _orderViewModel = value;
            }
        }

        public AddOrder(int clientId)
        {
            InitializeComponent();

            _clientMicroservice = App.Container.Resolve<IClientMicroservice>();
            var selectedClient = _clientMicroservice.GetClientInfoById(clientId);
            ViewModel = new OrderViewModel(selectedClient, App.Container.Resolve<IOrderMicroservice>());

            Messenger.Default.Register<NotificationMessage>(this, NotificationMessageReceived);
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            ChooseOptions chooseOptions = new ChooseOptions();
            chooseOptions.ShowDialog();
            if(!chooseOptions.WasCanceled)
            {
                _orderViewModel.UpdateCarOptions(chooseOptions.ViewModel.ListItems.ToList());
            }
        }

        private void NotificationMessageReceived(NotificationMessage obj)
        {
            var message = obj.Notification.ToString();

            if (message == "AddCurrentOrder")
            {
                var carDisplay = new CarDisplay(_orderViewModel);
                carDisplay.ShowDialog();

                if (carDisplay.AddedOrderFinal)
                {
                    carDisplay.AddedOrderFinal = false;
                    this.Close();
                }
            }
        }
    }
}
