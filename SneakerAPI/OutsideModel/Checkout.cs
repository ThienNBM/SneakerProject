using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SneakerAPI.OutsideModel
{
    public class CheckOutAction
    {
        public UserInfo UserInfo { get; set; }
        public OrderInfo OrderInfo { get; set; }
        public List<OrderDetailInfo> OrderDetailInfo { get; set; }
    }

    public class UserInfo
    {
        public string FullName { get; set; }

        public string Phone { get; set; }

        public string Email { get; set; }

        public string Address { get; set; }
    }

    public class OrderInfo
    {
        public string Note { get; set; }
    }

    public class OrderDetailInfo
    {
        public int ProductItemID { get; set; }

        public int PriceBuy { get; set; }

        public int AmountBuy { get; set; }
    }
}
