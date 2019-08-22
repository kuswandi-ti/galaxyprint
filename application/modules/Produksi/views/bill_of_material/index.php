<div class="page-content-wrapper ">
    <div class="content ">
        <div class=" container-fluid   container-fixed-lg bg-white">
            <div class="card card-transparent">
                <div class="card-header ">
                    <div class="card-title">Bill Of Material</div>
                    <div class="clearfix"></div>
                    </div>
                    <div class="card-body">
                        <div class="col-xs-12">
                            <button class="btn btn-success" onclick="add()"><i class="fa fa-plus"></i> Tambah Bill Of Material</button>
                            <button class="btn btn-default" onclick="reload_table()"><i class="fa fa-refresh"></i> Refresh</button>
                            <table id="table" class="table table-condensed" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th style="visibility:hidden;">ID</th>
                                        <th>Kode Barang</th>
                                        <th>Nama Barang</th>
                                        <th>Spesifikasi</th>
                                        <th>Satuan</th>
                                        <th>Currency</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                     
                                <tfoot>
                                    <tr>
                                        <th style="visibility:hidden;">ID</th>
                                        <th>Kode Barang</th>
                                        <th>Nama Barang</th>
                                        <th>Spesifikasi</th>
                                        <th>Satuan</th>
                                        <th>Currency</th>
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
                <h3 class="modal-title-br">&nbsp;</h3>
            </div>
            <div class="modal-body form">
                <form action="#" id="form" class="form-horizontal">
                    <input type="hidden" value="" name="id_hidden" id="id_hidden" />
                    <div class="form-body">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="row">
                                        <label class="control-label col-md-3">Barang</label>
                                        <div class="col-md-9">
                                            <select class="full-width select2" required data-init-plugin="select2" id='kode_barang' name="kode_barang">
                                                <option value="" selected>-- Pilih Barang --</option>
                                                <?php                                
                                                    foreach ($get_barang_jadi as $row) {  
                                                        echo "<option value='".$row->kode_barang."'>".$row->nama_barang."</option>";
                                                    }
                                                ?>
                                            </select>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-3">Nama Barang</label>
                                        <div class="col-md-9">
                                            <input id="nama_barang" name="nama_barang" placeholder="Nama Barang" class="form-control" type="text" readonly>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-3">Spesifikasi</label>
                                        <div class="col-md-9">
                                            <input id="spesifikasi_barang" name="spesifikasi_barang" placeholder="Spesifikasi" class="form-control" type="text" readonly>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-1"></div>
                                <div class="col-md-5">
                                    <div class="row">
                                        <label class="control-label col-md-3">Unit</label>
                                        <div class="col-md-9">
                                            <input id="unit_barang" name="unit_barang" placeholder="Unit" class="form-control" type="text" readonly>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-3">Currency</label>
                                        <div class="col-md-3">
                                            <input name="currency_barang" id="currency_barang" placeholder="Currency" class="form-control" type="text" readonly="">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <hr>

                    <div class="table-responsive">
                        <table style="width: 100%">
                            <tr class="bg-success-darker text-white">
                                <th style="width:20%">Nama Material</th>
                                <th style="width:10%">Kode Mat.</th>
                                <th style="width:10%">HS</th>
                                <th style="width:10%">Satuan</th>
                                <th style="width:10%">Spesifikasi</th>
                                <th style="width:10%">Jumlah</th>
                                <th style="width:10%">Harga</th>
                                <th style="width:10%">Curr</th>
                                <th style="width:10%">Actions</th>
                            </tr>
                            <tr>
                                <td style="width:20%">
                                    <select class="full-width select2" required data-init-plugin="select2" id='nama_material' name="nama_material">
                                        <option value="0" selected>-- Pilih Material --</option>
                                        <?php                                
                                            foreach ($get_material as $row) {  
                                                echo "<option value='".$row->kode_barang."'>".$row->nama_barang."</option>";
                                            }
                                        ?>
                                    </select>
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:10%">
                                    <input name="kode_material" id="kode_material" placeholder="Kode Material" class="form-control" type="text" readonly>                                    
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:10%">
                                    <input name="hs_material" id="hs_material" placeholder="HS" class="form-control" type="text" readonly>
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:10%">
                                    <input name="satuan_material" id="satuan_material" placeholder="Satuan" class="form-control" type="text" readonly>
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:10%">
                                    <input name="spesifikasi_bom" id="spesifikasi_bom" placeholder="Spesifikasi" class="form-control" type="text">
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:10%">
                                    <input name="jumlah_bom" id="jumlah_bom" placeholder="Qty" class="form-control text-right" type="text">
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:10%">
                                    <input name="harga_bom" id="harga_bom" placeholder="Harga/Sat" class="form-control text-right" type="text">
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:15%">
                                    <select class="full-width select2" required data-init-plugin="select2" id='currency_bom' name="currency_bom">
                                        <option value="0" selected>-- Pilih Currency --</option>
                                        <?php                                
                                            foreach ($get_currency as $row) {  
                                                echo "<option value='".$row->nama_currency."'>".$row->nama_currency."</option>";
                                            }
                                        ?>
                                    </select>
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:5%">
                                    <button type="button" id="" onclick="add_detail()" class="btn btn-warning">Add</button>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <table id="tbl_detail" style="width: 100%">
                            <thead>
                                <tr class="bg-success-darker text-white">
                                    <th style="width:5%; text-align:center">No</th>
                                    <th style="width:20%">Nama Material</th>
                                    <th style="width:10%; text-align:center">Kode Mat.</th>
                                    <th style="width:10%; text-align:center">HS</th>
                                    <th style="width:10%; text-align:center">Satuan</th>
                                    <th style="width:10%">Spesifikasi</th>
                                    <th style="width:10%; text-align:right">Jumlah</th>
                                    <th style="width:10%; text-align:right">Harga</th>
                                    <th style="width:10%; text-align:center">Curr</th>
                                    <th style="width:5%;; text-align:center">Actions</th>
                                </tr>
                            <thead>
                            <tbody id="show_detail">
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