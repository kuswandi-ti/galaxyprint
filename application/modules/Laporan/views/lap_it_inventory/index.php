<div class="page-content-wrapper ">
    <div class="content ">
        <div class=" container-fluid   container-fixed-lg bg-white">
            <div class="card card-transparent">
                <div class="card-header ">
                    <div class="card-title">Daftar Laporan (IT Inventory)</div>
                    <hr>
                    <div class="card-body">
                        <form class="form-horizontal">
                            <div class="form-body">
                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="row">
                                                <div class="col-md-9">
                                                    <select class="full-width select2" required data-init-plugin="select2" id='dokumen' name="dokumen">
                                                        <option value="" selected>-- Semua Dokumen --</option>
                                                        <?php                                
                                                            foreach ($get_dokumen as $row) {  
                                                                echo "<option value='".$row->kode_dokumen."'>".$row->nama_dokumen."</option>";
                                                            }
                                                        ?>
                                                    </select>
                                                    <span class="help-block"></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="row">
                                                <label class="control-label col-md-2">Periode</label>
                                                <div class="col-md-4">
                                                    <div class="input-group date">
                                                        <input type="text" class="form-control" id="periode_awal" name="periode_awal" autocomplete="off" value="<?=date('Y-m-d')?>">
                                                        <div class="input-group-append ">
                                                            <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <label class="control-label col-md-2 text-center">s/d</label>
                                                <div class="col-md-4">
                                                    <div class="input-group date">
                                                        <input type="text" class="form-control" id="periode_akhir" name="periode_akhir" autocomplete="off" value="<?=date('Y-m-d')?>">
                                                        <div class="input-group-append ">
                                                            <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>

                        <hr />

                        <div class="col-md-12">
                            <table id="example1" class="table-striped" style="width:100%;padding:5px;" border="0">
                                <thead>					
                                    <tr>
                                        <td style="width:40%;border-bottom:0px;font-size:14px;">
                                            <a href="#" class="laporan_1" title="Klik Untuk Melihat Laporan">1. Laporan Pemasukan Barang Perdokumen</a>
                                        </td>
                                        <td style="width:10%;border-bottom:0px;font-size:14px;text-align:center;">
                                            <a href="#" class="pdf_1">Pdf</a> | <a href="#" class="excel_1">Excel</a>
                                        </td>
                                        <td style="width:50%;border-bottom:0px;text-align:right;"></td>
                                    </tr>
                                    <tr>
                                        <td style="width:40%;border-bottom:0px;font-size:14px;">
                                            <a href="#" class="laporan_2" title="Klik Untuk Melihat Laporan">2. Laporan Pengeluaran Barang Perdokumen</a>
                                        </td>
                                        <td style="width:10%;border-bottom:0px;font-size:14px;text-align:center;">
                                            <a href="#" class="pdf_2">Pdf</a> | <a href="#" class="excel_2">Excel</a>
                                        </td>
                                        <td style="width:50%;border-bottom:0px;text-align:right;"></td>
                                    </tr>
                                    <tr>
                                        <td style="width:40%;border-bottom:0px;font-size:14px;">
                                            <a href="#" class="laporan_3" title="Klik Untuk Melihat Laporan">3. Laporan Mutasi Bahan Baku &amp; Penolong</a>
                                        </td>
                                        <td style="width:10%;border-bottom:0px;font-size:14px;text-align:center;">
                                            <a href="#" class="pdf_3">Pdf</a> | <a href="#" class="excel_3">Excel</a>
                                        </td>
                                        <td style="width:50%;border-bottom:0px;text-align:right;"></td>
                                    </tr>
                                    <tr>
                                        <td style="width:40%;border-bottom:0px;font-size:14px;">
                                            <a href="#" class="laporan_4" title="Klik Untuk Melihat Laporan">4. Laporan Mutasi Barang Jadi</a>
                                        </td>
                                        <td style="width:10%;border-bottom:0px;font-size:14px;text-align:center;">
                                            <a href="#" class="pdf_4">Pdf</a> | <a href="#" class="excel_4">Excel</a>
                                        </td>
                                        <td style="width:50%;border-bottom:0px;text-align:right;"></td>
                                    </tr>
                                    <tr>
                                        <td style="width:40%;border-bottom:0px;font-size:14px;">
                                            <a href="#" class="laporan_5" title="Klik Untuk Melihat Laporan">5. Laporan Mutasi Mesin &amp; Peralatan Kantor</a>
                                        </td>
                                        <td style="width:10%;border-bottom:0px;font-size:14px;text-align:center;">
                                            <a href="#" class="pdf_5">Pdf</a> | <a href="#" class="excel_5">Excel</a>
                                        </td>
                                        <td style="width:50%;border-bottom:0px;text-align:right;"></td>
                                    </tr>
                                    <tr>
                                        <td style="width:40%;border-bottom:0px;font-size:14px;">
                                            <a href="#" class="laporan_6" title="Klik Untuk Melihat Laporan">6. Laporan Mutasi Barang Sisa/Scrap</a>
                                        </td>
                                        <td style="width:10%;border-bottom:0px;font-size:14px;text-align:center;">
                                            <a href="#" class="pdf_6">Pdf</a> | <a href="#" class="excel_6">Excel</a>
                                        </td>
                                        <td style="width:50%;border-bottom:0px;text-align:right;"></td>
                                    </tr>
                                    <tr>
                                        <td style="width:40%;border-bottom:0px;font-size:14px;">
                                            <a href="#" class="laporan_7" title="Klik Untuk Melihat Laporan">7. Laporan Barang WIP</a>
                                        </td>
                                        <td style="width:10%;border-bottom:0px;font-size:14px;text-align:center;">
                                            <a href="#" class="pdf_7">Pdf</a> | <a href="#" class="excel_7">Excel</a>
                                        </td>
                                        <td style="width:50%;border-bottom:0px;text-align:right;"></td>
                                    </tr>                                
                                </thead>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>