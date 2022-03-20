using Microsoft.EntityFrameworkCore;

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
}
