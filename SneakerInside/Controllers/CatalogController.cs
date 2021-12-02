using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using SneakerInside.Models;
using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace SneakerInside.Controllers
{
    public class CatalogController : Controller
    {
        private readonly ILogger<CatalogController> _logger;
        private readonly IConfiguration _Configure;
        private readonly string apiUrl;
        public CatalogController(ILogger<CatalogController> logger, IConfiguration configuration)
        {
            _logger = logger;
            _Configure = configuration;
            apiUrl = _Configure.GetValue<string>("SneakerAPIUrl");
        }

        [HttpGet]
        public async Task<ActionResult> Index()
        {
            List<Catalog> catalogs = new List<Catalog>();
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri(apiUrl);
                HttpResponseMessage res = await client.GetAsync("/api/Catalog/GetAll");
                if (res.IsSuccessStatusCode)
                {
                    var result = res.Content.ReadAsStringAsync().Result;
                    catalogs = JsonConvert.DeserializeObject<List<Catalog>>(result);
                }
            }
            return View(catalogs);
        }

        [HttpGet]
        public async Task<ActionResult> Edit(int id)
        {
            Catalog catalog = new Catalog();
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri(apiUrl);
                HttpResponseMessage res = await client.GetAsync($"/api/Catalog/GetById/{id}");
                if (res.IsSuccessStatusCode)
                {
                    var result = res.Content.ReadAsStringAsync().Result;
                    var dataJson = (JArray)JsonConvert.DeserializeObject(result);
                    catalog.CatalogID = (int)dataJson.First["catalogID"];
                    catalog.CatalogName = (string)dataJson.First["catalogName"];
                    catalog.Status = (int)dataJson.First["status"];
                }
            }
            return View(catalog);
        }

        [HttpPost]
        public async Task<ActionResult> Edit(Catalog catalog)
        {
            using (var client = new HttpClient())
            {
                StringContent content = new StringContent(JsonConvert.SerializeObject(catalog), Encoding.UTF8, "application/json");
                client.BaseAddress = new Uri(apiUrl);
                HttpResponseMessage res = await client.PutAsync("/api/Catalog/Update", content);
            }
            return RedirectToAction("Index");
        }

        [HttpDelete]
        public async Task<ActionResult> Delete(int id)
        {
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri(apiUrl);
                HttpResponseMessage res = await client.DeleteAsync($"/api/Catalog/Delete/{id}");
                if (res.IsSuccessStatusCode)
                {
                    var result = res.Content.ReadAsStringAsync();
                    var a = result.Result;
                }
            }
            return RedirectToAction("Index");
        }


        //[HttpGet]
        //public async Task<IActionResult> GetAll()
        //{
        //    using (HttpClient client = new HttpClient())
        //    {
        //        string endpoint = apiUrl + "/api/Catalog/GetAll";
        //        using (var Response = await client.GetAsync(endpoint))
        //        {
        //            if (Response.StatusCode == System.Net.HttpStatusCode.OK)
        //            {
        //                var result = Response.Content.ReadAsStringAsync().Result;
        //                return Json(result);
        //            }
        //            else
        //            {
        //                return null;
        //            }
        //        }
        //    }
        //}
    }
}
