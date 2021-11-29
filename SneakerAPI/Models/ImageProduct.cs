using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SneakerAPI.Models
{
    [Keyless]
    public class ImageProductGetAll
    {
        public int ImageID { get; set; }

        public string ProductName { get; set; }

        public string Image { get; set; }
    }

    [Keyless]
    public class ImageProductGetByID
    {
        public int ImageID { get; set; }

        public int ProductID { get; set; }

        public string Image { get; set; }
    }

    [Keyless]
    public class ImageProductInsert
    {
        public int ProductID { get; set; }

        public string Image { get; set; }
    }

    [Keyless]
    public class ImageProductUpdate
    {
        public string Image { get; set; }
    }
}
