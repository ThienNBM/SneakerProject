using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using SneakerAPI.OutsideModel;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SneakerAPI.OutsideControllers
{
    [ApiExplorerSettings(IgnoreApi = true)]
    [Route("api/[controller]")]
    [ApiController]
    public class OScartController : Controller
    {
        private readonly OSdbContext context;

        public OScartController(OSdbContext context)
        {
            this.context = context;
        }

        [HttpGet]
        [Route("GetProductInfo/{ProductID}/{SizeID}")]
        public async Task<ActionResult<IEnumerable<CartProductInfo>>> GetProductInfo(int ProductID, int SizeID)
        {
            string StoredProc = "exec OS_Cart_GetProductInfo @ProductID, @SizeID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var productID = new SqlParameter("@ProductID", ProductID);
            var sizeID = new SqlParameter("@SizeID", SizeID);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            List<CartProductInfo> carts;
            try 
            {
                carts = await context.CartProductInfo.FromSqlRaw(StoredProc, productID, sizeID, ErrorCode, ErrorMessage).ToListAsync();
            }
            catch
            {
                carts = null;
            }
            return carts;
        }
    }
}
