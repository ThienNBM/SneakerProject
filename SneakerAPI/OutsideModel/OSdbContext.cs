using Microsoft.EntityFrameworkCore;

namespace SneakerAPI.OutsideModel
{
    public class OSdbContext : DbContext
    {
        public OSdbContext()
        {

        }

        public OSdbContext(DbContextOptions<OSdbContext> options) : base(options)
        {

        }

        public DbSet<ProductGetAll> ProductGetAll { get; set; }
        public DbSet<ProductGetInfo> ProductGetInfo { get; set; }
        public DbSet<ProductGetSize> ProductGetSize { get; set; }
        public DbSet<ProductGetImage> ProductGetImage { get; set; }

        public DbSet<CartProductInfo> CartProductInfo { get; set; }
    }
}
