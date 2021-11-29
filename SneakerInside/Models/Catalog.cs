using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SneakerInside.Models
{
    public class Catalog
    {
        [Display(Name = "ID")]
        public int CatalogID { get; set; }

        [Display(Name = "Tên danh mục")]
        public string CatalogName { get; set; }

        [Display(Name = "Trạng thái")]
        public int Status { get; set; }
    }
}
