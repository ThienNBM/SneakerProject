using Microsoft.EntityFrameworkCore;
using System;

namespace SneakerAPI.InsideModels
{
    [Keyless]
    public class ReportAmountStock
    {
        public string ProductName { get; set; }

        public string CatalogName { get; set; }

        public string SubCatalogName { get; set; }

        public string SizeName { get; set; }

        public int AmountStock { get; set; }

        public int Price { get; set; }
    }

    [Keyless]
    public class ReportOrder
    {
        public DateTime DateCreate { get; set; }

        public string FullName { get; set; }

        public string Phone { get; set; }

        public string Address { get; set; }

        public string Note { get; set; }

        public int Status { get; set; }

        public int Total { get; set; }
    }

    [Keyless]
    public class GetReportOrder
    {
        public string StartDate { get; set; }

        public string EndDate { get; set; }
    }
}
