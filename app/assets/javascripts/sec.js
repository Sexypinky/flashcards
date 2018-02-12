$(document).ready(function () {
var sum = 0;
function mode() {
    if ($('#time').val() == 'stop') {
        sum=0;
    } else {
        $('#time').val(sum = sum + 1);
    }
};
setInterval(mode, 1000);

});