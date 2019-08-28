$(document).ready(function() {
	$("#param").change(function() {
        var id=$(this).val();
        $.ajax({
            url : base_url + "Laporan/Keuangan/get_result",
            method : "POST",
            data : {id: id},
            success: function(data){
               $("#result").html(data);
            }
        });
        return false;
    });
});