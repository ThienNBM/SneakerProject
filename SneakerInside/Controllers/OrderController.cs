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
        private readonly ILogger<OrderController> _logger;
        private readonly IConfiguration _Configure;
        private readonly string apiBaseUrl;
        public OrderController(ILogger<OrderController> logger, IConfiguration configuration)
        {
            _logger = logger;
            _Configure = configuration;
            apiBaseUrl = _Configure.GetValue<string>("SneakerAPIUrl");
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
    }
}
