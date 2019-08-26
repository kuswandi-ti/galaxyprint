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
    var $row = $("<tr>");
    $row.append($("<td>"));
    $row.append($("<td>").html('<input type="text" name="nama_barang_detail[]" class="" readonly value="'+$('#nama_barang').val()+'">'));
    $row.append($("<td>").html('<input type="text" name="kode_barang_detail[]" class="" readonly value="'+$('#kode_barang').val()+'">'));
    $row.append($("<td>").html('<input type="text" name="no_wo_detail[]" class="" readonly value="'+$('#no_wo').val()+'">'));
    $row.append($("<td>").html('<input type="text" name="customer_po_detail[]" class="" readonly value="'+$('#customer_po').val()+'">'));
    $row.append($("<td>").html('<input type="text" name="qty_detail[]" class=" text-right" readonly value="'+$('#qty').val()+'">'));
    $row.append($("<td>").html('<input type="text" name="satuan_detail[]" class="" readonly value="'+$('#satuan').val()+'">'));
    $row.append($("<td>").html('<input type="text" name="harga_detail[]" class=" text-right" readonly value="'+$('#harga_barang').val()+'">'));
    $row.append($("<td>").html('<input type="text" name="total_detail[]" class="total_detail text-right" readonly value="'+$('#total_field').val()+'">'));
    $row.append($("<td>").html('<input type="text" name="currency_detail[]" class="total_detail text-right" value="'+$('#currency').val()+'">'));
    $row.append($("<td>").html('<button class="btn btn-danger btn-xs text-right"> <i class="fa fa-remove"></i> </button>'));
    $row.appendTo($("#tbl_detail tbody"));
    numberRows($("#tbl_detail"));
}

function getTotal(){
    total = parseFloat($('[name="qty"]').val()) * parseFloat($('[name="harga_barang"]').val());
    $('[name="total_field"]').val(total);
}

$("#customer").change(function() {
    var id=$(this).val();
    $.ajax({
        url : base_url + "Penjualan/Pengiriman/get_info_barang",
        method : "POST",
        data : {customer_id: id},
        async : true,
        dataType : 'json',
        success: function(data){
            if(data.length > 0){
                var html = '';
                var i;
                html += '<option value="">-- Pilih Barang Jadi --</option>';
                for(i=0; i<data.length; i++){
                    html += '<option value='+data[i].id+'>'+data[i].nama_barang+'-Wo : '+data[i].no_wo+'-Po : '+data[i].customer_po+'</option>';
                }
                $('#id_wo_detail').html(html);
            }else{
                alert("Tidak ada Invoice Open Untuk Supplier Ini");
            }

        }
    });
    return false;
});

$("#id_wo_detail").change(function() {
    var id=$(this).val();
    $.ajax({
        url : base_url + "Penjualan/Pengiriman/get_info_wo_detail",
        method : "POST",
        data : {id: id},
        async : true,
        dataType : 'json',
        success: function(data){
            $("#nama_barang").val(data.nama_barang);
            $("#kode_barang").val(data.kode_barang);
            $("#no_wo").val(data.no_wo);
            $("#customer_po").val(data.customer_po);
            $("#qty").val(data.qty);
            $("#satuan").val(data.satuan);
            $("#harga_barang").val(data.harga_barang);
            $("#total_field").val(data.harga_barang * data.qty);
            $("#currency").val(data.currency);
        }
    });
    return false;
});

$(document).ready(function() {
 
    //datatables
    table = $('#table').DataTable({ 
        "dom": '<"row view-pager"<"col-sm-12"<"pull-left"f><"pull-right"i><"clearfix">>>t<"row view-pager"<"col-sm-12"<"pull-left"l><"pull-right"p><"clearfix">>>',
        "processing": true, //Feature control the processing indicator.
        "serverSide": true, //Feature control DataTables' server-side processing mode.
        "order": [], //Initial no order.
 
        // Load data for the table's content from an Ajax source
        "ajax": {
            "url": base_url+'penjualan/pengiriman/ajax_list',
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
        url : base_url+"penjualan/pengiriman/ajax_edit/" + id,
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
        url = base_url+"penjualan/pengiriman/ajax_add";
    } else {
        url = base_url+"penjualan/pengiriman/ajax_update";
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
            url : base_url+"penjualan/pengiriman/ajax_delete/"+id,
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