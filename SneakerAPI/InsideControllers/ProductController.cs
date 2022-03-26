using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using SneakerAPI.InsideModels;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SneakerAPI.InsideControllers
{
    [ApiExplorerSettings(IgnoreApi = true)]
    [Route("api/[controller]")]
    [ApiController]
    public class ProductController : ControllerBase
    {
        private readonly ISdbContext _context;
        public ProductController(ISdbContext context)
        {
            _context = context;
        }
        Error error = new();

        [HttpGet]
        [Route("GetAll")]
        public async Task<ActionResult<IEnumerable<ProductGetAll>>> GetAll()
        {
            string StoredProc = "exec IS_Product_GetAll @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            List<ProductGetAll> result = new();
            try
            {
                result = await _context.ProductGetAll.FromSqlRaw(StoredProc, ErrorCode, ErrorMessage).ToListAsync();
            }
            catch (Exception ex)
            {
                result = new();
            }
            return result;
        }

        [HttpGet]
        [Route("GetById/{id}")]
        public async Task<ActionResult<IEnumerable<ProductGetAndUpdate>>> GetById(int id)
        {
            string StoredProc = "exec IS_Product_GetItemById @ProductID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var ProductID = new SqlParameter("@ProductID", id);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            List<ProductGetAndUpdate> result = new();
            try
            {
                result = await _context.ProductGetAndUpdate.FromSqlRaw(StoredProc, ProductID, ErrorCode, ErrorMessage).ToListAsync();
            }
            catch (Exception ex)
            {
                result = new();
            }
            return result;
        }

        [HttpPost]
        [Route("Insert")]
        public async Task<ActionResult<Error>> Insert(ProductInsert productInsert)
        {
            string StoredProc = "exec IS_Product_Insert @ProductName, @Description, @Status, @CatalogID, @SubCatalogID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var ProductName = new SqlParameter("@ProductName", productInsert.ProductName);
            var Description = new SqlParameter("@Description", (object)productInsert.Description ?? DBNull.Value);
            var Status = new SqlParameter("@Status", productInsert.Status);
            var CatalogID = new SqlParameter("@CatalogID", productInsert.CatalogID);
            var SubCatalogID = new SqlParameter("@SubCatalogID", productInsert.SubCatalogID);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            try
            {
                await _context.Database.ExecuteSqlRawAsync(StoredProc, ProductName, Description, Status, CatalogID, SubCatalogID, ErrorCode, ErrorMessage);
                error.ErrorCode = ErrorCode.Value.ToString();
                error.ErrorMessage = ErrorMessage.Value.ToString();
            }
            catch (Exception ex)
            {
                error.ErrorCode = "API_ERROR";
                error.ErrorMessage = ex.Message;
            }
            return error;
        }

        [HttpPut]
        [Route("Update")]
        public async Task<ActionResult<Error>> Update(ProductGetAndUpdate productGetAndUpdate)
        {
            string StoredProc = "exec IS_Product_Update @ProductID, @ProductName, @Description, @Status, @CatalogID, @SubCatalogID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var ProductID = new SqlParameter("@ProductID", productGetAndUpdate.ProductID);
            var ProductName = new SqlParameter("@ProductName", productGetAndUpdate.ProductName);
            var Description = new SqlParameter("@Description", (object)productGetAndUpdate.Description ?? DBNull.Value);
            var Status = new SqlParameter("@Status", productGetAndUpdate.Status);
            var CatalogID = new SqlParameter("@CatalogID", productGetAndUpdate.CatalogID);
            var SubCatalogID = new SqlParameter("@SubCatalogID", productGetAndUpdate.SubCatalogID);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            try
            {
                await _context.Database.ExecuteSqlRawAsync(StoredProc, ProductID, ProductName, Description, Status, CatalogID, SubCatalogID, ErrorCode, ErrorMessage);
                error.ErrorCode = ErrorCode.Value.ToString();
                error.ErrorMessage = ErrorMessage.Value.ToString();
            }
            catch (Exception ex)
            {
                error.ErrorCode = "API_ERROR";
                error.ErrorMessage = ex.Message;
            }
            return error;
        }

        [HttpDelete]
        [Route("Delete/{id}")]
        public async Task<ActionResult<Error>> Delete(int id)
        {
            string StoredProc = "exec IS_Product_Delete @ProductID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var ProductID = new SqlParameter("@ProductID", id);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            try
            {
                await _context.Database.ExecuteSqlRawAsync(StoredProc, ProductID, ErrorCode, ErrorMessage);
                error.ErrorCode = ErrorCode.Value.ToString();
                error.ErrorMessage = ErrorMessage.Value.ToString();
            }
            catch (Exception ex)
            {
                error.ErrorCode = "API_ERROR";
                error.ErrorMessage = ex.Message;
            }
            return error;
        }
    }
}
