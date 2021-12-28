namespace BAITAPLON.Areas
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TinTuc")]
    public partial class TinTuc
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TinTuc()
        {
            BinhLuans = new HashSet<BinhLuan>();
        }

        [Key]
        [DisplayName("ID Tin Tức")]
        public int Id_TinTuc { get; set; }
        [DisplayName("Loại Tin Tức")]

        public int Id_LoaiTinTuc { get; set; }
        [DisplayName("Ngày Đăng")]

        [Column(TypeName = "date")]
        
        public DateTime Ngay_Dang { get; set; }

        [StringLength(100)]
        [DisplayName("Tiêu Đề Bài Viết")]
        [Column(TypeName = "Ntext")]

        [Required(ErrorMessage = "Tiêu đề không được để trống!")]

        public string Tieu_De { get; set; }
        [DisplayName("Nội Dung")]

        [Column(TypeName = "Ntext")]
        [Required(ErrorMessage = "Nội dung không được để trống!")]
        public string Noi_Dung { get; set; }

        [StringLength(100)]
        [DisplayName("Ảnh Đại Diện")]
     
        public string img { get; set; }

        [Column(TypeName = "date")]
        [DisplayName("Ngày Cập Nhật")]
        public DateTime? Ngay_Cap_Nhat { get; set; }

        [DisplayName("Trạng Thái")]
        [Column(TypeName = "Ntext")]
        public string Trang_Thai { get; set; }
        [DisplayName("ID Tác Giả")]

        public int? Id_Tac_Gia { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        
        public virtual ICollection<BinhLuan> BinhLuans { get; set; }

        public virtual LoaiTinTuc LoaiTinTuc { get; set; }

        public virtual TacGia TacGia { get; set; }
    }
}
