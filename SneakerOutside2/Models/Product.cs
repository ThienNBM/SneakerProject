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

        public int MinPrice { get; set; }

        public int TotalStock { get; set; }

        public string Image { get; set; }
    }

    public class ProductGetAllCatalog
    {
        public int CatalogID { get; set; }

        public string CatalogName { get; set; }
    }
    
    public class ProductGetAllSubCatalog
    {
        public int SubCatalogID { get; set; }

        public string SubCatalogName { get; set; }
    }

    public class ProductFilterProduct
    { 
        public int CatalogID { get; set; }
    }

    public class ProductGetInfo
    {
        public int ProductID { get; set; }

        public string ProductName { get; set; }

        public string Description { get; set; }
    }

    public class ProductGetSize
    { 
        public int SizeID { get; set; }

        public string SizeName { get; set; }

        public int Price { get; set; }
    }

    public class ProductGetImage
    {
        public string Image { get; set; }
    }

    public class ProductGetProductItem
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
