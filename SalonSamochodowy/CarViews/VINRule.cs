using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace SalonSamochodowy.CarViews
{
    class VINRule : ValidationRule 
    {
        public VINRule() { }

        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {
            var stringValue = value.ToString().Trim();

            if (stringValue.Length == 17)
            {
                return new ValidationResult(true, null);
            }
            else
            {
                return new ValidationResult(false, "Numer VIN powinien zawierać 17 znaków");
            }
        }
    }
}
