using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using SneakerInside.Models;
using System.Collections.Generic;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace SneakerInside.Controllers
{
    public class SubCatalogController : Controller
    {
        private readonly ILogger<SubCatalogController> _logger;
        private readonly IConfiguration _Configure;
        private readonly string apiBaseUrl;
        public SubCatalogController(ILogger<SubCatalogController> logger, IConfiguration configuration)
        {
            _logger = logger;
            _Configure = configuration;
            apiBaseUrl = _Configure.GetValue<string>("SneakerAPIUrl");
        }

        Error _error = new Error();

        readonly string Name = "loại giày";

        List<SelectListItem> status = new List<SelectListItem>()
        {
            new SelectListItem { Value = "1", Text = "Hoạt động" },
            new SelectListItem { Value = "0", Text = "Không hoạt động" },
        };

        public async Task<IActionResult> Index()
        {
            List<SubCatalogGetAll> _subCatalogs = new List<SubCatalogGetAll>();
            using (var httpClient = new HttpClient())
            {
                using (var response = await httpClient.GetAsync(apiBaseUrl + "/api/SubCatalog/GetAll"))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        string apiResponse = await response.Content.ReadAsStringAsync();
                        _subCatalogs = JsonConvert.DeserializeObject<List<SubCatalogGetAll>>(apiResponse);
                    }
                }
            }
            ViewBag.Name = Name;
            return View(_subCatalogs);
        }

        public IActionResult Create()
        {
            ViewBag.Name = Name;
            ViewBag.status = status;
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(SubCatalogInsert SubCatalogInsert)
        {
            using (var httpClient = new HttpClient())
            {
                StringContent content = new StringContent(JsonConvert.SerializeObject(SubCatalogInsert), Encoding.UTF8, "application/json");
                using (var response = await httpClient.PostAsync(apiBaseUrl + "/api/SubCatalog/Insert", content))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        string apiResponse = await response.Content.ReadAsStringAsync();
                        _error = JsonConvert.DeserializeObject<Error>(apiResponse);
                        string errorCode = _error.ErrorCode;
                        string errorMesage = _error.ErrorMessage;
                    }
                }
            }
            return RedirectToAction("Index");
        }

        public async Task<IActionResult> Edit(int id)
        {
            SubCatalogGetAndUpdate _subCatalog = new SubCatalogGetAndUpdate();
            using (var httpClient = new HttpClient())
            {
                using (var response = await httpClient.GetAsync(apiBaseUrl + $"/api/SubCatalog/GetById/{id}"))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        string apiResponse = await response.Content.ReadAsStringAsync();
                        _subCatalog = JsonConvert.DeserializeObject<List<SubCatalogGetAndUpdate>>(apiResponse)[0];
                    }
                }
            }
            ViewBag.Name = Name;
            ViewBag.status = status;
            return View(_subCatalog);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(SubCatalogGetAndUpdate SubCatalogGetAndUpdate)
        {
            using (var httpClient = new HttpClient())
            {
                StringContent content = new StringContent(JsonConvert.SerializeObject(SubCatalogGetAndUpdate), Encoding.UTF8, "application/json");
                using (var response = await httpClient.PutAsync(apiBaseUrl + "/api/SubCatalog/Update", content))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        string apiResponse = await response.Content.ReadAsStringAsync();
                        _error = JsonConvert.DeserializeObject<Error>(apiResponse);
                        string errorCode = _error.ErrorCode;
                        string errorMesage = _error.ErrorMessage;
                    }
                }
            }
            return RedirectToAction("Index");
        }

        public async Task<IActionResult> Delete(int id)
        {
            _error = new Error();
            using (var httpClient = new HttpClient())
            {
                using (var response = await httpClient.DeleteAsync(apiBaseUrl + $"/api/SubCatalog/Delete/{id}"))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        string apiResponse = await response.Content.ReadAsStringAsync();
                        _error = JsonConvert.DeserializeObject<Error>(apiResponse);
                        string errorCode = _error.ErrorCode;
                        string errorMesage = _error.ErrorMessage;
                    }
                }
            }
            return RedirectToAction("Index");
        }
    }
}
