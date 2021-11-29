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
    public class ImageProductController : ControllerBase
    {
        private readonly SneakerAPIDBContext _context;

        public ImageProductController(SneakerAPIDBContext context)
        {
            _context = context;
        }

        [HttpGet("GetAll/{id}")]
        public async Task<ActionResult<IEnumerable<ImageProductGetAll>>> GetAll(int id)
        {
            string StoredProc = "exec ImageProduct_GetAll @ProductID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";

            var ProductID = new SqlParameter("@ProductID", id);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };

            return await _context.ImageProductGetAll.FromSqlRaw(StoredProc, ProductID, ErrorCode, ErrorMessage).ToListAsync();
        }

        [HttpGet("GetById/{id}")]
        public async Task<ActionResult<IEnumerable<ImageProductGetByID>>> GetById(int id)
        {
            string StoredProc = "exec ImageProduct_GetItemById @ImageID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";

            var ImageID = new SqlParameter("@ImageID", id);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };

            return await _context.ImageProductGetByID.FromSqlRaw(StoredProc, ImageID, ErrorCode, ErrorMessage).ToListAsync();
        }

        [HttpPost("Insert")]
        public async Task<ActionResult<Error>> Insert(ImageProductInsert imageProductInsert)
        {
            string StoredProc = "exec ImageProduct_Insert @ProductID, @Image, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";

            var ProductID = new SqlParameter("@ProductID", imageProductInsert.ProductID);
            var Image = new SqlParameter("@Image", imageProductInsert.Image);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };

            await _context.Database.ExecuteSqlRawAsync(StoredProc, ProductID, Image, ErrorCode, ErrorMessage);

            var error = new Error();
            error.ErrorCode = ErrorCode.Value.ToString();
            error.ErrorMessage = ErrorMessage.Value.ToString();
            return error;
        }

        [HttpPut("Update/{id}")]
        public async Task<ActionResult<Error>> Update(int id, ImageProductUpdate imageProductUpdate)
        {
            string StoredProc = "exec ImageProduct_Update @ImageID, @Image, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";

            var ImageID = new SqlParameter("@ImageID", id);
            var Image = new SqlParameter("@Image", imageProductUpdate.Image);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };

            await _context.Database.ExecuteSqlRawAsync(StoredProc, ImageID, Image, ErrorCode, ErrorMessage);

            var error = new Error();
            error.ErrorCode = ErrorCode.Value.ToString();
            error.ErrorMessage = ErrorMessage.Value.ToString();
            return error;
        }

        [HttpDelete("Delete/{id}")]
        public async Task<ActionResult<Error>> Delete(int id)
        {
            string StoredProc = "exec ImageProduct_Delete @ImageID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";

            var ImageID = new SqlParameter("@ImageID", id);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };

            await _context.Database.ExecuteSqlRawAsync(StoredProc, ImageID, ErrorCode, ErrorMessage);

            var error = new Error();
            error.ErrorCode = ErrorCode.Value.ToString();
            error.ErrorMessage = ErrorMessage.Value.ToString();
            return error;
        }
    }
}