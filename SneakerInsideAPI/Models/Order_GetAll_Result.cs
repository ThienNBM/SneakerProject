//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SneakerInsideAPI.Models
{
    using System;
    
    public partial class Order_GetAll_Result
    {
        public string FullName { get; set; }
        public string PhoneNumber { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }
        public string ProvinceName { get; set; }
        public string DistrictName { get; set; }
        public int UserOrderID { get; set; }
        public System.DateTime DateCreate { get; set; }
        public int Status { get; set; }
        public string Note { get; set; }
        public Nullable<double> TotalMoney { get; set; }
    }
}
