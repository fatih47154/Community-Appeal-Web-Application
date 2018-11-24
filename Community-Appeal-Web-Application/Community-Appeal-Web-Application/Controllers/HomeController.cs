using Community_Appeal_Web_Application.App_Classes;
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

        public ActionResult Index()
        {
            return View();
        }

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

        //public class basvuruAndYonetim
        //{
        //    public Basvuru b { get; set; }
        //    public YonetimKurulu y1 { get; set; }
        //}



        [HttpPost]
        public ActionResult FaliyetEkle(FaliyetPlani fp)
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Basvuru b = db.Basvuru.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();
            FaliyetPlani f = db.FaliyetPlani.Where(x => x.faliyetID == b.ID).FirstOrDefault();
            if (f != null)
            {
                return Json("hata0");
            }

            fp.faliyetID = b.ID;
            db.FaliyetPlani.Add(fp);
            db.SaveChanges();
            ViewBag.ft = db.FaliyetPlani.Where(x => x.faliyetID == b.ID).FirstOrDefault();

            return Json("hata2");
        }



        public void Drop()
        {
            var ogr = db.OgrenciListesi.ToList();
            ViewBag.Ogreciler = ogr;
        }

        [HttpGet]
        public ActionResult form3()
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Drop();
            Basvuru b = db.Basvuru.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();
            ViewBag.y1 = db.YonetimKurulu.FirstOrDefault(x => x.basvuruID == b.ID);

            //if (b.adimNo < 3)
            //{
            //    ViewBag.Hata = "İlk önce 2.Formu Doldurmanız Gerekmektedir.";
            //    return View();
            //}
            if (b != null)
            {
                return View(b);
            }
            return View();
        }

        [HttpPost]
        public ActionResult form3(Basvuru basvuru, YonetimKurulu baskan,int ID)
        {
            Kullanici k = (Kullanici)Session["Kullanici"];

            OgrenciListesi ogr = db.OgrenciListesi.Where(x => x.ID == ID).FirstOrDefault();

            Basvuru b = db.Basvuru.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();

            
            YonetimKurulu y1 = db.YonetimKurulu.Where(x=> x.basvuruID==b.ID).FirstOrDefault();
            if (y1==null)
            {
                YonetimKurulu y2=new YonetimKurulu();
                y2.basvuruID = b.ID;
                y2.adi = Functions.IlkHarfleriBuyut(ogr.adi);
                y2.soyadi = Functions.IlkHarfleriBuyut(ogr.soyadi);
                y2.unvan = "Yönetim Kurulu Başkanı";
                y1 = y2;

                if (b.adimNo == 3)
                {
                    b.adimNo = 4;
                }
                db.YonetimKurulu.Add(y1);
                db.SaveChanges();
                ViewBag.YonetimKurulu = y1;
                Drop();
                return View(b);
            }
            else
            {
                y1.basvuruID = b.ID;
                y1.adi = Functions.IlkHarfleriBuyut(ogr.adi);
                y1.soyadi = Functions.IlkHarfleriBuyut(ogr.soyadi);
                y1.unvan = "Yönetim Kurulu Başkanı";

                if (b.adimNo == 3)
                {
                    b.adimNo = 4;
                }
                db.SaveChanges();
                ViewBag.YonetimKurulu = y1;
                Drop();
                return View(b);
            }

        }

        [HttpGet]
        public ActionResult form4()
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Basvuru b = db.Basvuru.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();
            ViewBag.ft = db.FaliyetPlani.Where(x => x.faliyetID == b.ID).FirstOrDefault();

            if (b != null)
            {
                return View(b);
            }

            return View();
        }

        [HttpPost]
        public ActionResult form4(int ID)
        {
            return View();
        }

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
            List<OgrenciListesi> ol = db.OgrenciListesi.ToList();
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

            ViewBag.danisman = danisman;

            if (b.adimNo == 5)
            {
                b.adimNo = 6;
                db.SaveChanges();
            }

            return View("form6", b);

        }

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

            var Yazman = db.YonetimKurulu.FirstOrDefault(x => x.unvan == "Yazman");
            ViewBag.Yazman = Yazman;

            var yk1 = db.YonetimKurulu.Where(x => x.basvuruID == b.ID).ToList();
            ViewBag.yk1 = yk1;

            var dk = db.DenetimKurulu.Where(x => x.basvuruID == b.ID).ToList();
            ViewBag.dk = dk;
            return View(b);
        }

        [HttpPost]
        public ActionResult form7YonetimKuruluKaydet(Basvuru basvuru,int divanBasId,int baskanYarId,int yazmanId,int sekreterId)
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Basvuru b = db.Basvuru.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();

            var yk1 = db.YonetimKurulu.Where(x => x.basvuruID == b.ID).ToList();
            ViewBag.yk1 = yk1;

            var dk = db.DenetimKurulu.Where(x => x.basvuruID == b.ID).ToList();
            ViewBag.dk = dk;

            var BaskanYar = db.YonetimKurulu.FirstOrDefault(x => x.unvan == "Başkan Yardımcısı");
            ViewBag.BaskanYar = BaskanYar;

            var Yazman = db.YonetimKurulu.FirstOrDefault(x => x.unvan == "Yazman");
            ViewBag.Yazman = Yazman;

            b.marscı = basvuru.marscı;
            b.uyeSayisi = basvuru.uyeSayisi;

            var divanBaskani = db.OgrenciListesi.FirstOrDefault(x => x.ID == divanBasId);
            b.divanBaskanAdi = divanBaskani.adi;
            b.divanBaskanSoyadi = divanBaskani.soyadi;

             
            YonetimKurulu baskanYar = db.YonetimKurulu.FirstOrDefault(x => x.unvan == "Başkan Yardımcısı");
            OgrenciListesi baskanYard = db.OgrenciListesi.FirstOrDefault(x => x.ID == baskanYarId);
            if (db.YonetimKurulu.FirstOrDefault(x => x.ogrNo == baskanYard.ogrNo && x.unvan !="Başkan Yardımcısı") == null
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
                    db.SaveChanges();
                }
            }
            else
            {
                TempData["YönetimHata"] = "Başkan Yardımcısı Olarak Seçtiğiniz Üyeyi Daha Önce Yönetim Kurulunda Kullandınız.";
            }

            YonetimKurulu yazman = db.YonetimKurulu.FirstOrDefault(x => x.unvan == "Yazman");
            OgrenciListesi yazman1 = db.OgrenciListesi.FirstOrDefault(x => x.ID == yazmanId);
            if (db.YonetimKurulu.FirstOrDefault(x => x.ogrNo == yazman1.ogrNo && x.unvan != "Yazman") == null
                && db.DenetimKurulu.FirstOrDefault(x => x.ogrNo == yazman1.ogrNo) == null)
            {
                if (yazman == null)
                {
                    yazman = new YonetimKurulu();
                    yazman.basvuruID = b.ID;
                    yazman.adi = yazman1.adi;
                    yazman.soyadi = yazman1.soyadi;
                    yazman.unvan = "Yazman";
                    yazman.ogrNo = yazman1.ogrNo;
                    db.YonetimKurulu.Add(yazman);
                    db.SaveChanges();
                }
                else
                {
                    yazman.basvuruID = b.ID;
                    yazman.adi = yazman1.adi;
                    yazman.soyadi = yazman1.soyadi;
                    yazman.unvan = "Yazman";
                    yazman.ogrNo = yazman1.ogrNo;
                    db.SaveChanges();
                }
            }
            else
            {
                TempData["YönetimHata"] = "Yazman Olarak Seçtiğiniz Üyeyi Daha Önce Yönetim Kurulunda Kullandınız.";
            }

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
                    db.SaveChanges();
                }
            }
            else
            {
                TempData["YönetimHata"] = "Sekreter Olarak Seçtiğiniz Üyeyi Daha Önce Yönetim Kurulunda Kullandınız.";
            }

            return View("form7",b);

            
        }

        public ActionResult yonetimKuruluUyeEkle(int id)
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Basvuru b = db.Basvuru.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();
            var yk1 = db.YonetimKurulu.Where(x => x.basvuruID == b.ID).ToList();
            ViewBag.yk1 = yk1;

            var BaskanYar = db.YonetimKurulu.FirstOrDefault(x => x.unvan == "Başkan Yardımcısı");
            ViewBag.BaskanYar = BaskanYar;

            var Yazman = db.YonetimKurulu.FirstOrDefault(x => x.unvan == "Yazman");
            ViewBag.Yazman = Yazman;

            var dk = db.DenetimKurulu.Where(x => x.basvuruID == b.ID).ToList();
            ViewBag.dk = dk;
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

                    db.YonetimKurulu.Add(uye);
                    db.SaveChanges();
                }
                else
                {
                    TempData["YönetimHata"] = "Kaydetmek İstediğiniz Üye Yönetim Kurulu Tablosunda Bulunmaktadır.";
                }
                
                return View("form7",b);
            }
            else
            {
                TempData["YönetimHata"] = "Yönetim Kurulunda En Fazla 3 Üye Bulunabilir.";
                return View("form7",b);      
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

        public ActionResult uyeListesiSil(int id)
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Basvuru b = db.Basvuru.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();

            YonetimKurulu ul = db.YonetimKurulu.Where(x => x.ID == id).FirstOrDefault();
            db.YonetimKurulu.Remove(ul);
            db.SaveChanges();
            return RedirectToAction("form7",b);
        }

        public ActionResult denetimKuruluUyeEkle(int id)
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Basvuru b = db.Basvuru.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();
            var yk1 = db.YonetimKurulu.Where(x => x.basvuruID == b.ID).ToList();
            ViewBag.yk1 = yk1;

            var BaskanYar = db.YonetimKurulu.FirstOrDefault(x => x.unvan == "Başkan Yardımcısı");
            ViewBag.BaskanYar = BaskanYar;

            var Yazman = db.YonetimKurulu.FirstOrDefault(x => x.unvan == "Yazman");
            ViewBag.Yazman = Yazman;

            var dk = db.DenetimKurulu.Where(x => x.basvuruID == b.ID).ToList();
            ViewBag.dk = dk;
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
                    TempData["YönetimHata"] = "Kaydetmek İstediğiniz Üye Yönetim Kurulu Tablosunda Bulunmaktadır.";
                }

                return View("form7", b);
            }
            else
            {
                TempData["YönetimHata"] = "Yönetim Kurulunda En Fazla 2 Üye Bulunabilir.";
                return View("form7", b);
            }

        }

        [HttpPost]
        public ActionResult form7DenetimKuruluKaydet(int baskanId)
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Basvuru b = db.Basvuru.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();

            var yk1 = db.YonetimKurulu.Where(x => x.basvuruID == b.ID).ToList();
            ViewBag.yk1 = yk1;

            var dk = db.DenetimKurulu.Where(x => x.basvuruID == b.ID).ToList();
            ViewBag.dk = dk;

            var BaskanYar = db.YonetimKurulu.FirstOrDefault(x => x.unvan == "Başkan Yardımcısı");
            ViewBag.BaskanYar = BaskanYar;

            var Yazman = db.YonetimKurulu.FirstOrDefault(x => x.unvan == "Yazman");
            ViewBag.Yazman = Yazman;

            DenetimKurulu baskan = db.DenetimKurulu.FirstOrDefault(x => x.unvan == "Denetim Kurulu Başkanı");
            OgrenciListesi dBaskan = db.OgrenciListesi.FirstOrDefault(x => x.ID == baskanId);
            if (db.DenetimKurulu.FirstOrDefault(x => x.ogrNo == dBaskan.ogrNo && x.unvan != "Denetim Kurulu Başkanı") == null
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
                TempData["YönetimHata"] = "Denetim Kurulu Başkanı Olarak Seçtiğiniz Üyeyi Daha Önce Yönetim Kurulunda Kullandınız.";
            }

            return View("form7", b);


        }

        public ActionResult dUyeListesiSil(int id)
        {
            Kullanici k = (Kullanici)Session["Kullanici"];
            Basvuru b = db.Basvuru.Where(x => x.kullanıcıID == k.ID).FirstOrDefault();

            DenetimKurulu ul = db.DenetimKurulu.Where(x => x.ID == id).FirstOrDefault();
            db.DenetimKurulu.Remove(ul);
            db.SaveChanges();
            return RedirectToAction("form7", b);
        }

        public ActionResult basvuruTamamla()
        {

            return View();
        }

    }
}