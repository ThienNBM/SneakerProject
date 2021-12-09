using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using SneakerInside.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace SneakerInside.Controllers
{
    public class SizeController : Controller
    {
        private readonly ILogger<SizeController> _logger;
        private readonly IConfiguration _Configure;
        private readonly string apiBaseUrl;
        public SizeController(ILogger<SizeController> logger, IConfiguration configuration)
        {
            _logger = logger;
            _Configure = configuration;
            apiBaseUrl = _Configure.GetValue<string>("SneakerAPIUrl");
        }

        readonly string Name = "size";

        public async Task<IActionResult> Index()
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
            ViewBag.Name = Name;
            return View(sizes);
        }

        public IActionResult Create()
        {
            ViewBag.Name = Name;
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(SizeInsert model)
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
                        string errorCode = error.ErrorCode;
                        string errorMesage = error.ErrorMessage;
                    }
                }
            }
            return RedirectToAction("Index");
        }

        public async Task<IActionResult> Edit(int id)
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
            ViewBag.Name = Name;
            return View(size);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(SizeGetAndUpdate model)
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
                        string errorCode = error.ErrorCode;
                        string errorMesage = error.ErrorMessage;
                    }
                }
            }
            return RedirectToAction("Index");
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
                        string errorCode = error.ErrorCode;
                        string errorMesage = error.ErrorMessage;
                    }
                }
            }
            return RedirectToAction("Index");
        }
    }
}
