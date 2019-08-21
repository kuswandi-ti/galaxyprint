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
    var no_invoice = $('#no_invoice').select2('data');
    var $row = $("<tr>");
    $row.append($("<td>"));
    $row.append($("<td>").html('<input type="text" name="no_invoice_detail[]" class="" style="width:100%" readonly value="'+no_invoice[0].text+'">'));
    $row.append($("<td>").html('<input type="text" name="tgl_invoice_detail[]" class="" readonly value="'+$('#tgl_invoice').val()+'">'));
    $row.append($("<td>").html('<input type="text" name="jatuh_tempo_detail[]" class="" readonly value="'+$('#jatuh_tempo').val()+'">'));
    $row.append($("<td>").html('<input type="text" name="total_detail[]" class="" readonly value="'+$('#total').val()+'">'));
    $row.append($("<td>").html('<input type="text" name="currency_detail[]" class="" readonly value="'+$('#currency').val()+'">'));
    $row.append($("<td>").html('<input type="text" name="keterangan_detail[]" class="" readonly value="'+$('#keterangan').val()+'">'));
    $row.appendTo($("#tbl_detail tbody"));
    numberRows($("#tbl_detail"));
}
$(document).ready(function() {
    $("#date, #tgl_cek").datepicker({
        format: 'yyyy-mm-dd',
        autoclose: true
    }); 

    $("#supplier").change(function() {
        var id=$(this).val();
        $.ajax({
            url : base_url + "Pembelian/Pembayaran/get_info_inv",
            method : "POST",
            data : {supplier_id: id},
            async : true,
            dataType : 'json',
            success: function(data){
                if(data.length > 0){
                    var html = '';
                    var i;
                    html += '<option value="">-- Pilih No Inv --</option>';
                    for(i=0; i<data.length; i++){
                        html += '<option value='+data[i].no_invoice+'>'+data[i].no_invoice+'</option>';
                    }
                    $('#no_invoice').html(html);
                }else{
                    alert("Tidak ada Invoice Open Untuk Supplier Ini");
                }

            }
        });
        return false;
    });

    $("#no_invoice").change(function() {
        var id=$(this).val();
        $.ajax({
            url : base_url + "Pembelian/Pembayaran/get_info_from_inv",
            method : "POST",
            data : {no_invoice: id},
            async : true,
            dataType : 'json',
            success: function(data){
                $('[name="tgl_hutang"]').val(data.tgl_hutang);
                $('[name="jatuh_tempo"]').val(data.jatuh_tempo);
                $('[name="total"]').val(data.total_hutang);
                $('[name="currency"]').val(data.currency);
            }
        });
        return false;
    });

    //datatables
    table = $('#table').DataTable({ 
        "dom": '<"row view-pager"<"col-sm-12"<"pull-left"f><"pull-right"i><"clearfix">>>t<"row view-pager"<"col-sm-12"<"pull-left"l><"pull-right"p><"clearfix">>>',
        "processing": true, //Feature control the processing indicator.
        "serverSide": true, //Feature control DataTables' server-side processing mode.
        "order": [], //Initial no order.
 
        // Load data for the table's content from an Ajax source
        "ajax": {
            "url": base_url+'pembelian/pembayaran/ajax_list',
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
    $('.modal-title').text('Tambah Satuan'); // Set Title to Bootstrap modal title
}

function edit(id)
{
    save_method = 'update';
    $('#form')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string
 
    //Ajax Load data from ajax
    $.ajax({
        url : base_url+"pembelian/pembayaran/ajax_edit/" + id,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        {
 
            $('[name="id"]').val(data.id);
            $('[name="kode_satuan"]').val(data.kode_satuan);
            $('[name="nama_satuan"]').val(data.nama_satuan);
            $('#modal_form').modal('show'); // show bootstrap modal when complete loaded
            $('.modal-title').text('Edit Satuan'); // Set title to Bootstrap modal title
 
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error get data from ajax');
        }
    });
}

function save()
{
    $('#btnSave').text('saving...'); //change button text
    $('#btnSave').attr('disabled',true); //set button disable 
    var url;
 
    if(save_method == 'add') {
        url = base_url+"pembelian/pembayaran/ajax_add";
    } else {
        url = base_url+"pembelian/pembayaran/ajax_update";
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
            url : base_url+"pembelian/pembayaran/ajax_delete/"+id,
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