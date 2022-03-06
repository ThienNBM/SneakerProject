using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace SneakerInside.Models
{
    public class ReportAmountStock
    {
        [DisplayName("Tên giày")]
        public string ProductName { get; set; }

        [DisplayName("Hãng giày")]
        public string CatalogName { get; set; }

        [DisplayName("Mẫu giày")]
        public string SubCatalogName { get; set; }

        [DisplayName("Size")]
        public string SizeName { get; set; }

        [DisplayName("Số lượng tồn")]
        public int AmountStock { get; set; }

        [DisplayName("Giá")]
        public int Price { get; set; }
    }

    public class ReportOrder
    {
        public string StartDate { get; set; }

        public string EndDate { get; set; }

        [DisplayName("Ngày tạo")]
        public DateTime DateCreate { get; set; }

        [DisplayName("Họ và tên")]
        public string FullName { get; set; }

        [DisplayName("Số điện thoại")]
        public string Phone { get; set; }

        [DisplayName("Địa chỉ")]
        public string Address { get; set; }

        [DisplayName("Ghi chú")]
        public string Note { get; set; }

        [DisplayName("Trạng thái")]
        public int Status { get; set; }

        [DisplayName("Tổng đơn hàng")]
        public int Total { get; set; }
    }
}
