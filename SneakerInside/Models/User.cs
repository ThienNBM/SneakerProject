using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Threading.Tasks;

namespace SneakerInside.Models
{
    public class UserGetAll
    {
        [DisplayName("ID")]
        public int UserID { get; set; }

        [DisplayName("Email")]
        public string Email { get; set; }

        [DisplayName("Họ tên")]
        public string FullName { get; set; }

        [DisplayName("Số điện thoại")]
        public string Phone { get; set; }

        [DisplayName("Địa chỉ")]
        public string Address { get; set; }
    }
}
