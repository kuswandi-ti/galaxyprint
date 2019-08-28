var save_method; //for save method string
var table;
function numberRows($t) {
    var c = 0;
    $t.find("tbody tr").each(function(ind, el) {
        $(el).find("td:eq(0)").html(++c + ".");
    });
}

 function add_detail()
{
    /* https://stackoverflow.com/questions/50262073/dynamically-add-table-row-number-using-jquery */
    var nama_akun = $('#nama_akun').select2('data');
    var currency = $('#currency').select2('data');
    var $row = $("<tr>");
    $row.append($("<td>"));
    $row.append($("<td>").html('<input type="text" name="nama_akun_detail[]" class="" readonly value="'+nama_akun[0].text+'">'));
    $row.append($("<td>").html('<input type="text" name="kode_akun_detail[]" class="" readonly value="'+$('#kode_akun').val()+'">'));
    $row.append($("<td>").html('<input type="text" name="debet_detail[]" class="debet text-right" readonly value="'+$('#debet').val()+'">'));
    $row.append($("<td>").html('<input type="text" name="kredit_detail[]" class="kredit" readonly value="'+$('#kredit').val()+'">'));
    $row.append($("<td>").html('<input type="text" name="catatan_detail[]" class=" text-right" readonly value="'+$('#catatan').val()+'">'));
    $row.appendTo($("#tbl_detail tbody"));
    numberRows($("#tbl_detail"));
    calcTot();
}

function calcTot(){
    var total_debet = 0;
    var total_kredit = 0;
    $(".debet").each(function(){
        total_debet += +$(this).val();
    });
    $("#total_debet").val(total_debet);

    $(".kredit").each(function(){
        total_kredit += +$(this).val();
    });
    $("#total_kredit").val(total_kredit);
};

$(document).ready(function() {
    $('#tgl_keluar').datepicker({
        format: 'yyyy-mm-dd',
        autoclose: true
    });
    $('#tgl_dokumen').datepicker({
        format: 'yyyy-mm-dd',
        autoclose: true
    });

    //datatables
    table = $('#table').DataTable({ 
        "dom": '<"row view-pager"<"col-sm-12"<"pull-left"f><"pull-right"i><"clearfix">>>t<"row view-pager"<"col-sm-12"<"pull-left"l><"pull-right"p><"clearfix">>>',
        "processing": true, //Feature control the processing indicator.
        "serverSide": true, //Feature control DataTables' server-side processing mode.
        "order": [], //Initial no order.
 
        // Load data for the table's content from an Ajax source
        "ajax": {
            "url": base_url+'Buku_besar/Jurnal/ajax_list',
            "type": "POST"
        },
 
        //Set column definition initialisation properties.
        "columnDefs": [
        { 
            "targets": [ -1 ], //last column
            "orderable": false, //set not orderable
        },
        ],
 
    });
});

    $("body").on("change", "#nama_akun", function() {
        $.ajax({
            url: base_url + "Buku_besar/Jurnal/get_info_akun",
            data: {
                'kode_akun': $('#nama_akun').val()
            },
            dataType: 'json',
            type: 'post',
            success: function(data) {
                if (data.result == 'done') {
                    $('[name="kode_akun"]').val(data.kode_akun);
                } else {
                    $('[name="kode_akun"]').val('');
                }
            },
            error: function() {
                alert('failure');
            }
        });
    });

function reload_table()
{
    table.ajax.reload(null,false); //reload datatable ajax 
}

function add()
{
    save_method = 'add';
    $('#form')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string
    $('#modal_form').modal('show'); // show bootstrap modal
    $('.modal-title').text('Tambah Data'); // Set Title to Bootstrap modal title
}

function edit(id)
{
    save_method = 'update';
    $('#form')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string
 
    //Ajax Load data from ajax
    $.ajax({
        url : base_url+"Buku_besar/Jurnal/ajax_edit/" + id,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        {
 
            $('[name="id"]').val(data.id);
            $('[name="kode_barang"]').val(data.kode_barang);
            $('[name="nama_barang"]').val(data.nama_barang);
            $('[name="hs_barang"]').val(data.hs_barang);
            $('[name="spesifikasi_barang"]').val(data.spesifikasi_barang);
            $('[name="harga_barang"]').val(data.harga_barang);
            $("#kode_kategori").data('select2').trigger('select', {
                data: {"id": data.kode_kategori, "text": data.kode_kategori }
            });
            $("#satuan").data('select2').trigger('select', {
                data: {"id": data.satuan, "text": data.satuan }
            });
            $("#currency").data('select2').trigger('select', {
                data: {"id": data.currency, "text": data.currency }
            });
            $('#modal_form').modal('show'); // show bootstrap modal when complete loaded
            $('.modal-title').text('Edit Data'); // Set title to Bootstrap modal title
 
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error get data from ajax');
        }
    });
}

function save()
{
    total_kredit = $("#total_kredit").val();
    total_debet = $("#total_debet").val();
    if(total_kredit != total_debet){
        alert("Total Debit & Kredit Tidak Sama...!!!");
        return false;
    }
    $('#btnSave').text('saving...'); //change button text
    $('#btnSave').attr('disabled',true); //set button disable 
    var url;
 
    if(save_method == 'add') {
        url = base_url+"Buku_besar/Jurnal/ajax_add";
    } else {
        url = base_url+"Buku_besar/Jurnal/ajax_update";
    }
 
    // ajax adding data to database
    $.ajax({
        url : url,
        type: "POST",
        data: $('#form').serialize(),
        dataType: "JSON",
        success: function(data)
        {
 
            if(data.status) //if success close modal and reload ajax table
            {
                $('#modal_form').modal('hide');
                reload_table();
            }
 
            $('#btnSave').text('save'); //change button text
            $('#btnSave').attr('disabled',false); //set button enable 
 
 
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error adding / update data');
            $('#btnSave').text('save'); //change button text
            $('#btnSave').attr('disabled',false); //set button enable 
 
        }
    });
}

function hapus(id)
{
    if(confirm('Are you sure delete this data?'))
    {
        // ajax delete data to database
        $.ajax({
            url : base_url+"Buku_besar/Jurnal/ajax_delete/"+id,
            type: "POST",
            dataType: "JSON",
            success: function(data)
            {
                //if success reload ajax table
                $('#modal_form').modal('hide');
                reload_table();
            },
            error: function (jqXHR, textStatus, errorThrown)
            {
                alert('Error deleting data');
            }
        });
 
    }
}