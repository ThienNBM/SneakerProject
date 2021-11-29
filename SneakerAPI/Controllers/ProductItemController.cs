using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using SneakerAPI;
using SneakerAPI.Models;

namespace SneakerAPI.Controllers
{
    [ApiExplorerSettings(IgnoreApi = true)]
    [Route("api/[controller]")]
    [ApiController]
    public class ProductItemController : ControllerBase
    {
        private readonly SneakerAPIDBContext _context;

        public ProductItemController(SneakerAPIDBContext context)
        {
            _context = context;
        }

        [HttpGet("GetAll")]
        public async Task<ActionResult<IEnumerable<ProductItemGetAll>>> GetAll()
        {
            string StoredProc = "exec ProductItem_GetAll @ErrorCode OUTPUT, @ErrorMessage OUTPUT";

            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };

            return await _context.ProductItemGetAll.FromSqlRaw(StoredProc, ErrorCode, ErrorMessage).ToListAsync();
        }

        [HttpGet("GetById/{id}")]
        public async Task<ActionResult<IEnumerable<ProductItemGetById>>> GetById(int id)
        {
            string StoredProc = "exec ProductItem_GetItemById @ProductItemID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";

            var ProductItemID = new SqlParameter("@ProductItemID", id);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };

            return await _context.ProductItemGetById.FromSqlRaw(StoredProc, ProductItemID, ErrorCode, ErrorMessage).ToListAsync();
        }

        [HttpPost("Insert")]
        public async Task<ActionResult<Error>> Insert(ProductItemInsert productItemInsert)
        {
            string StoredProc = "exec ProductItem_Insert @ProductID, @SizeID, @AmountStock, @Status, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";

            var ProductID = new SqlParameter("@ProductID", productItemInsert.ProductID);
            var SizeID = new SqlParameter("@SizeID", productItemInsert.SizeID);
            var AmountStock = new SqlParameter("@AmountStock", productItemInsert.AmountStock);
            var Status = new SqlParameter("@Status", productItemInsert.Status);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };

            await _context.Database.ExecuteSqlRawAsync(StoredProc, ProductID, SizeID, AmountStock, Status, ErrorCode, ErrorMessage);

            var error = new Error();
            error.ErrorCode = ErrorCode.Value.ToString();
            error.ErrorMessage = ErrorMessage.Value.ToString();
            return error;
        }

        [HttpPut("Update/{id}")]
        public async Task<ActionResult<Error>> Update(int id, ProductItemUpdate productItemUpdate)
        {
            string StoredProc = "exec ProductItem_Update @ProductItemID, @ProductID, @SizeID, @AmountStock, @Status, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";

            var ProductItemID = new SqlParameter("@ProductItemID", id);
            var ProductID = new SqlParameter("@ProductID", productItemUpdate.ProductID);
            var SizeID = new SqlParameter("@SizeID", productItemUpdate.SizeID);
            var AmountStock = new SqlParameter("@AmountStock", productItemUpdate.AmountStock);
            var Status = new SqlParameter("@Status", productItemUpdate.Status);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };

            await _context.Database.ExecuteSqlRawAsync(StoredProc, ProductItemID, ProductID, SizeID, AmountStock, Status, ErrorCode, ErrorMessage);

            var error = new Error();
            error.ErrorCode = ErrorCode.Value.ToString();
            error.ErrorMessage = ErrorMessage.Value.ToString();
            return error;
        }

        [HttpDelete("Delete/{id}")]
        public async Task<ActionResult<Error>> Delete(int id)
        {
            string StoredProc = "exec ProductItem_Delete @ProductItemID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";

            var ProductItemID = new SqlParameter("@ProductItemID", id);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };

            await _context.Database.ExecuteSqlRawAsync(StoredProc, ProductItemID, ErrorCode, ErrorMessage);

            var error = new Error();
            error.ErrorCode = ErrorCode.Value.ToString();
            error.ErrorMessage = ErrorMessage.Value.ToString();
            return error;
        }
    }
}
