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
    public class CatalogController : ControllerBase
    {
        private readonly ISdbContext _context;
        public CatalogController(ISdbContext context)
        {
            _context = context;
        }
        Error error = new();

        [HttpGet]
        [Route("GetAll")]
        public async Task<ActionResult<IEnumerable<CatalogGetAll>>> GetAll()
        {
            string StoredProc = "exec IS_Catalog_GetAll @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            List<CatalogGetAll> result = new();
            try
            {
                result = await _context.CatalogGetAll.FromSqlRaw(StoredProc, ErrorCode, ErrorMessage).ToListAsync();
            }
            catch (Exception ex)
            {
                result = new();
            }
            return result;
        }

        [HttpGet]
        [Route("GetById/{id}")]
        public async Task<ActionResult<IEnumerable<CatalogGetById>>> GetById(int id)
        {
            string StoredProc = "exec IS_Catalog_GetItemById @CatalogID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var CatalogID = new SqlParameter("@CatalogID", id);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            List<CatalogGetById> result = new();
            try
            {
                result = await _context.CatalogGetById.FromSqlRaw(StoredProc, CatalogID, ErrorCode, ErrorMessage).ToListAsync();
            }
            catch (Exception ex)
            {
                result = new();
            }
            return result;
        }

        [HttpPost]
        [Route("Insert")]
        public async Task<ActionResult<Error>> Insert(CatalogInsert item)
        {
            string StoredProc = "exec IS_Catalog_Insert @CatalogName, @Status, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var CatalogName = new SqlParameter("@CatalogName", item.CatalogName.Trim());
            var Status = new SqlParameter("@Status", item.Status);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            try
            {
                await _context.Database.ExecuteSqlRawAsync(StoredProc, CatalogName, Status, ErrorCode, ErrorMessage);
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

        [HttpPut]
        [Route("Update")]
        public async Task<ActionResult<Error>> Update(CatalogUpdate CatalogUpdate)
        {
            string StoredProc = "exec IS_Catalog_Update @CatalogID, @CatalogName, @Status, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var CatalogID = new SqlParameter("@CatalogID", CatalogUpdate.CatalogID);
            var CatalogName = new SqlParameter("@CatalogName", CatalogUpdate.CatalogName);
            var Status = new SqlParameter("@Status", CatalogUpdate.Status);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            try
            {
                await _context.Database.ExecuteSqlRawAsync(StoredProc, CatalogID, CatalogName, Status, ErrorCode, ErrorMessage);
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
            string StoredProc = "exec IS_Catalog_Delete @CatalogID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var CatalogID = new SqlParameter("@CatalogID", id);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            try
            {
                await _context.Database.ExecuteSqlRawAsync(StoredProc, CatalogID, ErrorCode, ErrorMessage);
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
    }
}