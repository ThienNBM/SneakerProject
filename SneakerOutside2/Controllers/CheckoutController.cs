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
    public class CheckoutController : Controller
    {
        private readonly string apiBaseUrl;
        IEmailService _emailService = null;
        public CheckoutController(IConfiguration configuration, IEmailService emailService)
        {
            _emailService = emailService;
            apiBaseUrl = configuration.GetValue<string>("SneakerAPIUrl");
        }

        Error error = new();

        public IActionResult Index()
        {
            UserInfo userInfo = new UserInfo();
            var sessionUserMember = HttpContext.Session.GetString("UserMember");
            if (sessionUserMember != null)
            {
                UserMember userMember = JsonConvert.DeserializeObject<UserMember>(sessionUserMember);
                userInfo = new UserInfo()
                {
                    UserID = userMember.UserID,
                    FullName = userMember.FullName,
                    Phone = userMember.Phone,
                    Email = userMember.Email,
                    Address = userMember.Address
                };
            }

            CheckOutView checkoutView = new CheckOutView()
            {
                UserInfo = userInfo
            };

            return View(checkoutView);
        }

        //Lấy danh sách giỏ hàng từ session
        [HttpGet]
        public IActionResult GetCartList()
        {
            List<CartItem> cartList = new List<CartItem>();
            var sessionCart = HttpContext.Session.GetString("Cart");
            if (sessionCart != null)
            {
                cartList = JsonConvert.DeserializeObject<List<CartItem>>(sessionCart);
            }
            return Json(new { data = cartList });
        }

        //Cập nhật số lượng sản phẩm trong giỏ hàng
        [HttpPost]
        public IActionResult UpdateCart(int productItemId, int amountBuy)
        {
            List<CartItem> cartList = new List<CartItem>();
            var sessionCart = HttpContext.Session.GetString("Cart");
            if (sessionCart != null)
            {
                cartList = JsonConvert.DeserializeObject<List<CartItem>>(sessionCart);
            }

            var cartitem = cartList.Find(x => x.ProductItemID == productItemId);
            if (cartitem != null)
            {
                cartitem.AmountBuy = amountBuy;
                cartitem.Total = cartitem.AmountBuy * cartitem.Price;
            }

            HttpContext.Session.SetString("Cart", JsonConvert.SerializeObject(cartList));

            return Ok();
        }

        //Xóa sản phẩm trong giỏ hàng
        [HttpPost]
        public IActionResult RemoveCart(int productItemId)
        {
            List<CartItem> cartList = new List<CartItem>();
            var sessionCart = HttpContext.Session.GetString("Cart");
            if (sessionCart != null)
            {
                cartList = JsonConvert.DeserializeObject<List<CartItem>>(sessionCart);
            }

            var cartitem = cartList.Find(x => x.ProductItemID == productItemId);
            if (cartitem != null)
            {
                cartList.Remove(cartitem);
            }

            HttpContext.Session.SetString("Cart", JsonConvert.SerializeObject(cartList));

            return Ok();
        }

        //Thực hiện thanh toán
        [HttpPost]
        public async Task<IActionResult> Checkout(CheckOutView checkOutView)
        {
            var sessionCart = HttpContext.Session.GetString("Cart");
            if (sessionCart != null)
            {
                List<CartItem> cartList = JsonConvert.DeserializeObject<List<CartItem>>(sessionCart);
                if (cartList.Count > 0)
                {
                    List<OrderDetailInfo> orderDetailInfo = new();
                    foreach (var item in cartList)
                    {
                        orderDetailInfo.Add(new OrderDetailInfo()
                        {
                            ProductItemID = item.ProductItemID,
                            PriceBuy = item.Price,
                            AmountBuy = item.AmountBuy
                        });
                    }

                    OrderInfo orderInfo = new OrderInfo
                    {
                        UserID = checkOutView.UserInfo.UserID,
                        Note = checkOutView.OrderInfo.Note
                    };

                    var checkOutAction = new CheckOutAction()
                    {
                        UserInfo = checkOutView.UserInfo,
                        OrderInfo = orderInfo,
                        OrderDetailInfo = orderDetailInfo
                    };

                    if (ModelState.IsValid)
                    {
                        using (var httpClient = new HttpClient())
                        {
                            StringContent content = new StringContent(JsonConvert.SerializeObject(checkOutAction), Encoding.UTF8, "application/json");
                            var sessionUserMember = HttpContext.Session.GetString("UserMember");
                            if (sessionUserMember != null)
                            {
                                using (var response = await httpClient.PostAsync(apiBaseUrl + "/api/OSCheckout/CheckoutUserMember", content))
                                {
                                    if (response.IsSuccessStatusCode)
                                    {
                                        string apiResponse = await response.Content.ReadAsStringAsync();
                                        error = JsonConvert.DeserializeObject<Error>(apiResponse);
                                        if (error.ErrorCode == "0")
                                        {
                                            error.ErrorMessage = "Thanh toán thành công";

                                            EmailCheckout emailCheckout = new EmailCheckout()
                                            {
                                                EmailToId = checkOutView.UserInfo.Email,
                                                EmailToName = checkOutView.UserInfo.FullName
                                            };
                                            _emailService.SendEmailCheckout(emailCheckout);

                                            HttpContext.Session.Remove("Cart");
                                        }
                                    }
                                }
                            }
                            else
                            {
                                using (var response = await httpClient.PostAsync(apiBaseUrl + "/api/OSCheckout/CheckoutUserNormal", content))
                                {
                                    if (response.IsSuccessStatusCode)
                                    {
                                        string apiResponse = await response.Content.ReadAsStringAsync();
                                        error = JsonConvert.DeserializeObject<Error>(apiResponse);
                                        if (error.ErrorCode == "0")
                                        {
                                            error.ErrorMessage = "Thanh toán thành công";

                                            EmailCheckout emailCheckout = new EmailCheckout()
                                            {
                                                EmailToId = checkOutView.UserInfo.Email,
                                                EmailToName = checkOutView.UserInfo.FullName
                                            };
                                            _emailService.SendEmailCheckout(emailCheckout);

                                            HttpContext.Session.Remove("Cart");
                                        }
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
                    error.ErrorMessage = "Giỏ hàng trống";
                    return Json(new { isValid = false, error });
                }
            }
            else
            {
                error.ErrorCode = "1";
                error.ErrorMessage = "Giỏ hàng trống";
                return Json(new { isValid = false, error });
            }
        }
    }
}
