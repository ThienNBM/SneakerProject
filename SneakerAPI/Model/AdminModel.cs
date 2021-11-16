using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Threading.Tasks;

namespace SneakerAPI.Model
{
    [DataContract]
    public class AdminModel
    {
        [DataMember(Name = "AdminID")]
        public int AdminID { get; set; }

        [DataMember(Name = "Account")]
        public string Account { get; set; }

        [DataMember(Name = "Password")]
        public string Password { get; set; }

        [DataMember(Name = "Name")]
        public string Name { get; set; }

        [DataMember(Name = "Role")]
        public int Role { get; set; }
    }
}
