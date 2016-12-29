using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalonSamochodowy.OrderMicroservice
{
    public class OrderModel
    {
        public int OrderId { get; set; }

        public string ImieKlienta { get; set; }
        public string NazwiskoKlienta { get; set; }
        public string PeselKlienta { get; set; }
        public string MiejscowoscKlienta { get; set; }
        public string UlicaKlienta { get; set; }
        public string NrDomuKlienta { get; set; }
        public string NrLokaluKlienta { get; set; }
        public string KodPocztowyKlienta { get; set; }
        public DateTime DataUrodzeniaKlienta { get; set; }


        public string ImiePracownika { get; set; }
        public string NazwiskoPracownika { get; set; }


        public string StatusZamowienia { get; set; }


        public string MarkaPojazdu { get; set; }
        public string ModelPojazdu { get; set; }
        public string NadwoziePojazdu { get; set; }
        public string SilnikPojazdu { get; set; }
        public string LakierPojazdu { get; set; }
        public string VINPojazdu { get; set; }
        public string PrzebiegPojazdu { get; set; }
        public string KrajPojazdu { get; set; }
        public string CenaPojazdu { get; set; }
        public DateTime RokPojazdu { get; set; }
    }
}
