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

        [Required, DisplayName("Tên hãng giày")]
        public string CatalogName { get; set; }

        [Required,DisplayName("Trạng thái")]
        public int Status { get; set; }
    }
}
