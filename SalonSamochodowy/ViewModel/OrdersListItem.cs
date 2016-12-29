using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalonSamochodowy.ViewModel
{
    public class OrdersListItem : INotifyPropertyChanged
    {
        public int OrderId {get;set;}
        public string OrderName { get; set; }

        public OrdersListItem(string orderName, int orderId)
        {
            OrderName = orderName;
            OrderId = orderId;
        }

        public event PropertyChangedEventHandler PropertyChanged;

        protected void OnPropertyChanged(string name)
        {
            PropertyChangedEventHandler handler = PropertyChanged;
            if (handler != null)
            {
                handler(this, new PropertyChangedEventArgs(name));
            }
        }
    }
}
