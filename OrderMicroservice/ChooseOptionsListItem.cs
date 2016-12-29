using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalonSamochodowy.OrderMicroservice
{
    public class ChooseOptionsListItem : INotifyPropertyChanged
    {
        private bool _checked;

        public bool Checked
        {
            get { return _checked; }
            set 
            { 
                _checked = value;
                OnPropertyChanged("Checked");
            }
        }

        public int OptionId {get;set;}
        public string OptionName { get; set; }

        public ChooseOptionsListItem(bool @checked, string optionName, int optionId)
        {
            Checked = @checked;
            OptionName = optionName;
            OptionId = optionId;
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
