$(function () {

    //========== Login and register JS ==========

    //Mở modal đăng nhập khi click vào icon user
    $("#userButton").click(function () {
        $.get("/User/LoginRegister").done(function (res) {
            $("#loginRegisterModal").html(res)
            $("#loginModal").modal('show');
        });
    });

});

function submitLogin(form) {
    $.validator.unobtrusive.parse(form);
    if ($(form).valid()) {
        $.ajax({
            type: "POST",
            url: form.action,
            data: new FormData(form),
            contentType: false,
            processData: false,
            success: function (res) {
                if (res.isValid) {
                    if (res.error.errorCode == "0") {
                        $.bootstrapGrowl(res.error.errorMessage, {
                            type: 'success'
                        });
                        setTimeout(function () {
                            location.reload();
                        }, 1000);
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
    return false;
}

function submitRegister(form) {
    $.validator.unobtrusive.parse(form);
    if ($(form).valid()) {
        $.ajax({
            type: "POST",
            url: form.action,
            data: new FormData(form),
            contentType: false,
            processData: false,
            success: function (res) {
                if (res.isValid) {
                    if (res.error.errorCode == "0") {
                        $.bootstrapGrowl(res.error.errorMessage, {
                            type: 'success'
                        });
                        setTimeout(function () {
                            location.reload();
                        }, 1000);
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
    return false;
}