var save_method; //for save method string

$(document).ready(function() {
    $("#alert").hide();
    $.ajax({
        url : base_url+"Master/Akun_default/get_data",
        type: "GET",
        dataType: "JSON",
        success: function(data)
        { 
            $("#hutang").data('select2').trigger('select', {
                data: {"id": data.hutang, "text": data.hutang }
            });
            $("#penerimaan_barang").data('select2').trigger('select', {
                data: {"id": data.penerimaan_barang, "text": data.penerimaan_barang }
            });
            $("#potongan_pembelian").data('select2').trigger('select', {
                data: {"id": data.potongan_pembelian, "text": data.potongan_pembelian }
            });
            $("#ppn_masukan").data('select2').trigger('select', {
                data: {"id": data.ppn_masukan, "text": data.ppn_masukan }
            });
            $("#bahan_baku").data('select2').trigger('select', {
                data: {"id": data.bahan_baku, "text": data.bahan_baku }
            });
            $("#bahan_penolong").data('select2').trigger('select', {
                data: {"id": data.bahan_penolong, "text": data.bahan_penolong }
            });
            $("#bahan_sparepart").data('select2').trigger('select', {
                data: {"id": data.bahan_sparepart, "text": data.bahan_sparepart }
            });
            $("#barang_wip").data('select2').trigger('select', {
                data: {"id": data.barang_wip, "text": data.barang_wip }
            });
            $("#barang_jadi").data('select2').trigger('select', {
                data: {"id": data.barang_jadi, "text": data.barang_jadi }
            });
            $("#penjualan_produk").data('select2').trigger('select', {
                data: {"id": data.penjualan_produk, "text": data.penjualan_produk }
            });
            $("#piutang").data('select2').trigger('select', {
                data: {"id": data.piutang, "text": data.piutang }
            });
            $("#pengiriman_barang").data('select2').trigger('select', {
                data: {"id": data.pengiriman_barang, "text": data.pengiriman_barang }
            });
            $("#potongan_penjualan").data('select2').trigger('select', {
                data: {"id": data.potongan_penjualan, "text": data.potongan_penjualan }
            });
            $("#ppn_keluaran").data('select2').trigger('select', {
                data: {"id": data.ppn_keluaran, "text": data.ppn_keluaran }
            });
            $("#biaya_bahan_baku").data('select2').trigger('select', {
                data: {"id": data.biaya_bahan_baku, "text": data.biaya_bahan_baku }
            });
            $("#biaya_tkl").data('select2').trigger('select', {
                data: {"id": data.biaya_tkl, "text": data.biaya_tkl }
            });
            $("#biaya_overhead").data('select2').trigger('select', {
                data: {"id": data.biaya_overhead, "text": data.biaya_overhead }
            });
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error get data from ajax');
        }
    });
});

function save()
{
    $('#btnSave').text('saving...'); //change button text
    $('#btnSave').attr('disabled',true); //set button disable 

    var url;
    url = base_url+"Master/Akun_default/save";
 
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
                // tampilkan notif / alert
                $("#alert").show();
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