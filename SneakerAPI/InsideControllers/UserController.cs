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
    public class UserController : Controller
    {
        private readonly ISdbContext _context;

        public UserController(ISdbContext context)
        {
            _context = context;
        }

        [HttpGet]
        [Route("GetAll")]
        public async Task<ActionResult<IEnumerable<UserGetAll>>> GetAll()
        {
            string StoredProc = "exec IS_User_GetAll @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            List<UserGetAll> users;
            try
            {
                users = await _context.UserGetAll.FromSqlRaw(StoredProc, ErrorCode, ErrorMessage).ToListAsync();
            }
            catch (Exception ex)
            {
                users = null;
            }
            return users;
        }

        [HttpGet]
        [Route("GetOrderById/{id}")]
        public async Task<ActionResult<IEnumerable<UserGetOrderById>>> GetOrderById(int id)
        {
            string StoredProc = "exec IS_User_GetOrderById @UserID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var UserID = new SqlParameter("@UserID", id);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            List<UserGetOrderById> orders;
            try
            {
                orders = await _context.UserGetOrderById.FromSqlRaw(StoredProc, UserID, ErrorCode, ErrorMessage).ToListAsync();
            }
            catch (Exception ex)
            {
                orders = null;
            }
            return orders;
        }
    }
}
