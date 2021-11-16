using SneakerAPI.Model;
using SneakerAPI.Utility;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace SneakerAPI.Translators
{
    public static class AdminTranslator
    {
        public static AdminModel TranslateAsAdmin(this SqlDataReader reader, bool isList = false)
        {
            if (!isList)
            {
                if (!reader.HasRows)
                    return null;
                reader.Read();
            }
            var item = new AdminModel();
            if (reader.IsColumnExists("AdminID"))
                item.AdminID = SqlHelper.GetNullableInt32(reader, "AdminID");

            if (reader.IsColumnExists("Account"))
                item.Account = SqlHelper.GetNullableString(reader, "Account");

            if (reader.IsColumnExists("Password"))
                item.Password = SqlHelper.GetNullableString(reader, "Password");

            if (reader.IsColumnExists("Name"))
                item.Name = SqlHelper.GetNullableString(reader, "Name");

            if (reader.IsColumnExists("Role"))
                item.Role = SqlHelper.GetNullableInt32(reader, "Role");

            return item;
        }

        public static List<AdminModel> TranslateAsAdminList(this SqlDataReader reader)
        {
            var list = new List<AdminModel>();
            while (reader.Read())
            {
                list.Add(TranslateAsAdmin(reader, true));
            }
            return list;
        }
    }
}
