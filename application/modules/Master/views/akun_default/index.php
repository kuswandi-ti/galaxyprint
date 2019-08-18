<div class="page-content-wrapper ">
    <div class="content ">
        <div class=" container-fluid   container-fixed-lg bg-white">
            <div class="card card-transparent">
                <div class="card-header ">
                    <div class="card-title">Akun Default</div>
                </div>
                <div class="card-block">
                    <div class="alert alert-success" id="alert">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <strong>Success!</strong> Simpan data berhasil.
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <form id="form" class="form-horizontal" role="form" autocomplete="off">
                                <div class="row">
                                    <div class="col-md-6">
                                        <h5><u>Pembelian</u></h5>
                                        <div class="row">
                                            <label for="penerimaan_barang" class="col-md-4">Penerimaan Barang</label>
                                            <div class="col-md-7">
                                                <select class="full-width" required data-init-plugin="select2" id='penerimaan_barang' name="penerimaan_barang">
                                                    <option value="0" selected>-- Pilih Akun --</option>
                                                    <?php                                
                                                        foreach ($get_akun as $row) {  
                                                            echo "<option value='".$row->kode_akun."'>".$row->kode_akun." | ".$row->nama_akun."</option>";
                                                        }
                                                    ?>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label for="potongan_pembelian" class="col-md-4">Potongan Pembelian</label>
                                            <div class="col-md-7">
                                                <select class="full-width" required data-init-plugin="select2" id='potongan_pembelian' name="potongan_pembelian">
                                                    <option value="0" selected>-- Pilih Akun --</option>
                                                    <?php                                
                                                        foreach ($get_akun as $row) {  
                                                            echo "<option value='".$row->kode_akun."'>".$row->kode_akun." | ".$row->nama_akun."</option>";
                                                        }
                                                    ?>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label for="ppn_masukan" class="col-md-4">PPN Masukan</label>
                                            <div class="col-md-7">
                                                <select class="full-width" required data-init-plugin="select2" id='ppn_masukan' name="ppn_masukan">
                                                    <option value="0" selected>-- Pilih Akun --</option>
                                                    <?php                                
                                                        foreach ($get_akun as $row) {  
                                                            echo "<option value='".$row->kode_akun."'>".$row->kode_akun." | ".$row->nama_akun."</option>";
                                                        }
                                                    ?>
                                                </select>
                                            </div>
                                        </div>

                                        <h5><u>Persediaan</u></h5>
                                        <div class="row">
                                            <label for="bahan_baku" class="col-md-4">Bahan Baku</label>
                                            <div class="col-md-7">
                                                <select class="full-width" required data-init-plugin="select2" id='bahan_baku' name="bahan_baku">
                                                    <option value="0" selected>-- Pilih Akun --</option>
                                                    <?php                                
                                                        foreach ($get_akun as $row) {  
                                                            echo "<option value='".$row->kode_akun."'>".$row->kode_akun." | ".$row->nama_akun."</option>";
                                                        }
                                                    ?>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label for="bahan_penolong" class="col-md-4">Bahan Penolong</label>
                                            <div class="col-md-7">
                                                <select class="full-width" required data-init-plugin="select2" id='bahan_penolong' name="bahan_penolong">
                                                    <option value="0" selected>-- Pilih Akun --</option>
                                                    <?php                                
                                                        foreach ($get_akun as $row) {  
                                                            echo "<option value='".$row->kode_akun."'>".$row->kode_akun." | ".$row->nama_akun."</option>";
                                                        }
                                                    ?>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label for="bahan_sparepart" class="col-md-4">Sparepart</label>
                                            <div class="col-md-7">
                                                <select class="full-width" required data-init-plugin="select2" id='bahan_sparepart' name="bahan_sparepart">
                                                    <option value="0" selected>-- Pilih Akun --</option>
                                                    <?php                                
                                                        foreach ($get_akun as $row) {  
                                                            echo "<option value='".$row->kode_akun."'>".$row->kode_akun." | ".$row->nama_akun."</option>";
                                                        }
                                                    ?>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label for="barang_wip" class="col-md-4">Barang WIP</label>
                                            <div class="col-md-7">
                                                <select class="full-width" required data-init-plugin="select2" id='barang_wip' name="barang_wip">
                                                    <option value="0" selected>-- Pilih Akun --</option>
                                                    <?php                                
                                                        foreach ($get_akun as $row) {  
                                                            echo "<option value='".$row->kode_akun."'>".$row->kode_akun." | ".$row->nama_akun."</option>";
                                                        }
                                                    ?>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label for="barang_jadi" class="col-md-4">Barang Jadi</label>
                                            <div class="col-md-7">
                                                <select class="full-width" required data-init-plugin="select2" id='barang_jadi' name="barang_jadi">
                                                    <option value="0" selected>-- Pilih Akun --</option>
                                                    <?php                                
                                                        foreach ($get_akun as $row) {  
                                                            echo "<option value='".$row->kode_akun."'>".$row->kode_akun." | ".$row->nama_akun."</option>";
                                                        }
                                                    ?>
                                                </select>
                                            </div>
                                        </div>

                                        <h5><u>Biaya Produksi</u></h5>
                                        <div class="row">
                                            <label for="biaya_bahan_baku" class="col-md-4">Biaya Bahan Baku</label>
                                            <div class="col-md-7">
                                                <select class="full-width" required data-init-plugin="select2" id='biaya_bahan_baku' name="biaya_bahan_baku">
                                                    <option value="0" selected>-- Pilih Akun --</option>
                                                    <?php                                
                                                        foreach ($get_akun as $row) {  
                                                            echo "<option value='".$row->kode_akun."'>".$row->kode_akun." | ".$row->nama_akun."</option>";
                                                        }
                                                    ?>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label for="biaya_tkl" class="col-md-4">Biaya TKL</label>
                                            <div class="col-md-7">
                                                <select class="full-width" required data-init-plugin="select2" id='biaya_tkl' name="biaya_tkl">
                                                    <option value="0" selected>-- Pilih Akun --</option>
                                                    <?php                                
                                                        foreach ($get_akun as $row) {  
                                                            echo "<option value='".$row->kode_akun."'>".$row->kode_akun." | ".$row->nama_akun."</option>";
                                                        }
                                                    ?>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label for="biaya_overhead" class="col-md-4">Biaya Overhead</label>
                                            <div class="col-md-7">
                                                <select class="full-width" required data-init-plugin="select2" id='biaya_overhead' name="biaya_overhead">
                                                    <option value="0" selected>-- Pilih Akun --</option>
                                                    <?php                                
                                                        foreach ($get_akun as $row) {  
                                                            echo "<option value='".$row->kode_akun."'>".$row->kode_akun." | ".$row->nama_akun."</option>";
                                                        }
                                                    ?>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <h5><u>Penjualan</u></h5>
                                        <div class="row">
                                            <label for="penjualan_produk" class="col-md-4">Penjualan Produk</label>
                                            <div class="col-md-7">
                                                <select class="full-width" required data-init-plugin="select2" id='penjualan_produk' name="penjualan_produk">
                                                    <option value="0" selected>-- Pilih Akun --</option>
                                                    <?php                                
                                                        foreach ($get_akun as $row) {  
                                                            echo "<option value='".$row->kode_akun."'>".$row->kode_akun." | ".$row->nama_akun."</option>";
                                                        }
                                                    ?>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label for="pengiriman_barang" class="col-md-4">Pengiriman Barang</label>
                                            <div class="col-md-7">
                                                <select class="full-width" required data-init-plugin="select2" id='pengiriman_barang' name="pengiriman_barang">
                                                    <option value="0" selected>-- Pilih Akun --</option>
                                                    <?php                                
                                                        foreach ($get_akun as $row) {  
                                                            echo "<option value='".$row->kode_akun."'>".$row->kode_akun." | ".$row->nama_akun."</option>";
                                                        }
                                                    ?>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label for="potongan_penjualan" class="col-md-4">Potongan Penjualan</label>
                                            <div class="col-md-7">
                                                <select class="full-width" required data-init-plugin="select2" id='potongan_penjualan' name="potongan_penjualan">
                                                    <option value="0" selected>-- Pilih Akun --</option>
                                                    <?php                                
                                                        foreach ($get_akun as $row) {  
                                                            echo "<option value='".$row->kode_akun."'>".$row->kode_akun." | ".$row->nama_akun."</option>";
                                                        }
                                                    ?>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label for="ppn_keluaran" class="col-md-4">PPN Keluaran</label>
                                            <div class="col-md-7">
                                                <select class="full-width" required data-init-plugin="select2" id='ppn_keluaran' name="ppn_keluaran">
                                                    <option value="0" selected>-- Pilih Akun --</option>
                                                    <?php                                
                                                        foreach ($get_akun as $row) {  
                                                            echo "<option value='".$row->kode_akun."'>".$row->kode_akun." | ".$row->nama_akun."</option>";
                                                        }
                                                    ?>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group row"></div>
                                        <div class="row">&nbsp;</div>

                                        <div class="row">
                                            <label for="hutang" class="col-md-4">Akun Hutang</label>
                                            <div class="col-md-7">
                                                <select class="full-width" required data-init-plugin="select2" id='hutang' name="hutang">
                                                    <option value="0" selected>-- Pilih Akun --</option>
                                                    <?php                                
                                                        foreach ($get_akun as $row) {  
                                                            echo "<option value='".$row->kode_akun."'>".$row->kode_akun." | ".$row->nama_akun."</option>";
                                                        }
                                                    ?>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label for="piutang" class="col-md-4">Akun Piutang</label>
                                            <div class="col-md-7">
                                                <select class="full-width" required data-init-plugin="select2" id='piutang' name="piutang">
                                                    <option value="0" selected>-- Pilih Akun --</option>
                                                    <?php                                
                                                        foreach ($get_akun as $row) {  
                                                            echo "<option value='".$row->kode_akun."'>".$row->kode_akun." | ".$row->nama_akun."</option>";
                                                        }
                                                    ?>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group row"></div>
                                        <div class="row">&nbsp;</div>

                                        <div class="row">
                                        <button type="button" id="btnSave" onclick="save()" class="btn btn-primary">Save</button>
                                        </div>

                                    </div>
                                <div>
                            </form>
                        </div>
                    </div>
                    <p>&nbsp;</p>
                </div>
            </div>
        </div>
    </div>
</div>