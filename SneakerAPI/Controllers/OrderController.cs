using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using SneakerAPI.Models;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SneakerAPI.Controllers
{
    [ApiExplorerSettings(IgnoreApi = true)]
    [Route("api/[controller]")]
    [ApiController]
    public class OrderController : ControllerBase
    {
        private readonly SneakerAPIDBContext _context;

        public OrderController(SneakerAPIDBContext context)
        {
            _context = context;
        }

        [HttpGet]
        [Route("GetAll")]
        public async Task<ActionResult<IEnumerable<OrderGetAll>>> GetAll()
        {
            string StoredProc = "exec Order_GetAll @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            List<OrderGetAll> orders;
            try
            {
                orders = await _context.OrderGetAll.FromSqlRaw(StoredProc, ErrorCode, ErrorMessage).ToListAsync();
            }
            catch
            {
                orders = null;
            }
            return orders;
        }
        
        [HttpGet]
        [Route("GetByUserId/{id}")]
        public async Task<ActionResult<IEnumerable<OrderGetByUserId>>> GetByUserId(int id)
        {
            string StoredProc = "exec Order_GetByUserId @UserID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var UserID = new SqlParameter("@UserID", id);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            List<OrderGetByUserId> orders;
            try
            {
                orders = await _context.OrderGetByUserId.FromSqlRaw(StoredProc, UserID, ErrorCode, ErrorMessage).ToListAsync();
            }
            catch
            {
                orders = null;
            }
            return orders;
        }
    }
}
