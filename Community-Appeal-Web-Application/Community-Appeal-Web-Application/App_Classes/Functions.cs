using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Community_Appeal_Web_Application.App_Classes
{
    public class Functions
    {
        public static string IlkHarfleriBuyut(string metin)
        {
            string Degisen = "";
            try
            {
                System.Globalization.CultureInfo cultureInfo = System.Threading.Thread.CurrentThread.CurrentCulture;
                System.Globalization.TextInfo textInfo = cultureInfo.TextInfo;
                Degisen = textInfo.ToTitleCase(metin);
            }
            catch (Exception e)
            {
                Degisen = metin;
            }
            return Degisen;
        }
    }
}