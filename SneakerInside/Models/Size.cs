using System.ComponentModel;

namespace SneakerInside.Models
{
    public class SizeGetAll
    {
        [DisplayName("ID")]
        public int SizeID { get; set; }

        [DisplayName("Size")]
        public string SizeName { get; set; }
    }

    public class SizeInsert
    {
        [DisplayName("Size")]
        public string SizeName { get; set; }
    }

    public class SizeGetAndUpdate
    {
        public int SizeID { get; set; }

        [DisplayName("Size")]
        public string SizeName { get; set; }
    }
}
