using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace SalonSamochodowy.ClientViews
{
    class NumberRule : ValidationRule
    {
        public NumberRule()
        {
        }

        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {
            var stringValue = value.ToString();

            if (stringValue.Length <= 10)
            {
                return new ValidationResult(true, null);
            }
            else
            {
                return new ValidationResult(false, "Numer jest zbyt długi");
            }
        }
    }
}
