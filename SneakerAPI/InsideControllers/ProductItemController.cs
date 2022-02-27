using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using SneakerAPI.InsideModels;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SneakerAPI.InsideControllers
{
    //[ApiExplorerSettings(IgnoreApi = true)]
    [Route("api/[controller]")]
    [ApiController]
    public class ProductItemController : ControllerBase
    {
        private readonly ISdbContext _context;

        public ProductItemController(ISdbContext context)
        {
            _context = context;
        }

        [HttpGet]
        [Route("GetAll")]
        public async Task<ActionResult<IEnumerable<ProductItemGetAll>>> GetAll()
        {
            string StoredProc = "exec ProductItem_GetAll @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            List<ProductItemGetAll> productItems;
            try
            {
                productItems = await _context.ProductItemGetAll.FromSqlRaw(StoredProc, ErrorCode, ErrorMessage).ToListAsync();
            }
            catch (Exception ex)
            {
                productItems = null;
            }
            return productItems;
        }

        [HttpPost]
        [Route("Insert")]
        public async Task<ActionResult<Error>> Insert(ProductItemInsert model)
        {
            string StoredProc = "exec ProductItem_Insert @ProductID, @SizeID, @AmountStock, @Price, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var ProductID = new SqlParameter("@ProductID", model.ProductID);
            var SizeID = new SqlParameter("@SizeID", model.SizeID);
            var AmountStock = new SqlParameter("@AmountStock", model.AmountStock);
            var Price = new SqlParameter("@Price", model.Price);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            Error error = new Error();
            try
            {
                await _context.Database.ExecuteSqlRawAsync(StoredProc, ProductID, SizeID, AmountStock, Price, ErrorCode, ErrorMessage);
                error.ErrorCode = ErrorCode.Value.ToString();
                error.ErrorMessage = ErrorMessage.Value.ToString();
            }
            catch (Exception ex)
            {
                error.ErrorCode = "API_ERROR";
                error.ErrorMessage = ex.Message;
            };
            return error;
        }

        [HttpGet]
        [Route("GetById/{id}")]
        public async Task<ActionResult<IEnumerable<ProductItemGetAndUpdate>>> GetById(int id)
        {
            string StoredProc = "exec ProductItem_GetItemById @ProductItemID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var ProductItemID = new SqlParameter("@ProductItemID", id);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            List<ProductItemGetAndUpdate> productItems;
            try
            {
                productItems = await _context.ProductItemGetAndUpdate.FromSqlRaw(StoredProc, ProductItemID, ErrorCode, ErrorMessage).ToListAsync();
            }
            catch (Exception ex)
            {
                productItems = null;
            }
            return productItems;
        }

        [HttpPut]
        [Route("Update")]
        public async Task<ActionResult<Error>> Update(ProductItemGetAndUpdate model)
        {
            string StoredProc = "exec ProductItem_Update @ProductItemID, @ProductID, @SizeID, @AmountStock, @Price, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var ProductItemID = new SqlParameter("@ProductItemID", model.ProductItemID);
            var ProductID = new SqlParameter("@ProductID", model.ProductID);
            var SizeID = new SqlParameter("@SizeID", model.SizeID);
            var AmountStock = new SqlParameter("@AmountStock", model.AmountStock);
            var Price = new SqlParameter("@Price", model.Price);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            Error error = new Error();
            try
            {
                await _context.Database.ExecuteSqlRawAsync(StoredProc, ProductItemID, ProductID, SizeID, AmountStock, Price, ErrorCode, ErrorMessage);
                error.ErrorCode = ErrorCode.Value.ToString();
                error.ErrorMessage = ErrorMessage.Value.ToString();
            }
            catch (Exception ex)
            {
                error.ErrorCode = "API_ERROR";
                error.ErrorMessage = ex.Message;
            };
            return error;
        }

        [HttpDelete]
        [Route("Delete/{id}")]
        public async Task<ActionResult<Error>> Delete(int id)
        {
            string StoredProc = "exec ProductItem_Delete @ProductItemID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var ProductItemID = new SqlParameter("@ProductItemID", id);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            Error error = new Error();
            try
            {
                await _context.Database.ExecuteSqlRawAsync(StoredProc, ProductItemID, ErrorCode, ErrorMessage);
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
