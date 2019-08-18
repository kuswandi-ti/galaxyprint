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
                                        <th>Tgl DO</th>
                                        <th>No Do</th>
                                        <th>Cust</th>
                                        <th>No Inv</th>
                                        <th>No Aju</th>
                                        <th>Dokumen</th>
                                        <th>Nomor</th>
                                        <th>Tgl Dok</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                     
                                <tfoot>
                                    <tr>
                                        
                                        <th>Tgl DO</th>
                                        <th>No Do</th>
                                        <th>Cust</th>
                                        <th>No Inv</th>
                                        <th>No Aju</th>
                                        <th>Dokumen</th>
                                        <th>Nomor</th>
                                        <th>Tgl Dok</th>
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
                            <label class="control-label col-md-3">Nama Curr</label>
                            <div class="col-md-9">
                                <input name="nama_<?=$title?>" placeholder="Nama <?=$title?>" class="form-control" type="text">
                                <span class="help-block"></span>
                            </div>
                            <label class="control-label col-md-3">Kurs IDR</label>
                            <div class="col-md-9">
                                <input name="nilai_kurs_idr" placeholder="Kurs IDR" class="form-control" type="text">
                                <span class="help-block"></span>
                            </div>
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