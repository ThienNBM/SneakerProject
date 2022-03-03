using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SneakerInside.Models
{
    public class Order
    {
        public int OrderID { get; set; }

        public DateTime DateCreate { get; set; }

        public string FullName { get; set; }

        public string Phone { get; set; }

        public string Address { get; set; }

        public string Note { get; set; }

        public int Status { get; set; }

        public double Total { get; set; }
    }

    public class OrderGetOrderDetailById
    {
        public string Image { get; set; }

        public string ProductName { get; set; }

        public string SizeName { get; set; }

        public int? PriceBuy { get; set; }

        public int AmountBuy { get; set; }

        public int Total { get; set; }
    }
}
