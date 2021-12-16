using Microsoft.EntityFrameworkCore;

namespace SneakerAPI.InsideModels
{
    [Keyless]
    public class ProductItemGetAll
    {
        public int ProductItemID { get; set; }

        public string ProductName { get; set; }

        public string SizeName { get; set; }

        public int AmountStock { get; set; }
    }

    [Keyless]
    public class ProductItemInsert
    {
        public int ProductID { get; set; }

        public int SizeID { get; set; }

        public int AmountStock { get; set; }
    }

    [Keyless]
    public class ProductItemGetAndUpdate
    {
        public int ProductItemID { get; set; }

        public int ProductID { get; set; }

        public int SizeID { get; set; }

        public int AmountStock { get; set; }
    }
}
