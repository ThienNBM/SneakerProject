using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using SneakerAPI.OutsideModel;

namespace SneakerAPI.InsideModels
{
    public class ISdbContext : DbContext
    {
        public ISdbContext()
        {

        }

        public ISdbContext(DbContextOptions<ISdbContext> options) : base(options)
        {

        }
        public DbSet<CatalogGetAll> CatalogGetAll { get; set; }
        public DbSet<CatalogGetById> CatalogGetById { get; set; }
        public DbSet<CatalogInsert> CatalogInsert { get; set; }
        public DbSet<CatalogUpdate> CatalogUpdate { get; set; }

        public DbSet<SubCatalogGetAll> SubCatalogGetAll { get; set; }
        public DbSet<SubCatalogInsert> SubCatalogInsert { get; set; }
        public DbSet<SubCatalogGetAndUpdate> SubCatalogGetAndUpdate { get; set; }

        public DbSet<ProductGetAll> ProductGetAll { get; set; }
        public DbSet<ProductInsert> ProductInsert { get; set; }
        public DbSet<ProductGetAndUpdate> ProductGetAndUpdate { get; set; }

        public DbSet<ImageProductGetAll> ImageProductGetAll { get; set; }
        public DbSet<ImageProductGetAndUpdate> ImageProductGetAndUpdate { get; set; }

        public DbSet<SizeGetAll> SizeGetAll { get; set; }
        public DbSet<SizeGetAndUpdate> SizeGetAndUpdate { get; set; }

        public DbSet<ProductItemGetAll> ProductItemGetAll { get; set; }
        public DbSet<ProductItemGetAndUpdate> ProductItemGetAndUpdate { get; set; }

        public DbSet<UserGetAll> UserGetAll { get; set; }
        public DbSet<UserGetOrderById> UserGetOrderById { get; set; }

        public DbSet<OrderGetAll> OrderGetAll { get; set; }
        public DbSet<OrderGetOrderDetailById> OrderGetOrderDetailById { get; set; }

        public DbSet<ChartCountOrderStatus> ChartCountOrderStatus { get; set; }
        public DbSet<ChartCountCatalogProduct> ChartCountCatalogProduct { get; set; }
        public DbSet<TopSellProduct> TopSellProduct { get; set; }

        public DbSet<ReportAmountStock> ReportAmountStock { get; set; }
        public DbSet<ReportOrder> ReportOrder { get; set; }
    }
}