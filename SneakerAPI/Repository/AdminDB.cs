using SneakerAPI.Model;
using SneakerAPI.Translators;
using SneakerAPI.Utility;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace SneakerAPI.Repository
{
    public class AdminDB
    {
        public List<AdminModel> GetAll(string connString)
        {
            return SqlHelper.ExtecuteProcedureReturnData<List<AdminModel>>(connString,
                "Admin_GetAll", r => r.TranslateAsAdminList());
        }

        public string CreateAdmin(AdminModel model, string connString)
        {
            var outParam = new SqlParameter("@ErrorMessage", SqlDbType.NVarChar, 100)
            {
                Direction = ParameterDirection.Output
            };
            SqlParameter[] param = {
                new SqlParameter("@Account",model.Account),
                new SqlParameter("@Password",model.Password),
                new SqlParameter("@Name",model.Name),
                new SqlParameter("@Role",model.Role),
                outParam
            };
            SqlHelper.ExecuteProcedureReturnString(connString, "Admin_Insert", param);
            return (string)outParam.Value;
        }
    }
}
