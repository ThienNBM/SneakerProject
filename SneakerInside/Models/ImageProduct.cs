using Microsoft.AspNetCore.Http;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SneakerInside.Models
{
    public class ImageProductGetAll
    {
        [DisplayName("ID")]
        public int ImageID { get; set; }

        [DisplayName("Ảnh")]
        public string Image { get; set; }

        [DisplayName("Tên sản phẩm")]
        public string ProductName { get; set; }
    }

    public class ImageProductInsert
    {
        public string Image { get; set; }

        [Required, DisplayName("Ảnh")]
        public IFormFile ImageFile { get; set; }

        [Required, DisplayName("Tên sản phẩm")]
        public int ProductID { get; set; }
    }

    public class ImageProductGetAndUpdate
    {
        public int ImageID { get; set; }

        public string Image { get; set; }

        [DisplayName("Ảnh")]
        public IFormFile ImageFile { get; set; }

        [Required, DisplayName("Tên sản phẩm")]
        public int ProductID { get; set; }
    }
}
