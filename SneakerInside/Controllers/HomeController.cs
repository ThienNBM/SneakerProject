using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using SneakerInside.Models;
using System.Collections.Generic;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace SneakerInside.Controllers
{
    public class HomeController : Controller
    {
        private readonly string apiBaseUrl;
        public HomeController(IConfiguration configuration)
        {
            apiBaseUrl = configuration.GetValue<string>("SneakerAPIUrl");
        }

        public async Task<IActionResult> Index()
        {
            ChartCountOrderStatus countOrderStatus = new ChartCountOrderStatus();
            using (var httpClient = new HttpClient())
            {
                using (var response = await httpClient.GetAsync(apiBaseUrl + "/api/Home/CountOrderStatus"))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        string apiResponse = await response.Content.ReadAsStringAsync();
                        countOrderStatus = JsonConvert.DeserializeObject<List<ChartCountOrderStatus>>(apiResponse)[0];
                    }
                }
            }
            ViewBag.countOrderStatus = countOrderStatus;
            return View();
        }

        [HttpGet]
        public async Task<ActionResult> CountCatalogProduct()
        {
            List<ChartCountCatalogProduct> countCatalogProducts = new List<ChartCountCatalogProduct>();
            using (var httpClient = new HttpClient())
            {
                using (var response = await httpClient.GetAsync(apiBaseUrl + "/api/Home/CountCatalogProduct"))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        string apiResponse = await response.Content.ReadAsStringAsync();
                        countCatalogProducts = JsonConvert.DeserializeObject<List<ChartCountCatalogProduct>>(apiResponse);
                    }
                }
            }
            return Json(countCatalogProducts);
        }
        
        [HttpGet]
        public async Task<ActionResult> TopSellProduct()
        {
            List<TopSellProduct> countCatalogProducts = new List<TopSellProduct>();
            using (var httpClient = new HttpClient())
            {
                using (var response = await httpClient.GetAsync(apiBaseUrl + "/api/Home/TopSellProduct"))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        string apiResponse = await response.Content.ReadAsStringAsync();
                        countCatalogProducts = JsonConvert.DeserializeObject<List<TopSellProduct>>(apiResponse);
                    }
                }
            }
            return Json(countCatalogProducts);
        }
    }
}
