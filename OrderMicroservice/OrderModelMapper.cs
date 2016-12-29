using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalonSamochodowy.OrderMicroservice
{
    class OrderModelMapper
    {
        public OrderModel MapFromDataRow(DataRow dt, int orderId)
        {
            var om = new OrderModel();
            om.OrderId = orderId;
            om.ImieKlienta = dt["ImieKlienta"].ToString();
            om.NazwiskoKlienta = dt["NazwiskoKlienta"].ToString();
            om.PeselKlienta = dt["PeselKlienta"].ToString();
            om.MiejscowoscKlienta = dt["MiejscowoscKlienta"].ToString();
            om.UlicaKlienta = dt["UlicaKlienta"].ToString();
            om.NrDomuKlienta = dt["NrDomuKlienta"].ToString();
            om.NrLokaluKlienta = dt["NrLokaluKlienta"].ToString();
            om.KodPocztowyKlienta = dt["KodPocztowyKlienta"].ToString();
            om.DataUrodzeniaKlienta = DateTime.Parse(dt["DataUrodzeniaKlienta"].ToString());
            om.ImiePracownika = dt["ImiePracownika"].ToString();
            om.NazwiskoPracownika = dt["NazwiskoPracownika"].ToString();
            om.StatusZamowienia = dt["StatusZamowienia"].ToString();
            om.MarkaPojazdu = dt["MarkaPojazdu"].ToString();
            om.ModelPojazdu = dt["ModelPojazdu"].ToString();
            om.NadwoziePojazdu = dt["NadwoziePojazdu"].ToString();
            om.SilnikPojazdu = dt["SilnikPojazdu"].ToString();
            om.LakierPojazdu = dt["LakierPojazdu"].ToString();
            om.VINPojazdu = dt["VINPojazdu"].ToString();
            om.PrzebiegPojazdu = dt["PrzebiegPojazdu"].ToString();
            om.KrajPojazdu = dt["KrajPojazdu"].ToString();
            om.CenaPojazdu = dt["CenaPojazdu"].ToString();
            om.RokPojazdu = DateTime.Parse(dt["RokPojazdu"].ToString());
            return om;
        }
    }
}
