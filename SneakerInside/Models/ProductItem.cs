using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SneakerInside.Models
{
    public class ProductItemGetAll
    {
        [DisplayName("ID")]
        public int ProductItemID { get; set; }

        [DisplayName("Tên sản phẩm")]
        public string ProductName { get; set; }

        [DisplayName("Size")]
        public string SizeName { get; set; }

        [DisplayName("Số lượng tồn")]
        public int AmountStock { get; set; }
    }

    public class ProductItemInsert
    {
        [Required, DisplayName("Tên sản phẩm")]
        public int ProductID { get; set; }

        [Required, DisplayName("Size")]
        public int SizeID { get; set; }

        [Required, DisplayName("Số lượng tồn")]
        public int AmountStock { get; set; }
    }

    public class ProductItemGetAndUpdate
    {
        public int ProductItemID { get; set; }

        [Required, DisplayName("Tên sản phẩm")]
        public int ProductID { get; set; }

        [Required, DisplayName("Size")]
        public int SizeID { get; set; }

        [Required, DisplayName("Số lượng tồn")]
        public int AmountStock { get; set; }
    }
}
