$(document).ready(function() {
    $('#periode_awal').datepicker({
        format: 'yyyy-mm-dd',
        autoclose: true
    });

    $('#periode_akhir').datepicker({
        format: 'yyyy-mm-dd',
        autoclose: true
    });
});

$(document).on('click', '.laporan_1', function (e) {
    var dokumen		        = $('#dokumen').val();
    var periode_awal		= $('#periode_awal').val();
    var periode_akhir       = $('#periode_akhir').val();
    if(dokumen=='') {
        alert('Pilih jenis dokumen...!');
        $('#dokumen').focus();
        return false;
    }
    if(periode_awal=='') {
        alert('Isi tanggal awal laporan...!');
        $('#periode_awal').focus();
        return false;
    }
    if(periode_akhir=='') {
        alert('Isi tanggal akhir laporan...!');
        $('#periode_akhir').focus();
        return false;
    }
    var url = base_url+"laporan/lap_it_inventory/laporan_1?dokumen="+dokumen+"&periode_awal="+periode_awal+"&periode_akhir="+periode_akhir;
    var height=600;
    var width=1020;
    var leftPosition, topPosition;
    leftPosition = (window.screen.width / 2) - ((width / 2) + 10);
    topPosition = (window.screen.height / 2) - ((height / 2) + 50);
    popupwin = window.open(url, "Print","status=no,height=" + height + ",width=" + width + ",resizable=no,left="+ leftPosition + ",top=" + topPosition + ",screenX=" + leftPosition + ",screenY="+ topPosition + ",toolbar=no,menubar=no,scrollbars=yes,location=no,directories=no");	
    
    e.preventDefault();	        
});

$(document).on('click', '.laporan_2', function (e) {
    var dokumen		        = $('#dokumen').val();
    var periode_awal		= $('#periode_awal').val();
    var periode_akhir       = $('#periode_akhir').val();
    if(dokumen=='') {
        alert('Pilih jenis dokumen...!');
        $('#dokumen').focus();
        return false;
    }
    if(periode_awal=='') {
        alert('Isi tanggal awal laporan...!');
        $('#periode_awal').focus();
        return false;
    }
    if(periode_akhir=='') {
        alert('Isi tanggal akhir laporan...!');
        $('#periode_akhir').focus();
        return false;
    }
    var url = base_url+"laporan/lap_it_inventory/laporan_2?dokumen="+dokumen+"&periode_awal="+periode_awal+"&periode_akhir="+periode_akhir;
    var height=600;
    var width=1020;
    var leftPosition, topPosition;
    leftPosition = (window.screen.width / 2) - ((width / 2) + 10);
    topPosition = (window.screen.height / 2) - ((height / 2) + 50);
    popupwin = window.open(url, "Print","status=no,height=" + height + ",width=" + width + ",resizable=no,left="+ leftPosition + ",top=" + topPosition + ",screenX=" + leftPosition + ",screenY="+ topPosition + ",toolbar=no,menubar=no,scrollbars=yes,location=no,directories=no");	
    
    e.preventDefault();	        
});

$(document).on('click', '.laporan_3', function (e) {
    var dokumen		        = $('#dokumen').val();
    var periode_awal		= $('#periode_awal').val();
    var periode_akhir       = $('#periode_akhir').val();
    if(dokumen=='') {
        alert('Pilih jenis dokumen...!');
        $('#dokumen').focus();
        return false;
    }
    if(periode_awal=='') {
        alert('Isi tanggal awal laporan...!');
        $('#periode_awal').focus();
        return false;
    }
    if(periode_akhir=='') {
        alert('Isi tanggal akhir laporan...!');
        $('#periode_akhir').focus();
        return false;
    }
    var url = base_url+"laporan/lap_it_inventory/laporan_3?dokumen="+dokumen+"&periode_awal="+periode_awal+"&periode_akhir="+periode_akhir;
    var height=600;
    var width=1020;
    var leftPosition, topPosition;
    leftPosition = (window.screen.width / 2) - ((width / 2) + 10);
    topPosition = (window.screen.height / 2) - ((height / 2) + 50);
    popupwin = window.open(url, "Print","status=no,height=" + height + ",width=" + width + ",resizable=no,left="+ leftPosition + ",top=" + topPosition + ",screenX=" + leftPosition + ",screenY="+ topPosition + ",toolbar=no,menubar=no,scrollbars=yes,location=no,directories=no");	
    
    e.preventDefault();	        
});

