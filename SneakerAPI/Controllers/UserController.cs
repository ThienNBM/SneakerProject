using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using SneakerAPI.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SneakerAPI.Controllers
{
    [ApiExplorerSettings(IgnoreApi = true)]
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : Controller
    {
        private readonly SneakerAPIDBContext _context;

        public UserController(SneakerAPIDBContext context)
        {
            _context = context;
        }

        [HttpGet]
        [Route("GetAll")]
        public async Task<ActionResult<IEnumerable<UserGetAll>>> GetAll()
        {
            string StoredProc = "exec User_GetAll @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            List<UserGetAll> users;
            try
            {
                users = await _context.UserGetAll.FromSqlRaw(StoredProc, ErrorCode, ErrorMessage).ToListAsync();
            }
            catch
            {
                users = null;
            }
            return users;
        }
    }
}
