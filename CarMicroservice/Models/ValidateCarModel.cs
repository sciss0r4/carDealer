using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalonSamochodowy.CarMicroservice.Models
{
    class ValidateCarModel
    {
        public static bool Validate(CarViewModel model)
        {
            double numericTest;
            DateTime dateTest;

            if (model.VIN.Length != 17)
            {
                return false;
            }

            if (!model.WybranoModel)
            {
                return false;
            }

            if (!model.WybranoLakier)
            {
                return false;
            }

            if (!model.WybranoSilnik)
            {
                return false;
            }

            if (!model.WybranoNadwozie)
            {
                return false;
            }

            if (model.Cena.Length==0 || !double.TryParse(model.Cena, out numericTest))
            {
                return false;
            }

            if (!model.WybranoStatus)
            {
                return false;
            }

            if (model.RokProdukcji.Length == 0 || !DateTime.TryParse(model.RokProdukcji, out dateTest))
            {
                return false;
            }

            if (model.Przebieg < 0)
            {
                return false;
            }

            if (model.KrajProdukcji.Length == 0)
            {
                return false;
            }

            return true;
        }
    }
}
