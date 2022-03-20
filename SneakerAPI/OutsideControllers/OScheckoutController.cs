using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using SneakerAPI.OutsideModel;
using System;
using System.Threading.Tasks;

namespace SneakerAPI.OutsideControllers
{
    [ApiExplorerSettings(IgnoreApi = true)]
    [Route("api/[controller]")]
    [ApiController]
    public class OSCheckoutController : Controller
    {
        private readonly OSdbContext context;

        public OSCheckoutController(OSdbContext context)
        {
            this.context = context;
        }

        [HttpPost]
        [Route("CheckoutUserMember")]
        public async Task<ActionResult<Error>> CheckoutUserMember(CheckOutAction checkOutAction)
        {
            string StoredProc = "exec OS_CheckoutUserMember @JSON, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var JSON = new SqlParameter("@JSON", JsonConvert.SerializeObject(checkOutAction));
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            var error = new Error();
            try
            {
                await context.Database.ExecuteSqlRawAsync(StoredProc, JSON, ErrorCode, ErrorMessage);
                error.ErrorCode = ErrorCode.Value.ToString();
                error.ErrorMessage = ErrorMessage.Value.ToString();
            }
            catch (Exception ex)
            {
                error.ErrorCode = "API_ERROR";
                error.ErrorMessage = ex.Message;
            }
            return error;
        }

        [HttpPost]
        [Route("CheckoutUserNormal")]
        public async Task<ActionResult<Error>> CheckoutUserNormal(CheckOutAction checkOutAction)
        {
            string StoredProc = "exec OS_CheckoutUserNormal @JSON, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var JSON = new SqlParameter("@JSON", JsonConvert.SerializeObject(checkOutAction));
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            var error = new Error();
            try
            {
                await context.Database.ExecuteSqlRawAsync(StoredProc, JSON, ErrorCode, ErrorMessage);
                error.ErrorCode = ErrorCode.Value.ToString();
                error.ErrorMessage = ErrorMessage.Value.ToString();
            }
            catch (Exception ex)
            {
                error.ErrorCode = "API_ERROR";
                error.ErrorMessage = ex.Message;
            }
            return error;
        }
    }
}
