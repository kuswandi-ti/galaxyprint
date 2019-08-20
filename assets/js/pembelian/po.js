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
    var nama_material = $('#nama_material').select2('data');
    var $row = $("<tr>");
    $row.append($("<td>"));
    $row.append($("<td>").html('<input type="text" name="nama_barang_detail[]" class="" readonly value="'+nama_material[0].text+'">'));
    $row.append($("<td>").html('<input type="text" name="kode_barang_detail[]" class="" readonly value="'+$('#kode_material').val()+'">'));
    $row.append($("<td>").html('<input type="text" name="qty_detail[]" class="" readonly value="'+$('#qty_material').val()+'">'));
    $row.append($("<td>").html('<input type="text" name="satuan_detail[]" class="" readonly value="'+$('#unit_material').val()+'">'));
    $row.append($("<td>").html('<input type="text" name="harga_detail[]" class="" readonly value="'+$('#hargapersat_material').val()+'">'));
    $row.append($("<td>").html($('#total').val()));
    $row.appendTo($("#tbl_detail tbody"));
    numberRows($("#tbl_detail"));
}

function getTotal(){
    total = parseFloat($('[name="qty_material"]').val()) * parseFloat($('[name="hargapersat_material"]').val());
    $('[name="total"]').val(total);
}


$(document).ready(function() {
    $('#date').datepicker({
        format: 'yyyy-mm-dd',
        autoclose: true
    });

    $("body").on("change", "#nama_material", function() {
        $.ajax({
            url: base_url + "Pembelian/Po/get_info_material",
            data: {
                'kode_barang': $('#nama_material').val()
            },
            dataType: 'json',
            type: 'post',
            success: function(data) {
                if (data.result == 'done') {
                    $('[name="kode_material"]').val(data.res_kode_material);
                    $('[name="qty_material"]').val('0');
                    $('[name="unit_material"]').val(data.res_unit_material);
                    $('[name="hargapersat_material"]').val(data.res_hargapersat_material);
                } else {
                    $('[name="kode_material"]').val('');
                    $('[name="qty_material"]').val('0');
                    $('[name="unit_material"]').val('');
                    $('[name="hargapersat_material"]').val('');
                }
            },
            error: function() {
                alert('failure');
            }
        });
    });

    $("body").on("change", "#supplier", function() {
        $.ajax({
            url: base_url + "Pembelian/Po/get_info_supplier",
            data: {
                'supplier': $('#supplier').val()
            },
            dataType: 'json',
            type: 'post',
            success: function(data) {
                if (data.result == 'done') {
                    $('[name="currency"]').val(data.currency);
                    $('[name="tempo"]').val(data.tempo);
                } else {
                    $('[name="currency"]').val('');
                    $('[name="tempo"]').val('');
                }
            },
            error: function() {
                alert('failure');
            }
        });
    });

    //datatables
    table = $('#table').DataTable({ 
        "dom": '<"row view-pager"<"col-sm-12"<"pull-left"f><"pull-right"i><"clearfix">>>t<"row view-pager"<"col-sm-12"<"pull-left"l><"pull-right"p><"clearfix">>>',
        "processing": true, //Feature control the processing indicator.
        "serverSide": true, //Feature control DataTables' server-side processing mode.
        "order": [], //Initial no order.
 
        // Load data for the table's content from an Ajax source
        "ajax": {
            "url": base_url+'pembelian/po/ajax_list',
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
    $('.modal-title').text('Tambah PO'); // Set Title to Bootstrap modal title
}

function edit(id)
{
    save_method = 'update';
    $('#form')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string
 
    //Ajax Load data from ajax
    $.ajax({
        url : base_url+"pembelian/po/ajax_edit/" + id,
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
        url = base_url+"pembelian/po/ajax_add";
    } else {
        url = base_url+"pembelian/po/ajax_update";
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
            url : base_url+"pembelian/po/ajax_delete/"+id,
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