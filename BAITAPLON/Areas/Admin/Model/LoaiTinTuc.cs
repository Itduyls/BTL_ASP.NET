namespace BAITAPLON.Areas
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("LoaiTinTuc")]
    public partial class LoaiTinTuc
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public LoaiTinTuc()
        {
            TinTucs = new HashSet<TinTuc>();
        }

        [Key]
        [DisplayName("ID Tin Tức")]
        public int Id_LoaiTinTuc { get; set; }

        [Required]
        [StringLength(50)]
        [DisplayName("Loại Tin")]
        public string Ten_LoaiTinTuc { get; set; }

        [StringLength(100)]
        [DisplayName("Mô Tả")]
        public string MoTa_LoaiTinTuc { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TinTuc> TinTucs { get; set; }
    }
}
