using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace SneakerAPI.Models
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
    public class SubCatalogGetByID
    {
        public int SubCatalogID { get; set; }

        public string SubCatalogName { get; set; }

        public int Status { get; set; }

        public int CatalogID { get; set; }
    }

    [Keyless]
    public class SubCatalogInsertAndUpdate
    {
        public string SubCatalogName { get; set; }

        public int Status { get; set; }

        public int CatalogID { get; set; }
    }
}