<div class="page-content-wrapper ">
    <div class="content ">
        <div class=" container-fluid   container-fixed-lg bg-white">
            <div class="card card-transparent">
                <div class="card-header ">
                    <div class="card-title">Daftar Pembayaran (<?=$title?>)</div>
                    <div class="clearfix"></div>
                    </div>
                    <div class="card-body">
                        <div class="col-xs-12">
                            <button class="btn btn-success" onclick="add()"><i class="fa fa-plus"></i> Tambah <?=$title?></button>
                            <button class="btn btn-default" onclick="reload_table()"><i class="fa fa-refresh"></i> Refresh</button>
                            <table id="table" class="table table-condensed" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th>Tgl</th>
                                        <th>Kode Trx</th>
                                        <th>Penerima</th>
                                        <th>Kode Akun</th>
                                        <th>Total</th>
                                        <th>Mata Uang</th>
                                        <th>No Cek</th>
                                        <th>Tgl Cek</th>
                                        <th>Keterangan</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                     
                                <tfoot>
                                    <tr>
                                        <th>Tgl</th>
                                        <th>Kode Trx</th>
                                        <th>Penerima</th>
                                        <th>Kode Akun</th>
                                        <th>Total</th>
                                        <th>Mata Uang</th>
                                        <th>No Cek</th>
                                        <th>Tgl Cek</th>
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
                <h3 class="modal-title">Form Tambah <?=$title?></h3>
            </div>
            <div class="modal-body form">
                <form action="#" id="form" class="form-horizontal">
                    <input type="hidden" value="" name="id"/>
                    <div class="form-body">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="row">
                                        <label class="control-label col-md-3">Tanggal</label>
                                        <div class="col-md-9">
                                            <div class="input-group date col-md-8 p-l-0">
                                                <input type="text" class="form-control" id="date" name="tgl_transaksi" autocomplete="off" value="<?=date('Y-m-d')?>">
                                                <div class="input-group-append ">
                                                    <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                                </div>
                                            </div>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <label class="control-label col-md-3">Penerima </label>
                                        <div class="col-md-9">
                                            <select class="full-width select2" required data-init-plugin="select2" id='supplier' name="supplier">
                                                <option value="0" selected>-- Pilih Supplier --</option>
                                                <?php                                
                                                    foreach ($get_supplier as $row) {  
                                                        echo "<option value='".$row->supplier_id."'>".$row->supplier_name."</option>";
                                                    }
                                                ?>
                                            </select>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>


                                    <div class="row">
                                        <label class="control-label col-md-3">Bank </label>
                                        <div class="col-md-9">
                                            <select class="full-width select2" required data-init-plugin="select2" id='kode_akun' name="kode_akun">
                                                <option value="0" selected>-- Pilih Akun --</option>
                                                <?php                                
                                                    foreach ($get_kode_akun as $row) {  
                                                        echo "<option value='".$row->id."'>".$row->kode_akun.' | '.$row->nama_akun."</option>";
                                                    }
                                                ?>
                                            </select>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <label class="control-label col-md-3">Akun Terbayar </label>
                                        <div class="col-md-9">
                                            <select class="full-width select2" required data-init-plugin="select2" id='kode_akun_terbayar' name="kode_akun_terbayar">
                                                <option value="0" selected>-- Pilih Akun --</option>
                                                <?php                                
                                                    foreach ($get_kode_akun_terbayar as $row) {  
                                                        echo "<option value='".$row->id."'>".$row->kode_akun.' | '.$row->nama_akun."</option>";
                                                    }
                                                ?>
                                            </select>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-1"></div>
                                <div class="col-md-5">
                                    <div class="row">
                                        <label class="control-label col-md-3">Currency</label>
                                        <div class="col-md-3">
                                            <select class="full-width select2" required data-init-plugin="select2" id='currency' name="currency">
                                                <?php                                
                                                    foreach ($get_currency as $row) {  
                                                        echo "<option value='".$row->nama_currency."'>".$row->nama_currency."</option>";
                                                    }
                                                ?>
                                            </select>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-3">No Cek</label>
                                        <div class="col-md-9">
                                            <input id="no_cek" name="no_cek" placeholder="No Cek" class="form-control" type="text" value="">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-3">Tgl Cek</label>
                                        <div class="col-md-9">
                                            <div class="input-group date col-md-8 p-l-0">
                                                <input type="text" class="form-control" id="tgl_cek" name="tgl_cek" autocomplete="off" value="<?=date('Y-m-d')?>">
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
                                            <textarea class="form-control" name="keterangan"></textarea>
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
                                <th style="width:25%">No Invoice</th>
                                <th style="width:8%">Tgl</th>
                                <th style="width:10%">Jatuh Tempo</th>
                                <th style="width:10%">Total</th>
                                <th style="width:10%">Curr</th>
                                <th style="width:10%">Keterangan</th>
                                <th style="width:10%">Action</th>
                            </tr>
                            <tr>
                                <td style="width:25%">
                                    <select class="full-width select2" required data-init-plugin="select2" id='no_invoice' name="no_invoice">
                                        <option value="0" selected>-- Pilih No Inv --</option>
                                    </select>
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:8%">
                                    <input name="tgl_invoice" id="tgl_invoice" placeholder="Tgl Inv" class="form-control" type="text" readonly="readonly">
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:10%">
                                    <input name="jatuh_tempo" id="jatuh_tempo" placeholder="Tgl Jatuh Tempo" class="form-control text-right" type="text" readonly="readonly">
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:10%">
                                    <input name="total" id="total" placeholder="Total" class="form-control" type="text" readonly="readonly">
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:10%">
                                    <input name="currency" id="currency" placeholder="Curr" class="form-control text-right" type="text" readonly="readonly">
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:10%">
                                    <input name="keterangan" id="keterangan" placeholder="Keterangan" class="form-control" type="text">
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:10%">
                                    <button type="button" id="" onclick="add_detail()" class="btn btn-warning">Add</button>
                                </td>
                            </tr>
                        </table>
                        <br />

                        <table class="" id="tbl_detail" style="width: 100%">
                            <thead>
                                <tr class="bg-success-darker text-white">
                                    <th style="width:5%">No</th>
                                    <th style="width:20%">No Invoice</th>
                                    <th style="width:10%">Tgl</th>
                                    <th style="width:10%">Jatuh Tempo</th>
                                    <th style="width:10%">Total</th>
                                    <th style="width:10%">Curr</th>
                                    <th style="width:10%">Keterangan</th>
                                    <th style="width:10%">Action</th>
                                </tr>
                            <thead>
                            <tbody>
                            </tbody>
                            <tfoot style="font-weight: 800">
                                <tr>
                                    <td colspan="5" align="right">Sub Total</td>
                                    <td colspan="" align="center">:</td>
                                    <td colspan="">
                                        <input name="total" id="total" placeholder="Total" class="form-control text-right" type="text" value="0.00">
                                        <span class="help-block"></span>
                                    </td>
                                </tr>
                                 <tr>
                                    <td colspan="5" align="right">Potongan (%)</td>
                                    <td colspan="" align="center">:</td>
                                    <td colspan="">
                                        <input name="potongan" id="potongan" placeholder="0" class="form-control text-right" type="text" value="0.00">
                                        <span class="help-block"></span>
                                    </td>
                                </tr>
                                 <tr>
                                    <td colspan="5" align="right">PPN(%)</td>
                                    <td colspan="" align="center">:</td>
                                    <td colspan="">
                                        <input name="ppn" id="ppn" placeholder="0" class="form-control text-right" type="text" value="0.00">
                                        <span class="help-block"></span>
                                    </td>
                                </tr>
                                 <tr>
                                    <td colspan="5" align="right">Grand Total</td>
                                    <td colspan="" align="center">:</td>
                                    <td colspan="">
                                        <input name="grand_total" id="grand_total" placeholder="0" class="form-control text-right" type="text" value="0.00">
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