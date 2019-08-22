<div class="page-content-wrapper ">
    <div class="content ">
        <div class=" container-fluid   container-fixed-lg bg-white">
            <div class="card card-transparent">
                <div class="card-header ">
                    <div class="card-title">Work Order</div>
                    <hr>
                    <div class="card-body">
                        <div class="col-xs-12">
                            <button class="btn btn-success" onclick="add()"><i class="fa fa-plus"></i> Tambah Work Order</button>
                            <button class="btn btn-default" onclick="reload_table()"><i class="fa fa-refresh"></i> Refresh</button>
                            <table id="table" class="table table-condensed" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th style="visibility:hidden;">ID</th>
                                        <th>No. WO</th>
                                        <th>Tgl. WO</th>
                                        <th>Customer</th>
                                        <th>No. PO</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                     
                                <tfoot>
                                    <tr>
                                        <th style="visibility:hidden;">ID</th>
                                        <th>No. WO</th>
                                        <th>Tgl. WO</th>
                                        <th>Customer</th>
                                        <th>No. PO</th>
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
                                        <label class="control-label col-md-3">Tgl WO</label>
                                        <div class="col-md-9">
                                            <div class="input-group date col-md-8 p-l-0">
                                                <input type="text" class="form-control" id="tgl_wo" name="tgl_wo" autocomplete="off" value="<?=date('Y-m-d')?>">
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
                                            <select class="full-width select2" required data-init-plugin="select2" id='customer' name="customer">
                                                <option value="" selected>-- Pilih Customer --</option>
                                                <?php                                
                                                    foreach ($get_customer as $row) {  
                                                        echo "<option value='".$row->customer_id."'>".$row->customer_name."</option>";
                                                    }
                                                ?>
                                            </select>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-3">No. WO</label>
                                        <div class="col-md-9">
                                            <input id="no_wo" name="no_wo" placeholder="No. WO" class="form-control" type="text">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-3">No. PO</label>
                                        <div class="col-md-9">
                                            <input id="customer_po" name="customer_po" placeholder="No. PO Customer" class="form-control" type="text">
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
                                <th style="width:25%">Nama Barang</th>
                                <th style="width:10%; text-align:center">Kode Barang</th>
                                <th style="width:10%">Spesifikasi</th>
                                <th style="width:5%; text-align:center">HS</th>
                                <th style="width:5%; text-align:right">Qty</th>
                                <th style="width:5%; text-align:center">Satuan</th>
                                <th style="width:10%; text-align:right">Harga</th>
                                <th style="width:5%; text-align:center">Curr</th>
                                <th style="width:5%; text-align:right">Bahan Baku</th>
                                <th style="width:5%; text-align:right">TKL(%)</th>
                                <th style="width:5%; text-align:right">BOP(%)</th>
                                <th style="width:5%; text-align:right">HPP</th>
                                <th style="width:5%; text-align:center">Actions</th>
                            </tr>
                            <tr>
                                <td style="width:25%">
                                    <select class="full-width select2" required data-init-plugin="select2" id='nama_barang' name="nama_barang">
                                        <option value="0" selected>-- Pilih Barang --</option>
                                        <?php                                
                                            foreach ($get_barang_jadi as $row) {  
                                                echo "<option value='".$row->kode_barang."'>".$row->nama_barang."</option>";
                                            }
                                        ?>
                                    </select>
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:10%">
                                    <input name="kode_barang" id="kode_barang" placeholder="Kode Barang" class="form-control" type="text" readonly>                                    
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:10%">
                                    <input name="spesifikasi_barang" id="spesifikasi_barang" placeholder="Spesifikasi" class="form-control" type="text" readonly>
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:5%">
                                    <input name="hs_barang" id="hs_barang" placeholder="HS" class="form-control" type="text" readonly>
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:5%">
                                    <input name="qty" id="qty" placeholder="0" class="form-control text-right" type="text" value="0">
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:5%">
                                    <input name="satuan" id="satuan" placeholder="Satuan" class="form-control" type="text" readonly>
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:10%">
                                    <input name="harga_barang" id="harga_barang" placeholder="0" class="form-control text-right" type="text" readonly>
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:5%">
                                    <input name="currency" id="currency" placeholder="Curr" class="form-control text-right" type="text" readonly>
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:5%">
                                    <input name="material" id="material" placeholder="0" class="form-control text-right" type="text" value="0">
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:5%">
                                    <input name="tkl" id="tkl" placeholder="0" class="form-control text-right" type="text" value="0">
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:5%">
                                    <input name="bop" id="bop" placeholder="0" class="form-control text-right" type="text" value="0">
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:5%">
                                    <input name="hpp" id="hpp" placeholder="0" class="form-control text-right" type="text" value="0">
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
                                    <th style="width:20%">Nama Barang</th>
                                    <th style="width:10%; text-align:center">Kode Barang</th>
                                    <th style="width:10%">Spesifikasi</th>
                                    <th style="width:5%; text-align:center">HS</th>
                                    <th style="width:5%; text-align:right">Qty</th>
                                    <th style="width:5%; text-align:center">Satuan</th>
                                    <th style="width:10%; text-align:right">Harga</th>
                                    <th style="width:5%; text-align:center">Curr</th>
                                    <th style="width:5%; text-align:right">Bahan Baku</th>
                                    <th style="width:5%; text-align:right">TKL(%)</th>
                                    <th style="width:5%; text-align:right">BOP(%)</th>
                                    <th style="width:5%; text-align:right">HPP</th>
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