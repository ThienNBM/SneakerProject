using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using SneakerOutside2.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;

namespace SneakerOutside2.Controllers
{
    public class CartController : Controller
    {
        private readonly string apiBaseUrl;
        public CartController(IConfiguration configuration)
        {
            apiBaseUrl = configuration.GetValue<string>("SneakerAPIUrl");
        }

        public IActionResult Index()
        {
            return View();
        }

        public async Task<IActionResult> AddToCart(int ProductID, int SizeID)
        {
            //Lấy thông tin hàng theo productID và sizeID
            var productInfo = new CartProductInfo();
            using (var httpClient = new HttpClient())
            {
                using (var response = await httpClient.GetAsync(apiBaseUrl + $"/api/OScart/GetProductInfo/{ProductID}/{SizeID}"))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        string apiResponse = await response.Content.ReadAsStringAsync();
                        productInfo = JsonConvert.DeserializeObject<List<CartProductInfo>>(apiResponse)[0];
                    }
                }
            }

            //Xử lý giỏ hàng
            var sessionCart = HttpContext.Session.GetString("Cart");
            List<CartItem> CartList = new List<CartItem>();
            if (sessionCart != null)
            {
                CartList = JsonConvert.DeserializeObject<List<CartItem>>(sessionCart);
            }

            if (CartList.Any(x => x.ProductID == ProductID && x.SizeID == SizeID))
            {
                ViewBag.errormessage = "Sản phẩm đã tồn tại";
            }

            CartItem cartItem = new CartItem()
            {
                ProductItemID = productInfo.ProductItemID,
                Image = productInfo.Image,
                ProductID = productInfo.ProductID,
                ProductName = productInfo.ProductName,
                SizeID = productInfo.SizeID,
                SizeName = productInfo.SizeName,
                Price = productInfo.Price,
                AmountStock = productInfo.AmountStock,
                AmountBuy = 1
            };

            CartList.Add(cartItem);

            HttpContext.Session.SetString("Cart", JsonConvert.SerializeObject(CartList));

            return Ok();
        }
    }
}
