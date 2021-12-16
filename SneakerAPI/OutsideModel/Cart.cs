using Microsoft.EntityFrameworkCore;

namespace SneakerAPI.OutsideModel
{
    [Keyless]
    public class CartProductInfo
    {
        public int ProductItemID { get; set; }

        public string Image { get; set; }

        public int ProductID { get; set; }

        public string ProductName { get; set; }

        public int SizeID { get; set; }

        public string SizeName { get; set; }

        public int Price { get; set; }

        public int AmountStock { get; set; }
    }
}
