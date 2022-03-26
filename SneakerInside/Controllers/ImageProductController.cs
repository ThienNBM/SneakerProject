using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using SneakerInside.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace SneakerInside.Controllers
{
    public class ImageProductController : Controller
    {
        private readonly IWebHostEnvironment hostEnvironment;
        private readonly string apiBaseUrl;
        public ImageProductController(IConfiguration configuration, IWebHostEnvironment hostEnvironment)
        {
            this.hostEnvironment = hostEnvironment;
            apiBaseUrl = configuration.GetValue<string>("SneakerAPIUrl");
        }

        readonly string Name = "ảnh giày";

        public IActionResult Index()
        {
            ViewBag.Name = Name;
            return View();
        }

        [HttpGet]
        public async Task<ActionResult> GetAll()
        {
            List<ImageProductGetAll> imageProducts = new List<ImageProductGetAll>();
            using (var httpClient = new HttpClient())
            {
                using (var response = await httpClient.GetAsync(apiBaseUrl + "/api/ImageProduct/GetAll"))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        string apiResponse = await response.Content.ReadAsStringAsync();
                        imageProducts = JsonConvert.DeserializeObject<List<ImageProductGetAll>>(apiResponse);
                    }
                }
            }
            return Json(new { data = imageProducts });
        }

        [HttpGet]
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

            ViewBag.dropDownProduct = dropDownProduct;
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(ImageProductInsert model)
        {
            string uploadsFolder = Path.Combine(hostEnvironment.WebRootPath, "Images");
            string imageFileName = DateTime.Now.ToString("ddMMyyyy_HHmmss_") + model.ImageFile.FileName;
            string imageFilePath = Path.Combine(uploadsFolder, imageFileName);
            using (var fileStream = new FileStream(imageFilePath, FileMode.Create))
            {
                await model.ImageFile.CopyToAsync(fileStream);
            }
            model.Image = imageFileName;

            Error error = new Error();
            using (var httpClient = new HttpClient())
            {
                StringContent content = new StringContent(JsonConvert.SerializeObject(model), Encoding.UTF8, "application/json");
                using (var response = await httpClient.PostAsync(apiBaseUrl + "/api/ImageProduct/Insert", content))
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

        [HttpGet]
        public async Task<IActionResult> Update(int id)
        {
            ImageProductGetAndUpdate imageProduct = new ImageProductGetAndUpdate();
            using (var httpClient = new HttpClient())
            {
                using (var response = await httpClient.GetAsync(apiBaseUrl + $"/api/ImageProduct/GetById/{id}"))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        string apiResponse = await response.Content.ReadAsStringAsync();
                        imageProduct = JsonConvert.DeserializeObject<List<ImageProductGetAndUpdate>>(apiResponse)[0];
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

            ViewBag.dropDownProduct = dropDownProduct;
            return View(imageProduct);
        }

        [HttpPost]
        public async Task<IActionResult> Update(ImageProductGetAndUpdate imageProductGetAndUpdate)
        {
            Error error = new Error();
            using (var httpClient = new HttpClient())
            {
                StringContent content = new StringContent(JsonConvert.SerializeObject(imageProductGetAndUpdate), Encoding.UTF8, "application/json");
                using (var response = await httpClient.PutAsync(apiBaseUrl + "/api/ImageProduct/Update", content))
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

        public async Task<IActionResult> Delete(int id)
        {
            Error error = new Error();
            using (var httpClient = new HttpClient())
            {
                using (var response = await httpClient.DeleteAsync(apiBaseUrl + $"/api/ImageProduct/Delete/{id}"))
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
