using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace SalonSamochodowy.CarViews
{
    class NumericRule : ValidationRule
    {
        public NumericRule() { }

        public override ValidationResult Validate(object value, System.Globalization.CultureInfo cultureInfo)
        {
            double t;
            var stringValue = value.ToString().Trim();
            if (double.TryParse(stringValue, out t))
            {
                return new ValidationResult(true, null);
            }
            else
            {
                return new ValidationResult(false, "Wprowadzona wartość nie jest numeryczna");
            }
        }
    }
}
