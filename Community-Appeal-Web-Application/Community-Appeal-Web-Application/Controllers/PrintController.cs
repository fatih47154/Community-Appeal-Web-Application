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

        public ActionResult Form1_admin(int ID)
        {
            Basvuru b = db.Basvuru.Where(x => x.kullanıcıID == ID).FirstOrDefault();
            var report = new ViewAsPdf("Form1_admin", b)
            {

            };
            return report;
        }

        public ActionResult Form1()
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Basvuru b = db.Basvuru.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();
            var report = new ViewAsPdf("Form1",b)
            {

            };
            return report;
        }

        public ActionResult Form2_admin(int ID)
        {
            Basvuru b = db.Basvuru.Where(x => x.kullanıcıID == ID).FirstOrDefault();
            List<OgrenciListesi> ol = db.OgrenciListesi.Where(x => x.basvuruID == b.ID).ToList();
            ViewBag.ol = ol;
            var report = new ViewAsPdf("Form2_admin",b)
            {
                PageMargins = { Left = 20, Bottom = 20, Right = 20, Top = 20 },
                PageOrientation = Rotativa.Options.Orientation.Landscape,
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

        public ActionResult Form3_admin(int ID)
        {

            Basvuru b = db.Basvuru.Where(x => x.kullanıcıID == ID).FirstOrDefault();
            var report = new ViewAsPdf("Form3_admin",b)
            {
                
            };
            return report;
        }

        public ActionResult Form4_admin(int ID)
        {
            Basvuru b = db.Basvuru.Where(x => x.kullanıcıID == ID).FirstOrDefault();
            var report = new ViewAsPdf("Form4_admin",b)
            {

            };
            return report;
        }

        public ActionResult Form5_admin(int ID)
        {

            Basvuru b = db.Basvuru.Where(x => x.kullanıcıID == ID).FirstOrDefault();
            var report = new ViewAsPdf("Form5_admin",b)
            {

            };
            return report;
        }

        public ActionResult Form6_admin(int ID)
        {

            Basvuru b = db.Basvuru.Where(x => x.kullanıcıID == ID).FirstOrDefault();
            var report = new ViewAsPdf("Form6_admin",b)
            {

            };
            return report;
        }

    }
}