using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace SneakerInside.Models
{
    public class ProductGetAll
    {
        [DisplayName("ID")]
        public int ProductID { get; set; }

        [DisplayName("Tên sản phẩm")]
        public string ProductName { get; set; }

        [DisplayName("Giá")]
        public int Price { get; set; }

        [DisplayName("Trạng thái")]
        public int Status { get; set; }

        [DisplayName("Tên hãng giày")]
        public string CatalogName { get; set; }

        [DisplayName("Tên loại giày")]
        public string SubCatalogName { get; set; }
    }

    public class ProductInsert
    {
        [Required, DisplayName("Tên sản phẩm")]
        public string ProductName { get; set; }

        [DisplayName("Mô tả")]
        public string Description { get; set; }

        [Required, DisplayName("Giá")]
        public int Price { get; set; }

        [Required, DisplayName("Trạng thái")]
        public int Status { get; set; }

        [Required, DisplayName("Tên hãng giày")]
        public int CatalogID { get; set; }

        [Required, DisplayName("Tên loại giày")]
        public int SubCatalogID { get; set; }
    }

    public class ProductGetAndUpdate
    {
        public int ProductID { get; set; }

        [Required, DisplayName("Tên sản phẩm")]
        public string ProductName { get; set; }

        [DisplayName("Mô tả")]
        public string Description { get; set; }

        [Required, DisplayName("Giá")]
        public int Price { get; set; }

        [Required, DisplayName("Trạng thái")]
        public int Status { get; set; }

        [Required, DisplayName("Tên hãng giày")]
        public int CatalogID { get; set; }

        [Required, DisplayName("Tên loại giày")]
        public int SubCatalogID { get; set; }
    }
}
