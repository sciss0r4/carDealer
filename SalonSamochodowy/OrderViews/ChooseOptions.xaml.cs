using Microsoft.Practices.Unity;
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
    /// Interaction logic for ChooseOptions.xaml
    /// </summary>
    public partial class ChooseOptions : Window
    {
        private ChooseOptionsViewModel _chooseOptionsViewModel;
        private IOrderMicroservice _mos;
        [Dependency]
        public ChooseOptionsViewModel ViewModel
        {
            get { return _chooseOptionsViewModel; }
            set
            {
                DataContext = value;
                _chooseOptionsViewModel = value;
            }
        }

        public bool WasCanceled { get; set; }

        public ChooseOptions()
        {
            InitializeComponent();
            _mos = App.Container.Resolve<IOrderMicroservice>();
            ViewModel = new ChooseOptionsViewModel(_mos);
            WasCanceled = false;
        }

        public ChooseOptions(int carID) : this()
        {
            var options = _mos.GetCarOptionsForCarID(carID);

            for(int i = 0;i < ViewModel.ListItems.Count;++i)
            {
                var t = ViewModel.ListItems[i];

                t.Checked = options.Contains(t.OptionId);
            }
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            WasCanceled = true;
            this.Close();
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
