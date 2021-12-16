using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SneakerOutside2.Models
{
    //Thông tin sản phẩm trong giỏ hàng
    public class CartProductInfo
    {
        public int ProductItemID { get; set; }

        public string Image { get; set; }

        public int ProductID { get; set; }

        public string ProductName { get; set; }

        public int SizeID { get; set; }

        public string SizeName { get; set; }

        public int Price { get; set; }

        public int AmountStock { get; set; }
    }


    public class CartItem
    {
        public int ProductItemID { get; set; }

        public string Image { get; set; }

        public int ProductID { get; set; }

        public string ProductName { get; set; }

        public int SizeID { get; set; }

        public string SizeName { get; set; }

        public int Price { get; set; }

        public int AmountStock { get; set; }

        public int AmountBuy { get; set; }
    }
}
