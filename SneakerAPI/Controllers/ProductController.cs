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
    public class ProductController : ControllerBase
    {
        private readonly SneakerAPIDBContext _context;

        public ProductController(SneakerAPIDBContext context)
        {
            _context = context;
        }

        [HttpGet("GetAll")]
        public async Task<ActionResult<IEnumerable<ProductGetAll>>> GetAll()
        {
            string StoredProc = "exec Product_GetAll @ErrorCode OUTPUT, @ErrorMessage OUTPUT";

            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };

            return await _context.ProductGetAll.FromSqlRaw(StoredProc, ErrorCode, ErrorMessage).ToListAsync();
        }

        [HttpGet("GetById/{id}")]
        public async Task<ActionResult<IEnumerable<ProductGetById>>> GetById(int id)
        {
            string StoredProc = "exec Product_GetItemById @ProductID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";

            var ProductID = new SqlParameter("@ProductID", id);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };

            return await _context.ProductGetById.FromSqlRaw(StoredProc, ProductID, ErrorCode, ErrorMessage).ToListAsync();
        }

        [HttpPost("Insert")]
        public async Task<ActionResult<Error>> Insert(ProductInsert productInsert)
        {
            string StoredProc = "exec Product_Insert @ProductName, @Description, @Price, @Status, @CatalogID, @SubCatalogID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";

            var ProductName = new SqlParameter("@ProductName", productInsert.ProductName);
            var Description = new SqlParameter("@Description", productInsert.Description);
            var Price = new SqlParameter("@Price", productInsert.Price);
            var Status = new SqlParameter("@Status", productInsert.Status);
            var CatalogID = new SqlParameter("@CatalogID", productInsert.CatalogID);
            var SubCatalogID = new SqlParameter("@SubCatalogID", productInsert.SubCatalogID);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };

            await _context.Database.ExecuteSqlRawAsync(StoredProc, ProductName, Description, Price, Status, CatalogID, SubCatalogID, ErrorCode, ErrorMessage);

            var error = new Error();
            error.ErrorCode = ErrorCode.Value.ToString();
            error.ErrorMessage = ErrorMessage.Value.ToString();
            return error;
        }

        [HttpPut("Update/{id}")]
        public async Task<ActionResult<Error>> Update(int id, ProductUpdate productUpdate)
        {
            string StoredProc = "exec Product_Update @ProductID, @ProductName, @Description, @Price, @Status, @CatalogID, @SubCatalogID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";

            var ProductID = new SqlParameter("@ProductID", id);
            var ProductName = new SqlParameter("@ProductName", productUpdate.ProductName);
            var Description = new SqlParameter("@Description", productUpdate.Description);
            var Price = new SqlParameter("@Price", productUpdate.Price);
            var Status = new SqlParameter("@Status", productUpdate.Status);
            var CatalogID = new SqlParameter("@CatalogID", productUpdate.CatalogID);
            var SubCatalogID = new SqlParameter("@SubCatalogID", productUpdate.SubCatalogID);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };

            await _context.Database.ExecuteSqlRawAsync(StoredProc, ProductID, ProductName, Description, Price, Status, CatalogID, SubCatalogID, ErrorCode, ErrorMessage);

            var error = new Error();
            error.ErrorCode = ErrorCode.Value.ToString();
            error.ErrorMessage = ErrorMessage.Value.ToString();
            return error;
        }

        [HttpDelete("Delete/{id}")]
        public async Task<ActionResult<Error>> Delete(int id)
        {
            string StoredProc = "exec Product_Delete @ProductID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";

            var ProductID = new SqlParameter("@ProductID", id);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };

            await _context.Database.ExecuteSqlRawAsync(StoredProc, ProductID, ErrorCode, ErrorMessage);

            var error = new Error();
            error.ErrorCode = ErrorCode.Value.ToString();
            error.ErrorMessage = ErrorMessage.Value.ToString();
            return error;
        }
    }
}
