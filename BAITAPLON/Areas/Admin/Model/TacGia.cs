namespace BAITAPLON.Areas
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TacGia")]
    public partial class TacGia
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TacGia()
        {
            TinTucs = new HashSet<TinTuc>();
        }

        [Key]
        [DisplayName("ID Tác Giả")]
        public int Id_Tac_Gia { get; set; }

        [StringLength(50)]
        [DisplayName("Tác Giả")]
        [Column(TypeName = "Ntext")]
        [Required(ErrorMessage = "Tên tác giả không được để trống!")]
        public string Ten_Tac_Gia { get; set; }

        [StringLength(30)]
        [DisplayName("Email")]
        public string Email { get; set; }
        [StringLength(200)]
        [DisplayName("Chức Vụ")]
        [Column(TypeName = "Ntext")]
        public string Chucvu { get; set; }

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
        public virtual ICollection<TinTuc> TinTucs { get; set; }
    }
}
