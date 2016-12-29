using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalonSamochodowy.ClientMicroservice
{

    public class ClientViewModel
    {
        private string _nazwisko;
        private string _imie;
        private string _ulica;
        private int _nrDomu;
        private int _nrLokalu;
        private string _pesel;
        private string _miejscowosc;
        private string _kodPocztowy;
        private DateTime _dataUrodzenia;

        public string Imie
        {
            get { return _imie; }
            set { _imie = value; }
        }
        
        public string Ulica
        {
            get { return _ulica; }
            set { _ulica = value; }
        }
        
        public int NrDomu
        {
            get { return _nrDomu; }
            set { _nrDomu = value; }
        }

        public int NrLokalu
        {
            get { return _nrLokalu; }
            set { _nrLokalu = value; }
        }

        public string Miejscowosc
        {
            get { return _miejscowosc; }
            set { _miejscowosc = value; }
        }

        public string KodPocztowy
        {
            get { return _kodPocztowy; }
            set { _kodPocztowy = value; }
        }

        public DateTime DataUrodzenia
        {
            get { return _dataUrodzenia; }
            set { _dataUrodzenia = value; }
        }

        public string Nazwisko
        {
            get { return _nazwisko; }
            set { _nazwisko = value; }
        }

        public string Pesel
        {
            get { return _pesel; }
            set { _pesel = value; }
        }
    }
}
