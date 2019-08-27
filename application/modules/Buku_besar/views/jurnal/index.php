<div class="page-content-wrapper ">
    <div class="content ">
        <div class=" container-fluid   container-fixed-lg bg-white">
            <div class="card card-transparent">
                <div class="card-header ">
                    <div class="card-title"><?=$title?> Assets</div>
                    <div class="clearfix"></div>
                    </div>
                    <div class="card-body">
                        <div class="col-xs-12">
                            <button class="btn btn-success" onclick="add()"><i class="fa fa-plus"></i> Tambah <?=$title?></button>
                            <button class="btn btn-default" onclick="reload_table()"><i class="fa fa-refresh"></i> Refresh</button>
                            <table id="table" class="table table-condensed" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th>No Transaksi</th>
                                        <th>Tanggal</th>
                                        <th>Jumlah</th>
                                        <th>Keterangan</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                     
                                <tfoot>
                                    <tr>
                                        <th>No Transaksi</th>
                                        <th>Tanggal</th>
                                        <th>Jumlah</th>
                                        <th>Keterangan</th>
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
                                    <div class="row">
                                        <label class="control-label col-md-3">Tanggal</label>
                                        <div class="col-md-9">
                                            <div class="input-group date col-md-12 p-l-0">
                                                <input type="text" class="form-control" id="tgl_transaksi" name="tgl_transaksi" autocomplete="off" value="<?=date('Y-m-d')?>">
                                                <div class="input-group-append ">
                                                    <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                                </div>
                                            </div>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-3">Keterangan</label>
                                        <div class="col-md-9">
                                            <input name="keterangan" placeholder="Keterangan" class="form-control" type="text">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr/>
                    <!-- Nama Akun   Kode Akun   Debet   Kredit  Catatan -->
                    <div class="table-responsive">
                        <table style="width: 100%">
                            <tr class="bg-success-darker text-white">
                                <th style="width:20%">Nama Akun</th>
                                <th style="width:8%">Kode Akun</th>
                                <th style="width:10%">Debet</th>
                                <th style="width:10%">Kredit</th>
                                <th style="width:10%">Catatan</th>
                                <th style="width:10%">Action</th>
                            </tr>
                            <tr>
                                <td style="width:25%">
                                    <select class="full-width select2" required data-init-plugin="select2" id='nama_akun' name="nama_akun">
                                        <option value="" selected>-- Pilih Akun --</option>
                                        <?php                                
                                            foreach ($get_kode_akun as $row) {  
                                                echo "<option value='".$row->kode_akun."'>".$row->kode_akun.'-'.$row->nama_akun."</option>";
                                            }
                                        ?>
                                    </select>
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:8%">
                                    <input name="kode_akun" id="kode_akun" placeholder="Kode Akun" class="form-control" type="text">
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:10%">
                                    <input name="debet" id="debet" class="form-control text-right" type="text" value="0">
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:10%">
                                    <input name="kredit" id="kredit" class="form-control text-right" type="text"  value="0">
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:10%">
                                    <input name="catatan" id="catatan" placeholder="catatan" class="form-control" type="text">
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:10%">
                                    <button type="button" id="" onclick="add_detail()" class="btn btn-warning">Add</button>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <table id="tbl_detail" style="width: 100%">
                            <thead>
                                <tr class="bg-success-darker text-white">
                                    <th style="width:5%">No</th>
                                    <th style="width:20%">Nama Akun</th>
                                    <th style="width:8%">Kode Akun</th>
                                    <th style="width:10%">Debet</th>
                                    <th style="width:10%">Kredit</th>
                                    <th style="width:10%">Catatan</th>
                                    <th style="width:10%">Action</th>
                                </tr>
                            <thead>
                            <tbody>
                            </tbody>
                            <tfoot style="font-weight: 800">
                                <tr>
                                    <td colspan="6" align="right">Sub Total</td>
                                    <td colspan="" align="center">:</td>
                                    <td colspan="">
                                        <input name="sub_total" id="sub_total" placeholder="Total" class="form-control text-right" type="text" value="0.00">
                                        <span class="help-block"></span>
                                    </td>
                                </tr>
                            </tfoot>
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