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
    public class ReportController : Controller
    {
        private readonly string apiBaseUrl;
        public ReportController(IConfiguration configuration)
        {
            apiBaseUrl = configuration.GetValue<string>("SneakerAPIUrl");
        }

        public IActionResult AmountStock()
        {
            return View();
        }

        [HttpGet]
        public async Task<ActionResult> GetAmountStock()
        {
            List<ReportAmountStock> result = new List<ReportAmountStock>();
            using (var httpClient = new HttpClient())
            {
                using (var response = await httpClient.GetAsync(apiBaseUrl + "/api/Report/GetAmountStock"))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        string apiResponse = await response.Content.ReadAsStringAsync();
                        result = JsonConvert.DeserializeObject<List<ReportAmountStock>>(apiResponse);
                    }
                }
            }
            return Json(new { data = result });
        }

        public IActionResult Order()
        {
            return View();
        }

        [HttpPost]
        public async Task<ActionResult> GetOrder(ReportOrder reportOrder)
        {
            List<ReportOrder> result = new List<ReportOrder>();
            using (var httpClient = new HttpClient())
            {
                StringContent content = new StringContent(JsonConvert.SerializeObject(reportOrder), Encoding.UTF8, "application/json");
                using (var response = await httpClient.PostAsync(apiBaseUrl + "/api/Report/GetOrder", content))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        string apiResponse = await response.Content.ReadAsStringAsync();
                        result = JsonConvert.DeserializeObject<List<ReportOrder>>(apiResponse);
                    }
                }
            }
            return Json(new { data = result });
        }
    }
}
