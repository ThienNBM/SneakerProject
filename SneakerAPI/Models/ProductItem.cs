using Microsoft.EntityFrameworkCore;

namespace SneakerAPI.Models
{
    [Keyless]
    public class ProductItemGetAll
    {
        public int ProductItemID { get; set; }

        public string ProductName { get; set; }

        public string Image { get; set; }

        public string SizeName { get; set; }

        public int AmountStock { get; set; }

        public int Status { get; set; }
    }

    [Keyless]
    public class ProductItemGetById
    { 
        public int ProductItemID { get; set; }

        public int ProductID { get; set; }

        public int SizeID { get; set; }

        public int AmountStock { get; set; }

        public int Status { get; set; }
    }

    [Keyless]
    public class ProductItemInsert
    {
        public int ProductID { get; set; }

        public int SizeID { get; set; }

        public int AmountStock { get; set; }

        public int Status { get; set; }
    }

    [Keyless]
    public class ProductItemUpdate
    {
        public int ProductItemID { get; set; }

        public int ProductID { get; set; }

        public int SizeID { get; set; }

        public int AmountStock { get; set; }

        public int Status { get; set; }
    }
}
