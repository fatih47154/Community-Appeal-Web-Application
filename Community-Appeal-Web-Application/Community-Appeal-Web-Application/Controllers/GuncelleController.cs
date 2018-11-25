using Community_Appeal_Web_Application.App_Classes;
using Community_Appeal_Web_Application.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Community_Appeal_Web_Application.Controllers
{
    public class GuncelleController : Controller
    {
        CommunityContext db = new CommunityContext();
        Guncelle ga = new Guncelle();

        // form1
        [HttpGet]
        public ActionResult form1()
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Guncelle g = new Guncelle();
            if (ga==null)
            {
              g = db.Guncelle.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();
            }
            else
            {
                g = ga;
            }

            return View(g);
        }

        [HttpPost]
        public ActionResult form1(GuncelleForm1 guncelle)
        {

            Kullanici k = (Kullanici)Session["Kullanici"];
            Guncelle g = db.Guncelle.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();

            g.toplulukAdi = guncelle.toplulukAdi;
            g.baskanAdi = guncelle.baskanAdi;
            g.baskanSoyadi = guncelle.baskanSoyadi;


            GDanisman d1 = new GDanisman();
            GDanisman d2 = new GDanisman();

            if (g.adimNo == 1)
            {

                if (guncelle.Kontrol == true)
                {
                    d2.aktif = true;
                    d1.aktif = false;
                }
                else
                {
                    d1.aktif = true;
                    d2.aktif = false;
                }

                d1.adi = guncelle.adi1;
                d1.soyadi = guncelle.soyadi1;
                d1.unvan = guncelle.unvan1;
                d1.akademikBirim = guncelle.akademikBirim1;
                d1.GuncelleID = g.ID;


                d2.adi = guncelle.adi2;
                d2.soyadi = guncelle.soyadi2;
                d2.unvan = guncelle.unvan2;
                d2.akademikBirim = guncelle.akademikBirim2;
                d2.GuncelleID = g.ID;
                g.adimNo = 2;
            }
            else
            {
                d1 = db.GDanisman.Where(x => x.GuncelleID == g.ID && x.aktif == true).FirstOrDefault();
                d2 = db.GDanisman.Where(x => x.GuncelleID == g.ID && x.aktif == false).FirstOrDefault();

                if (guncelle.Kontrol == true)
                {
                    d2.aktif = true;
                    d1.aktif = false;
                }
                else
                {
                    d1.aktif = true;
                    d2.aktif = false;
                }

                d1.adi = guncelle.adi1;
                d1.soyadi = guncelle.soyadi1;
                d1.unvan = guncelle.unvan1;
                d1.akademikBirim = guncelle.akademikBirim1;
                d1.GuncelleID = g.ID;

                d2.adi = guncelle.adi2;
                d2.soyadi = guncelle.soyadi2;
                d2.unvan = guncelle.unvan2;
                d2.akademikBirim = guncelle.akademikBirim2;
                d2.GuncelleID = g.ID;
            }

            db.GDanisman.Add(d1);
            db.GDanisman.Add(d2);
            db.SaveChanges();

            return View(g);
        }


        // form2 
        public PartialViewResult ogrenciListesiWidget()
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Guncelle g = db.Guncelle.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();
            List<GOgrenciListesi> ol = db.GOgrenciListesi.Where(x => x.GuncelleID == g.ID).ToList();
            ViewBag.ol = ol;
            return PartialView();
        }

        [HttpGet]
        public ActionResult form2()
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Guncelle g = db.Guncelle.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();
            if (g.adimNo < 2)
            {
                ViewBag.Hata = "İlk önce 1.Formu Doldurmanız Gerekmektedir.";
                return View();
            }
            List<GOgrenciListesi> ol = db.GOgrenciListesi.Where(x => x.GuncelleID == g.ID).ToList();
            ViewBag.ol = ol;
            return View(g);
        }

        [HttpPost]
        public ActionResult OgrenciListesiEkle(GOgrenciListesi ol)
        {

            Kullanici k = (Kullanici)Session["Kullanici"];
            Guncelle g = db.Guncelle.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();
            if (g.GOgrenciListesi.Count != 20)
            {
                if (Functions.OgrenciSorgula(ol.ogrNo) == true)
                {
                    GOgrenciListesi ogrenciL = db.GOgrenciListesi.Where(x => x.ogrNo == ol.ogrNo && x.GuncelleID == g.ID).FirstOrDefault();
                    if (ogrenciL != null)
                    {
                        return Json("hata0");
                    }
                    ol.GuncelleID = g.ID;
                    db.GOgrenciListesi.Add(ol);
                    db.SaveChanges();
                    GOgrenciListesi o = db.GOgrenciListesi.Where(x => x.ogrNo == ol.ogrNo).FirstOrDefault();
                    int ogrno = o.ID;
                    return Json(ogrno);
                }
                else
                {
                    return Json("hata1");
                }
            }
            return Json("hata2");

        }

        [HttpPost]
        public ActionResult OgrenciListesiSil(int id)
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Guncelle g = db.Guncelle.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();

            GOgrenciListesi ol = db.GOgrenciListesi.Where(x => x.ID == id).FirstOrDefault();
            if (ol == null)
            {
                return Json(1);
            }
            else if (k.ogrNo == ol.ogrNo)
            {
                return Json(2);
            }
            else
            {
                db.GOgrenciListesi.Remove(ol);
                db.SaveChanges();
                return Json(3);
            }
        }

        // form3 
        [HttpGet]
        public ActionResult form3()
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Guncelle g = db.Guncelle.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();
            return View(g);
        }

        public PartialViewResult faaliyetPlaniWidget()
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Guncelle g = db.Guncelle.
Where(x => x.kullanıcıID == k.ID).FirstOrDefault();
            List<GFaliyetPlani> fp = db.GFaliyetPlani.Where(x => x.faliyetID == g.ID).ToList();
            ViewBag.fp = fp;
            return PartialView();
        }

        [HttpPost]
        public ActionResult faaliyetPlaniEkle(GFaliyetPlani fp)
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Guncelle g = db.Guncelle.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();

            if (g.GFaliyetPlani.Count != 5)
            {
                fp.faliyetID = g.ID;
                db.GFaliyetPlani.Add(fp);
                db.SaveChanges();
                return Json(true);
            }
            else
            {
                return Json(false); // 5 faaliyetten fazla eklenemez.
            }

        }

        public ActionResult faaliyetSil(int id)
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Guncelle g = db.Guncelle.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();


            GFaliyetPlani ol = db.GFaliyetPlani.Where(x => x.ID == id).FirstOrDefault();
            if (ol == null)
            {
                return Json(false);
            }
            else
            {
                db.GFaliyetPlani.Remove(ol);
                db.SaveChanges();
                return Json(true);
            }
        }

        [HttpPost]
        public ActionResult form3(Guncelle gun)
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Guncelle g = db.Guncelle.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();

            g.toplantiNo = gun.toplantiNo;
            g.toplantiTarihi = gun.toplantiTarihi;
            g.saat = gun.saat;
            g.mekan = gun.mekan;

            if (g.adimNo == 2)
            {
                g.adimNo = 3;
            }

            if (g.GFaliyetPlani.Count < 5)
            {
                ViewBag.Hata = "En az 5 faaliyet eklemeniz gerekmektedir.";
                return View(g);
            }

            db.SaveChanges();
            return View(g);
        }

        //form4
        [HttpGet]
        public ActionResult form4()
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Guncelle g = db.Guncelle.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();
            List<GDanisman> DL = db.GDanisman.Where(x => x.GuncelleID == g.ID).ToList();
            ViewBag.DL = DL;
            return View(g);
        }

    }
}