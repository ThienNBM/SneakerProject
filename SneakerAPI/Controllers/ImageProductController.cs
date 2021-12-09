﻿using Microsoft.AspNetCore.Mvc;
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
    public class ImageProductController : ControllerBase
    {
        private readonly SneakerAPIDBContext _context;

        public ImageProductController(SneakerAPIDBContext context)
        {
            _context = context;
        }

        [HttpGet]
        [Route("GetAll")]
        public async Task<ActionResult<IEnumerable<ImageProductGetAll>>> GetAll()
        {
            string StoredProc = "exec ImageProduct_GetAll @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            List<ImageProductGetAll> imageProducts;
            try
            {
                imageProducts = await _context.ImageProductGetAll.FromSqlRaw(StoredProc, ErrorCode, ErrorMessage).ToListAsync();
            }
            catch
            {
                imageProducts = null;
            }
            return imageProducts;
        }

        [HttpPost]
        [Route("Insert")]
        public async Task<ActionResult<Error>> Insert(ImageProductInsert imageProductInsert)
        {
            string StoredProc = "exec ImageProduct_Insert @Image, @ProductID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var Image = new SqlParameter("@Image", imageProductInsert.Image);
            var ProductID = new SqlParameter("@ProductID", imageProductInsert.ProductID);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };

            await _context.Database.ExecuteSqlRawAsync(StoredProc, Image, ProductID, ErrorCode, ErrorMessage);

            var error = new Error
            {
                ErrorCode = ErrorCode.Value.ToString(),
                ErrorMessage = ErrorMessage.Value.ToString()
            };
            return error;
        }

        [HttpGet]
        [Route("GetById/{id}")]
        public async Task<ActionResult<IEnumerable<ImageProductGetAndUpdate>>> GetById(int id)
        {
            string StoredProc = "exec ImageProduct_GetItemById @ImageID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var ImageID = new SqlParameter("@ImageID", id);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };
            List<ImageProductGetAndUpdate> imageProducts;
            try
            {
                imageProducts = await _context.ImageProductGetAndUpdate.FromSqlRaw(StoredProc, ImageID, ErrorCode, ErrorMessage).ToListAsync();
            }
            catch
            {
                imageProducts = null;
            }
            return imageProducts;
        }

        [HttpPut]
        [Route("Update")]
        public async Task<ActionResult<Error>> Update(ImageProductGetAndUpdate imageProductGetAndUpdate)
        {
            string StoredProc = "exec ImageProduct_Update @ImageID, @Image, @ProductID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var ImageID = new SqlParameter("@ImageID", imageProductGetAndUpdate.ImageID);
            var Image = new SqlParameter("@Image", imageProductGetAndUpdate.Image);
            var ProductID = new SqlParameter("@ProductID", imageProductGetAndUpdate.ProductID);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };

            await _context.Database.ExecuteSqlRawAsync(StoredProc, ImageID, Image, ProductID, ErrorCode, ErrorMessage);

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
            string StoredProc = "exec ImageProduct_Delete @ImageID, @ErrorCode OUTPUT, @ErrorMessage OUTPUT";
            var ImageID = new SqlParameter("@ImageID", id);
            var ErrorCode = new SqlParameter("@ErrorCode", System.Data.SqlDbType.NVarChar, 100) { Direction = System.Data.ParameterDirection.Output };
            var ErrorMessage = new SqlParameter("@ErrorMessage", System.Data.SqlDbType.NVarChar, 4000) { Direction = System.Data.ParameterDirection.Output };

            await _context.Database.ExecuteSqlRawAsync(StoredProc, ImageID, ErrorCode, ErrorMessage);

            var error = new Error
            {
                ErrorCode = ErrorCode.Value.ToString(),
                ErrorMessage = ErrorMessage.Value.ToString()
            };
            return error;
        }
    }
}