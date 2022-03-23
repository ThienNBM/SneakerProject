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
    public class ProductController : Controller
    {
        private readonly string apiBaseUrl;
        public ProductController(IConfiguration configuration)
        {
            apiBaseUrl = configuration.GetValue<string>("SneakerAPIUrl");
        }

        //Hiển thị danh sách sản phẩm
        public async Task<IActionResult> Index()
        {
            List<ProductGetAll> products = new List<ProductGetAll>();
            using (var httpClient = new HttpClient())
            {
                using (var response = await httpClient.GetAsync(apiBaseUrl + "/api/OSproduct/GetAll"))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        string apiResponse = await response.Content.ReadAsStringAsync();
                        products = JsonConvert.DeserializeObject<List<ProductGetAll>>(apiResponse);
                    }
                }
            }

            List<ProductGetAllCatalog> catalogs = new();
            using (var httpClient = new HttpClient())
            {
                using var response = await httpClient.GetAsync(apiBaseUrl + "/api/OSproduct/GetAllCatalog");
                if (response.IsSuccessStatusCode)
                {
                    string apiResponse = await response.Content.ReadAsStringAsync();
                    catalogs = JsonConvert.DeserializeObject<List<ProductGetAllCatalog>>(apiResponse);
                }
            }
            
            List<ProductGetAllSubCatalog> subCatalogs = new();
            using (var httpClient = new HttpClient())
            {
                using var response = await httpClient.GetAsync(apiBaseUrl + "/api/OSproduct/GetAllSubCatalog");
                if (response.IsSuccessStatusCode)
                {
                    string apiResponse = await response.Content.ReadAsStringAsync();
                    subCatalogs = JsonConvert.DeserializeObject<List<ProductGetAllSubCatalog>>(apiResponse);
                }
            } 

            ViewBag.catalogs = catalogs;
            ViewBag.subCatalogs = subCatalogs;
            return View(products);
        }

        public async Task<ActionResult> FilterProduct(ProductFilterProduct item)
        {
            List<ProductGetAll> products = new List<ProductGetAll>();
            using (var httpClient = new HttpClient())
            {
                StringContent content = new StringContent(JsonConvert.SerializeObject(item), Encoding.UTF8, "application/json");
                using (var response = await httpClient.PostAsync(apiBaseUrl + "/api/OSproduct/FilterProduct", content))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        string apiResponse = await response.Content.ReadAsStringAsync();
                        products = JsonConvert.DeserializeObject<List<ProductGetAll>>(apiResponse);
                    }
                }
            }
            return Json(products);
        }

        //Chi tiết sản phẩm: hiển thị thông tin chi tiết
        public async Task<IActionResult> ProductDetail(int id)
        {
            //Lấy thông tin sản phẩm
            ProductGetInfo product = new ProductGetInfo();
            using (var httpClient = new HttpClient())
            {
                using (var response = await httpClient.GetAsync(apiBaseUrl + $"/api/OSproduct/GetInfo/{id}"))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        string apiResponse = await response.Content.ReadAsStringAsync();
                        product = JsonConvert.DeserializeObject<List<ProductGetInfo>>(apiResponse)[0];
                    }
                }
            }

            //Chi tiết sản phẩm: lấy danh sách size đang có của sản phẩm
            List<ProductGetSize> sizes = new List<ProductGetSize>();
            using (var httpClient = new HttpClient())
            {
                using (var response = await httpClient.GetAsync(apiBaseUrl + $"/api/OSproduct/GetSize/{id}"))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        string apiResponse = await response.Content.ReadAsStringAsync();
                        sizes = JsonConvert.DeserializeObject<List<ProductGetSize>>(apiResponse);
                    }
                }
            }

            //Chi tiết sản phẩm: lấy danh sách hình ảnh đang có của sản phẩm
            List<ProductGetImage> images = new List<ProductGetImage>();
            using (var httpClient = new HttpClient())
            {
                using (var response = await httpClient.GetAsync(apiBaseUrl + $"/api/OSproduct/GetImage/{id}"))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        string apiResponse = await response.Content.ReadAsStringAsync();
                        images = JsonConvert.DeserializeObject<List<ProductGetImage>>(apiResponse);
                    }
                }
            }

            ViewBag.listSizes = sizes;
            ViewBag.listImages = images;
            return View(product);
        }

        //Thêm sản phẩm vào session giỏ hàng
        public async Task<IActionResult> AddToCart(int ProductID, int SizeID)
        {
            Error error = new Error();

            //Lấy thông tin hàng theo productID và sizeID
            ProductGetProductItem productItem = new ProductGetProductItem();
            using (var httpClient = new HttpClient())
            {
                using (var response = await httpClient.GetAsync(apiBaseUrl + $"/api/OSproduct/GetProductItem/{ProductID}/{SizeID}"))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        string apiResponse = await response.Content.ReadAsStringAsync();
                        productItem = JsonConvert.DeserializeObject<List<ProductGetProductItem>>(apiResponse)[0];
                    }
                }
            }

            //Nếu có session giỏ hàng thì lấy ra danh sách từ session, nếu chưa có thì tạo mới danh sách giỏ hàng
            var sessionCart = HttpContext.Session.GetString("Cart");
            List<CartItem> cartList = new List<CartItem>();
            if (sessionCart != null)
            {
                cartList = JsonConvert.DeserializeObject<List<CartItem>>(sessionCart);
            }

            //Gán toàn bộ productItem vừa lấy được vào cartItem, số lượng bằng 1
            CartItem cartItem = new CartItem()
            {
                ProductItemID = productItem.ProductItemID,
                Image = productItem.Image,
                ProductID = productItem.ProductID,
                ProductName = productItem.ProductName,
                SizeID = productItem.SizeID,
                SizeName = productItem.SizeName,
                Price = productItem.Price,
                AmountStock = productItem.AmountStock,
                AmountBuy = 1,
                Total = productItem.Price * 1
            };

            //Kiểm tra trong danh sách giỏ hàng có tồn tại sản phẩm đó hay chưa và trả ra thông báo
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

            //Gán danh sách giỏ hàng vào session
            HttpContext.Session.SetString("Cart", JsonConvert.SerializeObject(cartList));

            return Json(error);
        }
    }
}
