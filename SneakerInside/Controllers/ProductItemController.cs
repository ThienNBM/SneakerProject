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
    public class ProductItemController : Controller
    {
        private readonly ILogger<ProductItemController> _logger;
        private readonly IConfiguration _Configure;
        private readonly string apiBaseUrl;
        public ProductItemController(ILogger<ProductItemController> logger, IConfiguration configuration)
        {
            _logger = logger;
            _Configure = configuration;
            apiBaseUrl = _Configure.GetValue<string>("SneakerAPIUrl");
        }

        Error _error = new Error();

        readonly string Name = "sản phẩm chi tiết";

        public async Task<IActionResult> Index()
        {
            List<ProductItemGetAll> productItems = new List<ProductItemGetAll>();
            using (var httpClient = new HttpClient())
            {
                using (var response = await httpClient.GetAsync(apiBaseUrl + "/api/ProductItem/GetAll"))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        string apiResponse = await response.Content.ReadAsStringAsync();
                        productItems = JsonConvert.DeserializeObject<List<ProductItemGetAll>>(apiResponse);
                    }
                }
            }
            ViewBag.Name = Name;
            return View(productItems);
        }

        public async Task<IActionResult> Create()
        {
            List<ListProduct> listProducts = new List<ListProduct>();
            using (var httpClient = new HttpClient())
            {
                using (var response = await httpClient.GetAsync(apiBaseUrl + "/api/Product/GetAll"))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        string apiResponse = await response.Content.ReadAsStringAsync();
                        listProducts = JsonConvert.DeserializeObject<List<ListProduct>>(apiResponse);
                    }
                }
            }
            var dropDownProduct = new SelectList(listProducts, "ProductID", "ProductName");
            
            List<ListSize> listSizes = new List<ListSize>();
            using (var httpClient = new HttpClient())
            {
                using (var response = await httpClient.GetAsync(apiBaseUrl + "/api/Size/GetAll"))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        string apiResponse = await response.Content.ReadAsStringAsync();
                        listSizes = JsonConvert.DeserializeObject<List<ListSize>>(apiResponse);
                    }
                }
            }
            var dropDownSize = new SelectList(listSizes, "SizeID", "SizeName");

            ViewBag.dropDownProduct = dropDownProduct;
            ViewBag.dropDownSize = dropDownSize;
            ViewBag.Name = Name;
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(ProductItemInsert model)
        {
            using (var httpClient = new HttpClient())
            {
                StringContent content = new StringContent(JsonConvert.SerializeObject(model), Encoding.UTF8, "application/json");
                using (var response = await httpClient.PostAsync(apiBaseUrl + "/api/ProductItem/Insert", content))
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
            ProductItemGetAndUpdate productItem = new ProductItemGetAndUpdate();
            using (var httpClient = new HttpClient())
            {
                using (var response = await httpClient.GetAsync(apiBaseUrl + $"/api/ProductItem/GetById/{id}"))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        string apiResponse = await response.Content.ReadAsStringAsync();
                        productItem = JsonConvert.DeserializeObject<List<ProductItemGetAndUpdate>>(apiResponse)[0];
                    }
                }
            }

            List<ListProduct> listProducts = new List<ListProduct>();
            using (var httpClient = new HttpClient())
            {
                using (var response = await httpClient.GetAsync(apiBaseUrl + "/api/Product/GetAll"))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        string apiResponse = await response.Content.ReadAsStringAsync();
                        listProducts = JsonConvert.DeserializeObject<List<ListProduct>>(apiResponse);
                    }
                }
            }
            var dropDownProduct = new SelectList(listProducts, "ProductID", "ProductName");

            List<ListSize> listSizes = new List<ListSize>();
            using (var httpClient = new HttpClient())
            {
                using (var response = await httpClient.GetAsync(apiBaseUrl + "/api/Size/GetAll"))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        string apiResponse = await response.Content.ReadAsStringAsync();
                        listSizes = JsonConvert.DeserializeObject<List<ListSize>>(apiResponse);
                    }
                }
            }
            var dropDownSize = new SelectList(listSizes, "SizeID", "SizeName");

            ViewBag.dropDownProduct = dropDownProduct;
            ViewBag.dropDownSize = dropDownSize;
            ViewBag.Name = Name;
            return View(productItem);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(ProductItemGetAndUpdate model)
        {
            using (var httpClient = new HttpClient())
            {
                StringContent content = new StringContent(JsonConvert.SerializeObject(model), Encoding.UTF8, "application/json");
                using (var response = await httpClient.PutAsync(apiBaseUrl + "/api/ProductItem/Update", content))
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
                using (var response = await httpClient.DeleteAsync(apiBaseUrl + $"/api/ProductItem/Delete/{id}"))
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
