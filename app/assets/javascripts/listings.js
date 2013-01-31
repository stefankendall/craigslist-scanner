(function () {
    var marketChanged = function () {
        showMarket($(this).val());
    };

    var showMarket = function (market) {
        $('tr[data-market="' + market + '"]').show();
        $('tbody tr:not([data-market="' + market + '"])').hide();
    };

    $(document).ready(function () {
        $('.markets :radio').change(marketChanged);
        showMarket('raleigh');
    });
})();
