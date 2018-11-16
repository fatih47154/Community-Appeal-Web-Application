namespace Community_Appeal_Web_Application.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class CommunityContext : DbContext
    {
        public CommunityContext()
            : base("name=CommunityContext")
        {
        }

        public virtual DbSet<Admin> Admin { get; set; }
        public virtual DbSet<Basvuru> Basvuru { get; set; }
        public virtual DbSet<Danisman> Danisman { get; set; }
        public virtual DbSet<DenetimKurulu> DenetimKurulu { get; set; }
        public virtual DbSet<FaliyetPlani> FaliyetPlani { get; set; }
        public virtual DbSet<Kullanici> Kullanici { get; set; }
        public virtual DbSet<OgrenciListesi> OgrenciListesi { get; set; }
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
        public virtual DbSet<YeniUye> YeniUye { get; set; }
        public virtual DbSet<YonetimKurulu> YonetimKurulu { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Basvuru>()
                .HasMany(e => e.FaliyetPlani)
                .WithOptional(e => e.Basvuru)
                .HasForeignKey(e => e.faliyetID);

            modelBuilder.Entity<Kullanici>()
                .HasMany(e => e.Basvuru)
                .WithOptional(e => e.Kullanici)
                .HasForeignKey(e => e.kullanıcıID);
        }
    }
}
