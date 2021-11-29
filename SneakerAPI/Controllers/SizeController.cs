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
    public class SizeController : ControllerBase
    {
        private readonly SneakerAPIDBContext _context;

        public SizeController(SneakerAPIDBContext context)
        {
            _context = context;
        }

        [HttpGet("GetAll")]
        public async Task<ActionResult<IEnumerable<SizeGetAll>>> GetAll()
        {
            string StoredProc = "exec Size_GetAll @ErrorCode OUTPUT, @ErrorMessage OUTPUT";

            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };

            return await _context.SizeGetAll.FromSqlRaw(StoredProc, ErrorCode, ErrorMessage).ToListAsync();
        }

        [HttpGet("GetById/{id}")]
        public async Task<ActionResult<IEnumerable<SizeGetById>>> GetById(int id)
        {
            string StoredProc = "exec Size_GetItemById @SizeID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";

            var SizeID = new SqlParameter("@SizeID", id);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };

            return await _context.SizeGetById.FromSqlRaw(StoredProc, SizeID, ErrorCode, ErrorMessage).ToListAsync();
        }

        [HttpPost("Insert")]
        public async Task<ActionResult<Error>> Insert(SizeInsert sizeInsert)
        {
            string StoredProc = "exec Size_Insert @SizeName, @Status, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";

            var SizeName = new SqlParameter("@SizeName", sizeInsert.SizeName);
            var Status = new SqlParameter("@Status", sizeInsert.Status);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };

            await _context.Database.ExecuteSqlRawAsync(StoredProc, SizeName, Status, ErrorCode, ErrorMessage);

            var error = new Error();
            error.ErrorCode = ErrorCode.Value.ToString();
            error.ErrorMessage = ErrorMessage.Value.ToString();
            return error;
        }

        [HttpPut("Update/{id}")]
        public async Task<ActionResult<Error>> Update(int id, SizeUpdate sizeUpdate)
        {
            string StoredProc = "exec Size_Update @SizeID, @SizeName, @Status, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";

            var SizeID = new SqlParameter("@SizeID", id);
            var SizeName = new SqlParameter("@SizeName", sizeUpdate.SizeName);
            var Status = new SqlParameter("@Status", sizeUpdate.Status);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };

            await _context.Database.ExecuteSqlRawAsync(StoredProc, SizeID, SizeName, Status, ErrorCode, ErrorMessage);

            var error = new Error();
            error.ErrorCode = ErrorCode.Value.ToString();
            error.ErrorMessage = ErrorMessage.Value.ToString();
            return error;
        }

        [HttpDelete("Delete/{id}")]
        public async Task<ActionResult<Error>> Delete(int id)
        {
            string StoredProc = "exec Size_Delete @SizeID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";

            var SizeID = new SqlParameter("@SizeID", id);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };

            await _context.Database.ExecuteSqlRawAsync(StoredProc, SizeID, ErrorCode, ErrorMessage);

            var error = new Error();
            error.ErrorCode = ErrorCode.Value.ToString();
            error.ErrorMessage = ErrorMessage.Value.ToString();
            return error;
        }
    }
}
