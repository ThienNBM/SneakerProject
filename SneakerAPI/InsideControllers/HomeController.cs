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
    public class HomeController : ControllerBase
    {
        private readonly ISdbContext _context;

        public HomeController(ISdbContext context)
        {
            _context = context;
        }

        [HttpGet]
        [Route("CountOrderStatus")]
        public async Task<ActionResult<IEnumerable<ChartCountOrderStatus>>> CountOrderStatus()
        {
            string StoredProc = "exec IS_Chart_CountOrderStatus @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            List<ChartCountOrderStatus> result;
            try
            {
                result = await _context.ChartCountOrderStatus.FromSqlRaw(StoredProc, ErrorCode, ErrorMessage).ToListAsync();
            }
            catch (Exception ex)
            {
                result = null;
            }
            return result;
        }
        
        [HttpGet]
        [Route("CountCatalogProduct")]
        public async Task<ActionResult<IEnumerable<ChartCountCatalogProduct>>> CountCatalogProduct()
        {
            string StoredProc = "exec IS_Chart_CountCatalogProduct @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            List<ChartCountCatalogProduct> result;
            try
            {
                result = await _context.ChartCountCatalogProduct.FromSqlRaw(StoredProc, ErrorCode, ErrorMessage).ToListAsync();
            }
            catch (Exception ex)
            {
                result = null;
            }
            return result;
        }
        
        [HttpGet]
        [Route("TopSellProduct")]
        public async Task<ActionResult<IEnumerable<TopSellProduct>>> TopSellProduct()
        {
            string StoredProc = "exec IS_Chart_TopSellProduct @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            List<TopSellProduct> result;
            try
            {
                result = await _context.TopSellProduct.FromSqlRaw(StoredProc, ErrorCode, ErrorMessage).ToListAsync();
            }
            catch (Exception ex)
            {
                result = null;
            }
            return result;
        }
    }
}
