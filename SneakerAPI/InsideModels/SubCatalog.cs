using Microsoft.EntityFrameworkCore;

namespace SneakerAPI.InsideModels
{
    [Keyless]
    public class SubCatalogGetAll
    {
        public int SubCatalogID { get; set; }

        public string SubCatalogName { get; set; }

        public int Status { get; set; }

        public string CatalogName { get; set; }
    }

    [Keyless]
    public class SubCatalogInsert
    {
        public string SubCatalogName { get; set; }

        public int Status { get; set; }

        public int CatalogID { get; set; }
    }

    [Keyless]
    public class SubCatalogGetAndUpdate
    {
        public int SubCatalogID { get; set; }

        public string SubCatalogName { get; set; }

        public int Status { get; set; }

        public int CatalogID { get; set; }
    }
}