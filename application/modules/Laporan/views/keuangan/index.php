<div class="page-content-wrapper ">
    <div class="content ">
        <div class=" container-fluid   container-fixed-lg bg-white">
            <div class="card card-transparent">
                <div class="card-header ">
                    <div class="card-title"><?=$title?></div>
                    <div class="clearfix"></div>
                    </div>
                    <div class="card-body">
                        <div class="col-xs-12">
                            <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="row">
                                        <label class="control-label col-md-1">Periode</label>
                                        <div class="col-md-3">
                                            <div class="input-group date col-md-12 p-l-0">
                                                <input type="text" class="form-control" id="date" name="tgl_hutang" autocomplete="off" value="<?=date('Y-m-d')?>">
                                                <div class="input-group-append ">
                                                    <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                                </div>
                                            </div>
                                            <span class="help-block"></span>
                                        </div>
                                        <div class="col-md-1">S/D</div>
                                        <div class="col-md-3">
                                            <div class="input-group date col-md-12 p-l-0">
                                                <input type="text" class="form-control" id="date" name="tgl_hutang" autocomplete="off" value="<?=date('Y-m-d')?>">
                                                <div class="input-group-append ">
                                                    <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                                </div>
                                            </div>
                                            <span class="help-block"></span>
                                        </div>
                                        <div class="col-md-3">
                                            <select class="full-width select2" required data-init-plugin="select2" id='supplier' name="supplier">
                                                <option>-- Pilih Jenis Laporan --</option>
                                                <option value="">Buku Besar (Rinci)</option>
                                                <option value="">Neraca Saldo</option>
                                                <option value="">Laba/Rugi (Standart)</option>
                                            </select>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>