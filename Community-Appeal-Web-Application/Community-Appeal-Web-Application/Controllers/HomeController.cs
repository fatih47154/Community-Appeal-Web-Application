using Community_Appeal_Web_Application.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Community_Appeal_Web_Application.Controllers
{
    public class HomeController : Controller
    {
        CommunityContext db = new CommunityContext();
        // GET: Home

        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult form1()
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Basvuru b = db.Basvuru.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();
            if (b!=null)
            {
                return View(b);
            }
            return View();
        }

        [HttpPost]
        public ActionResult form1(Basvuru basvuru)
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Basvuru b = db.Basvuru.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();
            b.toplulukAdi = basvuru.toplulukAdi;
            b.toplulukAmac = basvuru.toplulukAmac;
            if (b.adimNo==1)
            {
                b.adimNo = 2;
            }
            db.SaveChanges();
            return View(basvuru);
        }

        [HttpGet]
        public ActionResult form2()
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Basvuru b = db.Basvuru.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();
            if (b.adimNo < 2)
            {
                ViewBag.Hata = "İlk önce 1.Formu Doldurmanız Gerekmektedir.";
                return View();
            }
            List<OgrenciListesi> ol = db.OgrenciListesi.Where(x => x.basvuruID == b.ID).ToList();
            ViewBag.ol = ol;
            return View(b);
        }

        [HttpPost]
        public ActionResult form2(Basvuru basvuru)
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Basvuru b = db.Basvuru.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();

            if (b.OgrenciListesi.Count<20)
            {
                List<OgrenciListesi> ol = db.OgrenciListesi.Where(x => x.basvuruID == b.ID).ToList();
                ViewBag.ol = ol;
                ViewBag.hata = "Bu formu kaydetmek için en az 20 kişi eklemelisiniz.";
                return View(b);
            }
            else
            {
                b.akademikYıl = (DateTime.Now.Year - DateTime.Now.AddYears(+1).Year).ToString();
                if (b.adimNo == 2)
                {
                    b.adimNo = 3;
                    db.SaveChanges();
                }
                List<OgrenciListesi> ol = db.OgrenciListesi.Where(x => x.basvuruID == b.ID).ToList();
                ViewBag.ol = ol;
                return View(b);
            }

           
        }

        public bool OgrenciSorgula(string ogNO)
        {
            return true;
        }

        [HttpPost]
        public ActionResult OgrenciListesiEkle(OgrenciListesi ol)
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Basvuru b = db.Basvuru.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();
            if (b.OgrenciListesi.Count != 20)
            {
                if (OgrenciSorgula(ol.ogrNo) == true)
                {
                    OgrenciListesi ogrenciL = db.OgrenciListesi.Where(x => x.ogrNo == ol.ogrNo).FirstOrDefault();
                    if(ogrenciL != null)
                    {
                        return Json("hata0");
                    }
                    ol.basvuruID = b.ID;
                    db.OgrenciListesi.Add(ol);
                    db.SaveChanges();
                    return Json("dogru");
                }
                else
                {
                    return Json("hata1");
                }
            }
            return Json("hata2");

        }

        [HttpGet]
        public ActionResult form5()
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Basvuru b = db.Basvuru.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();
            if (b.adimNo < 3)
            {
                ViewBag.Hata = "İlk Önce Diğer Formları Doldurmanız Gerekmektedir.";
                return View();
            }
            List<Danisman> dl = db.Danisman.Where(x => x.basvuruID == b.ID).ToList();
            ViewBag.dl = dl;
            return View(b);
        }

        [HttpPost]
        public ActionResult form5(Basvuru a)
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Basvuru b = db.Basvuru.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();

            if (b.Danisman.Count < 2)
            {
                List<Danisman> dl = db.Danisman.Where(x => x.basvuruID == b.ID).ToList();
                ViewBag.dl = dl;
                ViewBag.hata = "Bu formu kaydetmek için danışman sayısı 2 olmalıdır.";
                return View(b);
            }
            else
            {
                if (b.adimNo == 3)
                {
                    b.adimNo = 4;
                    db.SaveChanges();
                }
                List<Danisman> dl = db.Danisman.Where(x => x.basvuruID == b.ID).ToList();
                ViewBag.dl = dl;
                return View(b);
            }
        }

        public class basvuruAndYonetim
        {
            public Basvuru b { get; set; }  
            public YonetimKurulu y1 { get; set; }
        }

        [HttpGet]
        public ActionResult form3()
        {
            Kullanici k = (Kullanici)Session["Kullanici"];

            basvuruAndYonetim n = new basvuruAndYonetim();
            n.b = db.Basvuru.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();
            n.y1 = db.YonetimKurulu.FirstOrDefault(x => x.basvuruID == n.b.ID);

            if (n.b != null)
            {
                return View(n);
            }

            return View();
        }

        [HttpPost]
        public ActionResult form3(Basvuru basvuru, YonetimKurulu baskan)
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            

            basvuruAndYonetim n =new basvuruAndYonetim();
            n.b = db.Basvuru.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();
            n.y1 = db.YonetimKurulu.FirstOrDefault(x => x.basvuruID == n.b.ID);

            if (n.b.adimNo == 3)
            {
                n.b.adimNo = 4;
            }

            if (n.y1==null)
            {
                db.YonetimKurulu.Add(baskan);
            }
            
            db.SaveChanges();
            n.y1 = db.YonetimKurulu.FirstOrDefault(x => x.basvuruID == n.b.ID);
            return View(n);

        }

        [HttpPost]
        public ActionResult danismanEkle(Danisman ol)
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Basvuru b = db.Basvuru.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();
            int sayac = db.Danisman.Count();
            if (sayac < 2)
            {
                ol.basvuruID = b.ID;
                db.Danisman.Add(ol);
                db.SaveChanges();
                return Json(true);
            }
            else
            {
                return Json(false);
            }

        }

        [HttpGet]
        public ActionResult form6()
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Basvuru b = db.Basvuru.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();
            if (b.adimNo < 4)
            {
                ViewBag.Hata = "İlk Önce Diğer Formları Doldurmanız Gerekmektedir.";
                return View();
            }
            List<Danisman> dl = db.Danisman.Where(x => x.basvuruID == b.ID).ToList();
            Danisman dl1 = db.Danisman.FirstOrDefault(x => x.basvuruID == b.ID);
            ViewBag.dl = dl;
            ViewBag.dl1 = dl1;
            return View(b);
        }

    }
}