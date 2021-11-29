using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SneakerAPI.Models
{
    [Keyless]
    public class ProductGetAll
    {
        public int ProductID { get; set; }

        public string ProductName { get; set;}

        public decimal Price { get; set; }

        public int Status { get; set; }

        public string CatalogName { get; set; }

        public string SubCatalogName { get; set; }
    }

    [Keyless]
    public class ProductGetById
    {
        public int ProductID { get; set; }

        public string ProductName { get; set; }

        public string Description { get; set; }

        public decimal Price { get; set; }

        public int Status { get; set; }

        public int CatalogID { get; set; }

        public int SubCatalogID { get; set; }
    }

    [Keyless]
    public class ProductInsert
    {
        public string ProductName { get; set; }

        public string Description { get; set; }

        public decimal Price { get; set; }

        public int Status { get; set; }

        public int CatalogID { get; set; }

        public int SubCatalogID { get; set; }
    }

    [Keyless]
    public class ProductUpdate
    {
        public string ProductName { get; set; }

        public string Description { get; set; }

        public decimal Price { get; set; }

        public int Status { get; set; }

        public int CatalogID { get; set; }

        public int SubCatalogID { get; set; }
    }
}
