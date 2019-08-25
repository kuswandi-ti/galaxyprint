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
    $row.append($("<td>").html('<input type="text" name="qty_detail[]" class="text-right" readonly value="'+$('#qty_material').val()+'">'));
    $row.append($("<td>").html('<input type="text" name="satuan_detail[]" class="" readonly value="'+$('#unit_material').val()+'">'));
    $row.append($("<td>").html('<input type="text" name="harga_detail[]" class="text-right" readonly value="'+$('#hargapersat_material').val()+'">'));
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

    $("#supplier").change(function() {
        var id=$(this).val();
        $.ajax({
            url : base_url + "Pembelian/Faktur/get_info_po",
            method : "POST",
            data : {supplier_id: id},
            async : true,
            dataType : 'json',
            success: function(data){
                if(data.length > 0){
                    var html = '';
                    var i;
                    html += '<option value="">-- Pilih No Po --</option>';
                    for(i=0; i<data.length; i++){
                        html += '<option value='+data[i].no_po+'>'+data[i].no_po+'</option>';
                    }
                    $('#no_po').html(html);
                }else{
                    alert("Tidak ada Po Open Untuk Supplier Ini");
                }

            }
        });
        return false;
    });

    $("#no_po").change(function() {
        var id=$(this).val();
        $.ajax({
            url : base_url + "Pembelian/Faktur/get_info_from_po",
            method : "POST",
            data : {no_po: id},
            async : true,
            dataType : 'json',
            success: function(data){
                $("#tr-null").remove();
                $("#currency").val(data.header.currency);
                $("#kurs").val(data.header.kurs);
                $("#tempo").val(data.header.tempo);
                $("#total").val(data.header.total);
                $("#potongan").val(data.header.potongan);
                $("#ppn").val(data.header.ppn);
                $("#grand_total").val(data.header.grand_total);
                var i;
                for(i=0; i<data.detail.length; i++){
                    var $row = $("<tr>");
                    $row.append($("<td>"));
                    $row.append($("<td>").html('<input type="text" name="nama_barang_detail[]" style="width:100%" class="" readonly value="'+data.detail[i].nama_barang+'">'));
                    $row.append($("<td>").html('<input type="text" name="kode_barang_detail[]" class="" readonly value="'+data.detail[i].kode_barang+'">'));
                    $row.append($("<td>").html('<input type="text" name="qty_detail[]" class="text-right" readonly value="'+data.detail[i].qty+'">'));
                    $row.append($("<td>").html('<input type="text" name="satuan_detail[]" class="" readonly value="'+data.detail[i].satuan+'">'));
                    $row.append($("<td>").html('<input type="text" name="harga_detail[]" class="text-right" readonly value="'+data.detail[i].harga+'">'));
                    $row.append($("<td>").html('<input type="text" name="total[]" class="text-right" readonly value="'+data.detail[i].total+'">'));
                    $row.appendTo($("#tbl_detail tbody"));
                    numberRows($("#tbl_detail"));
                }
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
            "url": base_url+'Pembelian/Faktur/ajax_list',
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
    $('.modal-title').text('Tambah Invoice'); // Set Title to Bootstrap modal title
}

function edit(id)
{
    save_method = 'update';
    $('#form')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string
 
    //Ajax Load data from ajax
    $.ajax({
        url : base_url+"Pembelian/Faktur/ajax_edit/" + id,
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
        url = base_url+"Pembelian/Faktur/ajax_add";
    } else {
        url = base_url+"Pembelian/Faktur/ajax_update";
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
            url : base_url+"Pembelian/Faktur/ajax_delete/"+id,
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