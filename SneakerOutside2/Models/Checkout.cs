using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SneakerOutside2.Models
{
    public class CheckOutView
    {
        public List<CartItem> CartList { get; set; }
        public UserInfo UserInfo { get; set; }
        public OrderInfo OrderInfo { get; set; }
    }

    public class CheckOutAction
    {
        public UserInfo UserInfo { get; set; }
        public OrderInfo OrderInfo { get; set; }
        public List<OrderDetailInfo> OrderDetailInfo { get; set; }
    }

    public class UserInfo
    {
        [DisplayName("Họ và tên")]
        [Required]
        public string FullName { get; set; }

        [DisplayName("Số điện thoại")]
        [Required]
        public string Phone { get; set; }

        [DisplayName("Email")]
        [Required]
        public string Email { get; set; }

        [DisplayName("Địa chỉ")]
        [Required]
        public string Address { get; set; }
    }

    public class OrderInfo
    {
        [DisplayName("Ghi chú")]
        public string Note { get; set; }
    }

    public class OrderDetailInfo
    {
        public int ProductItemID { get; set; }

        public int PriceBuy { get; set; }

        public int AmountBuy { get; set; }
    }
}
