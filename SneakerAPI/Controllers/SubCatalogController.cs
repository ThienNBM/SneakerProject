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
    public class SubCatalogController : ControllerBase
    {
        private readonly SneakerAPIDBContext _context;

        public SubCatalogController(SneakerAPIDBContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<SubCatalogGetAll>>> GetAllSubCatalog()
        {
            string StoredProc = "exec SubCatalog_GetAll @ErrorCode OUTPUT, @ErrorMessage OUTPUT";

            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };

            return await _context.SubCatalogGetAll.FromSqlRaw(StoredProc, ErrorCode, ErrorMessage).ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<IEnumerable<SubCatalogGetByID>>> GetSubCatalogByID(int id)
        {
            string StoredProc = "exec SubCatalog_GetItemById @SubCatalogID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";

            var SubCatalogID = new SqlParameter("@SubCatalogID", id);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };

            return await _context.SubCatalogGetByID.FromSqlRaw(StoredProc, SubCatalogID, ErrorCode, ErrorMessage).ToListAsync();
        }

        [HttpPost]
        public async Task<ActionResult<Error>> InsertSubCatalog(SubCatalogInsertAndUpdate subCatalogInsertAndUpdate)
        {
            string StoredProc = "exec SubCatalog_Insert @SubCatalogName, @Status, @CatalogID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";

            var SubCatalogName = new SqlParameter("@SubCatalogName", subCatalogInsertAndUpdate.SubCatalogName);
            var Status = new SqlParameter("@Status", subCatalogInsertAndUpdate.Status);
            var CatalogID = new SqlParameter("@CatalogID", subCatalogInsertAndUpdate.CatalogID);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };

            await _context.Database.ExecuteSqlRawAsync(StoredProc, SubCatalogName, Status, CatalogID, ErrorCode, ErrorMessage);

            var error = new Error();
            error.ErrorCode = ErrorCode.Value.ToString();
            error.ErrorMessage = ErrorMessage.Value.ToString();
            return error;
        }

        [HttpPut("{id}")]
        public async Task<ActionResult<Error>> UpdateSubCatalog(int id, SubCatalogInsertAndUpdate subCatalogInsertAndUpdate)
        {
            string StoredProc = "exec SubCatalog_Update @SubCatalogID, @SubCatalogName, @Status, @CatalogID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";

            var SubCatalogID = new SqlParameter("@SubCatalogID", id);
            var SubCatalogName = new SqlParameter("@SubCatalogName", subCatalogInsertAndUpdate.SubCatalogName);
            var Status = new SqlParameter("@Status", subCatalogInsertAndUpdate.Status);
            var CatalogID = new SqlParameter("@CatalogID", subCatalogInsertAndUpdate.CatalogID);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };

            await _context.Database.ExecuteSqlRawAsync(StoredProc, SubCatalogID, SubCatalogName, Status, CatalogID, ErrorCode, ErrorMessage);

            var error = new Error();
            error.ErrorCode = ErrorCode.Value.ToString();
            error.ErrorMessage = ErrorMessage.Value.ToString();
            return error;
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult<Error>> DeleteSubCatalog(int id)
        {
            string StoredProc = "exec SubCatalog_Delete @SubCatalogID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";

            var SubCatalogID = new SqlParameter("@SubCatalogID", id);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };

            await _context.Database.ExecuteSqlRawAsync(StoredProc, SubCatalogID, ErrorCode, ErrorMessage);

            var error = new Error();
            error.ErrorCode = ErrorCode.Value.ToString();
            error.ErrorMessage = ErrorMessage.Value.ToString();
            return error;
        }
    }
}