$(document).on('click', '.laporan_4', function (e) {
    var dokumen		        = $('#dokumen').val();
    var periode_awal		= $('#periode_awal').val();
    var periode_akhir       = $('#periode_akhir').val();
    if(dokumen=='') {
        alert('Pilih jenis dokumen...!');
        $('#dokumen').focus();
        return false;
    }
    if(periode_awal=='') {
        alert('Isi tanggal awal laporan...!');
        $('#periode_awal').focus();
        return false;
    }
    if(periode_akhir=='') {
        alert('Isi tanggal akhir laporan...!');
        $('#periode_akhir').focus();
        return false;
    }
    var url = base_url+"laporan/lap_it_inventory/laporan_4?dokumen="+dokumen+"&periode_awal="+periode_awal+"&periode_akhir="+periode_akhir;
    var height=600;
    var width=1020;
    var leftPosition, topPosition;
    leftPosition = (window.screen.width / 2) - ((width / 2) + 10);
    topPosition = (window.screen.height / 2) - ((height / 2) + 50);
    popupwin = window.open(url, "Print","status=no,height=" + height + ",width=" + width + ",resizable=no,left="+ leftPosition + ",top=" + topPosition + ",screenX=" + leftPosition + ",screenY="+ topPosition + ",toolbar=no,menubar=no,scrollbars=yes,location=no,directories=no");	
    
    e.preventDefault();	        
});

$(document).on('click', '.laporan_5', function (e) {
    var dokumen		        = $('#dokumen').val();
    var periode_awal		= $('#periode_awal').val();
    var periode_akhir       = $('#periode_akhir').val();
    if(dokumen=='') {
        alert('Pilih jenis dokumen...!');
        $('#dokumen').focus();
        return false;
    }
    if(periode_awal=='') {
        alert('Isi tanggal awal laporan...!');
        $('#periode_awal').focus();
        return false;
    }
    if(periode_akhir=='') {
        alert('Isi tanggal akhir laporan...!');
        $('#periode_akhir').focus();
        return false;
    }
    var url = base_url+"laporan/lap_it_inventory/laporan_5?dokumen="+dokumen+"&periode_awal="+periode_awal+"&periode_akhir="+periode_akhir;
    var height=600;
    var width=1020;
    var leftPosition, topPosition;
    leftPosition = (window.screen.width / 2) - ((width / 2) + 10);
    topPosition = (window.screen.height / 2) - ((height / 2) + 50);
    popupwin = window.open(url, "Print","status=no,height=" + height + ",width=" + width + ",resizable=no,left="+ leftPosition + ",top=" + topPosition + ",screenX=" + leftPosition + ",screenY="+ topPosition + ",toolbar=no,menubar=no,scrollbars=yes,location=no,directories=no");	
    
    e.preventDefault();	        
});

$(document).on('click', '.laporan_6', function (e) {
    var dokumen		        = $('#dokumen').val();
    var periode_awal		= $('#periode_awal').val();
    var periode_akhir       = $('#periode_akhir').val();
    if(dokumen=='') {
        alert('Pilih jenis dokumen...!');
        $('#dokumen').focus();
        return false;
    }
    if(periode_awal=='') {
        alert('Isi tanggal awal laporan...!');
        $('#periode_awal').focus();
        return false;
    }
    if(periode_akhir=='') {
        alert('Isi tanggal akhir laporan...!');
        $('#periode_akhir').focus();
        return false;
    }
    var url = base_url+"laporan/lap_it_inventory/laporan_6?dokumen="+dokumen+"&periode_awal="+periode_awal+"&periode_akhir="+periode_akhir;
    var height=600;
    var width=1020;
    var leftPosition, topPosition;
    leftPosition = (window.screen.width / 2) - ((width / 2) + 10);
    topPosition = (window.screen.height / 2) - ((height / 2) + 50);
    popupwin = window.open(url, "Print","status=no,height=" + height + ",width=" + width + ",resizable=no,left="+ leftPosition + ",top=" + topPosition + ",screenX=" + leftPosition + ",screenY="+ topPosition + ",toolbar=no,menubar=no,scrollbars=yes,location=no,directories=no");	
    
    e.preventDefault();	        
});

$(document).on('click', '.laporan_7', function (e) {
    var dokumen		        = $('#dokumen').val();
    var periode_awal		= $('#periode_awal').val();
    var periode_akhir       = $('#periode_akhir').val();
    if(dokumen=='') {
        alert('Pilih jenis dokumen...!');
        $('#dokumen').focus();
        return false;
    }
    if(periode_awal=='') {
        alert('Isi tanggal awal laporan...!');
        $('#periode_awal').focus();
        return false;
    }
    if(periode_akhir=='') {
        alert('Isi tanggal akhir laporan...!');
        $('#periode_akhir').focus();
        return false;
    }
    var url = base_url+"laporan/lap_it_inventory/laporan_7?dokumen="+dokumen+"&periode_awal="+periode_awal+"&periode_akhir="+periode_akhir;
    var height=600;
    var width=1020;
    var leftPosition, topPosition;
    leftPosition = (window.screen.width / 2) - ((width / 2) + 10);
    topPosition = (window.screen.height / 2) - ((height / 2) + 50);
    popupwin = window.open(url, "Print","status=no,height=" + height + ",width=" + width + ",resizable=no,left="+ leftPosition + ",top=" + topPosition + ",screenX=" + leftPosition + ",screenY="+ topPosition + ",toolbar=no,menubar=no,scrollbars=yes,location=no,directories=no");	
    
    e.preventDefault();	        
});