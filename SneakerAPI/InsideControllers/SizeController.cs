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
    public class SizeController : ControllerBase
    {
        private readonly ISdbContext _context;
        public SizeController(ISdbContext context)
        {
            _context = context;
        }
        Error error = new();

        [HttpGet]
        [Route("GetAll")]
        public async Task<ActionResult<IEnumerable<SizeGetAll>>> GetAll()
        {
            string StoredProc = "exec IS_Size_GetAll @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            List<SizeGetAll> result = new();
            try
            {
                result = await _context.SizeGetAll.FromSqlRaw(StoredProc, ErrorCode, ErrorMessage).ToListAsync();
            }
            catch (Exception ex)
            {
                result = new();
            }
            return result;
        }

        [HttpGet]
        [Route("GetById/{id}")]
        public async Task<ActionResult<IEnumerable<SizeGetAndUpdate>>> GetById(int id)
        {
            string StoredProc = "exec IS_Size_GetItemById @SizeID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var SizeID = new SqlParameter("@SizeID", id);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            List<SizeGetAndUpdate> result = new();
            try
            {
                result = await _context.SizeGetAndUpdate.FromSqlRaw(StoredProc, SizeID, ErrorCode, ErrorMessage).ToListAsync();
            }
            catch (Exception ex)
            {
                result = new();
            }
            return result;
        }

        [HttpPost]
        [Route("Insert")]
        public async Task<ActionResult<Error>> Insert(SizeInsert model)
        {
            string StoredProc = "exec IS_Size_Insert @SizeName, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var SizeName = new SqlParameter("@SizeName", model.SizeName);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            try
            {
                await _context.Database.ExecuteSqlRawAsync(StoredProc, SizeName, ErrorCode, ErrorMessage);
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
        public async Task<ActionResult<Error>> Update(SizeGetAndUpdate model)
        {
            string StoredProc = "exec IS_Size_Update @SizeID, @SizeName, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var SizeID = new SqlParameter("@SizeID", model.SizeID);
            var SizeName = new SqlParameter("@SizeName", model.SizeName);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            try
            {
                await _context.Database.ExecuteSqlRawAsync(StoredProc, SizeID, SizeName, ErrorCode, ErrorMessage);
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
            string StoredProc = "exec IS_Size_Delete @SizeID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var SizeID = new SqlParameter("@SizeID", id);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            try
            {
                await _context.Database.ExecuteSqlRawAsync(StoredProc, SizeID, ErrorCode, ErrorMessage);
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
