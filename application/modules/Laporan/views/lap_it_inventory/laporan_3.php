<style>
	@media print
	{    
		.no-print, .no-print *
		{
			display: none !important;
		}
	}
	@media screen {
		.invoice{
			margin-left:5px;
			margin-right:5px;
		}
	}
</style>
<style>
    .judul >thead tr th{
        padding:2px;
        font-size:12px;
        border:0px solid;
    }
    .judul >tbody tr td{
        padding:2px;
        font-size:12px;
        border:0px solid;
    }
    .table >thead tr th{
        padding:2px;
        font-size:11px;
        border:1px solid;
    }
    
    .table >tbody tr td{
        padding:2px;
        font-size:11px;
        border:1px solid;
    }
    .kecilsekali{
        font-size:10px;
        padding-right:2px;
    }
    .kecil{
        font-size:12px;
        padding-right:2px;
    }
    .besar{
        font-size:14px;
        font-weight:bold;
        color:#D15B47;
        padding-right:2px;
    }		
</style>

<div class="page-content-wrapper ">
    <div class="content ">
        <div class=" container-fluid   container-fixed-lg bg-white">
            <div class="card card-transparent">
                <div class="card-header ">
                    <div class="card-body">
                        <div class="col-lg-12 table-responsive">
                            <table class="judul">
                                <tr>
                                    <td><b>LAPORAN PERTANGGUNG JAWABAN BAHAN BAKU & PENOLONG</b></td>
                                    <td style="text-align:right;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td><b>KAWASAN BERIKAT PT. ELTRON NUSA TEKNOLOGI</b></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><b>Periode 01-08-2019 s/d 31-08-2019</b></td>
                                    <td></td>
                                </tr>
                            </table>
                            <br>
                            <table width="100%" border="1" cellspacing="0" cellpadding="0" class="table">
                                <thead>
                                    <tr>
                                        <th style="text-align:center;vertical-align:middle;">NO</th>
                                        <th style="text-align:center;vertical-align:middle;">KODE BARANG</th>
                                        <th style="text-align:center;vertical-align:middle;">NAMA BARANG</th>
                                        <th style="text-align:center;vertical-align:middle;">SATUAN</th>
                                        <th style="text-align:center;vertical-align:middle;">SALDO AWAL <?php echo $periode_awal; ?></th>
                                        <th style="text-align:center;vertical-align:middle;">PEMASUKKAN</th>
                                        <th style="text-align:center;vertical-align:middle;">PENGELUARAN</th>
                                        <th style="text-align:center;vertical-align:middle;">PENYESUAIAN</th>
                                        <th style="text-align:center;vertical-align:middle;">SALDO AKHIR <?php echo $periode_akhir; ?></th>
                                        <th style="text-align:center;vertical-align:middle;">STOK OPNAME</th>
                                        <th style="text-align:center;vertical-align:middle;">SELISIH</th>
                                        <th style="text-align:center;vertical-align:middle;">KETERANGAN</th>
                                    </tr>
                                </thead>
                            </table>
                            <br>
                            <table border="0" width="100%" class="judul">
                                <tr>
                                    <td width="70%" colspan="10">&nbsp;</td>
                                    <td style="vertical-align:top; colspan="3"">
                                        KAMI BERTANGGUNG JAWAB<br>
                                        ATAS KEBENARAN LAPORAN INI<br>
                                        Bekasi, 31-08-2019<br>
                                        PENGUSAHA DI KAWASAN BERIKAT<br>
                                        <br><br><br>
                                        <u><b>Dian Hendrawan</b></u><br>
                                        Head of Procurement & GA
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>