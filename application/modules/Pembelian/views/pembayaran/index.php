<div class="page-content-wrapper ">
    <div class="content ">
        <div class=" container-fluid   container-fixed-lg bg-white">
            <div class="card card-transparent">
                <div class="card-header ">
                    <div class="card-title">Daftar Pembayaran (Pembelian)</div>
                    <hr>
                    <div class="card-body">
                        <div class="col-xs-12">
                            <button class="btn btn-success" onclick="add()"><i class="fa fa-plus"></i> Tambah Pembayaran (Pembelian)</button>
                            <button class="btn btn-default" onclick="reload_table()"><i class="fa fa-refresh"></i> Refresh</button>
                            <table id="table" class="table table-condensed" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th style="visibility:hidden;">ID</th>
                                        <th>Tgl. Transaksi</th>
                                        <th>Penerima</th>
                                        <th>Kode Akun</th>
                                        <th>Total Pembayaran</th>
                                        <th>Curr</th>
                                        <th>No. Cek</th>
                                        <th>Tgl. Cek</th>
                                        <th>Keterangan</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                     
                                <tfoot>
                                    <tr>
                                        <th style="visibility:hidden;">ID</th>
                                        <th>Tgl. Transaksi</th>
                                        <th>Penerima</th>
                                        <th>Kode Akun</th>
                                        <th>Total Pembayaran</th>
                                        <th>Curr</th>
                                        <th>No. Cek</th>
                                        <th>Tgl. Cek</th>
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
                                        <label class="control-label col-md-3">Tanggal</label>
                                        <div class="col-md-9">
                                            <div class="input-group date col-md-8 p-l-0">
                                                <input type="text" class="form-control" id="tgl_transaksi" name="tgl_transaksi" autocomplete="off" value="<?=date('Y-m-d')?>">
                                                <div class="input-group-append ">
                                                    <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                                </div>
                                            </div>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-3">Penerima</label>
                                        <div class="col-md-6">
                                            <select class="full-width select2" required data-init-plugin="select2" id='kode_penerima' name="kode_penerima">
                                                <option value="" selected>-- Pilih Supplier --</option>
                                                <?php                                
                                                    foreach ($get_supplier as $row) {  
                                                        echo "<option value='".$row->supplier_id."'>".$row->supplier_id." | ".$row->supplier_name."</option>";
                                                    }
                                                ?>
                                            </select>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-3">Bank</label>
                                        <div class="col-md-6">
                                            <select class="full-width select2" required data-init-plugin="select2" id='kode_akun' name="kode_akun">
                                                <option value="" selected>-- Pilih Bank --</option>
                                                <?php                                
                                                    foreach ($get_akun as $row) {  
                                                        echo "<option value='".$row->kode_akun."'>".$row->kode_akun." | ".$row->nama_akun."</option>";
                                                    }
                                                ?>
                                            </select>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-3">Akun Terbayar</label>
                                        <div class="col-md-6">
                                            <select class="full-width select2" required data-init-plugin="select2" id='kode_akun_terbayar' name="kode_akun_terbayar">
                                                <option value="" selected>-- Pilih Akun --</option>
                                                <?php                                
                                                    foreach ($get_akun as $row) {  
                                                        echo "<option value='".$row->kode_akun."'>".$row->kode_akun." | ".$row->nama_akun."</option>";
                                                    }
                                                ?>
                                            </select>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="row">
                                        <label class="control-label col-md-3">Currency</label>
                                        <div class="col-md-9">
                                            <select class="full-width select2" required data-init-plugin="select2" id='currency_header' name="currency_header">
                                                <option value="" selected>-- Pilih Currency --</option>
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
                                        <label class="control-label col-md-3">Nomor Cek</label>
                                        <div class="col-md-9">
                                            <input id="no_cek" name="no_cek" placeholder="Nomor Cek" class="form-control" type="text">
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
                                            <textarea class="form-control" id="keterangan_header" name="keterangan_header"></textarea>
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
                                <th style="width:35%">No. Invoice</th>
                                <th style="width:10%; text-align:right">Tanggal</th>
                                <th style="width:10%; text-align:right">Jt. Tempo</th>
                                <th style="width:15%; text-align:right">Total</th>
                                <th style="width:10%; text-align:center">Currency</th>
                                <th style="width:25%;">Keterangan</th>
                                <th style="width:5%; text-align:center">Actions</th>
                            </tr>
                            <tr>
                                <td style="width:35%">
                                    <select class="full-width select2" required data-init-plugin="select2" id='no_invoice' name="no_invoice">
                                        <option value="0" selected>-- Pilih Invoice --</option>
                                        <?php                                
                                            foreach ($get_inv as $row) {  
                                                echo "<option value='".$row->no_invoice."'>".$row->no_invoice."</option>";
                                            }
                                        ?>
                                    </select>
                                    <input name="id_hutang" id="id_hutang" type="hidden">
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:10%">
                                    <input name="tgl_invoice" id="tgl_invoice" placeholder="Tgl Invoice" class="form-control text-right" type="text" readonly>                                    
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:10%">
                                    <input name="jatuh_tempo" id="jatuh_tempo" placeholder="Jatuh Tempo" class="form-control text-right" type="text" readonly>
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:15%">
                                    <input name="total_invoice" id="total_invoice" placeholder="0" value="0" class="form-control text-right" type="text" readonly>
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:10%">
                                    <input name="currency" id="currency" placeholder="Currency" class="form-control text-center" type="text" readonly>
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:25%">
                                    <input name="keterangan" id="keterangan" placeholder="Keterangan" class="form-control" type="text">
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
                                    <th style="width:30%">No. Invoice</th>
                                    <th style="width:10%; text-align:right">Tanggal</th>
                                    <th style="width:10%; text-align:right">Jt. Tempo</th>
                                    <th style="width:15%; text-align:right">Total</th>
                                    <th style="width:10%; text-align:center">Currency</th>
                                    <th style="width:25%;">Keterangan</th>
                                    <th style="width:5%; text-align:center">Actions</th>
                                </tr>
                            <thead>
                            <tbody id="show_detail">
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="8" class="text-right">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="4" class="text-right">Total Pembayaran :</td>
                                    <td class="text-right">
                                        <input name="total_pembayaran" id="total_pembayaran" placeholder="" class="form-control text-right" type="text" value="0" readonly>
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