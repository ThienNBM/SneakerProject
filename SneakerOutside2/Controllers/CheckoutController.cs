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
        Error _error = new Error();

        public IActionResult Index()
        {
            //Lấy danh sách giỏ hàng từ session
            List<CartItem> cartList = new List<CartItem>();
            var sessionCart = HttpContext.Session.GetString("Cart");
            if (sessionCart != null)
            {
                cartList = JsonConvert.DeserializeObject<List<CartItem>>(sessionCart);
            }
            CheckOutView checkoutView = new CheckOutView()
            {
                CartList = cartList,
                UserInfo = new UserInfo(),
                OrderInfo = new OrderInfo()
            };

            return View(checkoutView);
        }

        [HttpPost]
        public async Task<IActionResult> Index(CheckOutView checkOutView)
        {
            List<CartItem> cartList = new List<CartItem>();
            var sessionCart = HttpContext.Session.GetString("Cart");
            if (sessionCart != null)
            {
                cartList = JsonConvert.DeserializeObject<List<CartItem>>(sessionCart);
            }
            var userInfo = checkOutView.UserInfo;
            var orderInfo = checkOutView.OrderInfo;
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
                UserInfo = userInfo,
                OrderInfo = orderInfo,
                OrderDetailInfo = orderDetailInfo
            };

            using (var httpClient = new HttpClient())
            {
                StringContent content = new StringContent(JsonConvert.SerializeObject(checkOutAction), Encoding.UTF8, "application/json");
                using (var response = await httpClient.PostAsync(apiBaseUrl + "/api/OSCheckout/Checkout", content))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        string apiResponse = await response.Content.ReadAsStringAsync();
                        _error = JsonConvert.DeserializeObject<Error>(apiResponse);
                        string errorCode = _error.ErrorCode;
                        string errorMesage = _error.ErrorMessage;
                    }
                }
            }

            ViewBag.success = "Thành công";
            return View();
        }
    }
}
