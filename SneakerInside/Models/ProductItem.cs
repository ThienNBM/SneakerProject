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

        [DisplayName("Giá sản phẩm")]
        public int Price { get; set; }

        [DisplayName("Ảnh")]
        public string Image { get; set; }
    }

    public class ProductItemInsert
    {
        [DisplayName("Tên sản phẩm")]
        [Required(ErrorMessage = "Tên sản phẩm không được để trống")]
        public int ProductID { get; set; }

        [Required, DisplayName("Size")]
        public int SizeID { get; set; }

        [DisplayName("Số lượng tồn")]
        [Required(ErrorMessage = "Số lượng tồn không được để trống")]
        public int AmountStock { get; set; }

        [DisplayName("Giá sản phẩm")]
        [Required(ErrorMessage = "Giá sản phẩm không được để trống")]
        public int Price { get; set; }
    }

    public class ProductItemGetAndUpdate
    {
        public int ProductItemID { get; set; }

        [DisplayName("Tên sản phẩm")]
        [Required(ErrorMessage = "Tên sản phẩm không được để trống")]
        public int ProductID { get; set; }

        [Required, DisplayName("Size")]
        public int SizeID { get; set; }

        [DisplayName("Số lượng tồn")]
        [Required(ErrorMessage = "Số lượng tồn không được để trống")]
        public int AmountStock { get; set; }

        [DisplayName("Giá sản phẩm")]
        [Required(ErrorMessage = "Giá sản phẩm không được để trống")]
        public int Price { get; set; }
    }
}
