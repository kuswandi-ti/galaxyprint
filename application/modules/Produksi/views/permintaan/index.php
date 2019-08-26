<div class="page-content-wrapper ">
    <div class="content ">
        <div class=" container-fluid   container-fixed-lg bg-white">
            <div class="card card-transparent">
                <div class="card-header ">
                    <div class="card-title">Permintaan Bahan Baku</div>
                    <hr>
                    <div class="card-body">
                        <div class="col-xs-12">
                            <button class="btn btn-success" onclick="add()"><i class="fa fa-plus"></i> Tambah Permintaan Bahan Baku</button>
                            <button class="btn btn-default" onclick="reload_table()"><i class="fa fa-refresh"></i> Refresh</button>
                            <table id="table" class="table table-condensed" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th style="visibility:hidden;">ID</th>
                                        <th>Tgl. Permintaan</th>
                                        <th>Bagian</th>
                                        <th>PIC</th>
                                        <th>No. WO</th>
                                        <th>Jml. Item</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                     
                                <tfoot>
                                    <tr>
                                        <th style="visibility:hidden;">ID</th>
                                        <th>Tgl. Permintaan</th>
                                        <th>Bagian</th>
                                        <th>PIC</th>
                                        <th>No. WO</th>
                                        <th>Jml. Item</th>
                                        <th>Status</th>
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
                                        <label class="control-label col-md-3">Tgl Permintaan</label>
                                        <div class="col-md-9">
                                            <div class="input-group date col-md-8 p-l-0">
                                                <input type="text" class="form-control" id="tgl_permintaan" name="tgl_permintaan" autocomplete="off" value="<?=date('Y-m-d')?>">
                                                <div class="input-group-append ">
                                                    <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                                </div>
                                            </div>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-3">Nomor WO</label>
                                        <div class="col-md-6">
                                            <select class="full-width select2" required data-init-plugin="select2" id='no_wo' name="no_wo">
                                                <option value="" selected>-- Pilih WO --</option>
                                                <?php                                
                                                    foreach ($get_wo as $row) {  
                                                        echo "<option value='".$row->no_wo."'>".$row->no_wo."</option>";
                                                    }
                                                ?>
                                            </select>
                                            <span class="help-block"></span>
                                        </div>
                                        <div class="col-md-3">
                                            <button type="button" id="btn_load_bom" onclick="load_bom()" class="btn btn-danger btn-sm">Load BOM</button>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-3">Bagian</label>
                                        <div class="col-md-9">
                                            <input id="no_ibagiannvoice" name="bagian" placeholder="Bagian" class="form-control" type="text">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="row">
                                        <label class="control-label col-md-3">PIC</label>
                                        <div class="col-md-9">
                                            <input id="pic" name="pic" placeholder="PIC" class="form-control" type="text">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-3">Keterangan</label>
                                        <div class="col-md-9">
                                            <textarea class="form-control" id="keterangan" name="keterangan"></textarea>
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
                                <th style="width:35%">Nama Barang</th>
                                <th style="width:10%; text-align:center">Kode Barang</th>
                                <th style="width:30%;">Spesifikasi</th>
                                <th style="width:10%; text-align:right">Qty</th>
                                <th style="width:10%; text-align:center">Sat. Kecil</th>
                                <th style="width:5%; text-align:center">Actions</th>
                            </tr>
                            <tr>
                                <td style="width:35%">
                                    <select class="full-width select2" required data-init-plugin="select2" id='nama_barang' name="nama_barang">
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
                                    <input name="kode_barang" id="kode_barang" placeholder="Kode Barang" class="form-control text-center" type="text" readonly>
                                    <input name="harga_kecil" id="harga_kecil" type="hidden">
                                    <input name="currency" id="currency" type="hidden">
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:30%">
                                    <input name="spesifikasi_barang" id="spesifikasi_barang" placeholder="Spesifikasi Barang" class="form-control text-center" type="text" readonly>
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:5%">
                                    <input name="qty" id="qty" placeholder="0" class="form-control text-right" type="text" value="0">
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:10%">
                                    <input name="satuan_kecil" id="satuan_kecil" placeholder="Satuan" class="form-control text-center" type="text" readonly>
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
                                    <th style="width:5%;">No</th>
                                    <th style="width:30%">Nama Barang</th>
                                    <th style="width:10%; text-align:center">Kode Barang</th>
                                    <th style="width:30%;">Spesifikasi</th>
                                    <th style="width:10%; text-align:right">Qty</th>
                                    <th style="width:10%; text-align:center">Sat. Kecil</th>
                                    <th style="width:5%; text-align:center">Actions</th>
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