<div class="page-content-wrapper ">
    <div class="content ">
        <div class=" container-fluid   container-fixed-lg bg-white">
            <div class="card card-transparent">
                <div class="card-header ">
                    <div class="card-title">Barang Keluar (Material)</div>
                    <hr>
                    <div class="card-body">
                        <div class="col-xs-12">
                            <button class="btn btn-success" onclick="add()"><i class="fa fa-plus"></i> Tambah Barang Keluar (Material)</button>
                            <button class="btn btn-default" onclick="reload_table()"><i class="fa fa-refresh"></i> Refresh</button>
                            <table id="table" class="table table-condensed" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th style="visibility:hidden;">ID</th>
                                        <th>Tgl. Keluar</th>
                                        <th>Tujuan</th>
                                        <th>Penerima</th>
                                        <th>No. Bukti</th>
                                        <th>No. Aju</th>
                                        <th>Jenis Dokumen</th>
                                        <th>No. Dokumen</th>
                                        <th>Tgl. Dokumen</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                     
                                <tfoot>
                                    <tr>
                                        <th style="visibility:hidden;">ID</th>
                                        <th>Tgl. Keluar</th>
                                        <th>Tujuan</th>
                                        <th>Penerima</th>
                                        <th>No. Bukti</th>
                                        <th>No. Aju</th>
                                        <th>Jenis Dokumen</th>
                                        <th>No. Dokumen</th>
                                        <th>Tgl. Dokumen</th>
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
                                        <label class="control-label col-md-3">Tgl Keluar</label>
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
                                        <label class="control-label col-md-3">Tujuan</label>
                                        <div class="col-md-9">
                                            <select class="full-width select2" required data-init-plugin="select2" id='jenis_keluar' name="jenis_keluar">
                                                <option value="" selected>-- Pilih Tujuan --</option>
                                                <?php                                
                                                    foreach ($get_jenis_keluar as $row) {  
                                                        echo "<option value='".$row->jenis_keluar."'>".$row->jenis_keluar."</option>";
                                                    }
                                                ?>
                                            </select>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-3">Nomor WO</label>
                                        <div class="col-md-9">
                                            <select class="full-width select2" required data-init-plugin="select2" id='no_wo' name="no_wo">
                                                <option value="" selected>-- Pilih No. WO --</option>
                                                <?php                                
                                                    foreach ($get_work_order as $row) {  
                                                        echo "<option value='".$row->no_wo."'>".$row->no_wo."</option>";
                                                    }
                                                ?>
                                            </select>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-3">Bagian</label>
                                        <div class="col-md-9">
                                            <input id="bagian" name="bagian" placeholder="Bagian" class="form-control" type="text">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="row">
                                        <label class="control-label col-md-3">Nomor Aju</label>
                                        <div class="col-md-9">
                                            <input id="no_aju" name="no_aju" placeholder="Nomor Aju" class="form-control" type="text">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-3">Jenis Dokumen</label>
                                        <div class="col-md-9">
                                            <select class="full-width select2" required data-init-plugin="select2" id='jenis_dokumen' name="jenis_dokumen">
                                                <option value="" selected>-- Pilih Jenis Dokumen --</option>
                                                <?php                                
                                                    foreach ($get_jenis_dokumen as $row) {  
                                                        echo "<option value='".$row->kode_dokumen."'>".$row->kode_dokumen."</option>";
                                                    }
                                                ?>
                                            </select>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-3">Nomor Dokumen</label>
                                        <div class="col-md-9">
                                            <input id="no_dokumen" name="no_dokumen" placeholder="Nomor Dokumen" class="form-control" type="text">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-3">Tgl Dokumen</label>
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
                                </div>
                            </div>
                        </div>
                    </div>

                    <hr>

                    <div class="table-responsive">
                        <table style="width: 100%">
                            <tr class="bg-success-darker text-white">
                                <th style="width:40%">Nama Barang</th>
                                <th style="width:10%; text-align:center">Kode Barang</th>
                                <th style="width:25%">Spesifikasi</th>
                                <th style="width:5%; text-align:center">HS</th>
                                <th style="width:5%; text-align:right">Qty</th>
                                <th style="width:10%; text-align:center">Satuan</th>
                                <th style="width:5%; text-align:center">Actions</th>
                            </tr>
                            <tr>
                                <td style="width:45%">
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
                                <td style="width:25%">
                                    <input name="spesifikasi_material" id="spesifikasi_material" placeholder="Spesifikasi" class="form-control" type="text" readonly>
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:5%">
                                    <input name="hs_material" id="hs_material" placeholder="HS" class="form-control" type="text" readonly>
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:5%">
                                    <input name="qty" id="qty" placeholder="0" class="form-control text-right" type="text" value="0">
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:10%">
                                    <input name="satuan_material" id="satuan_material" placeholder="Satuan" class="form-control" type="text" readonly>
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
                                    <th style="width:35%">Nama Barang</th>
                                    <th style="width:10%; text-align:center">Kode Barang</th>
                                    <th style="width:25%">Spesifikasi</th>
                                    <th style="width:5%; text-align:center">HS</th>
                                    <th style="width:5%; text-align:right">Qty</th>
                                    <th style="width:10%; text-align:center">Satuan</th>
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