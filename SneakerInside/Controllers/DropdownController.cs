using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using SneakerInside.Models;
using System.Collections.Generic;
using System.Net.Http;
using System.Threading.Tasks;

namespace SneakerInside.Controllers
{
    public class DropdownController : Controller
    {
        private readonly string apiBaseUrl;

        public DropdownController(string apiBaseUrl)
        {
            this.apiBaseUrl = apiBaseUrl;
        }

        public async Task<SelectList> ListCatalog()
        {
            List<ListCatalog> listCatalog = new List<ListCatalog>();
            using (var httpClient = new HttpClient())
            {
                using (var response = await httpClient.GetAsync(apiBaseUrl + "/api/Catalog/GetAll"))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        string apiResponse = await response.Content.ReadAsStringAsync();
                        listCatalog = JsonConvert.DeserializeObject<List<ListCatalog>>(apiResponse);
                    }
                }
            }
            var dropDownCatalog = new SelectList(listCatalog, "CatalogID", "CatalogName");
            return dropDownCatalog;
        }
    }
}
