using Microsoft.EntityFrameworkCore;

namespace SneakerAPI.InsideModels
{
    [Keyless]
    public class CatalogGetAll
    {
        public int CatalogID { get; set; }

        public string CatalogName { get; set; }

        public int Status { get; set; }
    }

    [Keyless]
    public class CatalogGetById
    {
        public int CatalogID { get; set; }

        public string CatalogName { get; set; }

        public int Status { get; set; }
    }

    [Keyless]
    public class CatalogInsert
    {
        public string CatalogName { get; set; }

        public int Status { get; set; }
    }

    [Keyless]
    public class CatalogUpdate
    {
        public int CatalogID { get; set; }

        public string CatalogName { get; set; }

        public int Status { get; set; }
    }
}
