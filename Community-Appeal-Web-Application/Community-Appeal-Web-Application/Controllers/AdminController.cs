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
        public ActionResult Ekle(Admin admin)
        {
            db.Admin.Add(admin);
            db.SaveChanges();
            return RedirectToAction("Listesi");
        }
    }
}