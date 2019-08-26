<div class="page-content-wrapper ">
    <div class="content ">
        <div class=" container-fluid   container-fixed-lg bg-white">
            <div class="card card-transparent">
                <div class="card-header ">
                    <div class="card-title">Master <?=$title?></div>
                    <div class="clearfix"></div>
                    </div>
                    <div class="card-body">
                        <div class="col-xs-12">
                            <button class="btn btn-success" onclick="add()"><i class="fa fa-plus"></i> Tambah <?=$title?></button>
                            <button class="btn btn-default" onclick="reload_table()"><i class="fa fa-refresh"></i> Refresh</button>
                            <table id="table" class="table table-condensed" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th>Kode Aktiva</th>
                                        <th>Keterangan</th>
                                        <th>Kategori</th>
                                        <th>Akun Aktiva</th>
                                        <th>Tgl Perolehan</th>
                                        <th>Qty</th>
                                        <th>Usia Pakai</th>
                                        <th>Biaya Aktiva</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                     
                                <tfoot>
                                    <tr>
                                         <th>Kode Aktiva</th>
                                        <th>Keterangan</th>
                                        <th>Kategori</th>
                                        <th>Akun Aktiva</th>
                                        <th>Tgl Perolehan</th>
                                        <th>Qty</th>
                                        <th>Usia Pakai</th>
                                        <th>Biaya Aktiva</th>
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
                <h3 class="modal-title"></h3>
            </div>
            <div class="modal-body form">
                <form action="#" id="form" class="form-horizontal">
                    <input type="hidden" value="" name="id"/> 
                    <div class="form-body">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-6 col-example"  style="padding-right:20px; border-right: 1px solid #ccc;">
                                    <label class="control-label col-md-3">Kode Barang</label>
                                    <div class="col-md-9">
                                        <input name="kode_barang" placeholder="Kode Barang" class="form-control" type="text">
                                        <span class="help-block"></span>
                                    </div>
                                    <label class="control-label col-md-3">Nama Barang</label>
                                    <div class="col-md-9">
                                        <input name="nama_barang" placeholder="Nama Barang" class="form-control" type="text">
                                        <span class="help-block"></span>
                                    </div>
                                    <label class="control-label col-md-4">Kategori</label>
                                    <div class="col-md-12">
                                        <select class="full-width select2" required data-init-plugin="select2" id='kode_kategori' name="kode_kategori">
                                            <?php                                
                                                foreach ($get_kategori_barang as $row) {  
                                                    echo "<option value='".$row->kode_kategori."'>".$row->nama_kategori."</option>";
                                                }
                                            ?>
                                        </select>
                                        <span class="help-block"></span>
                                    </div>
                                    <label class="control-label col-md-3">Kode HS</label>
                                    <div class="col-md-9">
                                        <input name="hs_barang" placeholder="Kode HS" class="form-control" type="text">
                                        <span class="help-block"></span>
                                    </div>
                                </div>
                                <div class="col-md-6 ml-auto col-example">
                                    <label class="control-label col-md-3">Spesifikasi</label>
                                    <div class="col-md-9">
                                        <textarea class="form-control" name="spesifikasi_barang"></textarea>
                                        <span class="help-block"></span>
                                    </div>
                                    <label class="control-label col-md-4">Satuan</label>
                                    <div class="col-md-12">
                                        <select class="full-width select2" required data-init-plugin="select2" id='satuan' name="satuan">
                                            <?php                                
                                                foreach ($get_satuan as $row) {  
                                                    echo "<option value='".$row->nama_satuan."'>".$row->nama_satuan."</option>";
                                                }
                                            ?>
                                        </select>
                                        <span class="help-block"></span>
                                    </div>
                                    <label class="control-label col-md-3">Harga Barang</label>
                                    <div class="col-md-9">
                                        <input name="harga_barang" placeholder="" class="form-control text-right" type="text" value="0">
                                        <span class="help-block"></span>
                                    </div>
                                    <label class="control-label col-md-4">Currency</label>
                                    <div class="col-md-12">
                                        <select class="full-width" required data-init-plugin="select2" id='currency' name="currency">
                                            <?php                                
                                                foreach ($get_currency as $row) {  
                                                    echo "<option value='".$row->nama_currency."'>".$row->nama_currency."</option>";
                                                }
                                            ?>
                                        </select>
                                        <span class="help-block"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
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