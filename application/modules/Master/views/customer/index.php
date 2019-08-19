<div class="page-content-wrapper ">
    <div class="content ">
        <div class=" container-fluid   container-fixed-lg bg-white">
            <div class="card card-transparent">
                <div class="card-header ">
                    <div class="card-title">Master Customer</div>
                    <div class="clearfix"></div>
                    </div>
                    <div class="card-body">
                        <div class="col-xs-12">
                            <button class="btn btn-success" onclick="add()"><i class="fa fa-plus"></i> Tambah Customer</button>
                            <button class="btn btn-default" onclick="reload_table()"><i class="fa fa-refresh"></i> Refresh</button>
                            <table id="table" class="table table-condensed" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>Kode Customer</th>
                                        <th>Nama Customer</th>
                                        <th>Kontak</th>
                                        <th>Aktif</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>                     
                                <tfoot>
                                    <tr>
                                        <th>Id</th>
                                        <th>Kode Customer</th>
                                        <th>Nama Customer</th>
                                        <th>Kontak</th>
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
                <h3 class="modal-title">Form Tambah Customer</h3>
            </div>
            <div class="modal-body form">
                <div class="card-block">
                    <form action="#" id="form" class="form-horizontal">
                        <input type="hidden" value="" name="id"/> 
                        <div class="form-body">
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-md-6 col-example"  style="padding-right:20px; border-right: 1px solid #ccc;">
                                        <label class="control-label col-md-4">Kode Customer</label>
                                        <div class="col-md-12">
                                            <input name="customer_id" placeholder="Kode Customer" class="form-control" type="text">
                                            <span class="help-block"></span>
                                        </div>
                                        <label class="control-label col-md-4">Nama Customer</label>
                                        <div class="col-md-12">
                                            <input name="customer_name" placeholder="Nama Customer" class="form-control" type="text">
                                            <span class="help-block"></span>
                                        </div>
                                        <label class="control-label col-md-4">Alamat</label>
                                        <div class="col-md-12">
                                            <input name="customer_address" placeholder="Alamat" class="form-control" type="text">
                                            <span class="help-block"></span>
                                        </div>
                                        <label class="control-label col-md-4">Negara</label>
                                        <div class="col-md-12">
                                            <select class="full-width select2" required data-init-plugin="select2" id='customer_country' name="customer_country">
                                                <!--<option value="0" disabled selected>-- Pilih Negara --</option>-->
                                                <?php                                
                                                    foreach ($get_negara as $row) {  
                                                        echo "<option value='".$row->nama_negara."'>".$row->nama_negara."</option>";
                                                    }
                                                ?>
                                            </select>
                                            <span class="help-block"></span>
                                        </div>
                                        <label class="control-label col-md-4">Kontak</label>
                                        <div class="col-md-12">
                                            <input name="customer_contact" placeholder="Kontak" class="form-control" type="text">
                                            <span class="help-block"></span>
                                        </div>
                                        <label class="control-label col-md-4">No. Telepon</label>
                                        <div class="col-md-12">
                                            <input name="customer_phone" placeholder="No. Telepon" class="form-control" type="text">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="col-md-6 ml-auto col-example">
                                        <label class="control-label col-md-4">Currency</label>
                                        <div class="col-md-12">
                                            <select class="full-width" required data-init-plugin="select2" id='currency' name="currency">
                                                <!--<option value="0" disabled selected>-- Pilih Currency --</option>-->
                                                <?php                                
                                                    foreach ($get_currency as $row) {  
                                                        echo "<option value='".$row->nama_currency."'>".$row->nama_currency."</option>";
                                                    }
                                                ?>
                                            </select>
                                            <span class="help-block"></span>
                                        </div>
                                        <label class="control-label col-md-4">Tempo</label>
                                        <div class="col-md-12">
                                            <input name="tempo" placeholder="Tempo" class="form-control" type="text">
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
                                </div>
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