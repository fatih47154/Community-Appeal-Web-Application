namespace Community_Appeal_Web_Application.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Kullanici")]
    public partial class Kullanici
    {
        public int ID { get; set; }

        [StringLength(100)]
        public string ogrMail { get; set; }

        [StringLength(100)]
        public string sifre { get; set; }

        [StringLength(100)]
        public string ogrNo { get; set; }

        [StringLength(100)]
        public string tc { get; set; }

        public virtual Basvuru Basvuru { get; set; }
    }
}
