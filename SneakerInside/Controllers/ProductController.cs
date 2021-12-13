using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
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
    public class ProductController : Controller
    {
        private readonly string apiBaseUrl;
        public ProductController(IConfiguration configuration)
        {
            apiBaseUrl = configuration.GetValue<string>("SneakerAPIUrl");
        }

        Error _error = new Error();

        readonly string Name = "sản phẩm";

        List<SelectListItem> status = new List<SelectListItem>()
        {
            new SelectListItem { Value = "1", Text = "Hoạt động" },
            new SelectListItem { Value = "0", Text = "Không hoạt động" },
        };

        public async Task<IActionResult> Index()
        {
            List<ProductGetAll> products = new List<ProductGetAll>();
            using (var httpClient = new HttpClient())
            {
                using (var response = await httpClient.GetAsync(apiBaseUrl + "/api/Product/GetAll"))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        string apiResponse = await response.Content.ReadAsStringAsync();
                        products = JsonConvert.DeserializeObject<List<ProductGetAll>>(apiResponse);
                    }
                }
            }
            ViewBag.Name = Name;
            return View(products);
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

            List<ListSubCatalog> listSubCatalogs = new List<ListSubCatalog>();
            using (var httpClient = new HttpClient())
            {
                using (var response = await httpClient.GetAsync(apiBaseUrl + "/api/SubCatalog/GetAll"))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        string apiResponse = await response.Content.ReadAsStringAsync();
                        listSubCatalogs = JsonConvert.DeserializeObject<List<ListSubCatalog>>(apiResponse);
                    }
                }
            }
            var dropDownSubCatalog = new SelectList(listSubCatalogs, "SubCatalogID", "SubCatalogName");

            ViewBag.dropDownCatalog = dropDownCatalog;
            ViewBag.dropDownSubCatalog = dropDownSubCatalog;
            ViewBag.Name = Name;
            ViewBag.status = status;
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(ProductInsert productInsert)
        {
            using (var httpClient = new HttpClient())
            {
                StringContent content = new StringContent(JsonConvert.SerializeObject(productInsert), Encoding.UTF8, "application/json");
                using (var response = await httpClient.PostAsync(apiBaseUrl + "/api/Product/Insert", content))
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
            ProductGetAndUpdate product = new ProductGetAndUpdate();
            using (var httpClient = new HttpClient())
            {
                using (var response = await httpClient.GetAsync(apiBaseUrl + $"/api/Product/GetById/{id}"))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        string apiResponse = await response.Content.ReadAsStringAsync();
                        product = JsonConvert.DeserializeObject<List<ProductGetAndUpdate>>(apiResponse)[0];
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

            List<ListSubCatalog> listSubCatalogs = new List<ListSubCatalog>();
            using (var httpClient = new HttpClient())
            {
                using (var response = await httpClient.GetAsync(apiBaseUrl + "/api/SubCatalog/GetAll"))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        string apiResponse = await response.Content.ReadAsStringAsync();
                        listSubCatalogs = JsonConvert.DeserializeObject<List<ListSubCatalog>>(apiResponse);
                    }
                }
            }
            var dropDownSubCatalog = new SelectList(listSubCatalogs, "SubCatalogID", "SubCatalogName");

            ViewBag.dropDownCatalog = dropDownCatalog;
            ViewBag.dropDownSubCatalog = dropDownSubCatalog;
            ViewBag.Name = Name;
            ViewBag.status = status;
            return View(product);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(ProductGetAndUpdate productGetAndUpdate)
        {
            using (var httpClient = new HttpClient())
            {
                StringContent content = new StringContent(JsonConvert.SerializeObject(productGetAndUpdate), Encoding.UTF8, "application/json");
                using (var response = await httpClient.PutAsync(apiBaseUrl + "/api/Product/Update", content))
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
                using (var response = await httpClient.DeleteAsync(apiBaseUrl + $"/api/Product/Delete/{id}"))
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
