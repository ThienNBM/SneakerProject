// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.

//Hàm hiện modal thêm, sửa
function showModal(url, name) {
    $.ajax({
        type: "GET",
        url: url,
        success: function (res) {
            $("#commonModal .modal-title").html(name);
            $("#commonModal .modal-body").html(res);
            $("#commonModal").modal('show');
        }
    })
}

//Hàm thực hiện thêm, sửa
function submitForm(form) {
    $.ajax({
        type: "POST",
        url: form.action,
        data: new FormData(form),
        contentType: false,
        processData: false,
        success: function (res) {
            if (res.isValid) {
                if (res.error.errorMessage == "") {
                    $.bootstrapGrowl("Thực hiện thành công", {
                        type: 'success'
                    });
                    $("#commonModal .modal-body").html('');
                    $("#commonModal .modal-title").html('');
                    $("#commonModal").modal('hide');
                    dataTable.ajax.reload();
                }
                else {
                    $.bootstrapGrowl(res.error.errorMessage, {
                        type: 'danger'
                    });
                }
            }
            else {
                $.bootstrapGrowl("Dữ liệu không hợp lệ", {
                    type: 'danger'
                });
            }
        }
    });
}
