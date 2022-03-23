using Microsoft.EntityFrameworkCore;
using System;

namespace SneakerAPI.InsideModels
{
    [Keyless]
    public class OrderGetAll
    {
        public int OrderID { get; set; }

        public string DateCreate { get; set; }

        public string FullName { get; set; }

        public string Phone { get; set; }

        public string Address { get; set; }

        public string Note { get; set; }

        public int Status { get; set; }

        public int Total { get; set; }
    }

    [Keyless]
    public class OrderGetOrderDetailById
    {
        public string Image { get; set; }

        public string ProductName { get; set; }

        public string SizeName { get; set; }

        public int? PriceBuy { get; set; }

        public int AmountBuy { get; set; }

        public int Total { get; set; }
    }

    [Keyless]
    public class OrderChangeStatus
    {
        public int OrderID { get; set; }

        public int Status { get; set; }
    }

    [Keyless]
    public class OrderDestroy
    {
        public int OrderID { get; set; }
    }
}
