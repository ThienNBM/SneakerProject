using Microsoft.EntityFrameworkCore;
using System;

namespace SneakerAPI.InsideModels
{
    [Keyless]
    public class OrderGetAll
    {
        public int OrderID { get; set; }

        public DateTime DateCreate { get; set; }

        public string FullName { get; set; }

        public string Phone { get; set; }

        public string Address { get; set; }

        public string Note { get; set; }

        public int Status { get; set; }

        public int Total { get; set; }
    }

    [Keyless]
    public class OrderGetByUserId
    {
        public int OrderID { get; set; }

        public DateTime DateCreate { get; set; }

        public string FullName { get; set; }

        public string Phone { get; set; }

        public string Address { get; set; }

        public string Note { get; set; }

        public int Status { get; set; }

        public int Total { get; set; }
    }
}
