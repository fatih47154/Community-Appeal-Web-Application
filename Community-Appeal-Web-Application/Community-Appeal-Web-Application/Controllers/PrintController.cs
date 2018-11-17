using Community_Appeal_Web_Application.Models;
using Rotativa;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Community_Appeal_Web_Application.Controllers
{
    public class PrintController : Controller
    {

        CommunityContext db = new CommunityContext();

        public ActionResult Form1()
        {
            var report = new ViewAsPdf("Form1")
            {

            };
            return report;
        }

        public ActionResult Form2()
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Basvuru b = db.Basvuru.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();
            List<OgrenciListesi> ol = db.OgrenciListesi.Where(x => x.basvuruID == b.ID).ToList();
            ViewBag.ol = ol;
            var report = new ViewAsPdf("Form2")
            {
                PageMargins = { Left = 20, Bottom = 20, Right = 20, Top = 20 },
                PageOrientation = Rotativa.Options.Orientation.Landscape,
            };
            return report;
        }

    }
}