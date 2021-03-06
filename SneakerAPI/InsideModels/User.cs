using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SneakerAPI.InsideModels
{
    [Keyless]
    public class UserGetAll
    {
        public int UserID { get; set; }

        public string Email { get; set; }

        public string FullName { get; set; }

        public string Phone { get; set; }

        public string Address { get; set; }
    }

    [Keyless]
    public class UserGetOrderById
    {
        public int OrderID { get; set; }

        public string OrderCode { get; set; }

        public string DateCreate { get; set; }

        public string Note { get; set; }

        public int Status { get; set; }

        public int Total { get; set; }
    }
}
