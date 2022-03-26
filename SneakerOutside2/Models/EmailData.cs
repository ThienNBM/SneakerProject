using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SneakerOutside2.Models
{
    public class EmailRegister
    {
        public string EmailToId { get; set; }

        public string EmailToName { get; set; }

        public string EmailToPhone { get; set; }
    }
    
    public class EmailCheckout
    {
        public string EmailToId { get; set; }

        public string EmailToName { get; set; }
    }
}
