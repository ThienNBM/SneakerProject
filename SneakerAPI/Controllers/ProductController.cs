using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using SneakerAPI.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

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

        [HttpGet]
        [Route("GetAll")]
        public async Task<ActionResult<IEnumerable<ProductGetAll>>> GetAll()
        {
            string StoredProc = "exec Product_GetAll @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            List<ProductGetAll> products;
            try
            {
                products = await _context.ProductGetAll.FromSqlRaw(StoredProc, ErrorCode, ErrorMessage).ToListAsync();
            }
            catch
            {
                products = null;
            }
            return products;
        }

        [HttpPost]
        [Route("Insert")]
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

            var error = new Error
            {
                ErrorCode = ErrorCode.Value.ToString(),
                ErrorMessage = ErrorMessage.Value.ToString()
            };
            return error;
        }

        [HttpGet]
        [Route("GetById/{id}")]
        public async Task<ActionResult<IEnumerable<ProductGetAndUpdate>>> GetById(int id)
        {
            string StoredProc = "exec Product_GetItemById @ProductID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var ProductID = new SqlParameter("@ProductID", id);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            List<ProductGetAndUpdate> products;
            try
            {
                products = await _context.ProductGetAndUpdate.FromSqlRaw(StoredProc, ProductID, ErrorCode, ErrorMessage).ToListAsync();
            }
            catch
            {
                products = null;
            }
            return products;
        }

        [HttpPut]
        [Route("Update")]
        public async Task<ActionResult<Error>> Update(ProductGetAndUpdate productGetAndUpdate)
        {
            string StoredProc = "exec Product_Update @ProductID, @ProductName, @Description, @Price, @Status, @CatalogID, @SubCatalogID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var ProductID = new SqlParameter("@ProductID", productGetAndUpdate.ProductID);
            var ProductName = new SqlParameter("@ProductName", productGetAndUpdate.ProductName);
            var Description = new SqlParameter("@Description", productGetAndUpdate.Description);
            var Price = new SqlParameter("@Price", productGetAndUpdate.Price);
            var Status = new SqlParameter("@Status", productGetAndUpdate.Status);
            var CatalogID = new SqlParameter("@CatalogID", productGetAndUpdate.CatalogID);
            var SubCatalogID = new SqlParameter("@SubCatalogID", productGetAndUpdate.SubCatalogID);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };

            await _context.Database.ExecuteSqlRawAsync(StoredProc, ProductID, ProductName, Description, Price, Status, CatalogID, SubCatalogID, ErrorCode, ErrorMessage);

            var error = new Error
            {
                ErrorCode = ErrorCode.Value.ToString(),
                ErrorMessage = ErrorMessage.Value.ToString()
            };
            return error;
        }

        [HttpDelete]
        [Route("Delete/{id}")]
        public async Task<ActionResult<Error>> Delete(int id)
        {
            string StoredProc = "exec Product_Delete @ProductID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var ProductID = new SqlParameter("@ProductID", id);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };

            await _context.Database.ExecuteSqlRawAsync(StoredProc, ProductID, ErrorCode, ErrorMessage);

            var error = new Error
            {
                ErrorCode = ErrorCode.Value.ToString(),
                ErrorMessage = ErrorMessage.Value.ToString()
            };
            return error;
        }
    }
}
