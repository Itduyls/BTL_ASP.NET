namespace BAITAPLON.Areas
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("NguoiDung")]
    public partial class NguoiDung
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public NguoiDung()
        {
            BinhLuans = new HashSet<BinhLuan>();
        }

        [Key]
        [DisplayName("ID Người Dùng")]
        public int Id_NguoiDung { get; set; }

        [StringLength(50)]
        [DisplayName("Tên Người Dùng")]
        [Column(TypeName = "Ntext")]
        [Required(ErrorMessage = "Tên người dùng không được để trống!")]
        public string Ten_NguoiDung { get; set; }

        [StringLength(30)]
        [DisplayName("Email")]
        public string Email { get; set; }

        [StringLength(100)]
        [DisplayName("Ảnh Đại Diện")]
        [Required(ErrorMessage = "Ảnh không được để trống!")]
        public string Avatar { get; set; }

        [StringLength(30)]
        [DisplayName("Tên Đăng Nhập")]
        [Required(ErrorMessage = "Tên đăng nhập không được để trống!")]
        public string Username { get; set; }

        [StringLength(30)]
        [DisplayName("Mật Khẩu")]
        [Required(ErrorMessage = "Mật khẩu không được để trống!")]
        public string Passwork { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BinhLuan> BinhLuans { get; set; }
    }
}
