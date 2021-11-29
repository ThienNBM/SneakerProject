using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace SneakerAPI.Models
{
    public class Catalog
    {
        [Key]
        public int CatalogID { get; set; }

        public string CatalogName { get; set; }

        public int Status { get; set; }
    }
}
