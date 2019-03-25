function sendPost(name, formId, url = '') {
    $.post('/index.php', 'name=' + name + '&' + $(formId).serialize(), function (data, status) {
        if (status == 'success') {
            if (url != '') $(location).attr('href','/success');
        } else {
            console.log('В процессе отправки произошла ошибка :(');
        }
    })
}

function seeAlertSuccess() {
    let message = $("<div style='display:none;' class='alert alert-success'><button style='display: block;' type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>Товар добавлен в корзину</div>");
    $('.media-body').prepend(message);
    $('.alert').slideDown("slow");
}

function fixAmount() {
    $("#amount").text($("#amount").text() - $("#total").val());
    $("#total").attr("max", $("#amount").text());
}

function fixAmount() {
    $("#amount").text($("#amount").text() - $("#total").val());
    $("#total").attr("max", $("#amount").text());
}

function productZero() {
    if ($("#amount").html() == '0') {
        $(".input-group").children().detach();
        $(".input-group").html("<p>Товара нет в наличии!</p>")

    }
}

$(document).ready(
    $('#add-cart').click(function (event) {
        event.preventDefault();
        sendPost('Cart','#add-to-cart');
        fixAmount();
        seeAlertSuccess();
        productZero();
    }),
    $('#order').click(function (event) {
        event.preventDefault();
        sendPost('Order','#order-form', '/');
    }),
    $(".alert").alert('close'),
    productZero(),
);

