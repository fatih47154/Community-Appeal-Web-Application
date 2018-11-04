using Community_Appeal_Web_Application.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Community_Appeal_Web_Application.Controllers
{
    public class KullaniciController : Controller
    {
        CommunityContext db = new CommunityContext();
        // GET: Kullanici
        public ActionResult Login()
        {
            return View();
        }

        public ActionResult GirisYap(Kullanici k)
        {
            Kullanici user = db.Kullanici.Where(x => x.ogrMail == k.ogrMail && x.sifre == k.sifre).FirstOrDefault();

            if (user !=null)
            {
                Session["Kullanici"] = user;
                return RedirectToAction("Index", "Home");
            }
            ViewData["Hata"] = "Girdiğiniz bilgiler ile kayıtlı bir kullanıcı bulunamadı.";
            return RedirectToAction("Login");
        }

        [HttpGet]
        public ActionResult Kayit()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Kayit(Kullanici k)
        {
            Basvuru b = new Basvuru();
            b.kullanıcıID = k.ID;
            b.adimNo = 1;
            db.Basvuru.Add(b);
            db.Kullanici.Add(k);
            db.SaveChanges();
            return RedirectToAction("GirisYap", "Kullanici", k);
        }
    }
}