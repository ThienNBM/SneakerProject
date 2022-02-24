using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using SneakerInside.Models;
using System.Collections.Generic;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace SneakerInside.Controllers
{
    public class SizeController : Controller
    {
        private readonly string apiBaseUrl;
        public SizeController(IConfiguration configuration)
        {
            apiBaseUrl = configuration.GetValue<string>("SneakerAPIUrl");
        }

        readonly string Name = "size";

        public IActionResult Index()
        {
            ViewBag.Name = Name;
            return View();
        }

        public async Task<ActionResult> GetAll()
        {
            List<SizeGetAll> sizes = new List<SizeGetAll>();
            using (var httpClient = new HttpClient())
            {
                using (var response = await httpClient.GetAsync(apiBaseUrl + "/api/Size/GetAll"))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        string apiResponse = await response.Content.ReadAsStringAsync();
                        sizes = JsonConvert.DeserializeObject<List<SizeGetAll>>(apiResponse);
                    }
                }
            }
            return Json(new { data = sizes });
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(SizeInsert model)
        {
            if (ModelState.IsValid)
            {
                Error error = new Error();
                using (var httpClient = new HttpClient())
                {
                    StringContent content = new StringContent(JsonConvert.SerializeObject(model), Encoding.UTF8, "application/json");
                    using (var response = await httpClient.PostAsync(apiBaseUrl + "/api/Size/Insert", content))
                    {
                        if (response.IsSuccessStatusCode)
                        {
                            string apiResponse = await response.Content.ReadAsStringAsync();
                            error = JsonConvert.DeserializeObject<Error>(apiResponse);
                        }
                    }
                }
                return Json(new { isValid = true, error });
            }
            else
            {
                return Json(new { isValid = false });
            }
        }

        public async Task<IActionResult> Update(int id)
        {
            SizeGetAndUpdate size = new SizeGetAndUpdate();
            using (var httpClient = new HttpClient())
            {
                using (var response = await httpClient.GetAsync(apiBaseUrl + $"/api/Size/GetById/{id}"))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        string apiResponse = await response.Content.ReadAsStringAsync();
                        size = JsonConvert.DeserializeObject<List<SizeGetAndUpdate>>(apiResponse)[0];
                    }
                }
            }
            return View(size);
        }

        [HttpPost]
        public async Task<IActionResult> Update(SizeGetAndUpdate model)
        {
            if (ModelState.IsValid)
            {
                Error error = new Error();
                using (var httpClient = new HttpClient())
                {
                    StringContent content = new StringContent(JsonConvert.SerializeObject(model), Encoding.UTF8, "application/json");
                    using (var response = await httpClient.PutAsync(apiBaseUrl + "/api/Size/Update", content))
                    {
                        if (response.IsSuccessStatusCode)
                        {
                            string apiResponse = await response.Content.ReadAsStringAsync();
                            error = JsonConvert.DeserializeObject<Error>(apiResponse);
                        }
                    }
                }
                return Json(new { isValid = true, error });
            }
            else
            {
                return Json(new { isValid = false });
            }
        }

        public async Task<IActionResult> Delete(int id)
        {
            Error error = new Error();
            using (var httpClient = new HttpClient())
            {
                using (var response = await httpClient.DeleteAsync(apiBaseUrl + $"/api/Size/Delete/{id}"))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        string apiResponse = await response.Content.ReadAsStringAsync();
                        error = JsonConvert.DeserializeObject<Error>(apiResponse);
                    }
                }
            }
            return Json(new { error });
        }
    }
}