using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
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

        public IActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public async Task<ActionResult> GetAll()
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
            return Json(new { data = orders });
        }

        [HttpGet]
        public async Task<ActionResult> GetOrderDetailById(int id)
        {
            List<OrderGetOrderDetailById> orderDetails = new List<OrderGetOrderDetailById>();
            using (var httpClient = new HttpClient())
            {
                using (var response = await httpClient.GetAsync(apiBaseUrl + $"/api/Order/GetOrderDetailById/{id}"))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        string apiResponse = await response.Content.ReadAsStringAsync();
                        orderDetails = JsonConvert.DeserializeObject<List<OrderGetOrderDetailById>>(apiResponse);
                    }
                }
            }
            return Json(new { data = orderDetails });
        }
    }
}
