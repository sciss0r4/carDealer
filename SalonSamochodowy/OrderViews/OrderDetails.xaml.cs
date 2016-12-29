using Microsoft.Practices.Unity;
using SalonSamochodowy.OrderMicroservice;
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

namespace SalonSamochodowy.OrderViews
{
    /// <summary>
    /// Interaction logic for OrderDetails.xaml
    /// </summary>
    public partial class OrderDetails : Window
    {
        public OrderDetails(int orderId)
        {
            InitializeComponent();
            ViewModel = new OrderDetailsViewModel(App.Container.Resolve<IOrderMicroservice>(),orderId);
        }

        private OrderDetailsViewModel _orderViewModel;

        [Dependency]
        public OrderDetailsViewModel ViewModel
        {
            get { return _orderViewModel; }
            set
            {
                _orderViewModel = value;
                DataContext = value.Omodel;
            }
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
