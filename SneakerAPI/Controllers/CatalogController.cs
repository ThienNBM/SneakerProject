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
    public class CatalogController : ControllerBase
    {
        private readonly SneakerAPIDBContext _context;

        public CatalogController(SneakerAPIDBContext context)
        {
            _context = context;
        }

        [HttpGet]
        [Route("GetAll")]
        public async Task<ActionResult<IEnumerable<CatalogGetAll>>> GetAll()
        {
            string StoredProc = "exec Catalog_GetAll @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            List<CatalogGetAll> catalogs;
            try
            {
                catalogs = await _context.CatalogGetAll.FromSqlRaw(StoredProc, ErrorCode, ErrorMessage).ToListAsync();
            }
            catch
            {
                catalogs = null;
            }
            return catalogs;
        }

        [HttpGet]
        [Route("GetById/{id}")]
        public async Task<ActionResult<IEnumerable<CatalogGetById>>> GetById(int id)
        {
            string StoredProc = "exec Catalog_GetItemById @CatalogID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var CatalogID = new SqlParameter("@CatalogID", id);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            List<CatalogGetById> catalogs;
            try
            {
                catalogs = await _context.CatalogGetById.FromSqlRaw(StoredProc, CatalogID, ErrorCode, ErrorMessage).ToListAsync();
            }
            catch
            {
                catalogs = null;
            }
            return catalogs;
        }

        [HttpPost]
        [Route("Insert")]
        public async Task<ActionResult<Error>> Insert(CatalogInsert CatalogInsert)
        {
            string StoredProc = "exec Catalog_Insert @CatalogName, @Status, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var CatalogName = new SqlParameter("@CatalogName", CatalogInsert.CatalogName);
            var Status = new SqlParameter("@Status", CatalogInsert.Status);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };

            await _context.Database.ExecuteSqlRawAsync(StoredProc, CatalogName, Status, ErrorCode, ErrorMessage);

            var error = new Error
            {
                ErrorCode = ErrorCode.Value.ToString(),
                ErrorMessage = ErrorMessage.Value.ToString()
            };
            return error;
        }

        [HttpPut]
        [Route("Update")]
        public async Task<ActionResult<Error>> Update(CatalogUpdate CatalogUpdate)
        {
            string StoredProc = "exec Catalog_Update @CatalogID, @CatalogName, @Status, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var CatalogID = new SqlParameter("@CatalogID", CatalogUpdate.CatalogID);
            var CatalogName = new SqlParameter("@CatalogName", CatalogUpdate.CatalogName);
            var Status = new SqlParameter("@Status", CatalogUpdate.Status);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };

            await _context.Database.ExecuteSqlRawAsync(StoredProc, CatalogID, CatalogName, Status, ErrorCode, ErrorMessage);

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
            string StoredProc = "exec Catalog_Delete @CatalogID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var CatalogID = new SqlParameter("@CatalogID", id);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };

            await _context.Database.ExecuteSqlRawAsync(StoredProc, CatalogID, ErrorCode, ErrorMessage);

            var error = new Error
            {
                ErrorCode = ErrorCode.Value.ToString(),
                ErrorMessage = ErrorMessage.Value.ToString()
            };
            return error;
        }
    }
}