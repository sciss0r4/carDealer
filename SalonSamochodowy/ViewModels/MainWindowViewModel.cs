using SalonSamochodowy.Shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace SalonSamochodowy.ViewModels
{
    class MainWindowViewModel
    {
        private string _bindedStringField;
 
        public MainWindowViewModel()
        {
            CreateSampleCommand();
            _bindedStringField = "Binded!";
        }

        public string BindedStringField
        {
            get { return _bindedStringField; }
            set { _bindedStringField = value; }
        }

        #region Commands

        public ICommand SampleCommand
        {
            get;
            internal set;
        }

        private bool CanExecuteSampleCommand()
        {
            return false;
        }

        private void CreateSampleCommand()
        {
            SampleCommand = new RelayCommand(x => SampleExecute(), x => CanExecuteSampleCommand());
        }

        public void SampleExecute()
        {
            int sampleValue = 0;
            var ci = App.Ioc.SampleMicroservice.GetSomethingFromDatabase(sampleValue);
        }

        #endregion
    }
}
