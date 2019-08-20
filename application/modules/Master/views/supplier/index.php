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
                                        <th>Supplier ID</th>
                                        <th>Supplier Nama</th>
                                        <th>Address</th>
                                        <th>Country</th>
                                        <th>Contact</th>
                                        <th>Phone</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                     
                                <tfoot>
                                <tr>
                                   <th>ID</th>
                                    <th>Nama Currency</th>
                                    <th>Kurs IDR</th>
                                    <th>Last Update</th>
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
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title">Form Tambah Currency</h3>
            </div>
            <div class="modal-body form">
                <form action="#" id="form" class="form-horizontal">
                    <input type="hidden" value="" name="id"/> 
                    <div class="form-body">
                            <label class="control-label col-md-3">Supplier ID</label>
                            <div class="col-md-9">
                                <input name="supplier_id" placeholder="Supplier ID" class="form-control" type="text">
                                <span class="help-block"></span>
                            </div>
                            <label class="control-label col-md-3">Supplier Name</label>
                            <div class="col-md-9">
                                <input name="supplier_name" placeholder="Supplier Name" class="form-control" type="text">
                                <span class="help-block"></span>
                            </div>
                             <label class="control-label col-md-4">Alamat</label>
                            <div class="col-md-12">
                                <input name="supplier_address" placeholder="Alamat" class="form-control" type="text">
                                <span class="help-block"></span>
                            </div>
                            <label class="control-label col-md-4">Negara</label>
                            <div class="col-md-12">
                                <select class="full-width select2" required data-init-plugin="select2" id='supplier_country' name="supplier_country">
                                    <!--<option value="0" disabled selected>-- Pilih Negara --</option>-->
                                    <?php                                
                                        foreach ($get_negara as $row) {  
                                            echo "<option value='".$row->nama_negara."'>".$row->nama_negara."</option>";
                                        }
                                    ?>
                                </select>
                                <span class="help-block"></span>
                            </div>
                            <label class="control-label col-md-3">Contact Name</label>
                            <div class="col-md-9">
                                <input name="supplier_contact" placeholder="Supplier ID" class="form-control" type="text">
                                <span class="help-block"></span>
                            </div>
                            <label class="control-label col-md-3">Phone</label>
                            <div class="col-md-9">
                                <input name="supplier_phone" placeholder="Supplier ID" class="form-control" type="text">
                                <span class="help-block"></span>
                            </div>
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
                            <label class="control-label col-md-3">Due Date (Days)</label>
                            <div class="col-md-9">
                                <input name="tempo" class="form-control text-right" type="text" value="0">
                                <span class="help-block"></span>
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