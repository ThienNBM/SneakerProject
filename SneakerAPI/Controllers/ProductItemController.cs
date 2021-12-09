﻿using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using SneakerAPI.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SneakerAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductItemController : ControllerBase
    {
        private readonly SneakerAPIDBContext _context;

        public ProductItemController(SneakerAPIDBContext context)
        {
            _context = context;
        }

        [HttpGet]
        [Route("GetAll")]
        public async Task<ActionResult<IEnumerable<ProductItemGetAll>>> GetAll()
        {
            string StoredProc = "exec ProductItem_GetAll @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            List<ProductItemGetAll> productItems;
            try
            {
                productItems = await _context.ProductItemGetAll.FromSqlRaw(StoredProc, ErrorCode, ErrorMessage).ToListAsync();
            }
            catch
            {
                productItems = null;
            }
            return productItems;
        }

        [HttpPost]
        [Route("Insert")]
        public async Task<ActionResult<Error>> Insert(ProductItemInsert model)
        {
            string StoredProc = "exec ProductItem_Insert @ProductID, @SizeID, @AmountStock, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var ProductID = new SqlParameter("@ProductID", model.ProductID);
            var SizeID = new SqlParameter("@SizeID", model.SizeID);
            var AmountStock = new SqlParameter("@AmountStock", model.AmountStock);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };

            await _context.Database.ExecuteSqlRawAsync(StoredProc, ProductID, SizeID, AmountStock, ErrorCode, ErrorMessage);

            var error = new Error
            {
                ErrorCode = ErrorCode.Value.ToString(),
                ErrorMessage = ErrorMessage.Value.ToString()
            };
            return error;
        }

        [HttpGet]
        [Route("GetById/{id}")]
        public async Task<ActionResult<IEnumerable<ProductItemGetAndUpdate>>> GetById(int id)
        {
            string StoredProc = "exec ProductItem_GetItemById @ProductItemID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var ProductItemID = new SqlParameter("@ProductItemID", id);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            List<ProductItemGetAndUpdate> productItems;
            try
            {
                productItems = await _context.ProductItemGetAndUpdate.FromSqlRaw(StoredProc, ProductItemID, ErrorCode, ErrorMessage).ToListAsync();
            }
            catch
            {
                productItems = null;
            }
            return productItems;
        }

        [HttpPut]
        [Route("Update")]
        public async Task<ActionResult<Error>> Update(ProductItemGetAndUpdate model)
        {
            string StoredProc = "exec ProductItem_Update @ProductItemID, @ProductID, @SizeID, @AmountStock, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var ProductItemID = new SqlParameter("@ProductItemID", model.ProductItemID);
            var ProductID = new SqlParameter("@ProductID", model.ProductID);
            var SizeID = new SqlParameter("@SizeID", model.SizeID);
            var AmountStock = new SqlParameter("@AmountStock", model.AmountStock);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };

            await _context.Database.ExecuteSqlRawAsync(StoredProc, ProductItemID, ProductID, SizeID, AmountStock, ErrorCode, ErrorMessage);

            var error = new Error
            {
                ErrorCode = ErrorCode.Value.ToString(),
                ErrorMessage = ErrorMessage.Value.ToString()
            };
            return error;
        }

        [HttpDelete]
        [Route("Delete/{id}")]
        public async Task<ActionResult<Error>> Delete(int id)
        {
            string StoredProc = "exec ProductItem_Delete @ProductItemID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var ProductItemID = new SqlParameter("@ProductItemID", id);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };

            await _context.Database.ExecuteSqlRawAsync(StoredProc, ProductItemID, ErrorCode, ErrorMessage);

            var error = new Error
            {
                ErrorCode = ErrorCode.Value.ToString(),
                ErrorMessage = ErrorMessage.Value.ToString()
            };
            return error;
        }
    }
}
