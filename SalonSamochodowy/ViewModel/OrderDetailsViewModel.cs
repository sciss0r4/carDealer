using SalonSamochodowy.OrderMicroservice;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalonSamochodowy.ViewModel
{
    public class OrderDetailsViewModel
    {
        private IOrderMicroservice _om;
        private OrderModel _omodel;

        public OrderModel Omodel
        {
            get { return _omodel; }
            set { _omodel = value; }
        }



        public OrderDetailsViewModel(IOrderMicroservice om, int orderId)
        {
            _om = om;
            _omodel = om.GetOrderData(orderId);
        }
    }
}
