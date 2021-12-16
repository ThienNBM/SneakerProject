using Microsoft.EntityFrameworkCore;

namespace SneakerAPI.InsideModels
{
    [Keyless]
    public class ProductGetAll
    {
        public int ProductID { get; set; }

        public string ProductName { get; set; }

        public int Price { get; set; }

        public int Status { get; set; }

        public string CatalogName { get; set; }

        public string SubCatalogName { get; set; }
    }

    [Keyless]
    public class ProductInsert
    {
        public string ProductName { get; set; }

        public string Description { get; set; }

        public int Price { get; set; }

        public int Status { get; set; }

        public int CatalogID { get; set; }

        public int SubCatalogID { get; set; }
    }

    [Keyless]
    public class ProductGetAndUpdate
    {
        public int ProductID { get; set; }

        public string ProductName { get; set; }

        public string Description { get; set; }

        public int Price { get; set; }

        public int Status { get; set; }

        public int CatalogID { get; set; }

        public int SubCatalogID { get; set; }
    }
}