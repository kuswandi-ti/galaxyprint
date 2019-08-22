var save_method; //for save method string
var table;

$(document).ready(function() {
    $('#tgl_wo').datepicker({
        format: 'yyyy-mm-dd',
        autoclose: true
    });

    $("body").on("change", "#nama_barang", function() {
        $.ajax({
            url: base_url + "produksi/work_order/get_info_barang_jadi",
            data: {
                'kode_barang': $('#nama_barang').val()
            },
            dataType: 'json',
            type: 'post',
            success: function(data) {
                if (data.result == 'done') {
                    $('[name="kode_barang"]').val(data.res_kode_barang);
                    $('[name="spesifikasi_barang"]').val(data.res_spesifikasi_barang);
                    $('[name="hs_barang"]').val(data.res_hs_barang);
                    $('[name="satuan"]').val(data.res_satuan);
                    $('[name="harga_barang"]').val(data.res_harga_barang);
                    $('[name="currency"]').val(data.res_currency);
                    $('[name="qty"]').focus();
                } else {
                    $('[name="kode_barang"]').val('');
                    $('[name="spesifikasi_barang"]').val('');
                    $('[name="hs_barang"]').val('');
                    $('[name="satuan"]').val('');
                    $('[name="harga_barang"]').val(0);
                    $('[name="currency"]').val('');
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
            "url": base_url+'produksi/work_order/ajax_list',
            "type": "POST"
        },
        //Set column definition initialisation properties.
        "columnDefs": [
        { 
            "targets": [ -1 ], //last column
            "orderable": false, //set not orderable
            'targets': [0], 'visible': false,
        },
        ],
    });
});

function numberRows($t) {
    var c = 0;
    $t.find("tbody tr").each(function(ind, el) {
        $(el).find("td:eq(0)").html(++c + ".");
    });
}

function add_detail() {
    /* https://stackoverflow.com/questions/50262073/dynamically-add-table-row-number-using-jquery */
    var nama_barang = $('#nama_barang').select2('data');
    var $row = $("<tr>");
    $row.append($("<td>"));
    $row.append($("<td>").html('<label>'+nama_barang[0].text+'</label><input type="hidden" name="nama_barang_detail[]" class="" readonly value="'+nama_barang[0].text+'">'));
    $row.append($("<td class='text-center'>").html('<label>'+$('#kode_barang').val()+'</label><input type="hidden" name="kode_barang_detail[]" class="" readonly value="'+$('#kode_barang').val()+'">'));
    $row.append($("<td>").html('<label>'+$('#spesifikasi_barang').val()+'</label><input type="hidden" name="spesifikasi_barang_detail[]" class="" readonly value="'+$('#spesifikasi_barang').val()+'">'));
    $row.append($("<td class='text-center'>").html('<label>'+$('#hs_barang').val()+'</label><input type="hidden" name="hs_barang_detail[]" class="" readonly value="'+$('#hs_barang').val()+'">'));
    $row.append($("<td class='text-right'>").html('<label>'+$('#qty').val()+'</label><input type="hidden" name="qty_detail[]" class="" readonly value="'+$('#qty').val()+'">'));
    $row.append($("<td class='text-center'>").html('<label>'+$('#satuan').val()+'</label><input type="hidden" name="satuan_detail[]" class="" readonly value="'+$('#satuan').val()+'">'));
    $row.append($("<td class='text-right'>").html('<label>'+$('#harga_barang').val()+'</label><input type="hidden" name="harga_barang_detail[]" class="" readonly value="'+$('#harga_barang').val()+'">'));
    $row.append($("<td class='text-center'>").html('<label>'+$('#currency').val()+'</label><input type="hidden" name="currency_detail[]" class="" readonly value="'+$('#currency').val()+'">'));    
    $row.append($("<td class='text-right'>").html('<label>'+$('#material').val()+'</label><input type="hidden" name="material_detail[]" class="" readonly value="'+$('#material').val()+'">'));
    $row.append($("<td class='text-right'>").html('<label>'+$('#tkl').val()+'</label><input type="hidden" name="tkl_detail[]" class="" readonly value="'+$('#tkl').val()+'">'));
    $row.append($("<td class='text-right'>").html('<label>'+$('#bop').val()+'</label><input type="hidden" name="bop_detail[]" class="" readonly value="'+$('#bop').val()+'">'));
    $row.append($("<td class='text-right'>").html('<label>'+$('#hpp').val()+'</label><input type="hidden" name="hpp_detail[]" class="" readonly value="'+$('#hpp').val()+'">'));
    $row.append($("<td>").html('<button class="btn btn-danger btn-xs text-right remove-row"> <i class="fa fa-trash"></i> </button>'));
    $row.appendTo($("#tbl_detail tbody"));
    numberRows($("#tbl_detail"));
}

function reload_table() {
    table.ajax.reload(null,false); //reload datatable ajax 
}

function add() {
    save_method = 'add';
    $('#form')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string
    $('#modal_form').modal('show'); // show bootstrap modal
    $('.modal-title').text('Tambah Work Order'); // Set Title to Bootstrap modal title
}

function show_detail() {
    var id_header = $("#id_hidden").val();
    $.ajax({
        url : base_url+'produksi/work_order/show_detail/?id_header='+id_header,
        async : false,
        success : function(data) {
            $('#show_detail').html(data);
        }
    });
}

function edit(id) {
    save_method = 'update';
    $('#form')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string
 
    //Ajax Load data from ajax
    $.ajax({
        url : base_url+"produksi/work_order/ajax_edit/" + id,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        { 
            $('[name="id_hidden"]').val(data.id);
            $('[name="tgl_wo"]').val(data.tgl_wo);
            $("#customer").data('select2').trigger('select', {
                data: {"id": data.customer_code, "text": data.customer_name }
            });
            $('[name="no_wo"]').val(data.no_wo);
            $('[name="customer_po"]').val(data.customer_po);
            show_detail();
            $('#modal_form').modal('show'); // show bootstrap modal when complete loaded
            $('.modal-title').text('Edit Work Order'); // Set title to Bootstrap modal title 
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error get data from ajax');
        }
    });
}

function save() {
    customer = $("#customer").val();
    if(!customer){
        alert("Customer harus diisi..!!!");
        return false;
    }

    $('#btnSave').text('saving...'); //change button text
    $('#btnSave').attr('disabled',true); //set button disable 

    var url;
 
    if(save_method == 'add') {
        url = base_url+"Produksi/work_order/ajax_add";
    } else {
        url = base_url+"Produksi/work_order/ajax_update";
    }
 
    // ajax adding data to database
    $.ajax({
        url : url,
        type: "POST",
        data: $('#form').serialize(),
        dataType: "JSON",
        success: function(data) { 
            if(data.status) {
                $('#modal_form').modal('hide');
                reload_table();
                $("#tbl_detail tbody").empty();
            } 
            $('#btnSave').text('save'); //change button text
            $('#btnSave').attr('disabled',false); //set button enable  
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert('Error adding / update data');
            $('#btnSave').text('save'); //change button text
            $('#btnSave').attr('disabled',false); //set button enable 
 
        }
    });
}

function hapus(id) {
    if(confirm('Are you sure delete this data?'))
    {
        // ajax delete data to database
        $.ajax({
            url : base_url+"produksi/work_order/ajax_delete/"+id,
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

$(document).on('click', '.remove-row', function () {
    if(confirm('Are you sure delete this data?')) {
        $(this).closest('tr').remove();
        return false;
    }    
});