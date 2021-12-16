using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using SneakerOutside2.Models;
using System;
using System.Collections.Generic;
using System.Dynamic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;

namespace SneakerOutside2.Controllers
{
    public class ProductController : Controller
    {
        private readonly string apiBaseUrl;
        public ProductController(IConfiguration configuration)
        {
            apiBaseUrl = configuration.GetValue<string>("SneakerAPIUrl");
        }

        Error _error = new Error();

        //Hàm hiển thị danh sách sản phẩm
        public async Task<IActionResult> Index()
        {
            List<ProductGetAll> products = new List<ProductGetAll>();
            using (var httpClient = new HttpClient())
            {
                using (var response = await httpClient.GetAsync(apiBaseUrl + "/api/OSproduct/GetAll"))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        string apiResponse = await response.Content.ReadAsStringAsync();
                        products = JsonConvert.DeserializeObject<List<ProductGetAll>>(apiResponse);
                    }
                }
            }
            return View(products);
        } 

        //Chi tiết sản phẩm: hiển thị thông tin chi tiết
        public async Task<IActionResult> ProductDetail(int id)
        {
            //Lấy thông tin sản phẩm
            ProductGetInfo product = new ProductGetInfo();
            using (var httpClient = new HttpClient())
            {
                using (var response = await httpClient.GetAsync(apiBaseUrl + $"/api/OSproduct/GetInfo/{id}"))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        string apiResponse = await response.Content.ReadAsStringAsync();
                        product = JsonConvert.DeserializeObject<List<ProductGetInfo>>(apiResponse)[0];
                    }
                }
            }

            //Chi tiết sản phẩm: lấy danh sách size đang có của sản phẩm
            List<ProductGetSize> sizes = new List<ProductGetSize>();
            using (var httpClient = new HttpClient())
            {
                using (var response = await httpClient.GetAsync(apiBaseUrl + $"/api/OSproduct/GetSize/{id}"))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        string apiResponse = await response.Content.ReadAsStringAsync();
                        sizes = JsonConvert.DeserializeObject<List<ProductGetSize>>(apiResponse);
                    }
                }
            }
            var dropDownSize = new SelectList(sizes, "SizeID", "SizeName");

            //Chi tiết sản phẩm: lấy danh sách hình ảnh đang có của sản phẩm
            List<ProductGetImage> images = new List<ProductGetImage>();
            using (var httpClient = new HttpClient())
            {
                using (var response = await httpClient.GetAsync(apiBaseUrl + $"/api/OSproduct/GetImage/{id}"))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        string apiResponse = await response.Content.ReadAsStringAsync();
                        images = JsonConvert.DeserializeObject<List<ProductGetImage>>(apiResponse);
                    }
                }
            }

            ViewBag.dropDownSize = dropDownSize;
            ViewBag.listImages = images;

            return View(product);
        }
    }
}
