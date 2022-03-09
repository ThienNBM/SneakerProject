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
    public class ReportController : ControllerBase
    {
        private readonly ISdbContext _context;

        public ReportController(ISdbContext context)
        {
            _context = context;
        }

        [HttpGet]
        [Route("GetAmountStock")]
        public async Task<ActionResult<IEnumerable<ReportAmountStock>>> GetAmountStock()
        {
            string StoredProc = "exec IS_Report_GetAmountStock @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            List<ReportAmountStock> result;
            try
            {
                result = await _context.ReportAmountStock.FromSqlRaw(StoredProc, ErrorCode, ErrorMessage).ToListAsync();
            }
            catch (Exception ex)
            {
                result = null;
            }
            return result;
        }

        [HttpPost]
        [Route("GetOrder")]
        public async Task<ActionResult<IEnumerable<ReportOrder>>> GetOrder(GetReportOrder getReportOrder)
        {
            string StoredProc = "exec IS_Report_GetListOrder @StartDate, @EndDate, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var StartDate = new SqlParameter("@StartDate", getReportOrder.StartDate);
            var EndDate = new SqlParameter("@EndDate", getReportOrder.EndDate);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            List<ReportOrder> result;
            try
            {
                result = await _context.ReportOrder.FromSqlRaw(StoredProc, StartDate, EndDate, ErrorCode, ErrorMessage).ToListAsync();
            }
            catch (Exception ex)
            {
                result = null;
            }
            return result;
        }
    }
}
