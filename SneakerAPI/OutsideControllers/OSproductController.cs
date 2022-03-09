using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using SneakerAPI.OutsideModel;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SneakerAPI.OutsideControllers
{
    //[ApiExplorerSettings(IgnoreApi = true)]
    [Route("api/[controller]")]
    [ApiController]
    public class OSproductController : Controller
    {
        private readonly OSdbContext context;

        public OSproductController(OSdbContext context)
        {
            this.context = context;
        }

        [HttpGet]
        [Route("GetAll")]
        public async Task<ActionResult<IEnumerable<ProductGetAll>>> GetAll()
        {
            string StoredProc = "exec OS_Product_GetAll @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            List<ProductGetAll> result;
            try
            {
                result = await context.ProductGetAll.FromSqlRaw(StoredProc, ErrorCode, ErrorMessage).ToListAsync();
            }
            catch (Exception ex)
            {
                result = null;
            }
            return result;
        }

        [HttpGet]
        [Route("GetInfo/{id}")]
        public async Task<ActionResult<IEnumerable<ProductGetInfo>>> GetInfo(int id)
        {
            string StoredProc = "exec OS_Product_GetInfo @ProductID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var ProductID = new SqlParameter("@ProductID", id);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            List<ProductGetInfo> products;
            try
            {
                products = await context.ProductGetInfo.FromSqlRaw(StoredProc, ProductID, ErrorCode, ErrorMessage).ToListAsync();
            }
            catch(Exception ex)
            {
                products = null;
            }
            return products;
        }

        [HttpGet]
        [Route("GetSize/{id}")]
        public async Task<ActionResult<IEnumerable<ProductGetSize>>> GetSize(int id)
        {
            string StoredProc = "exec OS_Product_GetSize @ProductID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var ProductID = new SqlParameter("@ProductID", id);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            List<ProductGetSize> sizes;
            try
            {
                sizes = await context.ProductGetSize.FromSqlRaw(StoredProc, ProductID, ErrorCode, ErrorMessage).ToListAsync();
            }
            catch
            {
                sizes = null;
            }
            return sizes;
        }

        [HttpGet]
        [Route("GetImage/{id}")]
        public async Task<ActionResult<IEnumerable<ProductGetImage>>> GetImage(int id)
        {
            string StoredProc = "exec OS_Product_GetImage @ProductID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var ProductID = new SqlParameter("@ProductID", id);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            List<ProductGetImage> images;
            try
            {
                images = await context.ProductGetImage.FromSqlRaw(StoredProc, ProductID, ErrorCode, ErrorMessage).ToListAsync();
            }
            catch
            {
                images = null;
            }
            return images;
        }
    }
}
