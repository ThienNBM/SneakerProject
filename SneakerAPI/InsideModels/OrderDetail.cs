using Microsoft.EntityFrameworkCore;

namespace SneakerAPI.InsideModels
{
    [Keyless]
    public class OrderDetailGetAll
    {
        public string Image { get; set; }

        public string ProductName { get; set; }

        public string SizeName { get; set; }

        public int? PriceBuy { get; set; }

        public int AmountBuy { get; set; }

        public int Total { get; set; }
    }
}