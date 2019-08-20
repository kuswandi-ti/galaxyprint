<div class="page-content-wrapper ">
    <div class="content ">
        <div class=" container-fluid   container-fixed-lg bg-white">
            <div class="card card-transparent">
                <div class="card-header ">
                    <div class="card-title">Daftar Hutang (<?=$title?> Pembelian)</div>
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
                                        <th>No Ref</th>
                                        <th>No Inv</th>
                                        <th>Supplier</th>
                                        <th>Total</th>
                                        <th>Mata Uang</th>
                                        <th>Keterangan</th>
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
                                        <th>No Ref</th>
                                        <th>No Inv</th>
                                        <th>Supplier</th>
                                        <th>Total</th>
                                        <th>Mata Uang</th>
                                        <th>Keterangan</th>
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
                                                <input type="text" class="form-control" id="date" name="tgl_po" autocomplete="off" value="<?=date('Y-m-d')?>">
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
                                            <input name="no_po" placeholder="No PO" class="form-control" type="text">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-3">Supplier</label>
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
                                        <label class="control-label col-md-3">No PO</label>
                                        <div class="col-md-9">
                                            <select class="full-width select2" required data-init-plugin="select2" id='supplier' name="supplier">
                                                <option value="0" selected>-- Pilih No PO --</option>
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
                                            <input name="currency" placeholder="Currency" class="form-control" type="text" readonly="">
                                            <span class="help-block"></span>
                                        </div>
                                        <label class="control-label col-md-3">Kurs</label>
                                        <div class="col-md-3">
                                            <input name="currency" placeholder="Currency" class="form-control" type="text" readonly="">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-3">Tempo (Hari)</label>
                                        <div class="col-md-9">
                                            <input name="tempo" placeholder="tempo" class="form-control" type="text" value="">
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
                        <table class="" id="tbl_detail" style="width: 100%">
                            <thead>
                                <tr class="bg-success-darker text-white">
                                    <th style="width:5%">No</th>
                                    <th style="width:25%">Keterangan Barang</th>
                                    <th style="width:8%">Kode</th>
                                    <th style="width:10%">Qty</th>
                                    <th style="width:10%">Satuan</th>
                                    <th style="width:10%">Harga/Sat</th>
                                    <th style="width:10%">Total</th>
                                    <th style="width:10%">Actions</th>
                                </tr>
                            <thead>
                            <tbody>
                                <tr>
                                    <td colspan="8" class="text-center">Belum ada data</td>
                                </tr>
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