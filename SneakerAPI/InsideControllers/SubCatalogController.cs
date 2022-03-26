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
    public class SubCatalogController : ControllerBase
    {
        private readonly ISdbContext _context;
        public SubCatalogController(ISdbContext context)
        {
            _context = context;
        }
        Error error = new();

        [HttpGet]
        [Route("GetAll")]
        public async Task<ActionResult<IEnumerable<SubCatalogGetAll>>> GetAll()
        {
            string StoredProc = "exec IS_SubCatalog_GetAll @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            List<SubCatalogGetAll> result = new();
            try
            {
                result = await _context.SubCatalogGetAll.FromSqlRaw(StoredProc, ErrorCode, ErrorMessage).ToListAsync();
            }
            catch (Exception ex)
            {
                result = new();
            }
            return result;
        }

        [HttpGet]
        [Route("GetById/{id}")]
        public async Task<ActionResult<IEnumerable<SubCatalogGetAndUpdate>>> GetById(int id)
        {
            string StoredProc = "exec IS_SubCatalog_GetItemById @SubCatalogID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var SubCatalogID = new SqlParameter("@SubCatalogID", id);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            List<SubCatalogGetAndUpdate> result = new();
            try
            {
                result = await _context.SubCatalogGetAndUpdate.FromSqlRaw(StoredProc, SubCatalogID, ErrorCode, ErrorMessage).ToListAsync();
            }
            catch (Exception ex)
            {
                result = new();
            }
            return result;
        }

        [HttpPost]
        [Route("Insert")]
        public async Task<ActionResult<Error>> Insert(SubCatalogInsert SubCatalogInsert)
        {
            string StoredProc = "exec IS_SubCatalog_Insert @SubCatalogName, @Status, @CatalogID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var SubCatalogName = new SqlParameter("@SubCatalogName", SubCatalogInsert.SubCatalogName);
            var Status = new SqlParameter("@Status", SubCatalogInsert.Status);
            var CatalogID = new SqlParameter("@CatalogID", SubCatalogInsert.CatalogID);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            try
            {
                await _context.Database.ExecuteSqlRawAsync(StoredProc, SubCatalogName, Status, CatalogID, ErrorCode, ErrorMessage);
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
        public async Task<ActionResult<Error>> Update(SubCatalogGetAndUpdate SubCatalogGetAndUpdate)
        {
            string StoredProc = "exec IS_SubCatalog_Update @SubCatalogID, @SubCatalogName, @Status, @CatalogID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var SubCatalogID = new SqlParameter("@SubCatalogID", SubCatalogGetAndUpdate.SubCatalogID);
            var SubCatalogName = new SqlParameter("@SubCatalogName", SubCatalogGetAndUpdate.SubCatalogName);
            var Status = new SqlParameter("@Status", SubCatalogGetAndUpdate.Status);
            var CatalogID = new SqlParameter("@CatalogID", SubCatalogGetAndUpdate.CatalogID);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            try
            {
                await _context.Database.ExecuteSqlRawAsync(StoredProc, SubCatalogID, SubCatalogName, Status, CatalogID, ErrorCode, ErrorMessage);
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
            string StoredProc = "exec IS_SubCatalog_Delete @SubCatalogID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var SubCatalogID = new SqlParameter("@SubCatalogID", id);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            try
            {
                await _context.Database.ExecuteSqlRawAsync(StoredProc, SubCatalogID, ErrorCode, ErrorMessage);
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
