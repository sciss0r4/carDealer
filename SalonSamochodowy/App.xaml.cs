using SalonSamochodowy.DatabaseAccess;
using SalonSamochodowy.SampleMicroservice;
using SalonSamochodowy.LoginMicroservice;
using SalonSamochodowy.CarMicroservice;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;
using Microsoft.Practices.Unity;
using SalonSamochodowy.ClientViews;
using SalonSamochodowy.ClientMicroservice;
using SalonSamochodowy.OrderMicroservice;
using SalonSamochodowy.ServiceMicroservice;

namespace SalonSamochodowy
{
    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    public partial class App : Application
    {
        private static readonly IUnityContainer _container = new UnityContainer();

        public static IUnityContainer Container
        {
            get { return App._container; }
        }

        protected override void OnStartup(StartupEventArgs e)
        {
            _container.RegisterType<ILoginMicroservice, LoginMicroservice.LoginMicroservice>();
            _container.RegisterType<IClientMicroservice, ClientMicroservice.ClientMicroservice>();
            _container.RegisterType<IOrderMicroservice, OrderMicroservice.OrderMicroservice>();
            _container.RegisterType<ICarMicroservice, CarMicroservice.CarMicroservice>();
            _container.RegisterType<IServiceMicroservice, ServiceMicroservice.ServiceMicroservice>();

            MainWindow mainWindow = _container.Resolve<MainWindow>();
            mainWindow.Show();
        }
    }
}
