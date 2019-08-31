var save_method; //for save method string
var table;

$(document).ready(function() {
    $('#tgl_opname').datepicker({
        format: 'yyyy-mm-dd',
        autoclose: true
    });
    // $('#tgl_dokumen').datepicker({
    //     format: 'yyyy-mm-dd',
    //     autoclose: true
    // });

    // $("body").on("change", "#nama_barang", function() {
    //     $.ajax({
    //         url: base_url + "warehouse/masuk_material/get_info_material",
    //         data: {
    //             'kode_barang': $('#nama_barang').val()
    //         },
    //         dataType: 'json',
    //         type: 'post',
    //         success: function(data) {
    //             if (data.result == 'done') {
    //                 $('[name="kode_barang"]').val(data.res_kode_barang);
    //                 $('[name="spesifikasi_barang"]').val(data.res_spesifikasi_barang);
    //                 $('[name="hs_barang"]').val(data.res_hs_barang);
    //                 $('[name="satuan_besar"]').val(data.res_satuan_besar);
    //                 $('[name="harga_besar"]').val(data.res_harga_satuan_besar);
    //             } else {
    //                 $('[name="kode_material"]').val('');
    //                 $('[name="spesifikasi_barang"]').val('');
    //                 $('[name="hs_barang"]').val('');
    //                 $('[name="satuan_besar"]').val('');
    //                 $('[name="harga_besar"]').val(0);
    //             }
    //             $('[name="qty_besar"]').focus();
    //         },
    //         error: function() {
    //             alert('failure');
    //         }
    //     });
    // });

    // $("body").on("keyup keypress", "#qty_besar", function() {
    //     var total = parseFloat($('#qty_besar').val()) * parseFloat($('#harga_besar').val());
    //     $('#total_besar').val(parseFloat(total));
    // });

    // $("body").on("keyup keypress", "#harga_besar", function() {
    //     var total = parseFloat($('#qty_besar').val()) * parseFloat($('#harga_besar').val());
    //     $('#total_besar').val(parseFloat(total));
    // });

    //datatables
    table = $('#table').DataTable({ 
        "dom": '<"row view-pager"<"col-sm-12"<"pull-left"f><"pull-right"i><"clearfix">>>t<"row view-pager"<"col-sm-12"<"pull-left"l><"pull-right"p><"clearfix">>>',
        "processing": true, //Feature control the processing indicator.
        "serverSide": true, //Feature control DataTables' server-side processing mode.
        "order": [], //Initial no order.
 
        // Load data for the table's content from an Ajax source
        "ajax": {
            "url": base_url+'produksi/sto_scrap/ajax_list',
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

// function numberRows($t) {
//     var c = 0;
//     $t.find("tbody tr").each(function(ind, el) {
//         $(el).find("td:eq(0)").html(++c + ".");
//     });
// }

// function load_po() {
//     // Clear dulu tabelnya, supaya data yang ada adalah yang terbaru (tidak menumpuk dengan yang lama)
//     // https://stackoverflow.com/questions/723112/jquery-fastest-way-to-remove-all-rows-from-a-very-large-table
//     $('#tbl_detail').find('tbody').detach();
//     $('#tbl_detail').append($('<tbody>'));

//     // Selanjutnya isi tabel dengan data yang baru
//     var no_po = $ ('#no_po').val();
//     $.ajax({
//         url : base_url + "warehouse/masuk_material/get_info_from_po",
//         method : "POST",
//         data : { no_po: no_po },
//         async : true,
//         dataType : 'json',
//         success: function(data) {
//             $("#supplier_id").data('select2').trigger('select', {
//                 data: {"id": data.header.supplier_id, "text": data.header.supplier_id + ' | ' + data.header.supplier_name }
//             });
//             var i;
//             for(i=0; i<data.detail.length; i++) {
//                 var $row = $("<tr>");
//                 $row.append($("<td>"));
//                 $row.append($("<td>").html('<label>'+data.detail[i].nama_barang+'</label><input type="hidden" name="nama_barang_detail[]" class="" readonly value="'+data.detail[i].nama_barang+'">'));
//                 $row.append($("<td class='text-center'>").html('<label>'+data.detail[i].kode_barang+
//                     '</label><input type="hidden" name="kode_barang_detail[]" class="" readonly value="'+data.detail[i].kode_barang+
//                     '"><input type="hidden" name="spesifikasi_barang_detail[]" class="" readonly value="'+data.detail[i].spesifikasi_barang+
//                     '"><input type="hidden" name="hs_barang_detail[]" class="" readonly value=""><input type="hidden" name="id_po_detail_detail[]" class="" readonly value="'+data.detail[i].id+'">'));
//                 $row.append($("<td class='text-right'>").html('<label>'+data.detail[i].qty+'</label><input type="hidden" name="qty_besar_detail[]" class="" readonly value="'+data.detail[i].qty+'">'));
//                 $row.append($("<td class='text-center'>").html('<label>'+data.detail[i].satuan+'</label><input type="hidden" name="satuan_besar_detail[]" class="" readonly value="'+data.detail[i].satuan+'">'));
//                 $row.append($("<td class='text-right'>").html('<label>'+data.detail[i].harga+'</label><input type="hidden" name="harga_besar_detail[]" class="" readonly value="'+data.detail[i].harga+'">'));
//                 $row.append($("<td class='text-right'>").html('<label>'+data.detail[i].total+'</label><input type="hidden" name="total_besar_detail[]" class="" readonly value="'+data.detail[i].total+'">'));
//                 $row.append($("<td class='text-center'>").html('<label>'+data.detail[i].currency+'</label><input type="hidden" name="currency_detail[]" class="" readonly value="'+data.detail[i].currency+'">'));
//                 $row.append($("<td>").html('<button class="btn btn-danger btn-xs text-right remove-row"> <i class="fa fa-trash"></i> </button>'));
//                 $row.appendTo($("#tbl_detail tbody"));
//                 numberRows($("#tbl_detail"));
//             }
//         }
//     });
//     return false;
// }

// function add_detail() {
//     /* https://stackoverflow.com/questions/50262073/dynamically-add-table-row-number-using-jquery */
//     var nama_barang = $('#nama_barang').select2('data');
//     var currency = $('#currency').select2('data');
//     var $row = $("<tr>");
//     $row.append($("<td>"));
//     $row.append($("<td>").html('<label>'+nama_barang[0].text+'</label><input type="hidden" name="nama_barang_detail[]" class="" readonly value="'+nama_barang[0].text+'">'));
//     $row.append($("<td class='text-center'>").html('<label>'+$('#kode_barang').val()+
//         '</label><input type="hidden" name="kode_barang_detail[]" class="" readonly value="'+$('#kode_barang').val()+
//         '"><input type="hidden" name="spesifikasi_barang_detail[]" class="" readonly value="'+$('#spesifikasi_barang').val()+
//         '"><input type="hidden" name="hs_barang_detail[]" class="" readonly value="'+$('#hs_barang').val()+
//         '"><input type="hidden" name="id_po_detail_detail[]" class="" readonly value="0">'));
//     $row.append($("<td class='text-right'>").html('<label>'+$('#qty_besar').val()+'</label><input type="hidden" name="qty_besar_detail[]" class="" readonly value="'+$('#qty_besar').val()+'">'));
//     $row.append($("<td class='text-center'>").html('<label>'+$('#satuan_besar').val()+'</label><input type="hidden" name="satuan_besar_detail[]" class="" readonly value="'+$('#satuan_besar').val()+'">'));
//     $row.append($("<td class='text-right'>").html('<label>'+$('#harga_besar').val()+'</label><input type="hidden" name="harga_besar_detail[]" class="" readonly value="'+$('#harga_besar').val()+'">'));
//     $row.append($("<td class='text-right'>").html('<label>'+$('#total_besar').val()+'</label><input type="hidden" name="total_besar_detail[]" class="" readonly value="'+$('#total_besar').val()+'">'));
//     $row.append($("<td class='text-center'>").html('<label>'+currency[0].text+'</label><input type="hidden" name="currency_detail[]" class="" readonly value="'+currency[0].text+'">'));
//     $row.append($("<td>").html('<button class="btn btn-danger btn-xs text-right remove-row"> <i class="fa fa-trash"></i> </button>'));
//     $row.appendTo($("#tbl_detail tbody"));
//     numberRows($("#tbl_detail"));
// }

// function reload_table() {
//     table.ajax.reload(null,false); //reload datatable ajax 
// }

function add() {
    save_method = 'add';
    $('#form')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string
    $('#modal_form').modal('show'); // show bootstrap modal
    $('.modal-title').text('Tambah Stok Opname Scrap'); // Set Title to Bootstrap modal title
}

// function show_detail() {
//     var id_header = $("#id_hidden").val();
//     $.ajax({
//         url : base_url+'warehouse/masuk_material/show_detail/?id_header='+id_header,
//         async : false,
//         success : function(data) {
//             $('#show_detail').html(data);
//         }
//     });
// }

// function edit(id) {
//     save_method = 'update';
//     $('#form')[0].reset(); // reset form on modals
//     $('.form-group').removeClass('has-error'); // clear error class
//     $('.help-block').empty(); // clear error string
 
//     //Ajax Load data from ajax
//     $.ajax({
//         url : base_url+"warehouse/masuk_material/ajax_edit/" + id,
//         type: "GET",
//         dataType: "JSON",
//         success: function(data) { 
//             $('[name="id_hidden"]').val(data.id);     
//             $('[name="tgl_masuk"]').val(data.tgl_masuk);    
//             $("#no_po").data('select2').trigger('select', {
//                 data: {"id": data.no_po, "text": data.no_po }
//             });
//             $('[name="no_invoice"]').val(data.no_invoice);
//             $("#supplier_id").data('select2').trigger('select', {
//                 data: {"id": data.supplier, "text": data.supplier + ' | ' + data.supplier_name }
//             });
//             $('[name="no_aju"]').val(data.no_aju);
//             $("#jenis_dokumen").data('select2').trigger('select', {
//                 data: {"id": data.jenis_dokumen, "text": data.jenis_dokumen }
//             });
//             $('[name="no_dokumen"]').val(data.no_dokumen);
//             $('[name="tgl_dokumen"]').val(data.tgl_dokumen);
//             show_detail();
//             $('#modal_form').modal('show'); // show bootstrap modal when complete loaded
//             $('.modal-title').text('Edit Barang Masuk (Material)'); // Set title to Bootstrap modal title 
//         },
//         error: function (jqXHR, textStatus, errorThrown) {
//             alert('Error get data from ajax');
//         }
//     });
// }

// function save() {
//     no_po = $("#no_po").val();
//     supplier_id = $("#supplier_id").val();
//     jenis_dokumen = $("#jenis_dokumen").val();
//     id_gudang = $("#id_gudang").val();

//     if (!no_po && !supplier_id && !jenis_dokumen && !id_gudang) {
//         alert("No. PO, Supplier, Jenis Dokumen, dan Warehouse harus diisi..!!!");
//         return false;
//     }

//     $('#btnSave').text('saving...'); //change button text
//     $('#btnSave').attr('disabled',true); //set button disable 

//     var url;
 
//     if(save_method == 'add') {
//         url = base_url+"warehouse/masuk_material/ajax_add";
//     } else {
//         url = base_url+"warehouse/masuk_material/ajax_update";
//     }
 
//     // ajax adding data to database
//     $.ajax({
//         url : url,
//         type: "POST",
//         data: $('#form').serialize(),
//         dataType: "JSON",
//         success: function(data) { 
//             if(data.status) {
//                 $('#modal_form').modal('hide');
//                 reload_table();
//                 location.reload(true);
//                 $('#tbl_detail').find('tbody').detach();
//                 $('#tbl_detail').append($('<tbody>'));
//             } 
//             $('#btnSave').text('save'); //change button text
//             $('#btnSave').attr('disabled',false); //set button enable  
//         },
//         error: function (jqXHR, textStatus, errorThrown) {
//             alert('Error adding / update data');
//             $('#btnSave').text('save'); //change button text
//             $('#btnSave').attr('disabled',false); //set button enable 
 
//         }
//     });
// }

// function hapus(id) {
//     if (confirm('Are you sure delete this data?')) {
//         // ajax delete data to database
//         $.ajax({
//             url : base_url+"warehouse/masuk_material/ajax_delete/"+id,
//             type: "POST",
//             dataType: "JSON",
//             success: function(data) {
//                 //if success reload ajax table
//                 $('#modal_form').modal('hide');
//                 reload_table();
//             },
//             error: function (jqXHR, textStatus, errorThrown) {
//                 alert('Error deleting data');
//             }
//         });
 
//     }
// }

// $(document).on('click', '.remove-row', function () {
//     if(confirm('Are you sure delete this data?')) {
//         $(this).closest('tr').remove();
//         return false;
//     }    
// });