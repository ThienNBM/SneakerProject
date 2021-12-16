using Microsoft.EntityFrameworkCore;

namespace SneakerAPI.OutsideModel
{
    [Keyless]
    public class ProductGetAll
    {
        public int ProductID { get; set; }

        public string ProductName { get; set; }

        public int Price { get; set; }

        public string Image { get; set; }
    }

    [Keyless]
    public class ProductGetInfo
    {
        public int ProductID { get; set; }

        public string ProductName { get; set; }

        public string Description { get; set; }

        public int Price { get; set; }
    }

    [Keyless]
    public class ProductGetSize
    {
        public int SizeID { get; set; }

        public string SizeName { get; set; }
    }

    [Keyless]
    public class ProductGetImage
    { 
        public string Image { get; set; }
    }
}
