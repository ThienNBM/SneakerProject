using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Threading.Tasks;

namespace SneakerInside.Models
{
    public class OrderDetailGetAll
    {
        [DisplayName("Ảnh")]
        public string Image { get; set; }

        [DisplayName("Tên sản phẩm")]
        public string ProductName { get; set; }

        [DisplayName("Size")]
        public string SizeName { get; set; }

        [DisplayName("Giá mua")]
        public int? PriceBuy { get; set; }

        [DisplayName("Số lượng mua")]
        public int AmountBuy { get; set; }

        [DisplayName("Tổng")]
        public int Total { get; set; }
    }
}
