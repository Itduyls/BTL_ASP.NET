namespace BAITAPLON.Areas
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("BinhLuan")]
    public partial class BinhLuan
    {
        [Key]
        [DisplayName("ID Bình Luận")]
        public int Id_Binh_Luan { get; set; }

        [StringLength(150)]
        [DisplayName("Nội Dung")]
        public string Noi_Dung_BL { get; set; }

        [Column(TypeName = "date")]
        [DisplayName("Ngày Bình Luận")]
        public DateTime? Ngay_Binh_Luan { get; set; }

        
        public int? Id_TinTuc { get; set; }

        public int? Id_NguoiDung { get; set; }

        public virtual NguoiDung NguoiDung { get; set; }

        public virtual TinTuc TinTuc { get; set; }
    }
}
