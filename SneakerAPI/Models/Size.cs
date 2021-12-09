using Microsoft.EntityFrameworkCore;

namespace SneakerAPI.Models
{
    [Keyless]
    public class SizeGetAll
    {
        public int SizeID { get; set; }

        public string SizeName { get; set; }
    }

    [Keyless]
    public class SizeInsert
    {
        public string SizeName { get; set; }
    }

    [Keyless]
    public class SizeGetAndUpdate
    {
        public int SizeID { get; set; }

        public string SizeName { get; set; }
    }
}