using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace SneakerInside.Models
{
    public class ChartCountOrderStatus
    {
        public int WaitConfirm { get; set; }

        public int Shipping { get; set; }

        public int Complete { get; set; }

        public int Destroy { get; set; }
    }

    public class ChartCountCatalogProduct
    {
        public string CatalogName { get; set; }

        public int TotalProduct { get; set; }
    }

    public class TopSellProduct
    {
        public string ProductName { get; set; }

        public int TotalBuy { get; set; }
    }
}
