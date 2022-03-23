using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace SneakerOutside2.Models
{
    public class LoginRegister
    {
        public Login Login { get; set; }

        public Register Register { get; set; }
    }

    public class Login
    {
        [DisplayName("Tài khoản")]
        [Required(ErrorMessage = "Tài khoản không được để trống")]
        public string Email { get; set; }

        [DisplayName("Mật khẩu")]
        [Required(ErrorMessage = "Mật khẩu không được để trống")]
        public string Password { get; set; }
    }

    public class UserMember
    {
        public int UserID { get; set; }

        public string Email { get; set; }

        public string Password { get; set; }

        public string FullName { get; set; }

        public string Phone { get; set; }

        public string Address { get; set; }
    }

    public class Register
    {
        [DisplayName("Họ và tên")]
        [Required(ErrorMessage = "Họ và tên không được để trống")]
        public string FullName { get; set; }

        [DisplayName("Số điện thoại")]
        [Required(ErrorMessage = "Số điện thoại không được để trống")]
        public string Phone { get; set; }

        [DisplayName("Email")]
        [Required(ErrorMessage = "Email không được để trống")]
        public string Email { get; set; }

        [DisplayName("Mật khẩu")]
        [Required(ErrorMessage = "Mật khẩu không được để trống")]
        public string Password { get; set; }

        [DisplayName("Nhập lại mật khẩu")]
        [Required(ErrorMessage = "Nhập lại mật khẩu không được để trống")]
        public string RePassword { get; set; }
    }

    public class ChangeInfoAndPass
    {
        public ChangeInfo ChangeInfo { get; set; }

        public ChangePass ChangePass { get; set; }
    }

    public class ChangeInfo
    {
        public int UserID { get; set; }

        [DisplayName("Họ và tên")]
        [Required(ErrorMessage = "Họ và tên không được để trống")]
        public string FullName { get; set; }

        [DisplayName("Số điện thoại")]
        [Required(ErrorMessage = "Số điện thoại không được để trống")]
        public string Phone { get; set; }

        [DisplayName("Email")]
        [Required(ErrorMessage = "Email không được để trống")]
        public string Email { get; set; }

        [DisplayName("Địa chỉ")]
        [Required(ErrorMessage = "Địa chỉ không được để trống")]
        public string Address { get; set; }
    }

    public class ChangePass
    {
        public int UserID { get; set; }

        [DisplayName("Mật khẩu cũ")]
        [Required(ErrorMessage = "Mật khẩu cũ không được để trống")]
        public string OldPassword { get; set; }

        [DisplayName("Mật khẩu mới")]
        [Required(ErrorMessage = "Mật khẩu mới không được để trống")]
        public string NewPassword { get; set; }

        [DisplayName("Nhập lại mật khẩu")]
        [Required(ErrorMessage = "Nhập lại mật khẩu không được để trống")]
        public string RePassword { get; set; }
    }

    public class UserGetOrderById
    {
        public int OrderID { get; set; }

        [DisplayName("Ngày tạo")]
        public string DateCreate { get; set; }

        [DisplayName("Ghi chú")]
        public string Note { get; set; }

        [DisplayName("Trạng thái")]
        public int Status { get; set; }

        [DisplayName("Tổng hóa đơn")]
        public double Total { get; set; }
    }

    public class UserGetOrderDetailById
    {
        public string Image { get; set; }

        public string ProductName { get; set; }

        public string SizeName { get; set; }

        public int PriceBuy { get; set; }

        public int AmountBuy { get; set; }

        public int Total { get; set; }
    }

    public class UserDestroyOrder
    {
        public int OrderID { get; set; }
    }
}
