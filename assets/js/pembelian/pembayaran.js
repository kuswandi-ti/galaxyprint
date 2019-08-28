var save_method; //for save method string
var table;

$(document).ready(function() {
    $('#tgl_transaksi').datepicker({
        format: 'yyyy-mm-dd',
        autoclose: true
    });

    $('#tgl_cek').datepicker({
        format: 'yyyy-mm-dd',
        autoclose: true
    });

    $("body").on("change", "#no_invoice", function() {
        $.ajax({
            url: base_url + "pembelian/pembayaran/get_info_inv",
            data: {
                'no_invoice': $('#no_invoice').val()
            },
            dataType: 'json',
            type: 'post',
            success: function(data) {
                if (data.result == 'done') {
                    $('[name="id_hutang"]').val(data.res_id);
                    $('[name="tgl_invoice"]').val(data.res_tgl_hutang);
                    $('[name="jatuh_tempo"]').val(data.res_jatuh_tempo);
                    $('[name="total_invoice"]').val(data.res_grand_total);
                    $('[name="currency"]').val(data.res_currency);
                } else {
                    $('[name="id_hutang"]').val('');
                    $('[name="tgl_invoice"]').val('');
                    $('[name="jatuh_tempo"]').val('');
                    $('[name="total_invoice"]').val('0');
                    $('[name="currency"]').val('');
                }
                $('[name="keterangan"]').focus();
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
            "url": base_url+'pembelian/pembayaran/ajax_list',
            "type": "POST"
        },
        //Set column definition initialisation properties.
        "columnDefs": [{ 
            "targets": [ -1 ], //last column
            "orderable": false, //set not orderable
            'targets': [0], 'visible': false,
        }],
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
    var no_invoice = $('#no_invoice').select2('data');
    var $row = $("<tr>");
    $row.append($("<td>"));
    $row.append($("<td>").html('<label>'+no_invoice[0].text+
        '</label><input type="hidden" name="no_invoice_detail[]" class="" readonly value="'+no_invoice[0].text+'"></label><input type="hidden" name="id_hutang_detail[]" class="" readonly value="'+$('#id_hutang').val()+'">'));
    $row.append($("<td class='text-right'>").html('<label>'+$('#tgl_invoice').val()+'</label><input type="hidden" name="tgl_invoice_detail[]" class="" readonly value="'+$('#tgl_invoice').val()+'">'));
    $row.append($("<td class='text-right'>").html('<label>'+$('#jatuh_tempo').val()+'</label><input type="hidden" name="jatuh_tempo_detail[]" class="" readonly value="'+$('#jatuh_tempo').val()+'">'));
    $row.append($("<td class='text-right'>").html('<label>'+$('#total_invoice').val()+'</label><input type="hidden" name="total_invoice_detail[]" class="" readonly value="'+$('#total_invoice').val()+'">'));
    $row.append($("<td class='text-center'>").html('<label>'+$('#currency').val()+'</label><input type="hidden" name="currency_detail[]" class="" readonly value="'+$('#currency').val()+'">'));
    $row.append($("<td>").html('<label>'+$('#keterangan').val()+'</label><input type="hidden" name="keterangan_detail[]" class="" readonly value="'+$('#keterangan').val()+'">'));
    $row.append($("<td>").html('<button class="btn btn-danger btn-xs text-right remove-row"> <i class="fa fa-trash"></i> </button>'));
    $row.appendTo($("#tbl_detail tbody"));
    numberRows($("#tbl_detail"));

    total = parseFloat($('#total_pembayaran').val()) + parseFloat($('#total_invoice').val());
    $('[name="total_pembayaran"]').val(total);
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
    $('.modal-title').text('Tambah Pembayaran (Pembelian)'); // Set Title to Bootstrap modal title
}

function show_detail() {
    var id_header = $("#id_hidden").val();
    $.ajax({
        url : base_url+'pembelian/pembayaran/show_detail/?id_header='+id_header,
        async : false,
        success : function(data) {
            $('#show_detail').html(data);
        }
    });
}

function get_total(index) {
    var total = 0;
    $("td:nth-child(" + index + ")").each(function() {
      total += parseInt($(this).text(), 10) || 0;
    });  
    return total;
}

function edit(id) {
    save_method = 'update';
    $('#form')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string
 
    //Ajax Load data from ajax
    $.ajax({
        url : base_url+"pembelian/pembayaran/ajax_edit/" + id,
        type: "GET",
        dataType: "JSON",
        success: function(data) { 
            $('[name="id_hidden"]').val(data.id);     
            $('[name="tgl_transaksi"]').val(data.tgl_transaksi);    
            $("#kode_penerima").data('select2').trigger('select', {
                data: {"id": data.supplier_id, "text": data.supplier_id + ' | ' + data.supplier_name }
            });
            $("#kode_akun").data('select2').trigger('select', {
                data: {"id": data.kode_akun, "text": data.kode_akun + ' | ' + data.nama_akun }
            });
            $("#kode_akun_terbayar").data('select2').trigger('select', {
                data: {"id": data.kode_akun_terbayar, "text": data.kode_akun_terbayar + ' | ' + data.nama_akun_terbayar }
            });
            $("#currency_header").data('select2').trigger('select', {
                data: {"id": data.currency, "text": data.currency }
            });
            $('[name="no_cek"]').val(data.no_cek);
            $('[name="tgl_cek"]').val(data.tgl_cek);
            $('[name="keterangan_header"]').val(data.keterangan);
            $('[name="total_pembayaran"]').val(data.total_pembayaran);
            show_detail();
            $('#modal_form').modal('show'); // show bootstrap modal when complete loaded
            $('.modal-title').text('Edit Barang Masuk (Material)'); // Set title to Bootstrap modal title 
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert('Error get data from ajax');
        }
    });
}

function save() {
    kode_penerima = $("#kode_penerima").val();
    kode_akun = $("#kode_akun").val();
    kode_akun_terbayar = $("#kode_akun_terbayar").val();
    currency = $("#currency").val();

    if (!kode_penerima && !kode_akun && !kode_akun_terbayar && !currency) {
        alert("Semua data harus diisi..!!!");
        return false;
    }

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
        success: function(data) { 
            if(data.status) {
                $('#modal_form').modal('hide');
                reload_table();
                location.reload(true);
                $('#tbl_detail').find('tbody').detach();
                $('#tbl_detail').append($('<tbody>'));
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
    if (confirm('Are you sure delete this data?')) {
        // ajax delete data to database
        $.ajax({
            url : base_url+"pembelian/pembayaran/ajax_delete/"+id,
            type: "POST",
            dataType: "JSON",
            success: function(data) {
                //if success reload ajax table
                $('#modal_form').modal('hide');
                reload_table();
            },
            error: function (jqXHR, textStatus, errorThrown) {
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