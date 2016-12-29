using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace SalonSamochodowy.ClientViews
{
    class KodPocztowyRule : ValidationRule
    {
        public KodPocztowyRule()
        {
        }

        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {
            string regex = @"^\d{2}-\d{3}$";
            var stringValue = value.ToString().Trim();

            if (Regex.IsMatch(stringValue,regex))
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
