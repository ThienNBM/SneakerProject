using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using SneakerOutside2.Models;
using System.Collections.Generic;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace SneakerOutside2.Controllers
{
    public class UserController : Controller
    {
        private readonly string apiBaseUrl;
        public UserController(IConfiguration configuration)
        {
            apiBaseUrl = configuration.GetValue<string>("SneakerAPIUrl");
        }

        public IActionResult LoginRegister()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Login(LoginRegister item)
        {
            Error error = new Error();
            if (ModelState.IsValid)
            {
                using (var httpClient = new HttpClient())
                {
                    StringContent content = new StringContent(JsonConvert.SerializeObject(item.Login), Encoding.UTF8, "application/json");
                    using (var response = await httpClient.PostAsync(apiBaseUrl + "/api/OSuser/Login", content))
                    {
                        if (response.IsSuccessStatusCode)
                        {
                            string apiResponse = await response.Content.ReadAsStringAsync();
                            List<UserMember> result = JsonConvert.DeserializeObject<List<UserMember>>(apiResponse);
                            if (result.Count == 0)
                            {
                                error.ErrorCode = "1";
                                error.ErrorMessage = "Tài khoản không tồn tại";
                            }
                            else
                            {
                                if (result[0].Password == item.Login.Password)
                                {
                                    error.ErrorCode = "0";
                                    error.ErrorMessage = "Đăng nhập thành công";

                                    HttpContext.Session.SetString("UserMember", JsonConvert.SerializeObject(result[0]));
                                }
                                else
                                {
                                    error.ErrorCode = "1";
                                    error.ErrorMessage = "Sai mật khẩu";
                                }
                            }
                        }
                    }
                }
                return Json(new { isValid = true, error });
            }
            else
            {
                return Json(new { isValid = false });
            }
        }

        [HttpPost]
        public async Task<IActionResult> Register(LoginRegister item)
        {
            Error error = new Error();
            if (ModelState.IsValid)
            {
                using (var httpClient = new HttpClient())
                {
                    StringContent content = new StringContent(JsonConvert.SerializeObject(item.Register), Encoding.UTF8, "application/json");
                    using (var response = await httpClient.PostAsync(apiBaseUrl + "/api/OSuser/Register", content))
                    {
                        if (response.IsSuccessStatusCode)
                        {
                            string apiResponse = await response.Content.ReadAsStringAsync();
                            List<UserMember> result = JsonConvert.DeserializeObject<List<UserMember>>(apiResponse);
                            if (result.Count == 0)
                            {
                                error.ErrorCode = "1";
                                error.ErrorMessage = "Email đã tồn tại";
                            }
                            else
                            {
                                error.ErrorCode = "0";
                                error.ErrorMessage = "Đăng ký thành công";

                                HttpContext.Session.SetString("UserMember", JsonConvert.SerializeObject(result[0]));
                            }
                        }
                    }
                }
                return Json(new { isValid = true, error });
            }
            else
            {
                return Json(new { isValid = false });
            }
        }
        
        public IActionResult Info()
        {
            return View();
        }
    }
}
