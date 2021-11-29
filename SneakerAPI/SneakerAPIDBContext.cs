using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using SneakerAPI.Models;

namespace SneakerAPI
{
    public class SneakerAPIDBContext : DbContext
    {
        public SneakerAPIDBContext() { 
        
        }

        public SneakerAPIDBContext(DbContextOptions<SneakerAPIDBContext> options) : base(options) { 
        
        }

        public DbSet<SneakerAPI.Models.Catalog> Catalog { get; set; }

        public DbSet<SneakerAPI.Models.SubCatalogGetAll> SubCatalogGetAll { get; set; }
        public DbSet<SneakerAPI.Models.SubCatalogGetByID> SubCatalogGetByID { get; set; }
        public DbSet<SneakerAPI.Models.SubCatalogInsertAndUpdate> SubCatalogInsertAndUpdate { get; set; }

        public DbSet<SneakerAPI.Models.ImageProductGetAll> ImageProductGetAll { get; set; }
        public DbSet<SneakerAPI.Models.ImageProductGetByID> ImageProductGetByID { get; set; }
        public DbSet<SneakerAPI.Models.ImageProductInsert> ImageProductInsert { get; set; }
        public DbSet<SneakerAPI.Models.ImageProductUpdate> ImageProductUpdate { get; set; }

        public DbSet<SneakerAPI.Models.ProductGetAll> ProductGetAll { get; set; }
        public DbSet<SneakerAPI.Models.ProductGetById> ProductGetById { get; set; }
        public DbSet<SneakerAPI.Models.ProductInsert> ProductInsert { get; set; }
        public DbSet<SneakerAPI.Models.ProductUpdate> ProductUpdate { get; set; }

        public DbSet<SneakerAPI.Models.SizeGetAll> SizeGetAll { get; set; }
        public DbSet<SneakerAPI.Models.SizeGetById> SizeGetById { get; set; }
        public DbSet<SneakerAPI.Models.SizeInsert> SizeInsert { get; set; }
        public DbSet<SneakerAPI.Models.SizeUpdate> SizeUpdate { get; set; }

        public DbSet<SneakerAPI.Models.ProductItemGetAll> ProductItemGetAll { get; set; }
        public DbSet<SneakerAPI.Models.ProductItemGetById> ProductItemGetById { get; set; }
        public DbSet<SneakerAPI.Models.ProductItemInsert> ProductItemInsert { get; set; }
        public DbSet<SneakerAPI.Models.ProductItemUpdate> ProductItemUpdate { get; set; }

        public DbSet<SneakerAPI.Models.OrderGetAll> OrderGetAll { get; set; }

        public DbSet<SneakerAPI.Models.OrderDetailGetAll> OrderDetailGetAll { get; set; }

    }
}