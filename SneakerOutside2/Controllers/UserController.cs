using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using SneakerOutside2.Models;
using SneakerOutside2.Services;
using System.Collections.Generic;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace SneakerOutside2.Controllers
{
    public class UserController : Controller
    {
        private readonly string apiBaseUrl;
        IEmailService _emailService = null;
        public UserController(IConfiguration configuration, IEmailService emailService)
        {
            _emailService = emailService;
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

                                EmailRegister emailRegister = new EmailRegister()
                                {
                                    EmailToId = item.Register.Email,
                                    EmailToName = item.Register.FullName,
                                    EmailToPhone = item.Register.Phone
                                };
                                _emailService.SendEmailRegister(emailRegister);
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

        public IActionResult Index()
        {
            ChangeInfo changeInfo = new();
            ChangePass changePass = new();
            var sessionUserMember = HttpContext.Session.GetString("UserMember");
            if (sessionUserMember != null)
            {
                UserMember userMember = JsonConvert.DeserializeObject<UserMember>(sessionUserMember);
                changeInfo = new ChangeInfo()
                {
                    UserID = userMember.UserID,
                    FullName = userMember.FullName,
                    Phone = userMember.Phone,
                    Email = userMember.Email,
                    Address = userMember.Address
                };
                changePass = new ChangePass()
                {
                    UserID = userMember.UserID
                };

                ChangeInfoAndPass changeInfoAndPass = new ChangeInfoAndPass()
                {
                    ChangeInfo = changeInfo,
                    ChangePass = changePass
                };

                ViewBag.UserID = userMember.UserID;

                return View(changeInfoAndPass);
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }

        [HttpPost]
        public async Task<IActionResult> ChangeInfo(ChangeInfoAndPass item)
        {
            Error error = new Error();
            if (ModelState.IsValid)
            {
                using (var httpClient = new HttpClient())
                {
                    StringContent content = new StringContent(JsonConvert.SerializeObject(item.ChangeInfo), Encoding.UTF8, "application/json");
                    using (var response = await httpClient.PostAsync(apiBaseUrl + "/api/OSuser/ChangeInfo", content))
                    {
                        if (response.IsSuccessStatusCode)
                        {
                            string apiResponse = await response.Content.ReadAsStringAsync();
                            error = JsonConvert.DeserializeObject<Error>(apiResponse);
                            if (error.ErrorCode == "0")
                            {
                                error.ErrorMessage = "Thay đổi thông tin thành công";

                                var sessionUserMember = HttpContext.Session.GetString("UserMember");
                                UserMember userMember = JsonConvert.DeserializeObject<UserMember>(sessionUserMember);
                                UserMember userMemberTemp = new UserMember()
                                {
                                    UserID = item.ChangeInfo.UserID,
                                    FullName = item.ChangeInfo.FullName,
                                    Phone = item.ChangeInfo.Phone,
                                    Address = item.ChangeInfo.Address,
                                    Email = item.ChangeInfo.Email,
                                    Password = userMember.Password
                                };
                                HttpContext.Session.SetString("UserMember", JsonConvert.SerializeObject(userMemberTemp));
                            }
                        }
                    }
                }
                return Json(new { isValid = true, error });
            }
            else
            {
                error.ErrorCode = "1";
                error.ErrorMessage = "Dữ liệu không hợp lệ";
                return Json(new { isValid = false, error });
            }
        }

        [HttpPost]
        public async Task<IActionResult> ChangePassword(ChangeInfoAndPass item)
        {
            Error error = new Error();
            var sessionUserMember = HttpContext.Session.GetString("UserMember");
            UserMember userMember = JsonConvert.DeserializeObject<UserMember>(sessionUserMember);
            if (userMember.Password == item.ChangePass.OldPassword)
            {
                if (ModelState.IsValid)
                {
                    using (var httpClient = new HttpClient())
                    {
                        StringContent content = new StringContent(JsonConvert.SerializeObject(item.ChangePass), Encoding.UTF8, "application/json");
                        using (var response = await httpClient.PostAsync(apiBaseUrl + "/api/OSuser/ChangePassword", content))
                        {
                            if (response.IsSuccessStatusCode)
                            {
                                string apiResponse = await response.Content.ReadAsStringAsync();
                                error = JsonConvert.DeserializeObject<Error>(apiResponse);
                                if (error.ErrorCode == "0")
                                {
                                    error.ErrorMessage = "Thay đổi mật khẩu thành công";

                                    HttpContext.Session.Remove("UserMember");
                                }
                            }
                        }
                    }
                    return Json(new { isValid = true, error });
                }
                else
                {
                    error.ErrorCode = "1";
                    error.ErrorMessage = "Dữ liệu không hợp lệ";
                    return Json(new { isValid = false, error });
                }
            }
            else
            {
                error.ErrorCode = "1";
                error.ErrorMessage = "Mật khẩu cũ không đúng";
                return Json(new { isValid = false, error });
            }    
        }

        [HttpGet]
        public async Task<ActionResult> GetOrderById(int id)
        {
            List<UserGetOrderById> orders = new();
            using (var httpClient = new HttpClient())
            {
                using var response = await httpClient.GetAsync(apiBaseUrl + $"/api/OSuser/GetOrderById/{id}");
                if (response.IsSuccessStatusCode)
                {
                    string apiResponse = await response.Content.ReadAsStringAsync();
                    orders = JsonConvert.DeserializeObject<List<UserGetOrderById>>(apiResponse);
                }
            }
            return Json(new { data = orders });
        }

        [HttpGet]
        public async Task<ActionResult> GetOrderDetailById(int id)
        {
            List<UserGetOrderDetailById> orderDetails = new();
            using (var httpClient = new HttpClient())
            {
                using (var response = await httpClient.GetAsync(apiBaseUrl + $"/api/OSuser/GetOrderDetailById/{id}"))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        string apiResponse = await response.Content.ReadAsStringAsync();
                        orderDetails = JsonConvert.DeserializeObject<List<UserGetOrderDetailById>>(apiResponse);
                    }
                }
            }
            return Json(new { data = orderDetails });
        }

        [HttpPost]
        public async Task<IActionResult> DestroyOrder(UserDestroyOrder item)
        {
            Error error = new Error();
            using (var httpClient = new HttpClient())
            {
                StringContent content = new StringContent(JsonConvert.SerializeObject(item), Encoding.UTF8, "application/json");
                using (var response = await httpClient.PostAsync(apiBaseUrl + "/api/OSuser/DestroyOrder", content))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        string apiResponse = await response.Content.ReadAsStringAsync();
                        error = JsonConvert.DeserializeObject<Error>(apiResponse);
                    }
                }
            }
            return Json(new { isValid = true, error });
        }

        [HttpGet]
        public ActionResult Logout()
        {
            HttpContext.Session.Remove("UserMember");

            return RedirectToAction("Index", "Home");
        }
    }
}
