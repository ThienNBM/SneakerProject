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
    public class OSuserController : Controller
    {
        private readonly OSdbContext context;

        public OSuserController(OSdbContext context)
        {
            this.context = context;
        }

        [HttpPost]
        [Route("Login")]
        public async Task<ActionResult<IEnumerable<UserMember>>> Login(Login item)
        {
            string StoredProc = "exec OS_User_Login @Email, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var Email = new SqlParameter("@Email", item.Email);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            List<UserMember> result;
            try
            {
                result = await context.UserMember.FromSqlRaw(StoredProc, Email, ErrorCode, ErrorMessage).ToListAsync();
            }
            catch (Exception ex)
            {
                result = new();
            }
            return result;
        }

        [HttpPost]
        [Route("Register")]
        public async Task<ActionResult<IEnumerable<UserMember>>> Register(Register item)
        {
            string StoredProc = "exec OS_User_Register @FullName, @Phone, @Email, @Password, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var FullName = new SqlParameter("@FullName", item.FullName);
            var Phone = new SqlParameter("@Phone", item.Phone);
            var Email = new SqlParameter("@Email", item.Email);
            var Password = new SqlParameter("@Password", item.Password);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            List<UserMember> result = new();
            try
            {
                result = await context.UserMember.FromSqlRaw(StoredProc, FullName, Phone, Email, Password, ErrorCode, ErrorMessage).ToListAsync();
            }
            catch (Exception ex)
            {
                result = new List<UserMember>();
            }
            return result;
        }

        [HttpPost]
        [Route("ChangeInfo")]
        public async Task<ActionResult<Error>> ChangeInfo(ChangeInfo item)
        {
            string StoredProc = "exec OS_User_ChangeInfo @UserID, @FullName, @Phone, @Address, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var UserID = new SqlParameter("@UserID", item.UserID);
            var FullName = new SqlParameter("@FullName", item.FullName);
            var Phone = new SqlParameter("@Phone", item.Phone);
            var Address = new SqlParameter("@Address", item.Address);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            Error error = new Error();
            try
            {
                await context.Database.ExecuteSqlRawAsync(StoredProc, UserID, FullName, Phone, Address, ErrorCode, ErrorMessage);
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
        [Route("ChangePassword")]
        public async Task<ActionResult<Error>> ChangePassword(ChangePass item)
        {
            string StoredProc = "exec OS_User_ChangePassword @UserID, @NewPassword, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var UserID = new SqlParameter("@UserID", item.UserID);
            var NewPassword = new SqlParameter("@NewPassword", item.NewPassword);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            Error error = new Error();
            try
            {
                await context.Database.ExecuteSqlRawAsync(StoredProc, UserID, NewPassword, ErrorCode, ErrorMessage);
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

        [HttpGet]
        [Route("GetOrderById/{id}")]
        public async Task<ActionResult<IEnumerable<UserGetOrderById>>> GetOrderById(int id)
        {
            string StoredProc = "exec OS_User_GetOrderById @UserID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var UserID = new SqlParameter("@UserID", id);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            List<UserGetOrderById> orders;
            try
            {
                orders = await context.UserGetOrderById.FromSqlRaw(StoredProc, UserID, ErrorCode, ErrorMessage).ToListAsync();
            }
            catch (Exception ex)
            {
                orders = new();
            }
            return orders;
        }

        [HttpGet]
        [Route("GetOrderDetailById/{id}")]
        public async Task<ActionResult<IEnumerable<UserGetOrderDetailById>>> GetOrderDetailById(int id)
        {
            string StoredProc = "exec OS_User_GetOrderDetailById @OrderID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var OrderID = new SqlParameter("@OrderID", id);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            List<UserGetOrderDetailById> orderDetails;
            try
            {
                orderDetails = await context.UserGetOrderDetailById.FromSqlRaw(StoredProc, OrderID, ErrorCode, ErrorMessage).ToListAsync();
            }
            catch (Exception ex)
            {
                orderDetails = new();
            }
            return orderDetails;
        }

        [HttpPost]
        [Route("DestroyOrder")]
        public async Task<ActionResult<Error>> DestroyOrder(UserDestroyOrder item)
        {
            string StoredProc = "exec OS_User_DestroyOrder @OrderID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var OrderID = new SqlParameter("@OrderID", item.OrderID);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            Error error = new Error();
            try
            {
                await context.Database.ExecuteSqlRawAsync(StoredProc, OrderID, ErrorCode, ErrorMessage);
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
