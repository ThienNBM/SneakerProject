// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.
$('#introduction .owl-carousel').owlCarousel({
    loop: true,
    margin: 10,
    nav: true,
    autoplay: true,
    autoplayTimeout: 5000,
    responsive: {
        0: {
            items: 1
        },
        600: {
            items: 1
        },
        1000: {
            items: 1
        }
    }
})
function openNav() {
    document.getElementById("mySidebar").style.width = "250px";
    document.getElementById("main").style.marginRight = "250px";
}

function closeNav() {
    document.getElementById("mySidebar").style.width = "0";
    document.getElementById("main").style.marginRight = "0";
}
$("#scroll-to-top").click(function () {
    $("html, body").animate({ scrollTop: 0 }, "slow");
    return false;
});
// Plus number quantiy product detail 
var plusQuantity = function () {
    if (jQuery('input[name="quantity"]').val() != undefined) {
        var currentVal = parseInt(jQuery('input[name="quantity"]').val());
        if (!isNaN(currentVal)) {
            jQuery('input[name="quantity"]').val(currentVal + 1);
        } else {
            jQuery('input[name="quantity"]').val(1);
        }
    } else {
        console.log('error: Not see elemnt ' + jQuery('input[name="quantity"]').val());
    }
}
// Minus number quantiy product detail 
var minusQuantity = function () {
    if (jQuery('input[name="quantity"]').val() != undefined) {
        var currentVal = parseInt(jQuery('input[name="quantity"]').val());
        if (!isNaN(currentVal) && currentVal > 1) {
            jQuery('input[name="quantity"]').val(currentVal - 1);
        }
    } else {
        console.log('error: Not see elemnt ' + jQuery('input[name="quantity"]').val());
    }
}
// Sản phẩm liên quan 
$('.product-detail .owl-carousel').owlCarousel({
    loop: true,
    margin: 10,
    autoplay: true,
    autoplayTimeout: 5000,
    responsive: {
        0: {
            items: 1
        },
        600: {
            items: 3
        },
        1000: {
            items: 5
        }
    }
})