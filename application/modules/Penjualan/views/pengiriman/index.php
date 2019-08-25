<div class="page-content-wrapper ">
    <div class="content ">
        <div class=" container-fluid   container-fixed-lg bg-white">
            <div class="card card-transparent">
                <div class="card-header ">
                    <div class="card-title">Daftar Pembayaran (<?=$title?>)</div>
                    <div class="clearfix"></div>
                    </div>
                    <div class="card-body">
                        <div class="col-xs-12">
                            <button class="btn btn-success" onclick="add()"><i class="fa fa-plus"></i> Tambah <?=$title?></button>
                            <button class="btn btn-default" onclick="reload_table()"><i class="fa fa-refresh"></i> Refresh</button>
                            <table id="table" class="table table-condensed" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th>Tgl DO</th>
                                        <th>No Do</th>
                                        <th>Cust</th>
                                        <th>No Inv</th>
                                        <th>No Aju</th>
                                        <th>Dokumen</th>
                                        <th>Nomor</th>
                                        <th>Tgl Dok</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                     
                                <tfoot>
                                    <tr>
                                        
                                        <th>Tgl DO</th>
                                        <th>No Do</th>
                                        <th>Cust</th>
                                        <th>No Inv</th>
                                        <th>No Aju</th>
                                        <th>Dokumen</th>
                                        <th>Nomor</th>
                                        <th>Tgl Dok</th>
                                        <th>Action</th>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap modal -->
