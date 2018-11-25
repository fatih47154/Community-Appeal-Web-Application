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

        // Başvuru Print

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

        // Güncelleme Print

        public ActionResult GForm1()
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Guncelle g = db.Guncelle.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();
            var report = new ViewAsPdf("GForm1", g)
            {

            };
            return report;
        }

        public ActionResult GForm1_admin(int ID)
        {
            Guncelle g = db.Guncelle.Where(x => x.kullanıcıID == ID).FirstOrDefault();
            var report = new ViewAsPdf("GForm1_admin", g)
            {

            };
            return report;
        }


        public ActionResult GForm2()
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Guncelle g = db.Guncelle.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();
            List<GOgrenciListesi> ol = db.GOgrenciListesi.Where(x => x.GuncelleID == g.ID).ToList();
            ViewBag.ol = ol;
            var report = new ViewAsPdf("GForm2", g)
            {
                PageMargins = { Left = 20, Bottom = 20, Right = 20, Top = 20 },
                PageOrientation = Rotativa.Options.Orientation.Landscape,
            };
            return report;
        }

        public ActionResult GForm2_admin(int ID)
        {
            Guncelle g = db.Guncelle.Where(x => x.kullanıcıID == ID).FirstOrDefault();
            List<GOgrenciListesi> ol = db.GOgrenciListesi.Where(x => x.GuncelleID == g.ID).ToList();
            ViewBag.ol = ol;
            var report = new ViewAsPdf("GForm2_admin", g)
            {
                PageMargins = { Left = 20, Bottom = 20, Right = 20, Top = 20 },
                PageOrientation = Rotativa.Options.Orientation.Landscape,
            };
            return report;
        }


        public ActionResult GForm3()
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Guncelle g = db.Guncelle.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();
            List<GFaliyetPlani> fp = db.GFaliyetPlani.Where(x => x.faliyetID == g.ID).ToList();
            ViewBag.fp = fp;
            var report = new ViewAsPdf("GForm3", g)
            {
                PageMargins = { Left = 20, Bottom = 20, Right = 20, Top = 20 },
                PageOrientation = Rotativa.Options.Orientation.Landscape,
            };
            return report;
        }

        public ActionResult GForm3_admin(int ID)
        {
            Guncelle g = db.Guncelle.Where(x => x.kullanıcıID == ID).FirstOrDefault();
            List<GFaliyetPlani> fp = db.GFaliyetPlani.Where(x => x.faliyetID == g.ID).ToList();
            ViewBag.fp = fp;
            var report = new ViewAsPdf("GForm3_admin", g)
            {
                PageMargins = { Left = 20, Bottom = 20, Right = 20, Top = 20 },
                PageOrientation = Rotativa.Options.Orientation.Landscape,
            };
            return report;
        }


        public ActionResult GForm4()
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Guncelle g = db.Guncelle.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();
            List<GDanisman> DL = db.GDanisman.Where(x => x.GuncelleID == g.ID).ToList();
            ViewBag.DL = DL;
            var report = new ViewAsPdf("GForm4", g)
            {

            };
            return report;
        }

        public ActionResult GForm4_admin(int ID)
        {
            Guncelle g = db.Guncelle.Where(x => x.kullanıcıID == ID).FirstOrDefault();
            List<GDanisman> DL = db.GDanisman.Where(x => x.GuncelleID == g.ID).ToList();
            ViewBag.DL = DL;
            var report = new ViewAsPdf("GForm4_admin", g)
            {

            };
            return report;
        }
    }
}