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
        Error error = new();

        [HttpGet]
        [Route("GetAll")]
        public async Task<ActionResult<IEnumerable<OrderGetAll>>> GetAll()
        {
            string StoredProc = "exec IS_Order_GetAll @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            List<OrderGetAll> result;
            try
            {
                result = await _context.OrderGetAll.FromSqlRaw(StoredProc, ErrorCode, ErrorMessage).ToListAsync();
            }
            catch (Exception ex)
            {
                result = new();
            }
            return result;
        }

        [HttpGet]
        [Route("GetOrderDetailById/{id}")]
        public async Task<ActionResult<IEnumerable<OrderGetOrderDetailById>>> GetOrderDetailById(int id)
        {
            string StoredProc = "exec IS_Order_GetOrderDetailById @OrderID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var OrderID = new SqlParameter("@OrderID", id);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            List<OrderGetOrderDetailById> result;
            try
            {
                result = await _context.OrderGetOrderDetailById.FromSqlRaw(StoredProc, OrderID, ErrorCode, ErrorMessage).ToListAsync();
            }
            catch (Exception ex)
            {
                result = new();
            }
            return result;
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
