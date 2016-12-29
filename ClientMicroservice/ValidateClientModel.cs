using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace SalonSamochodowy.ClientMicroservice
{
    public class ValidateClientModel
    {
        public static bool Validate(ClientViewModel model)
        {
            var kodPocztowyRegex = @"^\d{2}-\d{3}$";

            if (!Regex.IsMatch(model.KodPocztowy, kodPocztowyRegex))
                return false;

            if (!(model.Pesel.Length == 11 && IsDigitsOnly(model.Pesel)))
                return false;

            if (model.NrDomu.Length > 10 || model.NrLokalu.Length > 10)
                return false;

            if (String.IsNullOrWhiteSpace(model.Imie))
                return false;

            if (String.IsNullOrWhiteSpace(model.Miejscowosc))
                return false;

            if (String.IsNullOrWhiteSpace(model.Nazwisko))
                return false;

            if (String.IsNullOrWhiteSpace(model.NrDomu))
                return false;

            if (String.IsNullOrWhiteSpace(model.NrLokalu))
                return false;

            if (String.IsNullOrWhiteSpace(model.Ulica))
                return false;


            return true;
        }

        private static bool IsDigitsOnly(string str)
        {
            foreach (char c in str)
            {
                if (c < '0' || c > '9')
                    return false;
            }

            return true;
        }
    }
}
