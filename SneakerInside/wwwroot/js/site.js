// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.

//Hàm hiện modal thêm, sửa
function showCommonModal(url, title) {
    $.ajax({
        type: "GET",
        url: url,
        success: function (res) {
            $("#commonModal .modal-title").html(title);
            $("#commonModal .modal-body").html(res);
            $("#commonModal").modal('show');
        }
    })
}

//Hàm hiện modal xóa
function showDeleteModal() {
    $("#deleteModal").modal('show');
}

//Hàm thực hiện thêm, sửa
function submitForm(form, title) {
    $.ajax({
        type: "POST",
        url: form.action,
        data: new FormData(form),
        contentType: false,
        processData: false,
        success: function (res) {
            if (res.isValid) {
                if (res.error.errorMessage == "") {
                    $.bootstrapGrowl(title + " thành công" , {
                        type: 'success'
                    });
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

//Hàm thực hiện xóa
function submitDeleteForm(url, title) {
    $.ajax({
        type: "POST",
        url: url,
        success: function (res) {
            if (res.error.errorMessage == "") {
                $.bootstrapGrowl(title + " thành công", {
                    type: 'success'
                });
                $("#deleteModal").modal('hide');
                dataTable.ajax.reload();
            }
            else {
                $.bootstrapGrowl(res.error.errorMessage, {
                    type: 'danger'
                });
            }
        }
    });
}