using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using SneakerInside.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;

namespace SneakerInside.Controllers
{
    public class OrderDetailController : Controller
    {
        private readonly ILogger<OrderDetailController> _logger;
        private readonly IConfiguration _Configure;
        private readonly string apiBaseUrl;
        public OrderDetailController(ILogger<OrderDetailController> logger, IConfiguration configuration)
        {
            _logger = logger;
            _Configure = configuration;
            apiBaseUrl = _Configure.GetValue<string>("SneakerAPIUrl");
        }

        readonly string Name = "đơn hàng chi tiết";

        public async Task<IActionResult> Index(int id)
        {
            List<OrderDetailGetAll> orderDetails = new List<OrderDetailGetAll>();
            using (var httpClient = new HttpClient())
            {
                using (var response = await httpClient.GetAsync(apiBaseUrl + $"/api/OrderDetail/GetAll/{id}"))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        string apiResponse = await response.Content.ReadAsStringAsync();
                        orderDetails = JsonConvert.DeserializeObject<List<OrderDetailGetAll>>(apiResponse);
                    }
                }
            }
            ViewBag.Name = Name;
            return View(orderDetails);
        }
    }
}
