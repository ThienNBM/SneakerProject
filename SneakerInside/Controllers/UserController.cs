using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using SneakerInside.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;

namespace SneakerInside.Controllers
{
    public class UserController : Controller
    {
        private readonly ILogger<UserController> _logger;
        private readonly IConfiguration _Configure;
        private readonly string apiBaseUrl;
        public UserController(ILogger<UserController> logger, IConfiguration configuration)
        {
            _logger = logger;
            _Configure = configuration;
            apiBaseUrl = _Configure.GetValue<string>("SneakerAPIUrl");
        }

        readonly string Name = "khách hàng";

        public async Task<IActionResult> Index()
        {
            List<UserGetAll> users = new List<UserGetAll>();
            using (var httpClient = new HttpClient())
            {
                using (var response = await httpClient.GetAsync(apiBaseUrl + "/api/User/GetAll"))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        string apiResponse = await response.Content.ReadAsStringAsync();
                        users = JsonConvert.DeserializeObject<List<UserGetAll>>(apiResponse);
                    }
                }
            }
            ViewBag.Name = Name;
            return View(users);
        }
    }
}
