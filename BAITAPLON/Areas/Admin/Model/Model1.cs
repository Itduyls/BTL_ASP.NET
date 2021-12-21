using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace BAITAPLON.Areas
{
    public partial class Model1 : DbContext
    {
        public Model1()
            : base("name=TinTuc")
        {
        }

        public virtual DbSet<BinhLuan> BinhLuans { get; set; }
        public virtual DbSet<LoaiTinTuc> LoaiTinTucs { get; set; }
        public virtual DbSet<NguoiDung> NguoiDungs { get; set; }
        public virtual DbSet<TacGia> TacGias { get; set; }
        public virtual DbSet<TinTuc> TinTucs { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<BinhLuan>()
                .Property(e => e.Noi_Dung_BL)
                .IsUnicode(false);

            modelBuilder.Entity<LoaiTinTuc>()
                .Property(e => e.Ten_LoaiTinTuc)
                .IsUnicode(false);

            modelBuilder.Entity<LoaiTinTuc>()
                .Property(e => e.MoTa_LoaiTinTuc)
                .IsUnicode(false);

            modelBuilder.Entity<LoaiTinTuc>()
                .HasMany(e => e.TinTucs)
                .WithRequired(e => e.LoaiTinTuc)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<NguoiDung>()
                .Property(e => e.Ten_NguoiDung)
                .IsUnicode(false);

            modelBuilder.Entity<NguoiDung>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<NguoiDung>()
                .Property(e => e.Avatar)
                .IsUnicode(false);

            modelBuilder.Entity<NguoiDung>()
                .Property(e => e.Username)
                .IsUnicode(false);

            modelBuilder.Entity<NguoiDung>()
                .Property(e => e.Passwork)
                .IsUnicode(false);

            modelBuilder.Entity<TacGia>()
                .Property(e => e.Ten_Tac_Gia)
                .IsUnicode(false);

            modelBuilder.Entity<TacGia>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<TacGia>()
                .Property(e => e.Avatar)
                .IsUnicode(false);

            modelBuilder.Entity<TacGia>()
                .Property(e => e.Username)
                .IsUnicode(false);

            modelBuilder.Entity<TacGia>()
                .Property(e => e.Passwork)
                .IsUnicode(false);

            modelBuilder.Entity<TinTuc>()
                .Property(e => e.Tieu_De)
                .IsUnicode(false);

            modelBuilder.Entity<TinTuc>()
                .Property(e => e.Noi_Dung)
                .IsUnicode(false);

            modelBuilder.Entity<TinTuc>()
                .Property(e => e.img)
                .IsUnicode(false);
        }
    }
}
