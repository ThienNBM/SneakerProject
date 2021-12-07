using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace SneakerInside.Models
{
    public class SubCatalogGetAll
    {
        [DisplayName("ID")]
        public int SubCatalogID { get; set; }

        [DisplayName("Tên loại giày")]
        public string SubCatalogName { get; set; }

        [DisplayName("Trạng thái")]
        public int Status { get; set; }

        [DisplayName("Hãng giày")]
        public string CatalogName { get; set; }
    }

    public class SubCatalogInsert
    {
        [Required, DisplayName("Tên loại giày")]
        public string SubCatalogName { get; set; }

        [Required, DisplayName("Trạng thái")]
        public int Status { get; set; }

        [Required, DisplayName("Hãng giày")]
        public int CatalogID { get; set; }
    }

    public class SubCatalogGetAndUpdate
    {
        public int SubCatalogID { get; set; }

        [Required, DisplayName("Tên loại giày")]
        public string SubCatalogName { get; set; }

        [Required, DisplayName("Trạng thái")]
        public int Status { get; set; }

        [Required, DisplayName("Hãng giày")]
        public int CatalogID { get; set; }
    }
}
