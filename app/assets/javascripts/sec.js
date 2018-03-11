$(document).ready(function () {
var sum = 0;
function mode() {
    if ($('#point').val() == 'stop') {
        sum = 0;
        $('#point').val('0');
    } else {
        $('#time').val(sum++);
    }
}
setInterval(mode, 1000);

});