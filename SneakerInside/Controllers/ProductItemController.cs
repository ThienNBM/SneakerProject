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
        private readonly string apiBaseUrl;
        public ProductItemController(IConfiguration configuration)
        {
            apiBaseUrl = configuration.GetValue<string>("SneakerAPIUrl");
        }

        readonly string Name = "số lượng giày";

        public IActionResult Index()
        {
            ViewBag.Name = Name;
            return View();
        }

        [HttpGet]
        public async Task<ActionResult> GetAll()
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
            return Json(new { data = productItems });
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
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(ProductItemInsert model)
        {
            if (ModelState.IsValid)
            {
                Error error = new Error();
                using (var httpClient = new HttpClient())
                {
                    StringContent content = new StringContent(JsonConvert.SerializeObject(model), Encoding.UTF8, "application/json");
                    using (var response = await httpClient.PostAsync(apiBaseUrl + "/api/ProductItem/Insert", content))
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

        [HttpGet]
        public async Task<IActionResult> Update(int id)
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
            return View(productItem);
        }

        [HttpPost]
        public async Task<IActionResult> Update(ProductItemGetAndUpdate model)
        {
            if (ModelState.IsValid)
            {
                Error error = new Error();
                using (var httpClient = new HttpClient())
                {
                    StringContent content = new StringContent(JsonConvert.SerializeObject(model), Encoding.UTF8, "application/json");
                    using (var response = await httpClient.PutAsync(apiBaseUrl + "/api/ProductItem/Update", content))
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
                using (var response = await httpClient.DeleteAsync(apiBaseUrl + $"/api/ProductItem/Delete/{id}"))
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
