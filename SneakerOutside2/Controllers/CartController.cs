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

        readonly Error error = new Error();

        //Thêm sản phẩm vào giỏ hàng
        public async Task<IActionResult> AddCart(int ProductID, int SizeID)
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
            List<CartItem> cartList = new List<CartItem>();
            if (sessionCart != null)
            {
                cartList = JsonConvert.DeserializeObject<List<CartItem>>(sessionCart);
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

            var cartitem = cartList.Find(x => x.ProductID == ProductID && x.SizeID == SizeID);
            if (cartitem == null)
            {
                error.ErrorCode = "0";
                error.ErrorMessage = "Thêm sản phẩm vào giỏ hàng thành công";
                cartList.Add(cartItem);
            }
            else
            {
                error.ErrorCode = "1";
                error.ErrorMessage = "Sản phẩm đã được thêm vào giỏ hàng";
            }

            HttpContext.Session.SetString("Cart", JsonConvert.SerializeObject(cartList));

            return Json(error);
        }

        //Hiển thị giỏ hàng
        public IActionResult Index()
        {
            List<CartItem> cartList = new List<CartItem>();
            var sessionCart = HttpContext.Session.GetString("Cart");
            if (sessionCart != null)
            {
                cartList = JsonConvert.DeserializeObject<List<CartItem>>(sessionCart);
            }
            return View(cartList);
        }

        //Cập nhật số lượng sản phẩm trong giỏ hàng
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
            }

            HttpContext.Session.SetString("Cart", JsonConvert.SerializeObject(cartList));

            return Ok();
        }

        //Xóa sản phẩm trong giỏ hàng
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

            return RedirectToAction("Index", "Cart");
        }
    }
}
