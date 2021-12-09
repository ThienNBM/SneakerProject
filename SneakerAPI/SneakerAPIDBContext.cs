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
        public DbSet<SneakerAPI.Models.CatalogGetAll> CatalogGetAll { get; set; }
        public DbSet<SneakerAPI.Models.CatalogGetById> CatalogGetById { get; set; }
        public DbSet<SneakerAPI.Models.CatalogInsert> CatalogInsert { get; set; }
        public DbSet<SneakerAPI.Models.CatalogUpdate> CatalogUpdate { get; set; }

        public DbSet<SneakerAPI.Models.SubCatalogGetAll> SubCatalogGetAll { get; set; }
        public DbSet<SneakerAPI.Models.SubCatalogInsert> SubCatalogInsert { get; set; }
        public DbSet<SneakerAPI.Models.SubCatalogGetAndUpdate> SubCatalogGetAndUpdate { get; set; }

        public DbSet<SneakerAPI.Models.ProductGetAll> ProductGetAll { get; set; }
        public DbSet<SneakerAPI.Models.ProductInsert> ProductInsert { get; set; }
        public DbSet<SneakerAPI.Models.ProductGetAndUpdate> ProductGetAndUpdate { get; set; }

        public DbSet<SneakerAPI.Models.ImageProductGetAll> ImageProductGetAll { get; set; }
        public DbSet<SneakerAPI.Models.ImageProductGetAndUpdate> ImageProductGetAndUpdate { get; set; }

        public DbSet<SneakerAPI.Models.SizeGetAll> SizeGetAll { get; set; }
        public DbSet<SneakerAPI.Models.SizeGetAndUpdate> SizeGetAndUpdate { get; set; }

        public DbSet<SneakerAPI.Models.ProductItemGetAll> ProductItemGetAll { get; set; }
        public DbSet<SneakerAPI.Models.ProductItemGetAndUpdate> ProductItemGetAndUpdate { get; set; }

        public DbSet<SneakerAPI.Models.OrderGetAll> OrderGetAll { get; set; }

        public DbSet<SneakerAPI.Models.OrderDetailGetAll> OrderDetailGetAll { get; set; }

    }
}