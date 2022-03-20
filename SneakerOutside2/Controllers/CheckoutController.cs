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
    public class CheckoutController : Controller
    {
        private readonly string apiBaseUrl;
        public CheckoutController(IConfiguration configuration)
        {
            apiBaseUrl = configuration.GetValue<string>("SneakerAPIUrl");
        }

        public IActionResult Index()
        {
            UserInfo userInfo = new UserInfo();
            var sessionUserMember = HttpContext.Session.GetString("UserMember");
            if (sessionUserMember != null)
            {
                UserMember userMember = JsonConvert.DeserializeObject<UserMember>(sessionUserMember);
                userInfo = new UserInfo()
                {
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
            List<CartItem> cartList = new List<CartItem>();
            var sessionCart = HttpContext.Session.GetString("Cart");
            if (sessionCart != null)
            {
                cartList = JsonConvert.DeserializeObject<List<CartItem>>(sessionCart);
            }
            var orderDetailInfo = new List<OrderDetailInfo>();
            foreach (var item in cartList)
            {
                orderDetailInfo.Add(new OrderDetailInfo()
                {
                    ProductItemID = item.ProductItemID,
                    PriceBuy = item.Price,
                    AmountBuy = item.AmountBuy
                });
            }

            var checkOutAction = new CheckOutAction()
            {
                UserInfo = checkOutView.UserInfo,
                OrderInfo = checkOutView.OrderInfo,
                OrderDetailInfo = orderDetailInfo
            };

            if (ModelState.IsValid)
            {
                Error error = new Error();
                using (var httpClient = new HttpClient())
                {
                    StringContent content = new StringContent(JsonConvert.SerializeObject(checkOutAction), Encoding.UTF8, "application/json");
                    using (var response = await httpClient.PostAsync(apiBaseUrl + "/api/OSCheckout/Checkout", content))
                    {
                        if (response.IsSuccessStatusCode)
                        {
                            string apiResponse = await response.Content.ReadAsStringAsync();
                            error = JsonConvert.DeserializeObject<Error>(apiResponse);
                            if(error.ErrorMessage == "")
                            {
                                HttpContext.Session.Remove("Cart");
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
    }
}
