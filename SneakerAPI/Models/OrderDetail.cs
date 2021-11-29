using Microsoft.EntityFrameworkCore;

namespace SneakerAPI.Models
{
    [Keyless]
    public class OrderDetailGetAll
    {
        public string FullName { get; set; }

        public string ProductName { get; set; }

        public string SizeName { get; set; }

        public string Image { get; set; }

        public decimal Price { get; set; }

        public int AmountBuy { get; set; }

        public double Total { get; set; }
    }
}