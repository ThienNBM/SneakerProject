using Microsoft.EntityFrameworkCore;
using System;

namespace SneakerAPI.Models
{
    [Keyless]
    public class OrderGetAll
    {
        public string FullName { get; set; }

        public string PhoneNumber { get; set; }

        public string Email { get; set; }

        public string Address { get; set; }

        public string ProvinceName { get; set; }

        public string DistrictName { get; set; }

        public int OrderID { get; set; }

        public DateTime DateCreate { get; set; }

        public int Status { get; set; }

        public string Note { get; set; }

        public double TotalMoney { get; set; }
    }
}
