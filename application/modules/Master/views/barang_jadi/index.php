<div class="page-content-wrapper ">
    <div class="content ">
        <div class=" container-fluid   container-fixed-lg bg-white">
            <div class="card card-transparent">
                <div class="card-header ">
                    <div class="card-title">Master Barang Jadi</div>
                    <div class="clearfix"></div>
                    </div>
                    <div class="card-body">
                        <div class="col-xs-12">
                            <button class="btn btn-success" onclick="add()"><i class="fa fa-plus"></i> Tambah Barang Jadi</button>
                            <button class="btn btn-default" onclick="reload_table()"><i class="fa fa-refresh"></i> Refresh</button>
                            <table id="table" class="table table-condensed" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th>Kode Barang</th>
                                        <th>Nama Barang</th>
                                        <th>Kategori</th>
                                        <th>Spesifikasi</th>
                                        <th>Satuan</th>
                                        <th>Aktif</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>                     
                                <tfoot>
                                    <tr>
                                        <th>Kode Barang</th>
                                        <th>Nama Barang</th>
                                        <th>Kategori</th>
                                        <th>Spesifikasi</th>
                                        <th>Satuan</th>
                                        <th>Aktif</th>
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
                <h3 class="modal-title">Form Tambah Barang Jadi</h3>
            </div>
            <div class="modal-body form">
                <div class="card-block">
                    <form action="#" id="form" class="form-horizontal">
                        <input type="hidden" value="" name="id"/> 
                        <div class="form-body">
                            <label class="control-label col-md-4">Kode Barang</label>
                            <div class="col-md-12">
                                <input name="kode_barang" placeholder="Kode Barang" class="form-control" type="text">
                                <span class="help-block"></span>
                            </div>
                            <label class="control-label col-md-4">Nama Barang</label>
                            <div class="col-md-12">
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
                            <label class="control-label col-md-4">Spesifikasi</label>
                            <div class="col-md-12">
                                <input name="spesifikasi_barang" placeholder="Spesifikasi" class="form-control" type="text">
                                <span class="help-block"></span>
                            </div>
                            <label class="control-label col-md-4">HS</label>
                            <div class="col-md-12">
                                <input name="hs_barang" placeholder="HS" class="form-control" type="text">
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
                            <label class="control-label col-md-4">HPP</label>
                            <div class="col-md-12">
                                <input name="hpp" placeholder="HPP" class="form-control" type="text">
                                <span class="help-block"></span>
                            </div>
                            <label class="control-label col-md-4">Harga Barang</label>
                            <div class="col-md-12">
                                <input name="harga_barang" placeholder="Harga Barang" class="form-control" type="text">
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
                            <label class="control-label col-md-4">Aktif</label>
                            <div class="col-md-12">
                                <select class="full-width" required data-init-plugin="select2" id='active' name="active">
        	                        <option value="Y" selected>Y</option>
                                    <option value="N">N</option>
		                        </select>
                                <span class="help-block"></span>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" id="btnSave" onclick="save()" class="btn btn-primary">Save</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- End Bootstrap modal -->