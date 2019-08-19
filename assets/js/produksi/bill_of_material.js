var save_method; //for save method string
var table;

function add()
{
    save_method = 'add';
    $('#form')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string
    $('#modal_form').modal('show'); // show bootstrap modal
    $('.modal-title').text('Tambah Bill of Material'); // Set Title to Bootstrap modal title
}

function numberRows($t) {
    var c = 0;
    $t.find("tr").each(function(ind, el) {
        $(el).find("td:eq(0)").html(++c + ".");
    });
}

function add_detail()
{
    /* https://stackoverflow.com/questions/50262073/dynamically-add-table-row-number-using-jquery */
    var nama_material = $('#nama_material').select2('data');
    var currency_material = $('#currency_material').select2('data');
    var $row = $("<tr>");
    $row.append($("<td>"));
    $row.append($("<td>").html(nama_material[0].text));
    $row.append($("<td>").html($('#kode_material').val()));
    $row.append($("<td>").html($('#spesifikasi_material').val()));
    $row.append($("<td>").html($('#hs_material').val()));
    $row.append($("<td>").html($('#qty_material').val()));
    $row.append($("<td>").html($('#unit_material').val()));
    $row.append($("<td>").html($('#hargapersat_material').val()));
    $row.append($("<td>").html(currency_material[0].text));
    $row.appendTo($("#tbl_detail tbody"));
    numberRows($("#tbl_detail"));
}

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
                $('[name="kode_hs"]').val(data.res_hs_barang);
                $('[name="spesifikasi"]').val(data.res_spesifikasi);
                $('[name="satuan"]').val(data.res_satuan);
            } else {
                $('[name="nama_barang"]').val('');
                $('[name="kode_hs"]').val('');
                $('[name="spesifikasi"]').val('');
                $('[name="satuan"]').val('');
            }
        },
        error: function() {
            alert('failure');
        }
    });
});

$("body").on("change", "#nama_material", function() {
    $.ajax({
        url: base_url + "Produksi/Bill_Of_Material/get_info_material",
        data: {
            'kode_barang': $('#nama_material').val()
        },
        dataType: 'json',
        type: 'post',
        success: function(data) {
            if (data.result == 'done') {
                $('[name="kode_material"]').val(data.res_kode_material);
                $('[name="spesifikasi_material"]').val(data.res_spesifikasi_material);
                $('[name="hs_material"]').val(data.res_hs_material);
                $('[name="qty_material"]').val('0');
                $('[name="unit_material"]').val(data.res_unit_material);
                $('[name="hargapersat_material"]').val(data.res_hargapersat_material);
            } else {
                $('[name="kode_material"]').val('');
                $('[name="spesifikasi_material"]').val('');
                $('[name="hs_material"]').val('');
                $('[name="qty_material"]').val('0');
                $('[name="unit_material"]').val('');
                $('[name="hargapersat_material"]').val('0');
            }
        },
        error: function() {
            alert('failure');
        }
    });
});