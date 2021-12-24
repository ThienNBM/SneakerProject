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
    public class OrderDetailController : ControllerBase
    {
        private readonly ISdbContext _context;

        public OrderDetailController(ISdbContext context)
        {
            _context = context;
        }

        [HttpGet]
        [Route("GetAll/{id}")]
        public async Task<ActionResult<IEnumerable<OrderDetailGetAll>>> GetAll(int id)
        {
            string StoredProc = "exec OrderDetail_GetByOrderId @OrderID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var OrderID = new SqlParameter("@OrderID", id);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            List<OrderDetailGetAll> orderDetails;
            try
            {
                orderDetails = await _context.OrderDetailGetAll.FromSqlRaw(StoredProc, OrderID, ErrorCode, ErrorMessage).ToListAsync();
            }
            catch (Exception ex)
            {
                orderDetails = null;
            }
            return orderDetails;
        }
    }
}