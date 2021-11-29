using Microsoft.EntityFrameworkCore;

namespace SneakerAPI.Models
{
    [Keyless]
    public class SizeGetAll
    {
        public int SizeID { get; set; }

        public string SizeName { get; set; }

        public int Status { get; set; }
    }

    [Keyless]
    public class SizeGetById
    {
        public int SizeID { get; set; }

        public string SizeName { get; set; }

        public int Status { get; set; }
    }

    [Keyless]
    public class SizeInsert
    {
        public string SizeName { get; set; }

        public int Status { get; set; }
    }

    [Keyless]
    public class SizeUpdate
    {
        public string SizeName { get; set; }

        public int Status { get; set; }
    }
}