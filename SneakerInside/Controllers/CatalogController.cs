using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using SneakerInside.Helper;
using SneakerInside.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Json;
using System.Threading.Tasks;
using Newtonsoft.Json.Linq;
using System.Text;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Configuration;

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
        public IActionResult Index()
        {
            //List<Catalog> catalogs = new List<Catalog>();
            //HttpClient client = _api.Initial();
            //HttpResponseMessage res = await client.GetAsync("api/Catalog/GetAll");
            //if (res.IsSuccessStatusCode)
            //{
            //    var result = res.Content.ReadAsStringAsync().Result;

            //    catalogs = JsonConvert.DeserializeObject<List<Catalog>>(result);
            //}
            //ViewBag.ListCatalog = catalogs;
            return View();
        }

        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            using (HttpClient httpClient = new HttpClient())
            {
                string endpoint = apiUrl + "/api/Catalog/GetAll";
                using (var Response = await httpClient.GetAsync(endpoint))
                {
                    if (Response.StatusCode == System.Net.HttpStatusCode.OK)
                    {
                        var result = Response.Content.ReadAsStringAsync().Result;
                        return Json(result);
                    }
                    else
                    {
                        return null;
                    }
                }
            }     
        }
    }
}
