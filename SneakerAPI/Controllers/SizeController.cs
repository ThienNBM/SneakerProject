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
    public class SizeController : ControllerBase
    {
        private readonly SneakerAPIDBContext _context;
        public SizeController(SneakerAPIDBContext context)
        {
            _context = context;
        }

        [HttpGet]
        [Route("GetAll")]
        public async Task<ActionResult<IEnumerable<SizeGetAll>>> GetAll()
        {
            string StoredProc = "exec Size_GetAll @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            List<SizeGetAll> sizes;
            try
            {
                sizes = await _context.SizeGetAll.FromSqlRaw(StoredProc, ErrorCode, ErrorMessage).ToListAsync();
            }
            catch
            {
                sizes = null;
            }
            return sizes;
        }

        [HttpPost]
        [Route("Insert")]
        public async Task<ActionResult<Error>> Insert(SizeInsert model)
        {
            string StoredProc = "exec Size_Insert @SizeName, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var SizeName = new SqlParameter("@SizeName", model.SizeName);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };

            await _context.Database.ExecuteSqlRawAsync(StoredProc, SizeName, ErrorCode, ErrorMessage);

            var error = new Error
            {
                ErrorCode = ErrorCode.Value.ToString(),
                ErrorMessage = ErrorMessage.Value.ToString()
            };
            return error;
        }

        [HttpGet]
        [Route("GetById/{id}")]
        public async Task<ActionResult<IEnumerable<SizeGetAndUpdate>>> GetById(int id)
        {
            string StoredProc = "exec Size_GetItemById @SizeID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var SizeID = new SqlParameter("@SizeID", id);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            List<SizeGetAndUpdate> sizes;
            try
            {
                sizes = await _context.SizeGetAndUpdate.FromSqlRaw(StoredProc, SizeID, ErrorCode, ErrorMessage).ToListAsync();
            }
            catch
            {
                sizes = null;
            }
            return sizes;
        }

        [HttpPut]
        [Route("Update")]
        public async Task<ActionResult<Error>> Update(SizeGetAndUpdate model)
        {
            string StoredProc = "exec Size_Update @SizeID, @SizeName, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var SizeID = new SqlParameter("@SizeID", model.SizeID);
            var SizeName = new SqlParameter("@SizeName", model.SizeName);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };

            await _context.Database.ExecuteSqlRawAsync(StoredProc, SizeID, SizeName, ErrorCode, ErrorMessage);

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
            string StoredProc = "exec Size_Delete @SizeID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var SizeID = new SqlParameter("@SizeID", id);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };

            await _context.Database.ExecuteSqlRawAsync(StoredProc, SizeID, ErrorCode, ErrorMessage);

            var error = new Error
            {
                ErrorCode = ErrorCode.Value.ToString(),
                ErrorMessage = ErrorMessage.Value.ToString()
            };
            return error;
        }
    }
}
