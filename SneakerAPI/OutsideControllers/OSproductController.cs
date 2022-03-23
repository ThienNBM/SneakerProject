using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using SneakerAPI.OutsideModel;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SneakerAPI.OutsideControllers
{
    [ApiExplorerSettings(IgnoreApi = true)]
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
        [Route("GetAllCatalog")]
        public async Task<ActionResult<IEnumerable<ProductGetAllCatalog>>> GetAllCatalog()
        {
            string StoredProc = "exec OS_Product_GetAllCatalog @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            List<ProductGetAllCatalog> result;
            try
            {
                result = await context.ProductGetAllCatalog.FromSqlRaw(StoredProc, ErrorCode, ErrorMessage).ToListAsync();
            }
            catch
            {
                result = null;
            }
            return result;
        }
        
        [HttpGet]
        [Route("GetAllSubCatalog")]
        public async Task<ActionResult<IEnumerable<ProductGetAllSubCatalog>>> GetAllSubCatalog()
        {
            string StoredProc = "exec OS_Product_GetAllSubCatalog @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            List<ProductGetAllSubCatalog> result;
            try
            {
                result = await context.ProductGetAllSubCatalog.FromSqlRaw(StoredProc, ErrorCode, ErrorMessage).ToListAsync();
            }
            catch
            {
                result = null;
            }
            return result;
        }

        [HttpPost]
        [Route("FilterProduct")]
        public async Task<ActionResult<IEnumerable<ProductGetAll>>> FilterProduct(ProductFilterProduct item)
        {
            string StoredProc = "exec OS_Product_FilterProduct @CatalogID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var CatalogID = new SqlParameter("@CatalogID", item.CatalogID);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            List<ProductGetAll> result;
            try
            {
                result = await context.ProductGetAll.FromSqlRaw(StoredProc, CatalogID, ErrorCode, ErrorMessage).ToListAsync();
            }
            catch
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
            List<ProductGetInfo> result;
            try
            {
                result = await context.ProductGetInfo.FromSqlRaw(StoredProc, ProductID, ErrorCode, ErrorMessage).ToListAsync();
            }
            catch(Exception ex)
            {
                result = null;
            }
            return result;
        }

        [HttpGet]
        [Route("GetSize/{id}")]
        public async Task<ActionResult<IEnumerable<ProductGetSize>>> GetSize(int id)
        {
            string StoredProc = "exec OS_Product_GetSize @ProductID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var ProductID = new SqlParameter("@ProductID", id);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            List<ProductGetSize> result;
            try
            {
                result = await context.ProductGetSize.FromSqlRaw(StoredProc, ProductID, ErrorCode, ErrorMessage).ToListAsync();
            }
            catch
            {
                result = null;
            }
            return result;
        }

        [HttpGet]
        [Route("GetImage/{id}")]
        public async Task<ActionResult<IEnumerable<ProductGetImage>>> GetImage(int id)
        {
            string StoredProc = "exec OS_Product_GetImage @ProductID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var ProductID = new SqlParameter("@ProductID", id);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            List<ProductGetImage> result;
            try
            {
                result = await context.ProductGetImage.FromSqlRaw(StoredProc, ProductID, ErrorCode, ErrorMessage).ToListAsync();
            }
            catch
            {
                result = null;
            }
            return result;
        }

        [HttpGet]
        [Route("GetProductItem/{ProductID}/{SizeID}")]
        public async Task<ActionResult<IEnumerable<ProductGetProductItem>>> GetProductItem(int ProductID, int SizeID)
        {
            string StoredProc = "exec OS_Product_GetProductItem @ProductID, @SizeID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var productID = new SqlParameter("@ProductID", ProductID);
            var sizeID = new SqlParameter("@SizeID", SizeID);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            List<ProductGetProductItem> result;
            try
            {
                result = await context.ProductGetProductItem.FromSqlRaw(StoredProc, productID, sizeID, ErrorCode, ErrorMessage).ToListAsync();
            }
            catch
            {
                result = null;
            }
            return result;
        }
    }
}
