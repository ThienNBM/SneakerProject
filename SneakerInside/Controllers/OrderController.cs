using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using SneakerInside.Models;
using System.Collections.Generic;
using System.Net.Http;
using System.Threading.Tasks;

namespace SneakerInside.Controllers
{
    public class OrderController : Controller
    {
        private readonly string apiBaseUrl;
        public OrderController(IConfiguration configuration)
        {
            apiBaseUrl = configuration.GetValue<string>("SneakerAPIUrl");
        }

        readonly string Name = "đơn hàng";

        public async Task<IActionResult> Index()
        {
            List<OrderGetAll> orders = new List<OrderGetAll>();
            using (var httpClient = new HttpClient())
            {
                using (var response = await httpClient.GetAsync(apiBaseUrl + "/api/Order/GetAll"))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        string apiResponse = await response.Content.ReadAsStringAsync();
                        orders = JsonConvert.DeserializeObject<List<OrderGetAll>>(apiResponse);
                    }
                }
            }
            ViewBag.Name = Name;
            return View(orders);
        }
        
        public async Task<IActionResult> IndexByUserId(int id)
        {
            List<OrderGetByUserId> orders = new List<OrderGetByUserId>();
            using (var httpClient = new HttpClient())
            {
                using (var response = await httpClient.GetAsync(apiBaseUrl + $"/api/Order/GetByUserId/{id}"))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        string apiResponse = await response.Content.ReadAsStringAsync();
                        orders = JsonConvert.DeserializeObject<List<OrderGetByUserId>>(apiResponse);
                    }
                }
            }
            ViewBag.Name = Name;
            return View(orders);
        }
    }
}
