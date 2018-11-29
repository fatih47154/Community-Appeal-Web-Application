﻿using Community_Appeal_Web_Application.App_Classes;
using Community_Appeal_Web_Application.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Mvc;

namespace Community_Appeal_Web_Application.Controllers
{
    public class HomeController : Controller
    {
        CommunityContext db = new CommunityContext();
        // GET: Home
        static int hata { get; set; }
        public ActionResult Index()
        {
            return View();
        }

        //form1
        [HttpGet]
        public ActionResult form1()
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Basvuru b = db.Basvuru.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();
            return View(b);
        }

        [HttpPost]
        public ActionResult form1(Basvuru basvuru)
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Basvuru b = db.Basvuru.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();
            b.toplulukAdi = basvuru.toplulukAdi;
            b.toplulukAmac = basvuru.toplulukAmac;
            if (b.adimNo == 1)
            {
                b.adimNo = 2;
            }
            db.SaveChanges();
            return View(basvuru);
        }

        //form2
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

            if (b.OgrenciListesi.Count < 20)
            {
                List<OgrenciListesi> ol = db.OgrenciListesi.Where(x => x.basvuruID == b.ID).ToList();
                ViewBag.ol = ol;
                ViewBag.hata = "Bu formu kaydetmek için en az 20 kişi eklemelisiniz.";
                return View(b);
            }
            else
            {
                b.akademikYıl = DateTime.Now.Year.ToString() + " - " + DateTime.Now.AddYears(+1).Year.ToString();
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

        [HttpPost]
        public ActionResult OgrenciListesiEkle(OgrenciListesi ol)
        {
            
            Kullanici k = (Kullanici)Session["Kullanici"];
            Basvuru b = db.Basvuru.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();
            if (b.OgrenciListesi.Count != 20)
            {
                if (Functions.OgrenciSorgula(ol.ogrNo) == true)
                {
                    OgrenciListesi ogrenciL = db.OgrenciListesi.Where(x => x.ogrNo == ol.ogrNo && x.basvuruID == b.ID).FirstOrDefault();
                    if (ogrenciL != null)
                    {
                        return Json("hata0");
                    }
                    ol.basvuruID = b.ID;
                    db.OgrenciListesi.Add(ol);
                    db.SaveChanges();
                    OgrenciListesi o = db.OgrenciListesi.Where(x => x.ogrNo == ol.ogrNo).FirstOrDefault();
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
            Basvuru b = db.Basvuru.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();

            OgrenciListesi ol = db.OgrenciListesi.Where(x => x.ID == id).FirstOrDefault();
            if (ol == null)
            {
                return Json(1);
            }
            else if (k.ogrNo==ol.ogrNo)
            {
                return Json(2);
            }
            else
            {
                db.OgrenciListesi.Remove(ol);
                db.SaveChanges();
                return Json(3);
            }
        }      

        public PartialViewResult ogrenciListesiWidget()
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Basvuru b = db.Basvuru.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();
            List<OgrenciListesi> ol = db.OgrenciListesi.Where(x => x.basvuruID == b.ID).ToList();
            ViewBag.ol = ol;
            return PartialView();
        }

        
        //form3
        [HttpGet]
        public ActionResult form3()
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Basvuru b = db.Basvuru.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();

            var ogr = db.OgrenciListesi.Where(x=>x.basvuruID==b.ID).ToList();
            ViewBag.Ogreciler = ogr;

            YonetimKurulu baskan = db.YonetimKurulu.Where(x => x.Baskan == true && x.basvuruID == b.ID).FirstOrDefault();

            if (b.adimNo > 3)
            {
                ViewBag.baskan = baskan;
                return View(b);
            }
            return View(b);
        }

        [HttpPost]
        public ActionResult form3(int ID)
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Basvuru b = db.Basvuru.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();
            var ogrnci = db.OgrenciListesi.ToList();
            ViewBag.Ogreciler = ogrnci;

            OgrenciListesi ogr = db.OgrenciListesi.Where(x => x.ID == ID).FirstOrDefault();

            YonetimKurulu baskanEski = db.YonetimKurulu.Where(x => x.Baskan==true && x.basvuruID==b.ID).FirstOrDefault();

            YonetimKurulu baskan = new YonetimKurulu();

            if (baskanEski == null)
            {
                YonetimKurulu y2=new YonetimKurulu();
                y2.basvuruID = b.ID;
                y2.adi = Functions.IlkHarfleriBuyut(ogr.adi);
                y2.soyadi = Functions.IlkHarfleriBuyut(ogr.soyadi);
                y2.unvan = "Yönetim Kurulu Başkanı";
                y2.eMail = ogr.mail;
                y2.tc = ogr.tc;
                y2.gsm = ogr.tel;
                y2.ogrNo = ogr.ogrNo;
                y2.Baskan = true;
                
                if (b.adimNo == 3)
                {
                    b.adimNo = 4;
                }
                db.YonetimKurulu.Add(y2);
                db.SaveChanges();
                baskan = db.YonetimKurulu.Where(x => x.Baskan == true && x.basvuruID == b.ID).FirstOrDefault();
                ViewBag.baskan = baskan;
                return View(b);
            }
            else
            {
                db.YonetimKurulu.Remove(baskanEski);
                db.SaveChanges();
                
                YonetimKurulu y2 = new YonetimKurulu();
                y2.basvuruID = b.ID;
                y2.adi = Functions.IlkHarfleriBuyut(ogr.adi);
                y2.soyadi = Functions.IlkHarfleriBuyut(ogr.soyadi);
                y2.unvan = "Yönetim Kurulu Başkanı";
                y2.eMail = ogr.mail;
                y2.tc = ogr.tc;
                y2.gsm = ogr.tel;
                y2.ogrNo = ogr.ogrNo;
                y2.Baskan = true;
                if (b.adimNo == 3)
                    {
                        b.adimNo = 4;
                    }
                db.YonetimKurulu.Add(y2);
                db.SaveChanges();

                baskan = db.YonetimKurulu.Where(x => x.Baskan == true && x.basvuruID == b.ID).FirstOrDefault();
                ViewBag.baskan = baskan;
                return View(b);
            }

        }


        //form4
        [HttpGet]
        public ActionResult form4()
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Basvuru b = db.Basvuru.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();
            return View(b);
        }

        public PartialViewResult faaliyetPlaniWidget()
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Basvuru b = db.Basvuru.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();
            List<FaliyetPlani> fp = db.FaliyetPlani.Where(x => x.faliyetID == b.ID).ToList();
            ViewBag.fp = fp;
            return PartialView();
        }

        [HttpPost]
        public ActionResult faaliyetPlaniEkle(FaliyetPlani fp)
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Basvuru b = db.Basvuru.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();

            if (b.FaliyetPlani.Count != 5)
            {
                fp.faliyetID = b.ID;
                db.FaliyetPlani.Add(fp);
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
            Basvuru b = db.Basvuru.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();


            FaliyetPlani ol = db.FaliyetPlani.Where(x => x.ID == id).FirstOrDefault();
            if (ol == null)
            {
                return Json(false);
            }
            else
            {
                db.FaliyetPlani.Remove(ol);
                db.SaveChanges();
                return Json(true);
            }
        }

        [HttpPost]
        public ActionResult form4(Basvuru bas)
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Basvuru b = db.Basvuru.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();

            b.toplantiNo = bas.toplantiNo;
            b.toplantiTarihi = bas.toplantiTarihi;
            b.saat = bas.saat;
            b.mekan = bas.mekan;

            if (b.adimNo == 2)
            {
                b.adimNo = 3;
            }

            if (b.FaliyetPlani.Count < 5)
            {
                ViewBag.Hata = "En az 5 faaliyet eklemeniz gerekmektedir.";
                return View(b);
            }

            db.SaveChanges();
            return View(b);
        }

        //form5
        [HttpGet]
        public ActionResult form5()
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Basvuru b = db.Basvuru.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();
            if (b.adimNo < 2)
            {
                ViewBag.Hata = "İlk Önce Diğer Formları Doldurmanız Gerekmektedir.";
                return View();
            }
            List<Danisman> dl = db.Danisman.Where(x => x.basvuruID == b.ID).ToList();
            List<OgrenciListesi> ol = db.OgrenciListesi.Where(x=>x.basvuruID==b.ID).ToList();
            ViewBag.dl = dl;
            ViewBag.ol = ol;
            return View(b);
        }

        [HttpPost]
        public ActionResult form5(int ID)
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Basvuru b = db.Basvuru.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();
            
            if (b.Danisman.Count < 2)
            {
                List<Danisman> dl = db.Danisman.Where(x => x.basvuruID == b.ID).ToList();
                List<OgrenciListesi> ol = db.OgrenciListesi.ToList();
                ViewBag.ol = ol;
                ViewBag.dl = dl;
                TempData["a"] = "Bu formu kaydetmek için danışman sayısı 2 olmalıdır.";
                return View(b);
            }
            else
            {
                if (b.adimNo <= 3)
                {
                    b.adimNo = 5;
                    OgrenciListesi baskan = db.OgrenciListesi.FirstOrDefault(x => x.ID == ID);
                    b.baskanAdi = baskan.adi;
                    b.baskanSoyadi = baskan.soyadi;
                    db.SaveChanges();
                }
                List<Danisman> dl = db.Danisman.Where(x => x.basvuruID == b.ID).ToList();
                List<OgrenciListesi> ol = db.OgrenciListesi.ToList();
                ViewBag.dl = dl;
                ViewBag.ol = ol;
                return View(b);
            }
        }

        public PartialViewResult danismanListesiWidget()
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Basvuru b = db.Basvuru.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();
            List<Danisman> dl = db.Danisman.Where(x => x.basvuruID == b.ID).ToList();
            ViewBag.dl = dl;
            return PartialView();
        }

        [HttpPost]
        public ActionResult danismanListesiSil(int id)
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Basvuru b = db.Basvuru.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();

            Danisman dl = db.Danisman.Where(x => x.ID == id).FirstOrDefault();
            if (dl == null)
            {
                return Json(1);
            }
            else
            {
                db.Danisman.Remove(dl);
                db.SaveChanges();
                return Json(3);
            }
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

        //form6
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

        [HttpPost]
        public ActionResult form6(Danisman dan)
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Basvuru b = db.Basvuru.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();

            Danisman danisman = db.Danisman.FirstOrDefault(x => x.ID == dan.ID);
            danisman.aktif = true;

            var danismanList = db.Danisman.Where(x => x.ID != dan.ID && x.basvuruID == b.ID).ToList();
            foreach (var item in danismanList)
            {
                item.aktif = false;
            }

            db.SaveChanges();

            ViewBag.danisman = danisman;

            if (b.adimNo == 5)
            {
                b.adimNo = 6;
                db.SaveChanges();
            }

            return View("form6", b);

        }


        //form7
        [HttpGet]
        public ActionResult form7()
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Basvuru b = db.Basvuru.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();
            if (b.adimNo < 1)
            {
                ViewBag.Hata = "İlk Önce Diğer Formları Doldurmanız Gerekmektedir.";
                return View();
            }

            var BaskanYar = db.YonetimKurulu.FirstOrDefault(x => x.unvan == "Başkan Yardımcısı");
            ViewBag.BaskanYar = BaskanYar;

            var yk1 = db.YonetimKurulu.Where(x => x.basvuruID == b.ID).ToList();
            ViewBag.yk1 = yk1;

            var dk = db.DenetimKurulu.Where(x => x.basvuruID == b.ID).ToList();
            ViewBag.dk = dk;

            switch (hata)
            {
                case 1:
                    TempData["YönetimHata"] = "Başkan Yardımcısı Olarak Seçtiğiniz Üyeyi Daha Önce Yönetim Kurulunda Kullandınız.";
                    break;

                case 2:
                    TempData["YönetimHata"] = "Sayman Olarak Seçtiğiniz Üyeyi Daha Önce Yönetim Kurulunda Kullandınız.";
                    break;

                case 3:
                    TempData["YönetimHata"] = "Sekreter Olarak Seçtiğiniz Üyeyi Daha Önce Yönetim Kurulunda Kullandınız.";
                    break;

                case 4:
                    TempData["YönetimHata"] = "Kaydetmek İstediğiniz Üye Yönetim Kurulu Tablosunda Bulunmaktadır.";
                    break;

                case 5:
                    TempData["YönetimHata"] = "Yönetim Kurulunda En Fazla 3 Üye Bulunabilir.";
                    break;

                case 6:
                    TempData["YönetimHata"] = "Kaydetmek İstediğiniz Üye Yönetim Kurulu veya Denetim Kurulu Tablosunda Bulunmaktadır.";
                    break;

                case 7:
                    TempData["YönetimHata"] = "Denetim Kurulunda En Fazla 2 Üye Bulunabilir.";
                    break;

                case 8:
                    TempData["YönetimHata"] =
                        "Denetim Kurulu Başkanı Olarak Seçtiğiniz Üyeyi Daha Önce Yönetim Kurulunda Kullandınız.";
                    break;

                default:
                    break;
            }

            hata = 0;

            return View(b);
        }

        [HttpPost]
        public ActionResult form7YonetimKuruluKaydet(Basvuru basvuru,int? divanBasId,int? baskanYarId,int? yazmanId,int? sekreterId,int? saymanId)
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Basvuru b = db.Basvuru.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();

            if (basvuru.marscı != "null")
            {
                b.marscı = basvuru.marscı;
            }

            if (basvuru.uyeSayisi != null)
            {
                b.uyeSayisi = basvuru.uyeSayisi;
            }

            var divanBaskani = db.OgrenciListesi.FirstOrDefault(x => x.ID == divanBasId);
            if (divanBaskani != null)
            {
                b.divanBaskanAdi = divanBaskani.adi;
                b.divanBaskanSoyadi = divanBaskani.soyadi;
            }

            var yazman = db.OgrenciListesi.FirstOrDefault(x => x.ID == yazmanId);
            if (yazman != null)
            {
                b.yazmanAdi = yazman.adi;
                b.yazmanSoyadi = yazman.soyadi;
            }

            db.SaveChanges();

            if (baskanYarId != null)
            {
                YonetimKurulu baskanYar = db.YonetimKurulu.FirstOrDefault(x => x.unvan == "Başkan Yardımcısı");
                OgrenciListesi baskanYard = db.OgrenciListesi.FirstOrDefault(x => x.ID == baskanYarId);
                if (db.YonetimKurulu.FirstOrDefault(x =>
                        x.ogrNo == baskanYard.ogrNo && x.unvan != "Başkan Yardımcısı") == null
                    && db.DenetimKurulu.FirstOrDefault(x => x.ogrNo == baskanYard.ogrNo) == null)
                {
                    if (baskanYar == null)
                    {
                        baskanYar = new YonetimKurulu();
                        baskanYar.basvuruID = b.ID;
                        baskanYar.adi = baskanYard.adi;
                        baskanYar.soyadi = baskanYard.soyadi;
                        baskanYar.unvan = "Başkan Yardımcısı";
                        baskanYar.ogrNo = baskanYard.ogrNo;
                        baskanYar.fakulte = baskanYard.fak;
                        baskanYar.tc = baskanYard.tc;
                        baskanYar.gsm = baskanYard.tel;
                        baskanYar.eMail = baskanYard.mail;
                        db.YonetimKurulu.Add(baskanYar);
                        db.SaveChanges();
                    }
                    else
                    {
                        baskanYar.basvuruID = b.ID;
                        baskanYar.adi = baskanYard.adi;
                        baskanYar.soyadi = baskanYard.soyadi;
                        baskanYar.unvan = "Başkan Yardımcısı";
                        baskanYar.ogrNo = baskanYard.ogrNo;
                        baskanYar.fakulte = baskanYard.fak;
                        baskanYar.tc = baskanYard.tc;
                        baskanYar.gsm = baskanYard.tel;
                        baskanYar.eMail = baskanYard.mail;
                        db.SaveChanges();
                    }
                }
                else
                {
                    hata = 1;
                }
            }

            if (saymanId != null)
            {
                YonetimKurulu sayman = db.YonetimKurulu.FirstOrDefault(x => x.unvan == "Sayman");
                OgrenciListesi saymann = db.OgrenciListesi.FirstOrDefault(x => x.ID == saymanId);
                if (db.YonetimKurulu.FirstOrDefault(x =>
                        x.ogrNo == saymann.ogrNo && x.unvan != "Sayman") == null
                    && db.DenetimKurulu.FirstOrDefault(x => x.ogrNo == saymann.ogrNo) == null)
                {
                    if (sayman == null)
                    {
                        sayman = new YonetimKurulu();
                        sayman.basvuruID = b.ID;
                        sayman.adi = saymann.adi;
                        sayman.soyadi = saymann.soyadi;
                        sayman.unvan = "Sayman";
                        sayman.ogrNo = saymann.ogrNo;
                        sayman.fakulte = saymann.fak;
                        sayman.tc = saymann.tc;
                        sayman.gsm = saymann.tel;
                        sayman.eMail = saymann.mail;
                        db.YonetimKurulu.Add(sayman);
                        db.SaveChanges();
                    }
                    else
                    {
                        sayman.basvuruID = b.ID;
                        sayman.adi = saymann.adi;
                        sayman.soyadi = saymann.soyadi;
                        sayman.unvan = "Sayman";
                        sayman.ogrNo = saymann.ogrNo;
                        sayman.fakulte = saymann.fak;
                        sayman.tc = saymann.tc;
                        sayman.gsm = saymann.tel;
                        sayman.eMail = saymann.mail;
                        db.SaveChanges();
                    }
                }
                else
                {
                    hata = 2;
                }
            }

            if (sekreterId != null)
            {
                YonetimKurulu sekreter = db.YonetimKurulu.FirstOrDefault(x => x.unvan == "Sekreter");
                OgrenciListesi sekreter1 = db.OgrenciListesi.FirstOrDefault(x => x.ID == sekreterId);
                if (db.YonetimKurulu.FirstOrDefault(x => x.ogrNo == sekreter1.ogrNo && x.unvan != "Sekreter") == null
                    && db.DenetimKurulu.FirstOrDefault(x => x.ogrNo == sekreter1.ogrNo) == null)
                {
                    if (sekreter == null)
                    {
                        sekreter = new YonetimKurulu();
                        sekreter.basvuruID = b.ID;
                        sekreter.adi = sekreter1.adi;
                        sekreter.soyadi = sekreter1.soyadi;
                        sekreter.unvan = "Sekreter";
                        sekreter.ogrNo = sekreter1.ogrNo;
                        sekreter.fakulte = sekreter1.fak;
                        sekreter.tc = sekreter1.tc;
                        sekreter.gsm = sekreter1.tel;
                        sekreter.eMail = sekreter1.mail;
                        db.YonetimKurulu.Add(sekreter);
                        db.SaveChanges();
                    }
                    else
                    {
                        sekreter.basvuruID = b.ID;
                        sekreter.adi = sekreter1.adi;
                        sekreter.soyadi = sekreter1.soyadi;
                        sekreter.unvan = "Sekreter";
                        sekreter.ogrNo = sekreter1.ogrNo;
                        sekreter.fakulte = sekreter1.fak;
                        sekreter.tc = sekreter1.tc;
                        sekreter.gsm = sekreter1.tel;
                        sekreter.eMail = sekreter1.mail;
                        db.SaveChanges();
                    }
                }
                else
                {
                    hata = 3;
                }
            }

            if (b.adimNo == 6 && db.YonetimKurulu.Where(x => x.basvuruID == b.ID).ToList().Count() == 7 && db.DenetimKurulu.Where(x => x.basvuruID == b.ID).ToList().Count() == 3)
            {
                b.adimNo = 7;
                db.SaveChanges();
            }

            return RedirectToAction("form7");

        }

        public ActionResult yonetimKuruluUyeEkle(int id)
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Basvuru b = db.Basvuru.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();

            int sayac = db.YonetimKurulu.Where(x => x.unvan == "Üye").Count();
            if (sayac < 3)
            {
                var ogrenci = db.OgrenciListesi.FirstOrDefault(x => x.ID == id);
                if (db.YonetimKurulu.FirstOrDefault(x => x.ogrNo == ogrenci.ogrNo) == null
                    && db.DenetimKurulu.FirstOrDefault(x => x.ogrNo == ogrenci.ogrNo) == null)
                {
                    YonetimKurulu uye = new YonetimKurulu();
                    uye.basvuruID = b.ID;
                    uye.unvan = "Üye";
                    uye.adi = ogrenci.adi;
                    uye.soyadi = ogrenci.soyadi;
                    uye.ogrNo = ogrenci.ogrNo;
                    uye.fakulte = ogrenci.fak;
                    uye.tc = ogrenci.tc;
                    uye.gsm = ogrenci.tel;
                    uye.eMail = ogrenci.mail;
                    db.YonetimKurulu.Add(uye);
                    db.SaveChanges();
                }
                else
                {
                    hata = 4;
                }
                
                return RedirectToAction("form7");
            }
            else
            {
                hata = 5;
                return RedirectToAction("form7");      
            }

        }

        public PartialViewResult uyeListesiWidget()
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Basvuru b = db.Basvuru.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();
            List<YonetimKurulu> yk = db.YonetimKurulu.Where(x => x.unvan == "Üye").ToList();
            ViewBag.yk = yk;

            var yk1 = db.YonetimKurulu.Where(x => x.basvuruID == b.ID).ToList();
            ViewBag.yk1 = yk1;

            var dk = db.DenetimKurulu.Where(x => x.basvuruID == b.ID).ToList();
            ViewBag.dk = dk;
            return PartialView();
        }

        public PartialViewResult yKuruluListesiWidget()
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Basvuru b = db.Basvuru.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();

            var yk1 = db.YonetimKurulu.Where(x => x.basvuruID == b.ID).ToList();
            ViewBag.yk1 = yk1;

            return PartialView();
        }

        public PartialViewResult dKuruluListesiWidget()
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Basvuru b = db.Basvuru.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();

            var dk = db.DenetimKurulu.Where(x => x.basvuruID == b.ID).ToList();
            ViewBag.dk = dk;
            return PartialView();
        }

        public ActionResult uyeListesiSil(int id)
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Basvuru b = db.Basvuru.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();

            YonetimKurulu ul = db.YonetimKurulu.Where(x => x.ID == id).FirstOrDefault();
            db.YonetimKurulu.Remove(ul);
            db.SaveChanges();
            return RedirectToAction("form7");
        }

        public ActionResult denetimKuruluUyeEkle(int id)
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Basvuru b = db.Basvuru.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();

            int sayac = db.DenetimKurulu.Where(x => x.unvan == "Üye").Count();
            if (sayac < 2)
            {
                var ogrenci = db.OgrenciListesi.FirstOrDefault(x => x.ID == id);
                if (db.YonetimKurulu.FirstOrDefault(x => x.ogrNo == ogrenci.ogrNo) == null
                    && db.DenetimKurulu.FirstOrDefault(x => x.ogrNo == ogrenci.ogrNo) == null)
                {
                    DenetimKurulu uye = new DenetimKurulu();
                    uye.basvuruID = b.ID;
                    uye.unvan = "Üye";
                    uye.adi = ogrenci.adi;
                    uye.soyadi = ogrenci.soyadi;
                    uye.ogrNo = ogrenci.ogrNo;

                    db.DenetimKurulu.Add(uye);
                    db.SaveChanges();
                }
                else
                {
                    hata = 6;
                }

                return RedirectToAction("form7");
            }
            else
            {
                hata = 7;
                return RedirectToAction("form7");
            }

        }

        [HttpPost]
        public ActionResult form7DenetimKuruluKaydet(int? baskanId)
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Basvuru b = db.Basvuru.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();

            var yk1 = db.YonetimKurulu.Where(x => x.basvuruID == b.ID).ToList();
            ViewBag.yk1 = yk1;

            var dk = db.DenetimKurulu.Where(x => x.basvuruID == b.ID).ToList();
            ViewBag.dk = dk;

            var BaskanYar = db.YonetimKurulu.FirstOrDefault(x => x.unvan == "Başkan Yardımcısı");
            ViewBag.BaskanYar = BaskanYar;

            if (baskanId != null)
            {
                DenetimKurulu baskan = db.DenetimKurulu.FirstOrDefault(x => x.unvan == "Denetim Kurulu Başkanı");
                OgrenciListesi dBaskan = db.OgrenciListesi.FirstOrDefault(x => x.ID == baskanId);
                if (db.DenetimKurulu.FirstOrDefault(
                        x => x.ogrNo == dBaskan.ogrNo && x.unvan != "Denetim Kurulu Başkanı") == null
                    && db.YonetimKurulu.FirstOrDefault(x => x.ogrNo == dBaskan.ogrNo) == null)
                {
                    if (baskan == null)
                    {
                        baskan = new DenetimKurulu();
                        baskan.basvuruID = b.ID;
                        baskan.adi = dBaskan.adi;
                        baskan.soyadi = dBaskan.soyadi;
                        baskan.unvan = "Denetim Kurulu Başkanı";
                        baskan.ogrNo = dBaskan.ogrNo;
                        db.DenetimKurulu.Add(baskan);
                        db.SaveChanges();
                    }
                    else
                    {
                        baskan.basvuruID = b.ID;
                        baskan.adi = dBaskan.adi;
                        baskan.soyadi = dBaskan.soyadi;
                        baskan.unvan = "Denetim Kurulu Başkanı";
                        baskan.ogrNo = dBaskan.ogrNo;
                        db.SaveChanges();
                    }
                }
                else
                {
                    hata = 8;
                }
            }
            else
            {
                TempData["YönetimHata"] = "Denetim Kurulu Başkanını Seçmediniz.";
            }

            if (b.adimNo == 6 && db.YonetimKurulu.Where(x => x.basvuruID == b.ID).ToList().Count() == 7 && db.DenetimKurulu.Where(x => x.basvuruID == b.ID).ToList().Count() == 3)
            {
                b.adimNo = 7;
                db.SaveChanges();
            }

            return RedirectToAction("form7");


        }

        public ActionResult dUyeListesiSil(int id)
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Basvuru b = db.Basvuru.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();

            DenetimKurulu ul = db.DenetimKurulu.Where(x => x.ID == id).FirstOrDefault();
            db.DenetimKurulu.Remove(ul);
            db.SaveChanges();
            return RedirectToAction("form7");
        }

        [HttpGet]
        public ActionResult form8()
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Basvuru b = db.Basvuru.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();
            if (b.adimNo < 1)
            {
                ViewBag.Hata = "İlk Önce Diğer Formları Doldurmanız Gerekmektedir.";
                return View();
            }

            ViewBag.yonetimKurulu = db.YonetimKurulu.Where(x => x.basvuruID == b.ID).ToList();
            return View(b);
        }

        //Basvuru Tamamla
        public ActionResult basvuruTamamla()
        {

            return View();
        }

    }
}