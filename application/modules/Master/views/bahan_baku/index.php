<style type="text/css">
.modal .modal-lrg {
  width: 90%;
  height: 100%;
 /* margin: 0;
  padding: 0;*/
}

.modal-content {
  height: auto;
  min-height: 100%;
  border-radius: 0;
}
</style>
<div class="page-content-wrapper ">
    <div class="content ">
        <div class=" container-fluid   container-fixed-lg bg-white">
            <div class="card card-transparent">
                <div class="card-header ">
                    <div class="card-title">Master Bahan Baku</div>
                    <div class="clearfix"></div>
                    </div>
                    <div class="card-body">
                        <div class="col-xs-12">
                            <button class="btn btn-success" onclick="add()"><i class="fa fa-plus"></i> Tambah Bahan Baku</button>
                            <button class="btn btn-default" onclick="reload_table()"><i class="fa fa-refresh"></i> Refresh</button>
                            <div class="table-responsive">
                                <table id="table" style="font-size: 10px" class="table table-condensed" cellspacing="0" >
                                    <thead>
                                        <tr>
                                            <th width="7%">Kode Barang</th>
                                            <th width="12%">Nama Barang</th>
                                            <th width="12%">Spesifikasi</th>
                                            <th width="8%">Kode Kategori</th>
                                            <th width="5%">Kode Hs</th>
                                            <th width="10%">Besar</th>
                                            <th width="10%">Content</th>
                                            <th width="10%">Kecil</th>
                                            <th width="10%">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                         
                                    <tfoot>
                                    <tr>
                                        <th>Kode Barang</th>
                                        <th>Nama Barang</th>
                                        <th>Spesifikasi</th>
                                        <th>Kode Kategori</th>
                                        <th>Kode Hs</th>
                                        <th>Besar</th>
                                        <th>Content</th>
                                        <th>Kecil</th>
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
                                <label class="control-label col-md-3">Spesifikasi Barang</label>
                                <div class="col-md-9">
                                    <textarea class="form-control" name="spesifikasi_barang"></textarea>
                                    <span class="help-block"></span>
                                </div>
                                <label class="control-label col-md-4">Satuan Besar</label>
                                <div class="col-md-12">
                                    <select class="full-width select2" required data-init-plugin="select2" id='satuan_besar' name="satuan_besar">
                                        <?php                                
                                            foreach ($get_satuan as $row) {  
                                                echo "<option value='".$row->nama_satuan."'>".$row->nama_satuan."</option>";
                                            }
                                        ?>
                                    </select>
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="col-md-6 ml-auto col-example">
                                <label class="control-label col-md-4">Satuan Kecil</label>
                                <div class="col-md-12">
                                    <select class="full-width select2" required data-init-plugin="select2" id='satuan_kecil' name="satuan_kecil">
                                        <?php                                
                                            foreach ($get_satuan as $row) {  
                                                echo "<option value='".$row->nama_satuan."'>".$row->nama_satuan."</option>";
                                            }
                                        ?>
                                    </select>
                                    <span class="help-block"></span>
                                </div>
                                <label class="control-label col-md-3">Content/Konversi</label>
                                <div class="col-md-9">
                                    <input name="content" placeholder="Content" class="form-control" type="text">
                                    <span class="help-block"></span>
                                </div>
                                <label class="control-label col-md-3">Harga Satuan Besar</label>
                                <div class="col-md-9">
                                    <input name="harga_satuan_besar" placeholder="" class="form-control text-right" type="text" value="0">
                                    <span class="help-block"></span>
                                </div>
                                <label class="control-label col-md-3">Harga Satuan Kecil</label>
                                <div class="col-md-9">
                                    <input name="harga_satuan_kecil" placeholder="" class="form-control text-right" type="text" value="0">
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