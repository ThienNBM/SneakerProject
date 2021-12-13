using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SneakerInside.Models
{
    public class ListCatalog
    {
        public int CatalogID { get; set; }

        public string CatalogName { get; set; }
    }

    public class ListSubCatalog
    {
        public int SubCatalogID { get; set; }

        public string SubCatalogName { get; set; }
    }

    public class ListProduct
    {
        public int ProductID { get; set; }

        public string ProductName { get; set; }
    }
    
    public class ListSize
    {
        public int SizeID { get; set; }

        public string SizeName { get; set; }
    }
}