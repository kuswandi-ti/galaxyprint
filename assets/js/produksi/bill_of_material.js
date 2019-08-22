var save_method; //for save method string
var table;

$(document).ready(function() {
    $("body").on("change", "#nama_material", function() {
        $.ajax({
            url: base_url + "Produksi/Bill_Of_Material/get_info_material",
            data: {
                'kode_material': $('#nama_material').val()
            },
            dataType: 'json',
            type: 'post',
            success: function(data) {
                if (data.result == 'done') {
                    $('[name="kode_material"]').val(data.res_kode_material);
                    $('[name="hs_material"]').val('0');
                    $('[name="satuan_material"]').val(data.res_unit_material);
                    $('[name="spesifikasi_bom"]').val(data.res_spesifikasi_bom);                    
                } else {
                    $('[name="kode_material"]').val('');
                    $('[name="hs_material"]').val('');
                    $('[name="satuan_material"]').val('');
                    $('[name="spesifikasi_bom"]').val('');
                }
                $('[name="jumlah_bom"]').val(0);
                $('[name="harga_bom"]').val(0);
            },
            error: function() {
                alert('failure');
            }
        });
    });

    $("body").on("change", "#kode_barang", function() {
        $.ajax({
            url: base_url + "Produksi/Bill_Of_Material/get_info_barang_jadi",
            data: {
                'kode_barang': $('#kode_barang').val()
            },
            dataType: 'json',
            type: 'post',
            success: function(data) {
                if (data.result == 'done') {
                    $('[name="nama_barang"]').val(data.res_nama_barang);
                    $('[name="spesifikasi_barang"]').val(data.res_spesifikasi_barang);
                    $('[name="unit_barang"]').val(data.res_unit_barang);
                    $('[name="currency_barang"]').val(data.res_currency_barang);
                } else {
                    $('[name="nama_barang"]').val('');
                    $('[name="spesifikasi_barang"]').val('');
                    $('[name="unit_barang"]').val('');
                    $('[name="currency_barang"]').val('');
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
            "url": base_url+'produksi/bill_of_material/ajax_list',
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
    var nama_material = $('#nama_material').select2('data');
    var $row = $("<tr>");
    $row.append($("<td>"));

    $row.append($("<td>").html('<label>'+nama_material[0].text+'</label><input type="hidden" name="nama_material_detail[]" class="" readonly value="'+nama_material[0].text+'">'));
    $row.append($("<td class='text-center'>").html('<label>'+$('#kode_material').val()+'</label><input type="hidden" name="kode_material_detail[]" class="" readonly value="'+$('#kode_material').val()+'">'));
    $row.append($("<td class='text-center'>").html('<label>'+$('#hs_material').val()+'</label><input type="hidden" name="hs_material_detail[]" class="" readonly value="'+$('#hs_material').val()+'">'));
    $row.append($("<td class='text-center'>").html('<label>'+$('#satuan_material').val()+'</label><input type="hidden" name="satuan_material_detail[]" class="" readonly value="'+$('#satuan_material').val()+'">'));
    $row.append($("<td>").html('<label>'+$('#spesifikasi_bom').val()+'</label><input type="hidden" name="spesifikasi_bom_detail[]" class="" readonly value="'+$('#spesifikasi_bom').val()+'">'));
    $row.append($("<td class='text-right'>").html('<label>'+$('#jumlah_bom').val()+'</label><input type="hidden" name="jumlah_bom_detail[]" class="" readonly value="'+$('#jumlah_bom').val()+'">'));
    $row.append($("<td class='text-right'>").html('<label>'+$('#harga_bom').val()+'</label><input type="hidden" name="harga_bom_detail[]" class="" readonly value="'+$('#harga_bom').val()+'">'));
    $row.append($("<td class='text-center'>").html('<label>'+$('#currency_bom').val()+'</label><input type="hidden" name="currency_bom_detail[]" class="" readonly value="'+$('#currency_bom').val()+'">'));
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
    $('.modal-title').text('Tambah Bill Of Material'); // Set Title to Bootstrap modal title
}

function show_detail() {
    var id_header = $("#id_hidden").val();
    $.ajax({
        url : base_url+'produksi/bill_of_material/show_detail/?id_header='+id_header,
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
        url : base_url+"produksi/bill_of_material/ajax_edit/" + id,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        { 
            $('[name="id_hidden"]').val(data.id);
            $("#kode_barang").data('select2').trigger('select', {
                data: {"id": data.kode_barang, "text": data.nama_barang }
            });
            show_detail();
            $('#modal_form').modal('show'); // show bootstrap modal when complete loaded
            $('.modal-title').text('Edit Bill Of Material'); // Set title to Bootstrap modal title 
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error get data from ajax');
        }
    });
}

function save() {
    kode_barang = $("#kode_barang").val();
    if(!kode_barang){
        alert("Barang Jadi harus diisi..!!!");
        return false;
    }

    $('#btnSave').text('saving...'); //change button text
    $('#btnSave').attr('disabled',true); //set button disable 

    var url;
 
    if(save_method == 'add') {
        url = base_url+"Produksi/Bill_Of_Material/ajax_add";
    } else {
        url = base_url+"Produksi/Bill_Of_Material/ajax_update";
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
            url : base_url+"produksi/bill_of_material/ajax_delete/"+id,
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