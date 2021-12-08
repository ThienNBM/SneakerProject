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
    public class SubCatalogController : ControllerBase
    {
        private readonly SneakerAPIDBContext _context;

        public SubCatalogController(SneakerAPIDBContext context)
        {
            _context = context;
        }

        [HttpGet]
        [Route("GetAll")]
        public async Task<ActionResult<IEnumerable<SubCatalogGetAll>>> GetAll()
        {
            string StoredProc = "exec SubCatalog_GetAll @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            List<SubCatalogGetAll> subCatalogs;
            try
            {
                subCatalogs = await _context.SubCatalogGetAll.FromSqlRaw(StoredProc, ErrorCode, ErrorMessage).ToListAsync();
            }
            catch
            {
                subCatalogs = null;
            }
            return subCatalogs;
        }

        [HttpPost]
        [Route("Insert")]
        public async Task<ActionResult<Error>> Insert(SubCatalogInsert SubCatalogInsert)
        {
            string StoredProc = "exec SubCatalog_Insert @SubCatalogName, @Status, @CatalogID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var SubCatalogName = new SqlParameter("@SubCatalogName", SubCatalogInsert.SubCatalogName);
            var Status = new SqlParameter("@Status", SubCatalogInsert.Status);
            var CatalogID = new SqlParameter("@CatalogID", SubCatalogInsert.CatalogID);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };

            await _context.Database.ExecuteSqlRawAsync(StoredProc, SubCatalogName, Status, CatalogID, ErrorCode, ErrorMessage);

            var error = new Error
            {
                ErrorCode = ErrorCode.Value.ToString(),
                ErrorMessage = ErrorMessage.Value.ToString()
            };
            return error;
        }

        [HttpGet]
        [Route("GetById/{id}")]
        public async Task<ActionResult<IEnumerable<SubCatalogGetAndUpdate>>> GetById(int id)
        {
            string StoredProc = "exec SubCatalog_GetItemById @SubCatalogID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var SubCatalogID = new SqlParameter("@SubCatalogID", id);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            List<SubCatalogGetAndUpdate> subCatalogs;
            try
            {
                subCatalogs = await _context.SubCatalogGetAndUpdate.FromSqlRaw(StoredProc, SubCatalogID, ErrorCode, ErrorMessage).ToListAsync();
            }
            catch
            {
                subCatalogs = null;
            }
            return subCatalogs;
        }

        [HttpPut]
        [Route("Update")]
        public async Task<ActionResult<Error>> Update(SubCatalogGetAndUpdate SubCatalogGetAndUpdate)
        {
            string StoredProc = "exec SubCatalog_Update @SubCatalogID, @SubCatalogName, @Status, @CatalogID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var SubCatalogID = new SqlParameter("@SubCatalogID", SubCatalogGetAndUpdate.SubCatalogID);
            var SubCatalogName = new SqlParameter("@SubCatalogName", SubCatalogGetAndUpdate.SubCatalogName);
            var Status = new SqlParameter("@Status", SubCatalogGetAndUpdate.Status);
            var CatalogID = new SqlParameter("@CatalogID", SubCatalogGetAndUpdate.CatalogID);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };

            await _context.Database.ExecuteSqlRawAsync(StoredProc, SubCatalogID, SubCatalogName, Status, CatalogID, ErrorCode, ErrorMessage);

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
            string StoredProc = "exec SubCatalog_Delete @SubCatalogID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var SubCatalogID = new SqlParameter("@SubCatalogID", id);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };

            await _context.Database.ExecuteSqlRawAsync(StoredProc, SubCatalogID, ErrorCode, ErrorMessage);

            var error = new Error
            {
                ErrorCode = ErrorCode.Value.ToString(),
                ErrorMessage = ErrorMessage.Value.ToString()
            };
            return error;
        }
    }
}
