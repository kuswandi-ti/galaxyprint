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
                           <div role="tabpanel">
                                <!-- Nav tabs -->
                                <ul class="nav nav-tabs" role="tablist">
                                    <li role="presentation" class="active"><a href="#uploadTab" aria-controls="uploadTab" role="tab" data-toggle="tab">Informasi Aktiva Tetap</a>

                                    </li>
                                    <li role="presentation"><a href="#browseTab" aria-controls="browseTab" role="tab" data-toggle="tab">Informasi Akun & Biaya</a>

                                    </li>
                                </ul>
                                <!-- Tab panes -->
                                <div class="tab-content">
                                    <div role="tabpanel" class="tab-pane active" id="uploadTab">
                                        <div class="row">
                                            <label class="control-label col-md-3">Kategori</label>
                                            <div class="col-md-5">
                                                <select class="full-width select2" required data-init-plugin="select2" id='jenis_dokumen' name="jenis_dokumen">
                                                    <option value="" selected>-- Pilih Kategori --</option>
                                                    <?php                                
                                                        foreach ($get_kategori as $row) {  
                                                            echo "<option value='".$row->kode_kategori."'>".$row->nama_kategori."</option>";
                                                        }
                                                    ?>
                                                </select>
                                                <span class="help-block"></span>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label class="control-label col-md-3">Kode Aktiva</label>
                                            <div class="col-md-5">
                                                <input name="kode_aktiva" placeholder="Kode Aktiva" class="form-control" type="text">
                                                <span class="help-block"></span>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label class="control-label col-md-3">Keterangan</label>
                                            <div class="col-md-5">
                                                <textarea class="form-control" name="keterangan"></textarea>
                                                <span class="help-block"></span>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label class="control-label col-md-3">Spesifikasi</label>
                                            <div class="col-md-5">
                                                <textarea class="form-control" name="spesifikasi"></textarea>
                                                <span class="help-block"></span>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label class="control-label col-md-3">Satuan</label>
                                            <div class="col-md-5">
                                                <select class="full-width select2" required data-init-plugin="select2" id='satuan' name="satuan">
                                                    <option value="" selected>-- Pilih Satuan --</option>
                                                    <?php                                
                                                        foreach ($get_satuan as $row) {  
                                                            echo "<option value='".$row->nama_satuan."'>".$row->nama_satuan."</option>";
                                                        }
                                                    ?>
                                                </select>
                                                <span class="help-block"></span>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label class="control-label col-md-3">Tgl Perolehan</label>
                                            <div class="col-md-5">
                                                <div class="input-group date col-md-12 p-l-0">
                                                    <input type="text" class="form-control" id="tgl_perolehan" name="tgl_perolehan" autocomplete="off" value="<?=date('Y-m-d')?>">
                                                    <div class="input-group-append ">
                                                        <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                                    </div>
                                                </div>
                                                <span class="help-block"></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div role="tabpanel" class="tab-pane" id="browseTab">
                                        <div class="row">
                                            <label class="control-label col-md-3"> Usia Pakai (Bulan)</label>
                                            <div class="col-md-5">
                                                <input name="usia_pakai" class="form-control text-right" type="text" value="0">
                                                <span class="help-block"></span>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label class="control-label col-md-3"> Biaya Aktiva Satuan</label>
                                            <div class="col-md-5">
                                                <input name="biaya_aktiva" class="form-control text-right" type="text" value="0">
                                                <span class="help-block"></span>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label class="control-label col-md-3"> Qty</label>
                                            <div class="col-md-5">
                                                <input name="qty" class="form-control text-right" type="text" value="0">
                                                <span class="help-block"></span>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label class="control-label col-md-3">Currency</label>
                                            <div class="col-md-5">
                                                <select class="full-width select2" required data-init-plugin="select2" id='currency' name="currency">
                                                    <option value="" selected>-- Pilih Currency --</option>
                                                    <?php                                
                                                        foreach ($get_kategori as $row) {  
                                                            echo "<option value='".$row->kode_dokumen."'>".$row->nama_dokumen."</option>";
                                                        }
                                                    ?>
                                                </select>
                                                <span class="help-block"></span>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label class="control-label col-md-3">Akun Aktiva</label>
                                            <div class="col-md-5">
                                                <select class="full-width select2" required data-init-plugin="select2" id='kode_akun' name="kode_akun">
                                                    <option value="0" selected>-- Pilih Akun --</option>
                                                    <?php                                
                                                        foreach ($get_kode_akun as $row) {  
                                                            echo "<option value='".$row->kode_akun."'>".$row->kode_akun.' | '.$row->nama_akun."</option>";
                                                        }
                                                    ?>
                                                </select>
                                                <span class="help-block"></span>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label class="control-label col-md-3">Akun Penyusutan</label>
                                            <div class="col-md-5">
                                                <select class="full-width select2" required data-init-plugin="select2" id='kode_akun' name="kode_akun">
                                                    <option value="0" selected>-- Pilih Akun --</option>
                                                    <?php                                
                                                        foreach ($get_kode_akun as $row) {  
                                                            echo "<option value='".$row->kode_akun."'>".$row->kode_akun.' | '.$row->nama_akun."</option>";
                                                        }
                                                    ?>
                                                </select>
                                                <span class="help-block"></span>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label class="control-label col-md-3">Biaya Penyusutan</label>
                                            <div class="col-md-5">
                                                <select class="full-width select2" required data-init-plugin="select2" id='kode_akun' name="kode_akun">
                                                    <option value="0" selected>-- Pilih Akun --</option>
                                                    <?php                                
                                                        foreach ($get_kode_akun as $row) {  
                                                            echo "<option value='".$row->kode_akun."'>".$row->kode_akun.' | '.$row->nama_akun."</option>";
                                                        }
                                                    ?>
                                                </select>
                                                <span class="help-block"></span>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label class="control-label col-md-3">Akun Pengeluaran 1</label>
                                            <div class="col-md-5">
                                                <select class="full-width select2" required data-init-plugin="select2" id='kode_akun' name="kode_akun">
                                                    <option value="0" selected>-- Pilih Akun --</option>
                                                    <?php                                
                                                        foreach ($get_kode_akun as $row) {  
                                                            echo "<option value='".$row->kode_akun."'>".$row->kode_akun.' | '.$row->nama_akun."</option>";
                                                        }
                                                    ?>
                                                </select>
                                                <span class="help-block"></span>
                                            </div>
                                            <div class="col-md-1"></div>
                                            <div class="col-md-3">
                                                <input name="qty" class="form-control text-right" type="text" value="0">
                                                <span class="help-block"></span>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label class="control-label col-md-3">Akun Pengeluaran 2</label>
                                            <div class="col-md-5">
                                                <select class="full-width select2" required data-init-plugin="select2" id='kode_akun' name="kode_akun">
                                                    <option value="0" selected>-- Pilih Akun --</option>
                                                    <?php                                
                                                        foreach ($get_kode_akun as $row) {  
                                                            echo "<option value='".$row->kode_akun."'>".$row->kode_akun.' | '.$row->nama_akun."</option>";
                                                        }
                                                    ?>
                                                </select>
                                                <span class="help-block"></span>
                                            </div>
                                            <div class="col-md-1"></div>
                                            <div class="col-md-3">
                                                <input name="qty" class="form-control text-right" type="text" value="0">
                                                <span class="help-block"></span>
                                            </div>
                                        </div>
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