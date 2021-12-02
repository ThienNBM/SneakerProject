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
    [Route("api/[controller]")]
    [ApiController]
    public class CatalogController : ControllerBase
    {
        private readonly SneakerAPIDBContext _context;

        public CatalogController(SneakerAPIDBContext context)
        {
            _context = context;
        }

        [HttpGet("GetAll")]
        public async Task<ActionResult<IEnumerable<Catalog>>> GetAll()
        {
            string StoredProc = "exec Catalog_GetAll @ErrorCode OUTPUT, @ErrorMessage OUTPUT";

            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };

            return await _context.Catalog.FromSqlRaw(StoredProc, ErrorCode, ErrorMessage).ToListAsync();
        }

        [HttpGet("GetById/{id}")]
        public async Task<ActionResult<IEnumerable<Catalog>>> GetCatalogByID(int id)
        {
            string StoredProc = "exec Catalog_GetItemById @CatalogID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";

            var CatalogID = new SqlParameter("@CatalogID", id);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };

            return await _context.Catalog.FromSqlRaw(StoredProc, CatalogID, ErrorCode, ErrorMessage).ToListAsync();
        }

        [HttpPost("Insert")]
        public async Task<ActionResult<Error>> InsertCatalog(Catalog catalog)
        {
            string StoredProc = "exec Catalog_Insert @CatalogName, @Status, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";

            var CatalogName = new SqlParameter("@CatalogName", catalog.CatalogName);
            var Status = new SqlParameter("@Status", catalog.Status);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };

            await _context.Database.ExecuteSqlRawAsync(StoredProc, CatalogName, Status, ErrorCode, ErrorMessage);

            var error = new Error();
            error.ErrorCode = ErrorCode.Value.ToString();
            error.ErrorMessage = ErrorMessage.Value.ToString();
            return error;
        }

        [HttpPut("Update")]
        public async Task<ActionResult<Error>> UpdateCatalog(Catalog catalog)
        {
            string StoredProc = "exec Catalog_Update @CatalogID, @CatalogName, @Status, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";

            var CatalogID = new SqlParameter("@CatalogID", catalog.CatalogID);
            var CatalogName = new SqlParameter("@CatalogName", catalog.CatalogName);
            var Status = new SqlParameter("@Status", catalog.Status);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };

            await _context.Database.ExecuteSqlRawAsync(StoredProc, CatalogID, CatalogName, Status, ErrorCode, ErrorMessage);

            var error = new Error();
            error.ErrorCode = ErrorCode.Value.ToString();
            error.ErrorMessage = ErrorMessage.Value.ToString();
            return error;
        }

        [HttpDelete("Delete/{id}")]
        public async Task<ActionResult<Error>> DeleteCatalog(int id)
        {
            string StoredProc = "exec Catalog_Delete @CatalogID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";

            var CatalogID = new SqlParameter("@CatalogID", id);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };

            await _context.Database.ExecuteSqlRawAsync(StoredProc, CatalogID, ErrorCode, ErrorMessage);

            var error = new Error();
            error.ErrorCode = ErrorCode.Value.ToString();
            error.ErrorMessage = ErrorMessage.Value.ToString();
            return error;
        }

        //[HttpGet("{Id}")]
        //public async Task<ActionResult<Catalog>> GetCatalogByID(int Id)
        //{
        //    var catalog = _context.Catalog.FromSqlRaw("SELECT CatalogID, CatalogName, Status FROM[dbo].[Catalog] where CatalogID = {0}", Id).FirstOrDefault();
        //    if (catalog == null)
        //    {
        //        return NotFound();
        //    }

        //    return catalog;
        //}

        //[HttpPost]
        //public async Task<ActionResult<Error>> Add(Catalog catalog)
        //{
        //    string StoredProc = "exec Catalog_Insert @CatalogName, @Status, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";

        //    SqlParameter[] param = {
        //        new SqlParameter("@CatalogName", catalog.CatalogName),
        //        new SqlParameter("@Status", catalog.Status),
        //        new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output },
        //        new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output }
        //    };
        //    var addResult = _context.Database.ExecuteSqlRaw(StoredProc, param);

        //    var error = new Error();
        //    error.ErrorCode = param[2].Value.ToString();
        //    error.ErrorMessage = param[3].Value.ToString();
        //    return error;
        //}
    }
}
