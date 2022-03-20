using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using SneakerAPI.OutsideModel;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SneakerAPI.OutsideControllers
{
    //[ApiExplorerSettings(IgnoreApi = true)]
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
                result = null;
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
    }
}
