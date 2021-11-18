using SneakerInsideAPI.Models;
using System;
using System.Collections.Generic;
using System.Data.Objects;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SneakerInsideAPI.Controllers
{
    public class HomeController : BaseController
    {
        public ActionResult Index()
        {
            //var param1 = new ObjectParameter("ErrorCode", typeof(String));
            //var param2 = new ObjectParameter("ErrorMessage", typeof(String));
            //var catalog = DbContext.Catalog_GetAll(param1, param2).ToList();
            //return Json(catalog, JsonRequestBehavior.AllowGet);

            var catalogID = 2;
            var ErrorCode = new ObjectParameter("ErrorCode", typeof(String));
            var ErrorMessage = new ObjectParameter("ErrorMessage", typeof(String));
            var catalogByID = DbContext.Catalog_GetItemById(catalogID, ErrorCode, ErrorMessage).ToList();
            return Json(catalogByID, JsonRequestBehavior.AllowGet);
        }
    }
}
