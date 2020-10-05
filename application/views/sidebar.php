<nav class="page-sidebar" data-pages="sidebar">
    <div class="sidebar-header">
        <img src="assets/img/logo_white.png" alt="logo" class="brand" data-src="assets/img/logo_white.png" data-src-retina="assets/img/logo_white_2x.png" width="78" height="22">
        <div class="sidebar-header-controls">
            <button type="button" class="btn btn-xs sidebar-slide-toggle btn-link m-l-20" data-pages-toggle="#appMenu"><i class="fa fa-angle-down fs-16"></i>
            </button>
            <button type="button" class="btn btn-link d-lg-inline-block d-xlg-inline-block d-md-inline-block d-sm-none d-none" data-toggle-pin="sidebar"><i class="fa fs-12"></i>
            </button>
        </div>
    </div>

    <div class="sidebar-menu">

        <ul class="menu-items">
            <li class="m-t-30 ">
                <a href="<?=base_url()?>" class="detailed">
                    <span class="title">Dashboard</span>
                </a>
                <span class="bg-success icon-thumbnail"><i class="pg-home"></i></span>
            </li>

            <?php
                $group_name = $this->ion_auth->get_users_groups($this->session->userdata('user_id'))->row()->name;
            ?>

            <?php
                if ($this->ion_auth->is_admin()) {
            ?>
                    <li>
                        <a href="javascript:;"><span class="title">Preferensi</span>
                        <span class=" arrow"></span></a>
                        <span class="icon-thumbnail"><i class="pg-tables"></i></span>
                        <ul class="sub-menu">
                            <li class="">
                                <a href="<?=base_url('Master/Currency')?>">Mata Uang</a>
                            </li>
                            <li class="">
                                <a href="<?=base_url('Master/Supplier')?>">Supplier</a>
                            </li>
                            <li class="">
                                <a href="<?=base_url('Master/Customer')?>">Customer</a>
                            </li>
                            <li class="">
                                <a href="<?=base_url('Master/Satuan')?>">Satuan</a>
                            </li>
                            <li class="">
                                <a href="<?=base_url('Master/Bahan_baku')?>">Bahan Baku</a>
                            </li>
                            <li class="">
                                <a href="<?=base_url('Master/Akun')?>">Master Akun</a>
                            </li>
                            <li class="">
                                <a href="<?=base_url('Master/Akun_default')?>">Akun Default</a>
                            </li>
                        </ul>
                    </li>
            <?php
                }
            ?>

            <?php
                if ($group_name == 'deskprint') {
            ?>
                    <li>
                        <a href="javascript:;"><span class="title">Deskprint</span>
                        <span class=" arrow"></span></a>
                        <span class="icon-thumbnail"><i class="pg-tables"></i></span>
                        <ul class="sub-menu">
                            <li class="">
                                <a href="javascript:;">Penjualan Langsung</a>
                            </li>
                            <li class="">
                                <a href="javascript:;">Data Base Customer</a>
                            </li>
                            <li class="">
                                <a href="javascript:;">Pembuatan Faktur Penjualan</a>
                            </li>
                            <li class="">
                                <a href="javascript:;">Data Produksi</a>
                            </li>
                        </ul>
                    </li>
            <?php
                }
            ?>

            <?php
                if ($group_name == 'kasir') {
            ?>
                    <li>
                        <a href="javascript:;"><span class="title">Kasir</span>
                        <span class=" arrow"></span></a>
                        <span class="icon-thumbnail"><i class="pg-tables"></i></span>
                        <ul class="sub-menu">
                            <li class="">
                                <a href="javascript:;">Validasi Faktur Penjualan</a>
                            </li>
                            <li class="">
                                <a href="javascript:;">List Data Penjualan</a>
                            </li>
                            <li class="">
                                <a href="javascript:;">Aproval Produksi</a>
                            </li>
                            <li class="">
                                <a href="javascript:;">Data Pemasukan Tunai/Debit</a>
                            </li>
                            <li class="">
                                <a href="javascript:;">Cetak Faktur Penjualan</a>
                            </li>
                            <li class="">
                                <a href="javascript:;">Data Produksi</a>
                            </li>
                        </ul>
                    </li>
            <?php
                }
            ?>

            <?php
                if ($group_name == 'management') {
            ?>
                    <li>
                        <a href="javascript:;"><span class="title">Management</span>
                        <span class=" arrow"></span></a>
                        <span class="icon-thumbnail"><i class="pg-tables"></i></span>
                        <ul class="sub-menu">
                            <li class="">
                                <a href="javascript:;">Database Customer</a>
                            </li>
                            <li class="">
                                <a href="javascript:;">Database Penjualan</a>
                            </li>
                            <li class="">
                                <a href="javascript:;">Data Hutang - Piutang</a>
                            </li>
                            <li class="">
                                <a href="javascript:;">Data Akutansi</a>
                            </li>
                            <li class="">
                                <a href="javascript:;">Database Pricelist Jual</a>
                            </li>
                            <li class="">
                                <a href="javascript:;">Database Pricelist Modal Pembuatan Product</a>
                            </li>
                            <li class="">
                                <a href="javascript:;">Account Pembuatan Product</a>
                            </li>
                            <li class="">
                                <a href="javascript:;">Database Purchasing</a>
                            </li>
                        </ul>
                    </li>
            <?php
                }
            ?>

            <?php
                if ($group_name == 'operasional') {
            ?>
                    <li>
                        <a href="javascript:;"><span class="title">Operasional</span>
                        <span class=" arrow"></span></a>
                        <span class="icon-thumbnail"><i class="pg-tables"></i></span>
                        <ul class="sub-menu">
                            <li class="">
                                <a href="javascript:;">Database Bahan Baku</a>
                            </li>
                            <li class="">
                                <a href="javascript:;">Account Pembuatan Product</a>
                            </li>
                            <li class="">
                                <a href="javascript:;">Data Stock Bahan Baku</a>
                            </li>
                            <li class="">
                                <a href="javascript:;">Data Base Operasional Kantor</a>
                            </li>
                        </ul>
                    </li>
            <?php
                }
            ?>

            <?php
                if ($group_name == 'produksi') {
            ?>
                    <li>
                        <a href="javascript:;"><span class="title">Produksi</span>
                        <span class=" arrow"></span></a>
                        <span class="icon-thumbnail"><i class="pg-tables"></i></span>
                        <ul class="sub-menu">
                            <li class="">
                                <a href="javascript:;">Data Produksi</a>
                            </li>
                            <li class="">
                                <a href="javascript:;">Update Status Produksi Selesai</a>
                            </li>
                            <li class="">
                                <a href="javascript:;">Mencetak SPK Produksi</a>
                            </li>
                        </ul>
                    </li>
            <?php
                }
            ?>
            
            <!-- <li>
                <a href="javascript:;"><span class="title">Pembelian</span>
                <span class=" arrow"></span></a>
                <span class="icon-thumbnail"><i class="pg-tables"></i></span>
                <ul class="sub-menu">
                    <li class="">
                        <a href="<?=base_url('Pembelian/Po')?>">Pesanan Pembelian/PO</a>
                    </li>
                    <li class="">
                        <a href="<?=base_url('Pembelian/Faktur')?>">Faktur Pembelian</a>
                    </li>
                    <li class="">
                        <a href="<?=base_url('Pembelian/Pembayaran')?>">Pembayaran Pembelian</a>
                    </li>
                </ul>
            </li> -->
            <!-- <li>
                <a href="javascript:;"><span class="title">Warehouse</span>
                <span class=" arrow"></span></a>
                <span class="icon-thumbnail"><i class="pg-tables"></i></span>
                <ul class="sub-menu">
                    <li class="">
                        <a href="<?=base_url('Warehouse/Masuk_material')?>">Penerimaan Barang</a>
                    </li>
                    <li class="">
                        <a href="<?=base_url('Warehouse/Keluar_material')?>">Pemakaian Bahan Baku</a>
                    </li>
                    <li class="">
                        <a href="<?=base_url('Warehouse/Sto_Bahan_Baku')?>">Stok Opname</a>
                    </li>
                </ul>
            </li> -->
            <!-- <li>
                <a href="javascript:;"><span class="title">Produksi</span>
                <span class=" arrow"></span></a>
                <span class="icon-thumbnail"><i class="pg-tables"></i></span>
                <ul class="sub-menu">
                    <li class="">
                        <a href="<?=base_url('Produksi/Work_Order')?>">Work Order</a>
                    </li>
                    <li class="">
                        <a href="<?=base_url('Produksi/Bill_of_material')?>">Bill of Material Master</a>
                    </li>
                    <li class="">
                    <a href="<?=base_url('Produksi/Permintaan')?>">Permintaan Bahan Baku</a>
                    </li>
                    <li class="">
                        <a href="<?=base_url('Produksi/Masuk_Scrap')?>">Pencatatan Scrap</a>
                    </li>
                    <li class="">
                        <a href="<?=base_url('Produksi/Keluar_Scrap')?>">Penyelesaian Scrap</a>
                    </li>
                    <li class="">
                        <a href="<?=base_url('Produksi/Sto_Scrap')?>">SO Scrap</a>
                    </li>
                    <li class="">
                        <a href="<?=base_url('Produksi/Hasil_Produksi')?>">Hasil Produksi</a>
                    </li>
                </ul>
            </li> -->
            <!-- <li>
                <a href="javascript:;"><span class="title">Penjualan</span>
                <span class=" arrow"></span></a>
                <span class="icon-thumbnail"><i class="pg-tables"></i></span>
                <ul class="sub-menu">
                    <li class="">
                        <a href="<?=base_url('Penjualan/Pengiriman')?>">Pengiriman Barang</a>
                    </li>
                    <li class="">
                        <a href="<?=base_url('Penjualan/Faktur')?>">Faktur Penjualan</a>
                    </li>
                    <li class="">
                        <a href="<?=base_url('Penjualan/Penerimaan')?>">Penerimaan Penjualan</a>
                    </li>
                </ul>
            </li> -->
            <!-- <li>
                <a href="javascript:;"><span class="title">Assets</span>
                <span class=" arrow"></span></a>
                <span class="icon-thumbnail"><i class="pg-tables"></i></span>
                <ul class="sub-menu">
                    <li class="">
                        <a href="<?=base_url('Assets/Aktiva')?>">Aktiva Tetap</a>
                    </li>
                    <li class="">
                        <a href="<?=base_url('Assets/Penerimaan')?>">Penerimaan</a>
                    </li>
                    <li class="">
                        <a href="<?=base_url('Assets/Pengeluaran')?>">Pengeluaran</a>
                    </li>
                    <li class="">
                        <a href="<?=base_url()?>">Stock Opname</a>
                    </li>
                </ul>
            </li> -->
            <!-- <li>
                <a href="javascript:;"><span class="title">Buku Besar</span>
                <span class=" arrow"></span></a>
                <span class="icon-thumbnail"><i class="pg-tables"></i></span>
                <ul class="sub-menu">
                    <li class="">
                        <a href="<?=base_url('Buku_besar/Jurnal')?>">Jurnal Umum</a>
                    </li>
                </ul>
            </li> -->
            <!-- <li>
                <a href="javascript:;"><span class="title">Kas & Bank</span>
                <span class=" arrow"></span></a>
                <span class="icon-thumbnail"><i class="pg-tables"></i></span>
                <ul class="sub-menu">
                    <li class="">
                        <a href="<?=base_url('Kas_Bank/Acc_Bank_Pembayaran')?>">Pembayaran</a>
                    </li>
                    <li class="">
                        <a href="<?=base_url('Kas_Bank/Acc_Bank_Penerimaan')?>">Penerimaan</a>
                    </li>
                </ul>
            </li> -->
            <!-- <li>
                <a href="javascript:;"><span class="title">Laporan</span>
                <span class=" arrow"></span></a>
                <span class="icon-thumbnail"><i class="pg-tables"></i></span>
                <ul class="sub-menu">
                    <li class="">
                         <a href="<?=base_url('Laporan/Keuangan')?>">Laporan Keuangan</a>
                    </li>
                    <li class="">
                        <a href="<?=base_url('Laporan/Lap_IT_Inventory')?>">Laporan Inventory</a>
                    </li>
                </ul>
            </li> -->
            <?php
                if ($this->ion_auth->is_admin()) {
            ?>
                    <li>
                        <a href="javascript:;"><span class="title">Utility</span>
                        <span class=" arrow"></span></a>
                        <span class="icon-thumbnail"><i class="pg-tables"></i></span>
                        <ul class="sub-menu">
                            <li class="">
                                <a href="<?=base_url('Auth')?>">User</a>
                            </li>
                            <li class="">
                                <a href="<?=base_url('Auth')?>">Group</a>
                            </li>
                        </ul>
                    </li>
            <?php
                }
            ?>
        </ul>
        <div class="clearfix"></div>
    </div>

</nav>