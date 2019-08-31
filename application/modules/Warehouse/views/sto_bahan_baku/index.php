<div class="page-content-wrapper ">
    <div class="content ">
        <div class=" container-fluid   container-fixed-lg bg-white">
            <div class="card card-transparent">
                <div class="card-header ">
                    <div class="card-title">Stok Opname Bahan Baku</div>
                    <hr>
                    <div class="card-body">
                        <div class="col-xs-12">
                            <button class="btn btn-success" onclick="add()"><i class="fa fa-plus"></i> Tambah</button>
                            <button class="btn btn-default" onclick="reload_table()"><i class="fa fa-refresh"></i> Refresh</button>
                            <table id="table" class="table table-condensed" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th>No. Transaksi</th>
                                        <th>Tgl. Opname</th>
                                        <th>Total Barang</th>
                                        <th>User</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                     
                                <tfoot>
                                    <tr>
                                        <th>No. Transaksi</th>
                                        <th>Tgl. Opname</th>
                                        <th>Total Barang</th>
                                        <th>User</th>
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
    <div class="modal-dialog modal-lg">
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
                                                <input type="text" class="form-control" id="tgl_opname" name="tgl_opname" autocomplete="off" value="<?=date('Y-m-d')?>">
                                                <div class="input-group-append ">
                                                    <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                                </div>
                                            </div>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-3">Jam</label>
                                        <div class="col-md-6">
                                            <input id="jam" name="jam" class="form-control" value="<?=date('H:i:s')?>" type="text">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <!-- <div class="row">
                                        <label class="control-label col-md-3">Nomor PO</label>
                                        <div class="col-md-6">
                                            <select class="full-width select2" required data-init-plugin="select2" id='no_po' name="no_po">
                                                <option value="" selected>-- Pilih PO --</option>
                                                <?php                                
                                                    // foreach ($get_po as $row) {  
                                                    //     echo "<option value='".$row->no_po."'>".$row->no_po."</option>";
                                                    // }
                                                ?>
                                            </select>
                                            <span class="help-block"></span>
                                        </div>
                                        <div class="col-md-3">
                                            <button type="button" id="" onclick="load_po()" class="btn btn-danger btn-sm">Load PO</button>
                                        </div>
                                    </div> -->
                                    <!-- <div class="row">
                                        <label class="control-label col-md-3">No. Invoice</label>
                                        <div class="col-md-9">
                                            <input id="no_invoice" name="no_invoice" placeholder="No. Invoice" class="form-control" type="text">
                                            <span class="help-block"></span>
                                        </div>
                                    </div> -->
                                    <!-- <div class="row">
                                        <label class="control-label col-md-3">Supplier</label>
                                        <div class="col-md-9">
                                            <select class="full-width select2" required data-init-plugin="select2" id='supplier_id' name="supplier_id">
                                                <option value="" selected>-- Pilih Supplier --</option>
                                                <?php                                
                                                    // foreach ($get_supplier as $row) {  
                                                    //     echo "<option value='".$row->supplier_id."'>".$row->supplier_id." | ".$row->supplier_name."</option>";
                                                    // }
                                                ?>
                                            </select>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                </div> -->

                                <!-- <div class="col-md-6">
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
                                                    // foreach ($get_jenis_dokumen as $row) {  
                                                    //     echo "<option value='".$row->kode_dokumen."'>".$row->kode_dokumen." | ".$row->nama_dokumen."</option>";
                                                    // }
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
                                    <div class="row">
                                        <label class="control-label col-md-3">Warehouse</label>
                                        <div class="col-md-9">
                                            <select class="full-width select2" required data-init-plugin="select2" id='id_gudang' name="id_gudang">
                                                <option value="" selected>-- Pilih Warehouse --</option>
                                                <?php                                
                                                    // foreach ($get_warehouse as $row) {  
                                                    //     echo "<option value='".$row->id_gudang."'>".$row->nama_gudang." | ".$row->keterangan_gudang."</option>";
                                                    // }
                                                ?>
                                            </select>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                </div> -->
                            </div>
                        </div>
                    </div>

                    <!-- <hr> -->

                    <!-- <div class="table-responsive">
                        <table style="width: 100%">
                            <tr class="bg-success-darker text-white">
                                <th style="width:35%">Nama Barang</th>
                                <th style="width:10%; text-align:center">Kode Barang</th>
                                <th style="width:10%; text-align:right">Qty</th>
                                <th style="width:10%; text-align:center">Sat. Besar</th>
                                <th style="width:10%; text-align:right">Harga/Sat.Besar</th>
                                <th style="width:15%; text-align:right">Total</th>
                                <th style="width:10%; text-align:center">Currency</th>
                                <th style="width:5%; text-align:center">Actions</th>
                            </tr>
                            <tr>
                                <td style="width:40%">
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
                                    <input name="spesifikasi_barang" id="spesifikasi_barang" type="hidden">
                                    <input name="hs_barang" id="hs_barang" type="hidden">
                                    <input name="id_po_detail" id="id_po_detail" type="hidden">
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:5%">
                                    <input name="qty_besar" id="qty_besar" placeholder="0" class="form-control text-right" type="text" value="0">
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:10%">
                                    <input name="satuan_besar" id="satuan_besar" placeholder="Satuan" class="form-control text-center" type="text" readonly>
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:10%">
                                    <input name="harga_besar" id="harga_besar" placeholder="0" value="0" class="form-control text-right" type="text">
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:15%">
                                    <input name="total_besar" id="total_besar" placeholder="0" value="0" class="form-control text-right" type="text" readonly>
                                    <span class="help-block"></span>
                                </td>
                                <td style="width:5%">
                                    <select class="full-width select2" required data-init-plugin="select2" id='currency' name="currency">
                                        <option value="0" selected>-- Pilih Currency --</option>
                                        <?php                                
                                            foreach ($get_currency as $row) {  
                                                echo "<option value='".$row->nama_currency."'>".$row->nama_currency."</option>";
                                            }
                                        ?>
                                    </select>
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
                                    <th style="width:10%; text-align:right">Qty</th>
                                    <th style="width:10%; text-align:center">Sat. Besar</th>
                                    <th style="width:10%; text-align:right">Harga/Sat.Besar</th>
                                    <th style="width:15%; text-align:right">Total</th>
                                    <th style="width:10%; text-align:center">Currency</th>
                                    <th style="width:5%; text-align:center">Actions</th>
                                </tr>
                            <thead>
                            <tbody id="show_detail">
                            </tbody>
                        </table>
                    </div>                         -->
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="btnSave" onclick="save()" class="btn btn-primary">Proses</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>