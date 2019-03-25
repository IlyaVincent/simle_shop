function resetButton() {
    $('.nav-link').each((n, item) => {
        $(item).removeClass("active");
    })
}

function resetCard() {
    $('.card').parent().each((n, item) => {
        $(item).fadeIn(500);
    })
}

function button() {
    resetButton();
    $(this).addClass("active");
    $('.card.category-' + ($(event.target).index() + 1)).parent().each((n, item) => {
        $(item).fadeIn(500);
    });
    $('.card').not('.category-' + ($(event.target).index() + 1)).parent().each((n, item) => {
        $(item).fadeOut(200);
    });
}

$(document).ready(
    $('.nav-link').click(button),
    $('.reset').on('click', ()=> {
        resetButton();
        resetCard();
    }),
);