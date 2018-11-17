using Community_Appeal_Web_Application.App_Classes;
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

        public ActionResult CikisYap()
        {
            Session.Abandon();
            return RedirectToAction("Login");
        }

        [HttpGet]
        public ActionResult Kayit()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Kayit(Kullanici k, string tel,string fak)
        {
            Kullanici us = db.Kullanici.Where(x => x.ogrMail == k.ogrMail).FirstOrDefault();

            if (us != null)
            {
                ViewBag.Hata = "Bu mail adresi ile bir kayıt bulunmaktadır.";
                return View();
            }

            k.adi= Functions.IlkHarfleriBuyut(k.adi);
            k.soyadi = Functions.IlkHarfleriBuyut(k.soyadi);

            Basvuru b = new Basvuru();
            b.kullanıcıID = k.ID;
            b.adimNo = 1;

            OgrenciListesi ol = new OgrenciListesi();
            ol.adi = k.adi;
            ol.soyadi = k.soyadi;
            ol.tc = k.tc;
            ol.ogrNo = k.ogrNo;
            ol.tel = tel;
            ol.basvuruID = b.ID;
            ol.mail = k.ogrMail;
            ol.fak = fak;

            db.OgrenciListesi.Add(ol);
            db.Basvuru.Add(b);
            db.Kullanici.Add(k);
            db.SaveChanges();
            return RedirectToAction("GirisYap", "Kullanici", k);
        }
    }
}