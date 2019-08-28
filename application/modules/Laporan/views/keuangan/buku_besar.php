<div class="col-lg-12 table-responsive"><div class="col-sm-6">
                    <table>
                      <tbody><tr>
                        <td><b>PT. RIZKI MAJU ANGKASA</b></td>
                        <td style="text-align:right;">&nbsp;</td>
                      </tr>
                      <tr>
                        <td><b>Buku Besar - Rinci</b></td>
                        <td></td>
                      </tr>
                      <tr>
                            <td><b>Periode 01-08-2019 s/d 28-08-2019</b></td>
                            <td></td>
                        </tr>
                      </tbody></table></div><div class="pull-right" style="padding-right:10px;">
                            <button id="unduh" class="btn btn-white btn-primary btn-xs" title="Unduh Excel"><i class="fa fa-download"></i> Unduh</button>
                            <button id="cetak" style="display:none;" class="btn btn-white btn-warning btn-xs" title="Cetak"><i class="fa fa-print"></i> Cetak</button>
                            <button id="close" class="btn btn-white btn-danger btn-xs" title="Tutup"><i class="fa fa-close"></i> Tutup</button> 
                      </div><table width="100%" border="0" style="border-collapse:separate;border-spacing: 10px 0;"><thead><tr>
                                <th style="border-bottom:1px solid;">Tanggal</th>
                                <th style="border-bottom:1px solid;">Sumber</th>
                                <th style="border-bottom:1px solid;width:10%;">No.Sumber</th>
                                <th colspan="1" style="border-bottom:1px solid;">Keterangan</th>
                                <th style="border-bottom:1px solid;text-align:right;">Debet</th>
                                <th style="border-bottom:1px solid;text-align:right;">Kredit</th>
                                <th style="border-bottom:1px solid;text-align:right;">Balance</th>
                      </tr></thead><tbody>
                        <?php foreach ($kode_akun as $r) {
                                $trx = $ci->db->query("
                                        SELECT tgl_transaksi,  'Bukti Jurnal' jenis_trx,  h.id id_header, keterangan, debet, kredit, debet-kredit balance
                                        FROM  acc_bukti_transaksi h, acc_jurnal_umum d
                                        where h.id = d.id_header
                                        and kode_akun = '$r->kode_akun'
                                        UNION
                                        SELECT tgl_pembayaran tgl_transaksi,  'Pengeluaran Kas & Bank' jenis_trx,  id, penerima keterangan, 0 debet, total_pembayaran kredit, 0-total_pembayaran balance
                                        FROM  acc_bank_pembayaran
                                        where kode_akun = '$r->kode_akun'
                                        UNION
                                        SELECT tgl_penerimaan tgl_transaksi,  'Penerimaan Kas & Bank' jenis_trx,  id, pengirim keterangan, total_penerimaan debet, 0 kredit, 0+total_penerimaan balance
                                        FROM  acc_bank_penerimaan
                                        where kode_akun = '$r->kode_akun'
                                        UNION
                                        SELECT tgl_transaksi,  'Pembayaran Pembelian' jenis_trx,  id, keterangan, 0 debet, total_pembayaran kredit, 0-total_pembayaran balance
                                        FROM  acc_pembayaran_header
                                        where kode_akun = '$r->kode_akun'
                                        UNION
                                        SELECT tgl_penerimaan tgl_transaksi,  'Penerimaan Penjualan' jenis_trx,  id, keterangan, total_penerimaan debet, 0 kredit, 0+total_penerimaan balance
                                        FROM  acc_penerimaan_header
                                        where kode_akun_debet = '$r->kode_akun'
                                    ");
                            ?>
                            
                            <?php 
                            if($trx->num_rows() > 0){?>
                                <tr>
                                        <td style="font-weight:bold;"><?=$r->kode_akun?></td>
                                        <td style="font-weight:bold;"><?=$r->nama_akun?></td>
                                        <td style="font-weight:bold;"><?=getValue('nama_akun', 'acc_master_type', array('kode_akun'=>'where/'.substr($r->kode_akun, 0, 1)))?></td>
                                        <td style="font-weight:bold;text-align:right;">0.00</td>
                                        <td style="font-weight:bold;"></td>
                                        <td style="font-weight:bold;"></td>
                                        <td style="font-weight:bold;"></td>
                              </tr><?php
                                foreach ($trx->result() as $t) { ?>
                                    <tr>
                                    <td><?=$t->tgl_transaksi?></td>
                                    <td><?=$t->jenis_trx?></td>
                                    <td><?=$t->id_header?></td>
                                    <td><?=$t->keterangan?></td>
                                    <td><?=$t->debet?></td>
                                    <td><?=$t->kredit?></td>
                                    <td>&nbsp;&nbsp; <?=($t->balance <=0) ? '(Cr)' : '(Dr)';?> <?=$t->balance?></td>
                                    </tr>
                            <?php } ?>

                            <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td style="border-top:1px solid;text-align:right;font-weight:bold;color:blue;">100,000.00</td>
                                            <td style="border-top:1px solid;text-align:right;font-weight:bold;color:blue;">100,000.00</td>
                                            <td style="text-align:right;"></td>
                                    </tr>
                       <?php } ?>
                            
                       <?php } ?>
                        </tbody></table><br></div>