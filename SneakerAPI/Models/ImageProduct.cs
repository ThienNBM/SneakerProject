using Microsoft.EntityFrameworkCore;

namespace SneakerAPI.Models
{
    [Keyless]
    public class ImageProductGetAll
    {
        public int ImageID { get; set; }

        public string Image { get; set; }

        public string ProductName { get; set; }
    }

    [Keyless]
    public class ImageProductInsert
    {
        public string Image { get; set; }

        public int ProductID { get; set; }
    }

    [Keyless]
    public class ImageProductGetAndUpdate
    {
        public int ImageID { get; set; }

        public string Image { get; set; }

        public int ProductID { get; set; }
    }
}
