<div class="page-content-wrapper ">
    <div class="content ">
        <div class=" container-fluid   container-fixed-lg bg-white">
            <div class="card card-transparent">
                <div class="card-header ">
                    <div class="card-title">Penerimaan Penjualan</div>
                    <hr>
                    <div class="card-body">
                        <div class="col-xs-12">
                            <button class="btn btn-success" onclick="add()"><i class="fa fa-plus"></i> Tambah Penerimaan</button>
                            <button class="btn btn-default" onclick="reload_table()"><i class="fa fa-refresh"></i> Refresh</button>
                            <table id="table" class="table table-condensed" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th style="visibility:hidden;">ID</th>
                                        <th>Tgl. Penerimaan</th>
                                        <th>Customer</th>
                                        <th>Akun Debet</th>
                                        <th>Akun Kredit</th>
                                        <th>Total Penerimaan</th>
                                        <th>Curr.</th>
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
                                        <th>Tgl. Penerimaan</th>
                                        <th>Customer</th>
                                        <th>Akun Debet</th>
                                        <th>Akun Kredit</th>
                                        <th>Total Penerimaan</th>
                                        <th>Curr.</th>
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
                                        <label class="control-label col-md-3">Tgl Penerimaan</label>
                                        <div class="col-md-9">
                                            <div class="input-group date col-md-8 p-l-0">
                                                <input type="text" class="form-control" id="tgl_penerimaan" name="tgl_penerimaan" autocomplete="off" value="<?=date('Y-m-d')?>">
                                                <div class="input-group-append ">
                                                    <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                                </div>
                                            </div>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-3">Customer</label>
                                        <div class="col-md-9">
                                            <select class="full-width select2" required data-init-plugin="select2" id='kode_customer' name="kode_customer">
                                                <option value="" selected>-- Pilih Customer --</option>
                                                <?php                                
                                                    foreach ($get_customer as $row) {  
                                                        echo "<option value='".$row->kode_customer."'>".$row->kode_customer.' | '.$row->customer_name."</option>";
                                                    }
                                                ?>
                                            </select>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-3">Bank Tujuan</label>
                                        <div class="col-md-9">
                                            <select class="full-width select2" required data-init-plugin="select2" id='kode_akun_debet' name="kode_akun_debet">
                                                <option value="" selected>-- Pilih Akun --</option>
                                                <?php                                
                                                    foreach ($get_akun_debet as $row) {  
                                                        echo "<option value='".$row->kode_akun_debet."'>".$row->kode_akun_debet." | ".$row->nama_akun_debet."</option>";
                                                    }
                                                ?>
                                            </select>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-3">Piutang Terbayar</label>
                                        <div class="col-md-9">
                                            <select class="full-width select2" required data-init-plugin="select2" id='kode_akun_kredit' name="kode_akun_kredit">
                                                <option value="" selected>-- Pilih Akun --</option>
                                                <?php                                
                                                    foreach ($get_akun_kredit as $row) {  
                                                        echo "<option value='".$row->kode_akun_kredit."'>".$row->kode_akun_kredit." | ".$row->nama_akun_kredit."</option>";
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
                                        <div class="col-md-4">
                                            <select class="full-width select2" required data-init-plugin="select2" id='currency' name="currency">
                                                <option value="" selected>-- Pilih Currency --</option>
                                                <?php                                
                                                    foreach ($get_currency as $row) {  
                                                        echo "<option value='".$row->currency."'>".$row->currency."</option>";
                                                    }
                                                ?>
                                            </select>
                                            <span class="help-block"></span>
                                        </div>
                                        <label class="control-label col-md-2 text-right">Kurs</label>
                                        <div class="col-md-3">
                                            <input id="kurs" name="kurs" placeholder="Kurs" class="form-control" type="text" value="0">
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
                                            <textarea rows="2" cols="52" id="keterangan" name="keterangan"></textarea> 
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
                                <th style="width:25%">No. Invoice</th>
                                <th style="width:15%; text-align:right">Tgl. Invoice</th>
                                <th style="width:15%; text-align:right">Jatuh Tempo</th>
                                <th style="width:15%; text-align:right">Total</th>
                                <th style="width:10%; text-align:center">Currency</th>
                                <th style="width:15%;">Keterangan</th>
                                <th style="width:5%; text-align:center">Actions</th>
                            </tr>
                            <tr>
                                <td style="width:25%">
                                    <select class="full-width select2" required data-init-plugin="select2" id='no_invoice' name="no_invoice">
                                        <option value="0" selected>-- Pilih Invoice --</option>
                                        <?php                                
                                            foreach ($get_invoice as $row) {  
                                                echo "<option value='".$row->no_invoice."'>".$row->no_invoice."</option>";
                                            }
                                        ?>
                                    </select>
                                    <input name="id_invoice" id="id_invoice" type="hidden" readonly>
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:15%">
                                    <input name="tgl_invoice" id="tgl_invoice" placeholder="Tgl Invoice" class="form-control text-right" type="text" readonly>                                    
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:15%">
                                    <input name="jatuh_tempo" id="jatuh_tempo" placeholder="Jatuh Tempo" class="form-control text-right" type="text" readonly>
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:15%">
                                    <input name="total_invoice" id="total_invoice" placeholder="0" class="form-control text-right" type="text" value="0" readonly>
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:10%">
                                    <input name="currency2" id="currency2" placeholder="Curr" class="form-control text-center" type="text" readonly>
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:15%">
                                    <input name="keterangan2" id="keterangan2" placeholder="Keterangan" class="form-control" type="text">
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
                                    <th style="width:5%">No</th>
                                    <th style="width:20%">No. Invoice</th>
                                    <th style="width:15%; text-align:right">Tgl. Invoice</th>
                                    <th style="width:15%; text-align:right">Jatuh Tempo</th>
                                    <th style="width:15%; text-align:right">Total</th>
                                    <th style="width:10%; text-align:center">Currency</th>
                                    <th style="width:15%;">Keterangan</th>
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
                                    <td colspan="4" class="text-right">Total Penerimaan :</td>
                                    <td class="text-right">
                                        <input name="total_penerimaan" id="total_penerimaan" placeholder="" class="form-control text-right" type="text" value="0" readonly>
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