using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Community_Appeal_Web_Application.Models;

namespace Community_Appeal_Web_Application.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin
        CommunityContext db = new CommunityContext();

        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(Admin admin)
        {
            Admin a = db.Admin.Where(x => x.eMail == admin.eMail && x.sifre == admin.sifre).FirstOrDefault();
            if (a==null)
            {
                ViewBag.Hata = "Girdiğiniz Bilgilerde bir kullanıcı Bulunamadı.";
                return View();
            }
            Session["Admin"] = a;
            return RedirectToAction("Index");
        }

        public ActionResult CikisYap()
        {
            Session.Abandon();
            return RedirectToAction("Login");

        }

        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Listesi()
        {
            return View(db.Admin.ToList());
        }

        [HttpGet]
        public ActionResult Ekle()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Sil(int id)
        {
            Admin admin = db.Admin.Where(x => x.ID == id).FirstOrDefault();
            Admin admin2 = (Admin)Session["Admin"]; 
            if (admin!=null)
            {
                if (admin.ID== admin2.ID)
                {
                    return Json(2);
                }
                db.Admin.Remove(admin);
                db.SaveChanges();
                return Json(1);
            }
            return Json(0);
        }

        [HttpGet]
        public ActionResult Duzenle(int id)
        {
            Admin admin = db.Admin.Where(x => x.ID == id).FirstOrDefault();
            if (admin==null)
            {
                return RedirectToAction("Listesi");
            }
            return View(admin);
        }

        [HttpPost]
        public ActionResult Duzenle(Admin admin)
        {
            Admin ad = db.Admin.Where(x => x.ID == admin.ID).SingleOrDefault();
            if (ad !=null)
            {
                ad.adi = admin.adi;
                ad.soyadi = admin.soyadi;
                ad.eMail = admin.eMail;
                ad.sifre = admin.sifre;
                db.SaveChanges();
                return RedirectToAction("Listesi");
            }
            return RedirectToAction("Listesi");
        }

        [HttpPost]
        public ActionResult Ekle(Admin admin)
        {
            db.Admin.Add(admin);
            db.SaveChanges();
            return RedirectToAction("Listesi");
        }

        [HttpGet]
        public ActionResult Basvurular()
        {
            return View(db.Basvuru.Where(x=>x.adimNo>=6).ToList());
        }

        
      public ActionResult KayitliKullanicilar()
        {
            return View(db.Kullanici.ToList());
        }

    }
}