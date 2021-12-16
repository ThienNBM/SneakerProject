using Microsoft.EntityFrameworkCore;

namespace SneakerAPI.InsideModels
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