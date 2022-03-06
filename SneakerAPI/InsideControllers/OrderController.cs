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
    public class OrderController : ControllerBase
    {
        private readonly ISdbContext _context;

        public OrderController(ISdbContext context)
        {
            _context = context;
        }

        [HttpGet]
        [Route("GetAll")]
        public async Task<ActionResult<IEnumerable<OrderGetAll>>> GetAll()
        {
            string StoredProc = "exec IS_Order_GetAll @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            List<OrderGetAll> orders;
            try
            {
                orders = await _context.OrderGetAll.FromSqlRaw(StoredProc, ErrorCode, ErrorMessage).ToListAsync();
            }
            catch (Exception ex)
            {
                orders = null;
            }
            return orders;
        }

        [HttpGet]
        [Route("GetOrderDetailById/{id}")]
        public async Task<ActionResult<IEnumerable<OrderGetOrderDetailById>>> GetOrderDetailById(int id)
        {
            string StoredProc = "exec IS_Order_GetOrderDetailById @OrderID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var OrderID = new SqlParameter("@OrderID", id);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            List<OrderGetOrderDetailById> orderDetails;
            try
            {
                orderDetails = await _context.OrderGetOrderDetailById.FromSqlRaw(StoredProc, OrderID, ErrorCode, ErrorMessage).ToListAsync();
            }
            catch (Exception ex)
            {
                orderDetails = null;
            }
            return orderDetails;
        }

        [HttpPost]
        [Route("ChangeStatus")]
        public async Task<ActionResult<Error>> ChangeStatus(OrderChangeStatus orderChangeStatus)
        {
            string StoredProc = "exec IS_Order_ChangeStatus @OrderID, @Status, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var OrderID = new SqlParameter("@OrderID", orderChangeStatus.OrderID);
            var Status = new SqlParameter("@Status", orderChangeStatus.Status);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            Error error = new Error();
            try
            {
                await _context.Database.ExecuteSqlRawAsync(StoredProc, OrderID, Status, ErrorCode, ErrorMessage);
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
        [Route("Destroy")]
        public async Task<ActionResult<Error>> Destroy(OrderDestroy orderDestroy)
        {
            string StoredProc = "exec IS_Order_Destroy @OrderID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var OrderID = new SqlParameter("@OrderID", orderDestroy.OrderID);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            Error error = new Error();
            try
            {
                await _context.Database.ExecuteSqlRawAsync(StoredProc, OrderID, ErrorCode, ErrorMessage);
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
