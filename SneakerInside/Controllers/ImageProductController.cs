using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
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
        private readonly ILogger<ImageProductController> _logger;
        private readonly IConfiguration _Configure;
        private readonly IWebHostEnvironment hostEnvironment;
        private readonly string apiBaseUrl;
        public ImageProductController(ILogger<ImageProductController> logger, IConfiguration configuration, IWebHostEnvironment hostEnvironment)
        {
            _logger = logger;
            _Configure = configuration;
            this.hostEnvironment = hostEnvironment;
            apiBaseUrl = _Configure.GetValue<string>("SneakerAPIUrl");
        }

        Error _error = new Error();

        readonly string Name = "ảnh sản phẩm";

        public async Task<IActionResult> Index()
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
            ViewBag.Name = Name;
            return View(imageProducts);
        }

        public IActionResult Create()
        {
            ViewBag.Name = Name;
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

            using (var httpClient = new HttpClient())
            {
                StringContent content = new StringContent(JsonConvert.SerializeObject(model), Encoding.UTF8, "application/json");
                using (var response = await httpClient.PostAsync(apiBaseUrl + "/api/ImageProduct/Insert", content))
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
            ViewBag.Name = Name;
            return View(imageProduct);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(ImageProductGetAndUpdate imageProductGetAndUpdate)
        {
            using (var httpClient = new HttpClient())
            {
                StringContent content = new StringContent(JsonConvert.SerializeObject(imageProductGetAndUpdate), Encoding.UTF8, "application/json");
                using (var response = await httpClient.PutAsync(apiBaseUrl + "/api/ImageProduct/Update", content))
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
            using (var httpClient = new HttpClient())
            {
                using (var response = await httpClient.DeleteAsync(apiBaseUrl + $"/api/ImageProduct/Delete/{id}"))
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
