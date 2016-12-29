using GalaSoft.MvvmLight.Messaging;
using SalonSamochodowy.LoginMicroservice;
using SalonSamochodowy.LoginMicroservice.Constants;
using SalonSamochodowy.Shared;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Windows.Input;

namespace SalonSamochodowy.LoginMicroservice
{
    public class LoginViewModel : INotifyPropertyChanged
    {
        private string _login;
        private string _password;

        public string Password
        {
            get { return _password; }
            set { _password = value; }
        }
        private ILoginMicroservice _loginMicroservice;

        public string Login
        {
            get { return _login; }
            set
            {
                _login = value;
                OnPropertyChanged(new PropertyChangedEventArgs("Login"));
            }
        }

        public LoginViewModel(ILoginMicroservice loginMicroservice)
        {
            _loginMicroservice = loginMicroservice;
            LoginCommand = new RelayCommand(x => ExecuteLogin(), x => CanExecuteLogin());
        }

        #region Commands

        private ICommand _loginCommand;

        public ICommand LoginCommand
        {
            get
            {
                return _loginCommand;
            }
            internal set
            {
                _loginCommand = value;
                OnPropertyChanged(new PropertyChangedEventArgs("LoginCommand"));
            }
        }

        public void ExecuteLogin()
        {
            if(!_loginMicroservice.UserExists(Login))
            {
                MessageBox.Show("User does not exist!");
                return;
            }

            if(!_loginMicroservice.PasswordIsCorrect(Login,Password))
            {
                MessageBox.Show("Password is incorrect!");
                return;
            }

            var dat = _loginMicroservice.GetUserData(Login,Password);
            var message = String.Format("{0};{1};{2}",dat.Permissions,dat.Name,dat.PracownikId);
            Messenger.Default.Send(new NotificationMessage(message));
        }

        public bool CanExecuteLogin()
        {
            return !String.IsNullOrEmpty(Login) && !String.IsNullOrEmpty(Password);
        }

        #endregion

        #region PropertyChanged

        public event PropertyChangedEventHandler PropertyChanged;

        public void OnPropertyChanged(PropertyChangedEventArgs e)
        {
            if (PropertyChanged != null)
            {
                PropertyChanged(this, e);
            }
        }

        #endregion
    }
}
