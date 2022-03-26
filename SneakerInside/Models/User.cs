using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Threading.Tasks;

namespace SneakerInside.Models
{
    public class UserGetAll
    {
        public int UserID { get; set; }

        [DisplayName("Họ tên")]
        public string FullName { get; set; }

        [DisplayName("Số điện thoại")]
        public string Phone { get; set; }

        [DisplayName("Email")]
        public string Email { get; set; }

        [DisplayName("Địa chỉ")]
        public string Address { get; set; }
    }

    public class UserGetOrderById
    {
        public int OrderID { get; set; }

        [DisplayName("Mã đơn hàng")]
        public string OrderCode { get; set; }

        [DisplayName("Ngày tạo")]
        public string DateCreate { get; set; }

        [DisplayName("Ghi chú")]
        public string Note { get; set; }

        [DisplayName("Trạng thái")]
        public int Status { get; set; }

        [DisplayName("Tổng hóa đơn")]
        public double Total { get; set; }
    }
}