<div class="modal fade" id="modal_form" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title">Form Tambah <?=$title?></h3>
            </div>
            <div class="modal-body form">
                <form action="#" id="form" class="form-horizontal">
                    <input type="hidden" value="" name="id"/> 
                    <div class="form-body">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="row">
                                        <label class="control-label col-md-3">Tgl Pengiriman</label>
                                        <div class="col-md-9">
                                            <div class="input-group date col-md-8 p-l-0">
                                                <input type="text" class="form-control" id="tgl_keluar" name="tgl_keluar" autocomplete="off" value="<?=date('Y-m-d')?>">
                                                <div class="input-group-append ">
                                                    <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                                </div>
                                            </div>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-3">No DO</label>
                                        <div class="col-md-9">
                                            <input id="no_do" name="no_do" placeholder="No DO" class="form-control" type="text">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-3">No Invoice</label>
                                        <div class="col-md-4">
                                            <input id="no_invoice" name="no_invoice" placeholder="No Invoice" class="form-control" type="text">
                                            <span class="help-block"></span>
                                        </div>
                                        <div class="col-md-1">Tgl</div>
                                        <div class="col-md-4">
                                            <div class="input-group date col-md-12 p-l-0">
                                                <input type="text" class="form-control" id="tgl_keluar" name="tgl_keluar" autocomplete="off" value="<?=date('Y-m-d')?>">
                                                <div class="input-group-append ">
                                                    <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                                </div>
                                            </div>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-3">Customer</label>
                                        <div class="col-md-9">
                                            <select class="full-width select2" required data-init-plugin="select2" id='customer' name="customer">
                                                <option value="" selected>-- Pilih Customer --</option>
                                                <?php
                                                    if($get_customer->num_row() > 0){                                
                                                    foreach ($get_customer->result() as $row) {  
                                                        echo "<option value='".$row->customer_id."'>".$row->customer_name."</option>";
                                                    }else{
                                                        echo "<option value=''>Belum Ada WO Open</option>";
                                                    }
                                                ?>
                                            </select>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-1"></div>
                                <div class="col-md-5">
                                    <div class="row">
                                        <label class="control-label col-md-3">No Aju</label>
                                        <div class="col-md-9">
                                            <input id="no_aju" name="no_aju" placeholder="No Aju" class="form-control" type="text">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-3">Jenis Dokumen</label>
                                        <div class="col-md-9">
                                            <select class="full-width select2" required data-init-plugin="select2" id='jenis_dokumen' name="jenis_dokumen">
                                                <option value="" selected>-- Pilih Jenis Dokumen --</option>
                                                <?php                                
                                                    foreach ($get_dokumen as $row) {  
                                                        echo "<option value='".$row->kode_dokumen."'>".$row->nama_dokumen."</option>";
                                                    }
                                                ?>
                                            </select>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-3">No Dokumen</label>
                                        <div class="col-md-9">
                                            <input id="no_dokumen" name="no_dokumen" placeholder="No Dokumen" class="form-control" type="text">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-3">Tanggal Dokumen</label>
                                        <div class="col-md-9">
                                            <div class="input-group date col-md-8 p-l-0">
                                                <input type="text" class="form-control" id="tgl_dokumen" name="tgl_dokumen" autocomplete="off" value="<?=date('Y-m-d')?>">
                                                <div class="input-group-append ">
                                                    <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                                </div>
                                            </div>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-3">Warehouse</label>
                                        <div class="col-md-9">
                                            <select class="full-width select2" required data-init-plugin="select2" id='gudang' name="gudang">
                                                <option value="" selected>-- Pilih Jenis Dokumen --</option>
                                                <?php                                
                                                    foreach ($get_gudang as $row) {  
                                                        echo "<option value='".$row->nama_gudang."'>".$row->keterangan."</option>";
                                                    }
                                                ?>
                                            </select>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table style="width: 100%">
                            <tr class="bg-success-darker text-white">
                                <th style="width:25%">Keterangan Barang</th>
                                <th style="width:8%">Kode</th>
                                <th style="width:10%">Qty</th>
                                <th style="width:10%">Satuan</th>
                                <th style="width:10%">Harga/Sat</th>
                                <th style="width:10%">Total</th>
                                <th style="width:10%">Valas</th>
                                <th style="width:10%">Action</th>
                            </tr>
                            <tr>
                                <td style="width:25%">
                                    <select class="full-width select2" required data-init-plugin="select2" id='nama_material' name="nama_material">
                                        <option value="" selected>-- Pilih Customer Untuk Menampilkan Barang --</option>
                                        <?php                                
                                            // foreach ($get_barang as $row) {  
                                            //     echo "<option value='".$row->kode_barang."'>".$row->nama_barang."</option>";
                                            // }
                                        ?>
                                    </select>
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:8%">
                                    <input name="kode_material" id="kode_material" placeholder="Kode Material" class="form-control" type="text" disabled>
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:10%">
                                    <input name="qty_material" id="qty_material" placeholder="Qty" class="form-control text-right" type="text" onkeyup ="getTotal()">
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:10%">
                                    <input name="unit_material" id="unit_material" placeholder="Satuan" class="form-control" type="text" disabled>
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:10%">
                                    <input name="hargapersat_material" id="hargapersat_material" placeholder="Harga/Sat" class="form-control text-right" type="text" onkeyup ="getTotal()">
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:10%">
                                    <input name="total_field" id="total_field" placeholder="Total" class="form-control" type="text" readonly="">
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:25%">
                                    <select class="full-width select2" required data-init-plugin="select2" id='nama_material' name="nama_material">
                                        <option value="0" selected>-- Pilih Valas --</option>
                                        <?php                                
                                            foreach ($get_currency as $row) {  
                                                echo "<option value='".$row->nama_currency."'>".$row->nama_currency."</option>";
                                            }
                                        ?>
                                    </select>
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:10%">
                                    <button type="button" id="" onclick="add_detail()" class="btn btn-warning">Add</button>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <table id="tbl_detail" style="width: 100%">
                            <thead>
                                <tr class="bg-success-darker text-white">
                                    <th style="width:5%">No</th>
                                    <th style="width:25%">Keterangan Barang</th>
                                    <th style="width:8%">Kode</th>
                                    <th style="width:10%">Qty</th>
                                    <th style="width:10%">Satuan</th>
                                    <th style="width:10%">Harga/Sat</th>
                                    <th style="width:10%">Total</th>
                                    <th style="width:10%">Valas</th>
                                    <th style="width:10%">Actions</th>
                                </tr>
                            <thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>    
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="btnSave" onclick="save()" class="btn btn-primary">Save</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- End Bootstrap modal -->