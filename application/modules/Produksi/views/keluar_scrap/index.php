<div class="page-content-wrapper ">
    <div class="content ">
        <div class=" container-fluid   container-fixed-lg bg-white">
            <div class="card card-transparent">
                <div class="card-header ">
                    <div class="card-title">Daftar Pengeluaran Barang Sisa (Scrap)</div>
                    <hr>
                    <div class="card-body">
                        <div class="col-xs-12">
                            <button class="btn btn-success" onclick="add()"><i class="fa fa-plus"></i> Tambah Pengeluaran Barang Sisa (Scrap)</button>
                            <button class="btn btn-default" onclick="reload_table()"><i class="fa fa-refresh"></i> Refresh</button>
                            <table id="table" class="table table-condensed" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th style="visibility:hidden;">ID</th>
                                        <th>Tgl. Keluar</th>
                                        <th>No. DO</th>
                                        <th>Penerima</th>
                                        <th>No. Aju</th>
                                        <th>Dokumen</th>
                                        <th>Nomor</th>
                                        <th>Tanggal</th>
                                        <th>Jml Detail</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                     
                                <tfoot>
                                    <tr>
                                        <th style="visibility:hidden;">ID</th>
                                        <th>Tgl. Keluar</th>
                                        <th>No. DO</th>
                                        <th>Penerima</th>
                                        <th>No. Aju</th>
                                        <th>Dokumen</th>
                                        <th>Nomor</th>
                                        <th>Tanggal</th>
                                        <th>Jml Detail</th>
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
                                                <input type="text" class="form-control" id="tgl_keluar" name="tgl_keluar" autocomplete="off" value="<?=date('Y-m-d')?>">
                                                <div class="input-group-append ">
                                                    <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                                </div>
                                            </div>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-3">Nomor DO</label>
                                        <div class="col-md-9">
                                            <input id="no_do" name="no_do" placeholder="No. DO" class="form-control" type="text">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-3">Nomor Invoice</label>
                                        <div class="col-md-9">
                                            <input id="no_invoice" name="no_invoice" placeholder="No. Invoice" class="form-control" type="text">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-3">Penerima</label>
                                        <div class="col-md-9">
                                            <select class="full-width select2" required data-init-plugin="select2" id='penerima' name="penerima">
                                                <option value="0" selected>-- Pilih Penerima --</option>
                                                <?php                                
                                                    foreach ($get_customer as $row) {  
                                                        echo "<option value='".$row->customer_id."'>".$row->customer_name."</option>";
                                                    }
                                                ?>
                                            </select>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="row">
                                        <label class="control-label col-md-3">Nomor Aju</label>
                                        <div class="col-md-9">
                                            <input id="no_aju" name="no_aju" placeholder="No. Aju" class="form-control" type="text">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-3">Dokumen</label>
                                        <div class="col-md-9">
                                            <select class="full-width select2" required data-init-plugin="select2" id='jenis_dokumen' name="jenis_dokumen">
                                                <option value="0" selected>-- Pilih Dokumen --</option>
                                                <?php                                
                                                    foreach ($get_jenis_dokumen as $row) {  
                                                        echo "<option value='".$row->kode_dokumen."'>".$row->nama_dokumen."</option>";
                                                    }
                                                ?>
                                            </select>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-3">Nomor Dokumen</label>
                                        <div class="col-md-9">
                                            <input id="no_dokumen" name="no_dokumen" placeholder="No. Dokumen" class="form-control" type="text">
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
                                <th style="width:30%">Keterangan Barang</th>
                                <th style="width:10%; text-align:center">Kode</th>
                                <th style="width:10%; text-align:right">Qty</th>
                                <th style="width:15%; text-align:center">Sat</th>
                                <th style="width:10%; text-align:right">Harga</th>
                                <th style="width:15%; text-align:right">Total</th>
                                <th style="width:15%; text-align:center">Valas</th>
                                <th style="width:5%; text-align:center">Actions</th>
                            </tr>
                            <tr>
                                <td style="width:30%">
                                    <select class="full-width select2" required data-init-plugin="select2" id='nama_barang' name="nama_barang">
                                        <option value="0" selected>-- Pilih Barang --</option>
                                        <?php                                
                                            foreach ($get_master_scrap as $row) {  
                                                echo "<option value='".$row->kode_barang."'>".$row->nama_barang."</option>";
                                            }
                                        ?>
                                    </select>
                                    <input name="spesifikasi_barang" id="spesifikasi_barang" type="hidden">
                                    <input name="hs_barang" id="hs_barang" type="hidden">
                                    <input name="harga_barang" id="harga_barang" type="hidden">
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:10%">
                                    <input name="kode_barang" id="kode_barang" placeholder="Kode Barang" class="form-control text-center" type="text" readonly>                                    
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:10%">
                                    <input name="qty" id="qty" placeholder="0" class="form-control text-right" type="text" value="0">
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:15%">
                                    <input name="satuan_barang" id="satuan_barang" placeholder="Satuan" class="form-control text-center" type="text">
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:10%">
                                    <input name="harga_barang" id="harga_barang" placeholder="0" class="form-control text-right" type="text" value="0">
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:15%">
                                    <input name="total" id="total" placeholder="0" class="form-control text-right" type="text" value="0" readonly>
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:15%">
                                    <select class="full-width select2" required data-init-plugin="select2" id='currency' name="currency">
                                        <option value="0" selected>-- Pilih Valas --</option>
                                        <?php                                
                                            foreach ($get_currency as $row) {  
                                                echo "<option value='".$row->nama_currency."'>".$row->nama_currency."</option>";
                                            }
                                        ?>
                                    </select>
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
                                    <th style="width:25%">Keterangan Barang</th>
                                    <th style="width:10%; text-align:center">Kode</th>
                                    <th style="width:10%; text-align:right">Qty</th>
                                    <th style="width:15%; text-align:center">Sat</th>
                                    <th style="width:10%; text-align:right">Harga</th>
                                    <th style="width:15%; text-align:right">Total</th>
                                    <th style="width:15%; text-align:center">Valas</th>
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
                                    <td colspan="4" class="text-right">Total :</td>
                                    <td class="text-right">
                                        <input name="total_scrap" id="total_scrap" class="form-control text-right" type="text" value="0" readonly>
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