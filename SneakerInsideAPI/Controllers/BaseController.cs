using SneakerInsideAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SneakerInsideAPI.Controllers
{
    public class BaseController : Controller
    {
        private SneakerDBEntities _dbContext;
        protected SneakerDBEntities DbContext
        {
            get
            {
                if (_dbContext == null)
                {
                    _dbContext = new SneakerDBEntities();
                }
                return _dbContext;
            }
        }
    }
}