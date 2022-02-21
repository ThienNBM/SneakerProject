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
    public class CatalogController : Controller
    {
        private readonly string apiBaseUrl;
        public CatalogController(IConfiguration configuration)
        {
            apiBaseUrl = configuration.GetValue<string>("SneakerAPIUrl");
        }

        Catalog _catalog = new Catalog();
        List<Catalog> _catalogs = new List<Catalog>();
        Error _error = new Error();

        readonly string Name = "hãng giày";

        List<SelectListItem> status = new List<SelectListItem>()
        {
            new SelectListItem { Value = "1", Text = "Hoạt động" },
            new SelectListItem { Value = "0", Text = "Không hoạt động" },
        };

        public IActionResult Index()
        {
            return View();
        }

        public async Task<ActionResult> GetAll()
        {
            List<Catalog> catalogs = new List<Catalog>();
            using (var httpClient = new HttpClient())
            {
                using (var response = await httpClient.GetAsync(apiBaseUrl + "/api/Catalog/GetAll"))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        string apiResponse = await response.Content.ReadAsStringAsync();
                        catalogs = JsonConvert.DeserializeObject<List<Catalog>>(apiResponse);
                    }
                }
            }
            return Json(new { data = catalogs });
        }

        [HttpGet]
        public IActionResult Create()
        {
            ViewBag.Name = Name;
            ViewBag.status = status;
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(Catalog catalog)
        {
            if (ModelState.IsValid)
            {
                _error = new Error();
                using (var httpClient = new HttpClient())
                {
                    StringContent content = new StringContent(JsonConvert.SerializeObject(catalog), Encoding.UTF8, "application/json");
                    using (var response = await httpClient.PostAsync(apiBaseUrl + "/api/Catalog/Insert", content))
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
                return Json(new { isValid = true, _error });
            }
            return Json(new { isValid = false });
        }

        public async Task<IActionResult> Edit(int id)
        {
            _catalog = new Catalog();
            using (var httpClient = new HttpClient())
            {
                using (var response = await httpClient.GetAsync(apiBaseUrl + $"/api/Catalog/GetById/{id}"))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        string apiResponse = await response.Content.ReadAsStringAsync();
                        _catalog = JsonConvert.DeserializeObject<List<Catalog>>(apiResponse)[0];
                    }
                }
            }
            ViewBag.Name = Name;
            ViewBag.status = status;
            return View(_catalog);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(Catalog catalog)
        {
            if (ModelState.IsValid)
            {
                _error = new Error();
                using (var httpClient = new HttpClient())
                {
                    StringContent content = new StringContent(JsonConvert.SerializeObject(catalog), Encoding.UTF8, "application/json");
                    using (var response = await httpClient.PutAsync(apiBaseUrl + "/api/Catalog/Update", content))
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
                return Json(new { isValid = true, _error});
            }
            return Json(new { isValid = false});
        }

        public async Task<IActionResult> Delete(int id)
        {
            _error = new Error();
            using (var httpClient = new HttpClient())
            {
                using (var response = await httpClient.DeleteAsync(apiBaseUrl + $"/api/Catalog/Delete/{id}"))
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
            return Json(new { isValid = true, _error });
        }
    }
}