using Microsoft.EntityFrameworkCore;

namespace SneakerAPI.InsideModels
{
    [Keyless]
    public class ChartCountOrderStatus
    { 
        public int WaitConfirm { get; set; }

        public int Shipping { get; set; }

        public int Complete { get; set; }

        public int Destroy { get; set; }
    }

    [Keyless]
    public class ChartCountCatalogProduct
    {
        public string CatalogName { get; set; }

        public int TotalProduct { get; set; }
    }

    [Keyless]
    public class TopSellProduct
    {
        public string ProductName { get; set; }

        public int TotalBuy { get; set; }
    }
}
