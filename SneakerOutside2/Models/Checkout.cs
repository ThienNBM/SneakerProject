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
        public UserInfo UserInfo { get; set; }
        public OrderInfo OrderInfo { get; set; }
        public List<CartItem> CartList { get; set; }
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
        [Required(ErrorMessage = "Họ và tên không được để trống")]
        public string FullName { get; set; }

        [DisplayName("Số điện thoại")]
        [Required(ErrorMessage = "Số điện thoại không được để trống")]
        [StringLength(10, ErrorMessage = "Số điện thoại phải đủ 10 ký tự.", MinimumLength = 10)]
        public string Phone { get; set; }

        [DisplayName("Email")]
        [Required(ErrorMessage = "Email không được để trống")]
        [EmailAddress(ErrorMessage = "Email không đúng định dạng")]
        public string Email { get; set; }

        [DisplayName("Địa chỉ")]
        [Required(ErrorMessage = "Địa chỉ không được để trống")]
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

        public int Total { get; set; }
    }
}
