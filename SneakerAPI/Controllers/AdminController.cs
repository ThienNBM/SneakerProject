using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using SneakerAPI.Model;
using SneakerAPI.Repository;
using SneakerAPI.Utility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SneakerAPI.Controllers
{
    [Produces("application/json")]
    [Route("api/Admin")]
    public class AdminController : Controller
    {
        private readonly IOptions<MySettingsModel> appSettings;

        public AdminController(IOptions<MySettingsModel> app)
        {
            appSettings = app;
        }

        [HttpGet]
        [Route("GetAllAdmin")]
        public IActionResult GetAllAdmin()
        {
            var data = DbClientFactory<AdminDB>.Instance.GetAll(appSettings.Value.DbConn);
            return Ok(data);
        }

        [HttpPost]
        [Route("CreateAdmin")]
        public IActionResult CreateAdmin([FromBody] AdminModel model)
        {
            var msg = new Message<AdminModel>();
            var data = DbClientFactory<AdminDB>.Instance.CreateAdmin(model, appSettings.Value.DbConn);
            if (data == "C200")
            {
                msg.IsSuccess = true;
                msg.ReturnMessage = "User saved successfully";
            }
            else if (data == "C201")
            {
                msg.IsSuccess = false;
                msg.ReturnMessage = "Email Id already exists";
            }
            else if (data == "C202")
            {
                msg.IsSuccess = false;
                msg.ReturnMessage = "Mobile Number already exists";
            }
            return Ok(msg);
        }
    }
}
