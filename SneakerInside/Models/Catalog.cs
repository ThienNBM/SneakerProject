using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SneakerInside.Models
{
    public class Catalog
    {
        [DisplayName("ID")]
        public int CatalogID { get; set; }

        [DisplayName("Tên hãng giày")]
        [Required(ErrorMessage ="Tên hãng giày không được để trống")]
        public string CatalogName { get; set; }

        [Required,DisplayName("Trạng thái")]
        public int Status { get; set; }
    }
}
