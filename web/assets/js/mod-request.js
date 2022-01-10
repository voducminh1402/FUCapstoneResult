$(function ($) {

    // bulma
    // dropdown
    $(".dropdown .button").click(function () {
        var dropdown = $(this).parents('.dropdown');
        dropdown.toggleClass('is-active');
        dropdown.focusout(function () {
            window.setTimeout(function () { dropdown.removeClass('is-active'); }, 100);
        });
    });
    // bulma end

});
