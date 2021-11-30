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

namespace SneakerInside.Controllers
{
    public class CatalogController : Controller
    {
        SneakerAPIUrl _api = new SneakerAPIUrl();

        public async Task<IActionResult> Index()
        {
            List<Catalog> catalogs = new List<Catalog>();
            HttpClient client = _api.Initial();
            HttpResponseMessage res = await client.GetAsync("api/Catalog/GetAll");
            if (res.IsSuccessStatusCode)
            {
                var result = res.Content.ReadAsStringAsync().Result;
                catalogs = JsonConvert.DeserializeObject<List<Catalog>>(result);
            }
            return View(catalogs);
        }

        // GET: CatalogController/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: CatalogController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create(Catalog catalog)
        {
            HttpClient client = _api.Initial();
            var postTask = client.PostAsJsonAsync<Catalog>("api/Catalog/Insert", catalog);
            postTask.Wait();

            var result = postTask.Result;
            if (result.IsSuccessStatusCode)
            {
                return RedirectToAction("Index");
            }
            return View();
        }

        public async Task<IActionResult> Edit(int id)
        {
            List<Catalog> catalogs = new List<Catalog>();
            HttpClient client = _api.Initial();
            HttpResponseMessage res = await client.GetAsync($"api/Catalog/Update/{id}");
            if (res.IsSuccessStatusCode)
            {
                var result = res.Content.ReadAsStringAsync().Result;
                catalogs = JsonConvert.DeserializeObject<List<Catalog>>(result);
            }
            return View(catalogs);
        }


        // POST: CatalogController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: CatalogController/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: CatalogController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }
    }
}
