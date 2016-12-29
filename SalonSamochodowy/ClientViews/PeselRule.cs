using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace SalonSamochodowy.ClientViews
{
    class PeselRule : ValidationRule
    {
        public PeselRule()
        {
        }

        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {
            var stringValue = value.ToString();

            if(stringValue.Length == 11 && IsDigitsOnly(stringValue))
            {
                return new ValidationResult(true, null);
            }
            else
            {
                return new ValidationResult(false, "PESEL składa się z 11 cyfr");
            }
        }

        private bool IsDigitsOnly(string str)
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
