$(document).ready(function(){
    $('#myForm').on('click','input[type="submit"]', function() {
        $.ajax({
            type: "POST",
            url: "dashboard/cards/cardcheck",
            data: "check_text="+$("#check_text").val()+"&id="+$("#id").val()+"&time="+$("#time").val(),
            success: function(notice) {
                $("#flash").html('<div class="alert alert-info">'+notice+'</div>');
                $("#myForm").load(location.href + " #myForm");
                $("#time").val('stop');
            }
        });
        return false;
    });
});
