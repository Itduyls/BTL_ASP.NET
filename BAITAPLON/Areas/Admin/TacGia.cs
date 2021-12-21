namespace BAITAPLON.Areas.Admin
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TacGia")]
    public partial class TacGia
    {
        [Key]
        public int Id_Tac_Gia { get; set; }

        [StringLength(50)]
        public string Ten_Tac_Gia { get; set; }

        [StringLength(30)]
        public string Email { get; set; }

        [StringLength(50)]
        public string Chucvu { get; set; }

        [StringLength(100)]
        public string Avatar { get; set; }

        [StringLength(30)]
        public string Username { get; set; }

        [StringLength(30)]
        public string Passwork { get; set; }
    }
}
