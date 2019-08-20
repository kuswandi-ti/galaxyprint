<div class="page-content-wrapper ">
    <div class="content ">
        <div class=" container-fluid   container-fixed-lg bg-white">
            <div class="card card-transparent">
                <div class="card-header ">
                    <div class="card-title">Bill of Material</div>
                    <div class="clearfix"></div>
                    </div>
                    <div class="card-body">
                        <div class="col-xs-12">
                            <button class="btn btn-success" onclick="add()"><i class="fa fa-plus"></i> Tambah BOM</button>
                            <button class="btn btn-default" onclick="reload_table()"><i class="fa fa-refresh"></i> Refresh</button>
                            <div class="table-responsive">
                                <table id="table" style="font-size: 10px" class="table table-condensed" cellspacing="0" >
                                    <thead>
                                        <tr>
                                            <th width="15%" class="text-center">Kode Barang</th>
                                            <th width="25%" class="text-left">Nama Barang</th>
                                            <th width="25%" class="text-left">Spesifikasi</th>
                                            <th width="10%" class="text-center">Satuan</th>
                                            <th width="15%" class="text-center">Jml Bahan Baku</th>
                                            <th width="10%" class="text-center">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                         
                                    <tfoot>
                                    <tr>
                                        <th>Kode Barang</th>
                                        <th>Nama Barang</th>
                                        <th>Spesifikasi</th>
                                        <th>Satuan</th>
                                        <th>Jumlah Bahan Baku</th>
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
<div class="modal fade" id="modal_form" role="dialog" aria-hidden="false">
    <div class="modal-dialog ">
        <div class="modal-content-wrapper"> 
            <div class="modal-content">
                <div class="modal-header clearfix text-left">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    </button>
                    <h5 class="modal-title"></h5>
                    <hr>
                </div>
                <div class="modal-body">
                    <form action="#" id="form" class="form-horizontal">
                        <input type="hidden" value="" name="kode_barang"/>
                        <div class="form-body">
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="row">
                                            <label class="control-label col-md-3">Kode Barang</label>
                                            <div class="col-md-9">
                                                <select class="full-width select2" required data-init-plugin="select2" id='kode_barang' name="kode_barang">
                                                    <option value="0" selected>-- Pilih Barang --</option>
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
                                                <input name="nama_barang" placeholder="Nama Barang" class="form-control" type="text" disabled>
                                                <span class="help-block"></span>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label class="control-label col-md-3">Kode HS</label>
                                            <div class="col-md-9">
                                                <input name="kode_hs" placeholder="Kode HS" class="form-control" type="text" disabled>
                                                <span class="help-block"></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-1"></div>
                                    <div class="col-md-5">
                                        <div class="row">
                                            <label class="control-label col-md-3">Spesifikasi</label>
                                            <div class="col-md-9">
                                                <input name="spesifikasi" placeholder="Spesifikasi" class="form-control" type="text" disabled>
                                                <span class="help-block"></span>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label class="control-label col-md-3">Satuan</label>
                                            <div class="col-md-9">
                                                <input name="satuan" placeholder="Satuan" class="form-control" type="text" disabled>
                                                <span class="help-block"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <hr>

                        <div class="table-responsive">
                            <table>
                                <tr class="bg-success-darker text-white">
                                    <td style="width:25%">Keterangan Bahan</td>
                                    <td style="width:8%">Kode</td>
                                    <td style="width:17%">Spesifikasi</td>
                                    <td style="width:10%">HS</td>
                                    <td style="width:10%">Qty</td>
                                    <td style="width:10%">Satuan</td>
                                    <td style="width:10%">Harga/Sat</td>
                                    <td style="width:10%">Valas</td>
                                    <td style="width:10%">Actions</td>
                                </tr>
                                <tr>
                                    <td style="width:25%">
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
                                    <td style="width:8%">
                                        <input name="kode_material" id="kode_material" placeholder="Kode Material" class="form-control" type="text" readonly="">
                                        <span class="help-block"></span>
                                    </td>
                                    <td style="width:17%">
                                        <input name="spesifikasi_material" id="spesifikasi_material" placeholder="Spesifikasi" class="form-control" type="text">
                                        <span class="help-block"></span>
                                    </td>
                                    <td style="width:10%">
                                        <input name="hs_material" id="hs_material" placeholder="HS Code" class="form-control" type="text" readonly="">
                                        <span class="help-block"></span>
                                    </td>
                                    <td style="width:10%">
                                        <input name="qty_material" id="qty_material" placeholder="Qty" class="form-control text-right" type="text">
                                        <span class="help-block"></span>
                                    </td>
                                    <td style="width:10%">
                                        <input name="unit_material" id="unit_material" placeholder="Satuan" class="form-control text-right" type="text" readonly="">
                                        <span class="help-block"></span>
                                    </td>
                                    <td style="width:10%">
                                        <input name="hargapersat_material" id="hargapersat_material" placeholder="Harga/Sat" class="form-control" type="text">
                                        <span class="help-block"></span>
                                    </td>
                                    <td style="width:10%">
                                        <select class="full-width select2" required data-init-plugin="select2" id='currency_material' name="currency_material">
                                            <option value="0" selected>-- Pilih --</option>
                                            <?php                                
                                                foreach ($get_currency as $row) {  
                                                    echo "<option value='".$row->nama_currency."'>".$row->nama_currency."</option>";
                                                }
                                            ?>
                                        </select>
                                        <span class="help-block"></span>
                                    </td>
                                    <td style="width:10%">
                                        <button type="button" id="btnSave" onclick="add_detail()" class="btn btn-warning">Add</button>
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <table id="tbl_detail">
                                <thead>
                                    <tr class="bg-success-darker text-white">
                                        <th style="width:5%">No</th>
                                        <th style="width:20%">Keterangan Bahan</th>
                                        <th style="width:8%">Kode</th>
                                        <th style="width:17%">Spesifikasi</th>
                                        <th style="width:10%">HS</th>
                                        <th style="width:10%">Qty</th>
                                        <th style="width:10%">Satuan</th>
                                        <th style="width:10%">Harga/Sat</th>
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
            </div>
        </div>
    </div>
</div>