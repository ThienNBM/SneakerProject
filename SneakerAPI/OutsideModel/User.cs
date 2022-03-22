using Microsoft.EntityFrameworkCore;
using System;

namespace SneakerAPI.OutsideModel
{
    [Keyless]
    public class Login
    {
        public string Email { get; set; }
    }

    [Keyless]
    public class Register
    {
        public string FullName { get; set; }

        public string Phone { get; set; }

        public string Email { get; set; }

        public string Password { get; set; }
    }

    [Keyless]
    public class UserMember
    {
        public int UserID { get; set; }

        public string Email { get; set; }

        public string Password { get; set; }

        public string FullName { get; set; }

        public string Phone { get; set; }

        public string Address { get; set; }
    }

    [Keyless]
    public class ChangeInfo
    {
        public int UserID { get; set; }

        public string FullName { get; set; }

        public string Phone { get; set; }

        public string Address { get; set; }
    }

    [Keyless]
    public class ChangePass
    {
        public int UserID { get; set; }

        public string NewPassword { get; set; }
    }

    [Keyless]
    public class UserGetOrderById
    {
        public int OrderID { get; set; }

        public DateTime DateCreate { get; set; }

        public string Note { get; set; }

        public int Status { get; set; }

        public int Total { get; set; }
    }

    [Keyless]
    public class UserGetOrderDetailById
    {
        public string Image { get; set; }

        public string ProductName { get; set; }

        public string SizeName { get; set; }

        public int PriceBuy { get; set; }

        public int AmountBuy { get; set; }

        public int Total { get; set; }
    }

    [Keyless]
    public class UserDestroyOrder
    {
        public int OrderID { get; set; }
    }
}
