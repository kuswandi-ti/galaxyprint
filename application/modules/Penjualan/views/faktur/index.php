<div class="page-content-wrapper ">
    <div class="content ">
        <div class=" container-fluid   container-fixed-lg bg-white">
            <div class="card card-transparent">
                <div class="card-header ">
                    <div class="card-title">Daftar Piutang (Tagihan)</div>
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
                                        <th>No Inv</th>
                                        <th>Cust</th>
                                        <th>Total</th>
                                        <th>Mata Uang</th>
                                        <th>Jatuh Tempo</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                     
                                <tfoot>
                                    <tr>
                                        <th>Tgl</th>
                                        <th>No Inv</th>
                                        <th>Cust</th>
                                        <th>Total</th>
                                        <th>Mata Uang</th>
                                        <th>Jatuh Tempo</th>
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
                                                <input type="text" class="form-control" id="tgl_invoice" name="tgl_invoice" autocomplete="off" value="<?=date('Y-m-d')?>">
                                                <div class="input-group-append ">
                                                    <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                                </div>
                                            </div>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-3">No Invoice</label>
                                        <div class="col-md-9">
                                            <input id="no_invoice" name="no_invoice" placeholder="No Invoice" class="form-control" type="text">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-3">Customer</label>
                                        <div class="col-md-9">
                                            <select class="full-width select2" required data-init-plugin="select2" id='customer' name="customer">
                                                <option value="" selected>-- Pilih Customer --</option>
                                                <?php
                                                    if($get_customer->num_rows() > 0){                                
                                                    foreach ($get_customer->result() as $row) {  
                                                        echo "<option value='".$row->customer_id."'>".$row->customer_name."</option>";
                                                    }
                                                    }else{
                                                        echo "<option value=''>Belum Ada Delivery Open</option>";
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
                                            <select class="full-width select2" required data-init-plugin="select2" id='jenis_dokumen' name="jenis_dokumen">
                                                <option value="" selected>-- Pilih Currency --</option>
                                                <?php                                
                                                    foreach ($get_currency as $row) {  
                                                        echo "<option value='".$row->nama_currency."'>".$row->nama_currency."</option>";
                                                    }
                                                ?>
                                            </select>
                                            <span class="help-block"></span>
                                        </div>
                                        <label class="control-label col-md-3">Kurs</label>
                                        <div class="col-md-3">
                                            <input id="kurs" name="kurs" placeholder="Kurs" class="form-control" type="text">
                                            <span class="help-block"></span>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-3">Akun Piutang </label>
                                        <div class="col-md-9">
                                            <select class="full-width select2" required data-init-plugin="select2" id='kode_akun' name="kode_akun">
                                                <option value="0" selected>-- Pilih Akun --</option>
                                                <?php                                
                                                    foreach ($get_kode_akun as $row) {  
                                                        echo "<option value='".$row->kode_akun."'>".$row->kode_akun.' | '.$row->nama_akun."</option>";
                                                    }
                                                ?>
                                            </select>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-3">No PO</label>
                                        <div class="col-md-9">
                                            <input id="no_po" name="no_po" placeholder="No Po" class="form-control" type="text">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-3">Jatuh Tempo</label>
                                        <div class="col-md-9">
                                            <div class="input-group date col-md-8 p-l-0">
                                                <input type="text" class="form-control" id="jatuh_tempo" name="jatuh_tempo" autocomplete="off" value="<?=date('Y-m-d')?>">
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
                                            <textarea class="form-control" id="keterangan" name="keterangan"></textarea>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table style="width: 100%">
                            <tr class="bg-success-darker text-white">
                                <th style="width:20%">Nama Barang</th>
                                <th style="width:8%">Kode</th>
                                <th style="width:10%">Qty</th>
                                <th style="width:10%">Satuan</th>
                                <th style="width:10%">Harga/Sat</th>
                                <th style="width:10%">Total</th>
                                <th style="width:10%">Currency</th>
                                <th style="width:10%">No Do</th>
                                <th style="width:10%">Action</th>
                            </tr>
                            <tr>
                                <td style="width:25%">
                                    <select class="full-width select2" required data-init-plugin="select2" id='id_do_detail' name="id_do_detail">
                                        <option value="" selected>-- Pilih Barang --</option>
                                        <?php                                
                                            // foreach ($get_barang as $row) {  
                                            //     echo "<option value='".$row->kode_barang."'>".$row->nama_barang."</option>";
                                            // }
                                        ?>
                                    </select>
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:8%">
                                    <input name="kode_barang" id="kode_barang" placeholder="Kode Barang" class="form-control" type="text" disabled>
                                    <span class="help-block"></span>
                                </td>
                                <input name="nama_barang" id="nama_barang" class="form-control" type="hidden" readonly="readonly">
                                <input name="id_delivery_header" id="id_delivery_header" class="form-control" type="hidden" readonly="readonly">
                                <input name="id_delivery_detail" id="id_delivery_detail" class="form-control" type="hidden" readonly="readonly">
                                <td style="width:10%">
                                    <input name="qty" id="qty" placeholder="Qty" class="form-control text-right" type="text" onkeyup ="getTotal()">
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:10%">
                                    <input name="satuan" id="satuan" placeholder="Satuan" class="form-control" type="text" disabled>
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:10%">
                                    <input name="harga_barang" id="harga_barang" placeholder="Harga/Sat" class="form-control text-right" type="text" onkeyup ="getTotal()">
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:10%">
                                    <input name="total_field" id="total_field" placeholder="Total" class="form-control" type="text" readonly="">
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:8%">
                                    <input name="currency" id="currency" placeholder="currency" class="form-control" type="text" readonly="readonly">
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:15%">
                                    <input name="no_do" id="no_do" placeholder="No DO" class="form-control" type="text" readonly="readonly">
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
                                    <th style="width:20%">Nama Barang</th>
                                    <th style="width:8%">Kode</th>
                                    <th style="width:10%">Qty</th>
                                    <th style="width:10%">Satuan</th>
                                    <th style="width:10%">Harga/Sat</th>
                                    <th style="width:10%">Total</th>
                                    <th style="width:10%">Curr</th>
                                    <th style="width:15%">No DO</th>
                                    <th style="width:10%">Action</th>
                                </tr>
                            <thead>
                            <tbody>
                            </tbody>
                            <tfoot style="font-weight: 800">
                                <tr>
                                    <td colspan="7" align="right">Sub Total</td>
                                    <td colspan="" align="center">:</td>
                                    <td colspan="">
                                        <input name="sub_total" id="sub_total" placeholder="Total" class="form-control text-right" type="text" value="0.00">
                                        <span class="help-block"></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="7" align="right">Pajak</td>
                                    <td colspan="" align="center">:</td>
                                    <td colspan="">
                                        <input name="ppn" id="ppn" placeholder="0" class="form-control text-right" type="text" value="0.00" onkeyup="calcTot()">
                                        <span class="help-block"></span>
                                    </td>
                                </tr>
                                 <tr>
                                    <td colspan="7" align="right">Grand Total</td>
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