#pragma checksum "D:\Source\SneakerProject\SneakerInside\Views\Catalog\Index.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "d420986db0b1b00d337c3dcc7335578a66d0f958"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_Catalog_Index), @"mvc.1.0.view", @"/Views/Catalog/Index.cshtml")]
namespace AspNetCore
{
    #line hidden
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.AspNetCore.Mvc.Rendering;
    using Microsoft.AspNetCore.Mvc.ViewFeatures;
#nullable restore
#line 1 "D:\Source\SneakerProject\SneakerInside\Views\_ViewImports.cshtml"
using SneakerInside;

#line default
#line hidden
#nullable disable
#nullable restore
#line 2 "D:\Source\SneakerProject\SneakerInside\Views\_ViewImports.cshtml"
using SneakerInside.Models;

#line default
#line hidden
#nullable disable
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"d420986db0b1b00d337c3dcc7335578a66d0f958", @"/Views/Catalog/Index.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"9e7e6164b0e2a3caf1bf2da49f95bae07d9883f5", @"/Views/_ViewImports.cshtml")]
    public class Views_Catalog_Index : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<IEnumerable<SneakerInside.Models.Catalog>>
    {
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
            WriteLiteral("\r\n");
#nullable restore
#line 3 "D:\Source\SneakerProject\SneakerInside\Views\Catalog\Index.cshtml"
  
    ViewData["Title"] = "Index";
    Layout = "~/Views/Shared/_Layout.cshtml";
    List<Catalog> ListCatalog = new List<Catalog>();
    ListCatalog = ViewBag.ListCatalog;

#line default
#line hidden
#nullable disable
            WriteLiteral(@"
<!-- Input addon -->
<div class=""card card-info"">
    <div class=""card-header"">
        <h3 class=""card-title"">Danh sách hãng giày</h3>
    </div>
    <div class=""card-body"">
        <table id=""catalogTable"" class=""table table-bordered table-hover"">
            <thead>
                <tr>
                    <th>
                        ");
#nullable restore
#line 20 "D:\Source\SneakerProject\SneakerInside\Views\Catalog\Index.cshtml"
                   Write(Html.DisplayNameFor(model => model.CatalogID));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                    </th>\r\n                    <th>\r\n                        ");
#nullable restore
#line 23 "D:\Source\SneakerProject\SneakerInside\Views\Catalog\Index.cshtml"
                   Write(Html.DisplayNameFor(model => model.CatalogName));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                    </th>\r\n                    <th>\r\n                        ");
#nullable restore
#line 26 "D:\Source\SneakerProject\SneakerInside\Views\Catalog\Index.cshtml"
                   Write(Html.DisplayNameFor(model => model.Status));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                    </th>\r\n                    <th style=\"text-align: center\">\r\n                        <a class=\"btn btn-success btn-sm\"");
            BeginWriteAttribute("href", " href=\"", 1020, "\"", 1058, 1);
#nullable restore
#line 29 "D:\Source\SneakerProject\SneakerInside\Views\Catalog\Index.cshtml"
WriteAttributeValue("", 1027, Url.Action("Create","Catalog"), 1027, 31, false);

#line default
#line hidden
#nullable disable
            EndWriteAttribute();
            WriteLiteral("><i class=\"fa fa-plus-square\"></i></a>\r\n                    </th>\r\n                </tr>\r\n            </thead>\r\n");
            WriteLiteral("        </table>\r\n    </div>\r\n</div>\r\n\r\n");
            DefineSection("Scripts", async() => {
                WriteLiteral(" \r\n    <script type=\"text/javascript\">\r\n\r\n        $(document).ready(function () {\r\n            var data = [];\r\n            $.ajax({\r\n                url: \'");
#nullable restore
#line 72 "D:\Source\SneakerProject\SneakerInside\Views\Catalog\Index.cshtml"
                 Write(Url.Action("GetAll", "Catalog"));

#line default
#line hidden
#nullable disable
                WriteLiteral(@"',
                type: 'GET',
                dataType: 'html',
                success: function (response) {
                    data = response;
                }
            });
            console.log('11111');
            console.log(data)
            $('#catalogTable').dataTable({
                data: data,
                columns: [
                    {
                        data: 'catalogID' },
                    { data: 'catalogName' },
                    { data: 'status' },
                    {
                        //""render"": function (data, row) {
                        //    return ""<a href='#' class='btn btn-danger' onclick=DeleteCustomer('"" + row.id + ""'); >Delete</a>"";
                        //}
                    },
                ]
            });
        });

        function getdata() {
            $.ajax({
                url: '");
#nullable restore
#line 99 "D:\Source\SneakerProject\SneakerInside\Views\Catalog\Index.cshtml"
                 Write(Url.Action("GetAll", "Catalog"));

#line default
#line hidden
#nullable disable
                WriteLiteral(@"',
                type: 'GET',
                dataType: 'html',
                success: function (response) {
                    console.log(response);
                    return data;
                }
            });
        }
    </script>
");
            }
            );
        }
        #pragma warning restore 1998
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.IModelExpressionProvider ModelExpressionProvider { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IUrlHelper Url { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IViewComponentHelper Component { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IJsonHelper Json { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<IEnumerable<SneakerInside.Models.Catalog>> Html { get; private set; }
    }
}
#pragma warning restore 1591
