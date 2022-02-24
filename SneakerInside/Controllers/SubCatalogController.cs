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
    public class SubCatalogController : Controller
    {
        private readonly string apiBaseUrl;
        public SubCatalogController(IConfiguration configuration)
        {
            apiBaseUrl = configuration.GetValue<string>("SneakerAPIUrl");
        }

        readonly string Name = "mẫu giày";

        List<SelectListItem> status = new List<SelectListItem>()
        {
            new SelectListItem { Value = "1", Text = "Hoạt động" },
            new SelectListItem { Value = "0", Text = "Không hoạt động" },
        };

        public IActionResult Index()
        {
            ViewBag.Name = Name;
            return View();
        }

        public async Task<ActionResult> GetAll()
        {
            List<SubCatalogGetAll> subCatalogs = new List<SubCatalogGetAll>();
            using (var httpClient = new HttpClient())
            {
                using (var response = await httpClient.GetAsync(apiBaseUrl + "/api/SubCatalog/GetAll"))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        string apiResponse = await response.Content.ReadAsStringAsync();
                        subCatalogs = JsonConvert.DeserializeObject<List<SubCatalogGetAll>>(apiResponse);
                    }
                }
            }
            return Json(new { data = subCatalogs });
        }

        public async Task<IActionResult> Create()
        {
            List<ListCatalog> listCatalogs = new List<ListCatalog>();
            using (var httpClient = new HttpClient())
            {
                using (var response = await httpClient.GetAsync(apiBaseUrl + "/api/Catalog/GetAll"))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        string apiResponse = await response.Content.ReadAsStringAsync();
                        listCatalogs = JsonConvert.DeserializeObject<List<ListCatalog>>(apiResponse);
                    }
                }
            }
            var dropDownCatalog = new SelectList(listCatalogs, "CatalogID", "CatalogName");
            ViewBag.dropDownCatalog = dropDownCatalog;
            ViewBag.status = status;
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(SubCatalogInsert SubCatalogInsert)
        {
            if (ModelState.IsValid)
            {
                Error error = new Error();
                using (var httpClient = new HttpClient())
                {
                    StringContent content = new StringContent(JsonConvert.SerializeObject(SubCatalogInsert), Encoding.UTF8, "application/json");
                    using (var response = await httpClient.PostAsync(apiBaseUrl + "/api/SubCatalog/Insert", content))
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
            SubCatalogGetAndUpdate subCatalog = new SubCatalogGetAndUpdate();
            using (var httpClient = new HttpClient())
            {
                using (var response = await httpClient.GetAsync(apiBaseUrl + $"/api/SubCatalog/GetById/{id}"))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        string apiResponse = await response.Content.ReadAsStringAsync();
                        subCatalog = JsonConvert.DeserializeObject<List<SubCatalogGetAndUpdate>>(apiResponse)[0];
                    }
                }
            }

            List<ListCatalog> listCatalogs = new List<ListCatalog>();
            using (var httpClient = new HttpClient())
            {
                using (var response = await httpClient.GetAsync(apiBaseUrl + "/api/Catalog/GetAll"))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        string apiResponse = await response.Content.ReadAsStringAsync();
                        listCatalogs = JsonConvert.DeserializeObject<List<ListCatalog>>(apiResponse);
                    }
                }
            }
            var dropDownCatalog = new SelectList(listCatalogs, "CatalogID", "CatalogName");
            ViewBag.dropDownCatalog = dropDownCatalog;
            ViewBag.status = status;
            return View(subCatalog);
        }

        [HttpPost]
        public async Task<IActionResult> Update(SubCatalogGetAndUpdate SubCatalogGetAndUpdate)
        {
            if (ModelState.IsValid)
            {
                Error error = new Error();
                using (var httpClient = new HttpClient())
                {
                    StringContent content = new StringContent(JsonConvert.SerializeObject(SubCatalogGetAndUpdate), Encoding.UTF8, "application/json");
                    using (var response = await httpClient.PutAsync(apiBaseUrl + "/api/SubCatalog/Update", content))
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
                using (var response = await httpClient.DeleteAsync(apiBaseUrl + $"/api/SubCatalog/Delete/{id}"))
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