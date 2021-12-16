using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SneakerOutside2.Models
{
    public class ProductGetAll
    {
        public int ProductID { get; set; }

        public string ProductName { get; set; }

        public int Price { get; set; }

        public string Image { get; set; }
    }

    public class ProductGetInfo
    {
        public int ProductID { get; set; }

        public string ProductName { get; set; }

        public string Description { get; set; }

        public int Price { get; set; }
    }

    public class ProductGetSize
    { 
        public int SizeID { get; set; }

        public string SizeName { get; set; }
    }

    public class ProductGetImage
    {
        public string Image { get; set; }
    }
}
