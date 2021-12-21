﻿namespace BAITAPLON.Areas
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
        public string Ten_Tac_Gia { get; set; }

        [StringLength(30)]
        [DisplayName("Email")]
        public string Email { get; set; }
        [StringLength(200)]
        [DisplayName("Chức Vụ")]
        public string Chucvu { get; set; }

        [StringLength(100)]
        [DisplayName("Ảnh Đại Diện")]
        public string Avatar { get; set; }

        [StringLength(30)]
        [DisplayName("Tên Đăng Nhập")]
        public string Username { get; set; }
        

        [StringLength(30)]
        [DisplayName("Mật Khẩu")]
        public string Passwork { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TinTuc> TinTucs { get; set; }
    }
}