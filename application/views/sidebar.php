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
                <a href="index.html" class="detailed">
                    <span class="title">Dashboard</span>
                </a>
                <span class="bg-success icon-thumbnail"><i class="pg-home"></i></span>
            </li>
            <li>
                <a href="javascript:;"><span class="title">Preferensi</span>
                <span class=" arrow"></span></a>
                <span class="icon-thumbnail"><i class="pg-tables"></i></span>
                <ul class="sub-menu">
                    <li class="">
                        <a href="<?=base_url('Master/Currency')?>">Mata Uang</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                    <li class="">
                        <a href="<?=base_url('Master/Supplier')?>">Supplier</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                    <li class="">
                        <a href="<?=base_url('Master/Customer')?>">Customer</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                    <li class="">
                        <a href="<?=base_url('Master/Subcon')?>">Subcon</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                    <li class="">
                        <a href="<?=base_url('Master/Satuan')?>">Satuan</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                    <li class="">
                        <a href="<?=base_url('Master/Bahan_baku')?>">Bahan Baku & Penolong</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                    <li class="">
                    <a href="<?=base_url('Master/Barang_jadi')?>">Barang Jadi</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                    <li class="">
                        <a href="<?=base_url('Master/Barang_sisa')?>">Barang Sisa</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                    <li class="">
                        <a href="<?=base_url('Master/Akun')?>">Master Akun</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                    <li class="">
                        <a href="<?=base_url('Master/Akun_default')?>">Akun Default</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;"><span class="title">Pembelian</span>
                <span class=" arrow"></span></a>
                <span class="icon-thumbnail"><i class="pg-tables"></i></span>
                <ul class="sub-menu">
                    <li class="">
                        <a href="<?=base_url('Pembelian/Po')?>">Pesanan Pembelian/PO</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                    <li class="">
                        <a href="<?=base_url('Pembelian/Faktur')?>">Faktur Pembelian</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                    <li class="">
                        <a href="<?=base_url('Pembelian/Pembayaran')?>">Pembayaran Pembelian</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;"><span class="title">Warehouse</span>
                <span class=" arrow"></span></a>
                <span class="icon-thumbnail"><i class="pg-tables"></i></span>
                <ul class="sub-menu">
                    <li class="">
                        <a href="<?=base_url('Warehouse/Masuk_material')?>">Penerimaan Barang</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                    <li class="">
                        <a href="<?=base_url('Warehouse/Keluar_material')?>">Pemakaian Bahan Baku</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                    <li class="">
                        <a href="<?=base_url('Warehouse/Sto_Bahan_Baku')?>">Stok Opname</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;"><span class="title">Produksi</span>
                <span class=" arrow"></span></a>
                <span class="icon-thumbnail"><i class="pg-tables"></i></span>
                <ul class="sub-menu">
                    <li class="">
                        <a href="<?=base_url('Produksi/Work_Order')?>">Work Order</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                    <li class="">
                        <a href="<?=base_url('Produksi/Bill_of_material')?>">Bill of Material Master</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                    <li class="">
                    <a href="<?=base_url('Produksi/Permintaan')?>">Permintaan Bahan Baku</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                    <li class="">
                        <a href="<?=base_url('produksi/masuk_scrap')?>">Pencatatan Scrap</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                    <li class="">
                        <a href="<?=base_url('produksi/keluar_scrap')?>">Penyelesaian Scrap</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                    <li class="">
                        <a href="<?=base_url('produksi/Sto_Scrap')?>">SO Scrap</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                    <li class="">
                        <a href="<?=base_url('produksi/hasil_produksi')?>">Hasil Produksi</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;"><span class="title">Penjualan</span>
                <span class=" arrow"></span></a>
                <span class="icon-thumbnail"><i class="pg-tables"></i></span>
                <ul class="sub-menu">
                    <li class="">
                        <a href="<?=base_url('Penjualan/Pengiriman')?>">Pengiriman Barang</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                    <li class="">
                        <a href="<?=base_url('Penjualan/Faktur')?>">Faktur Penjualan</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                    <li class="">
                        <a href="<?=base_url('Penjualan/Penerimaan')?>">Penerimaan Penjualan</a>
                    </li>
                   <!--  <li class="">
                        <a href="<?=base_url()?>">Stock Opname</a>
                    </li> -->
                </ul>
            </li>
            <li>
                <a href="javascript:;"><span class="title">Assets</span>
                <span class=" arrow"></span></a>
                <span class="icon-thumbnail"><i class="pg-tables"></i></span>
                <ul class="sub-menu">
                    <li class="">
                        <a href="<?=base_url('Assets/Aktiva')?>">Aktiva Tetap</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                    <li class="">
                        <a href="<?=base_url('Assets/Penerimaan')?>">Penerimaan</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                    <li class="">
                        <a href="<?=base_url('Assets/Pengeluaran')?>">Pengeluaran</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                    <!-- <li class="">
                        <a href="<?=base_url()?>">Stock Opname</a>
                    </li> -->
                </ul>
            </li>
            <li>
                <a href="javascript:;"><span class="title">Buku Besar</span>
                <span class=" arrow"></span></a>
                <span class="icon-thumbnail"><i class="pg-tables"></i></span>
                <ul class="sub-menu">
                    <li class="">
                        <a href="<?=base_url('Buku_besar/Jurnal')?>">Jurnal Umum</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;"><span class="title">Kas & Bank</span>
                <span class=" arrow"></span></a>
                <span class="icon-thumbnail"><i class="pg-tables"></i></span>
                <ul class="sub-menu">
                    <li class="">
                        <a href="<?=base_url('Kas_bank/Acc_Bank_Pembayaran')?>">Pembayaran</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                    <li class="">
                        <a href="<?=base_url('Kas_bank/Acc_Bank_Penerimaan')?>">Penerimaan</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;"><span class="title">Laporan</span>
                <span class=" arrow"></span></a>
                <span class="icon-thumbnail"><i class="pg-tables"></i></span>
                <ul class="sub-menu">
                    <li class="">
                         <a href="<?=base_url('Laporan/Keuangan')?>">Laporan Keuangan</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                    <li class="">
                        <a href="<?=base_url('Laporan/Lap_It_Inventory')?>">Laporan IT Inventory</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;"><span class="title">Utility</span>
                <span class=" arrow"></span></a>
                <span class="icon-thumbnail"><i class="pg-tables"></i></span>
                <ul class="sub-menu">
                    <li class="">
                        <a href="<?=base_url('Auth/index')?>">User</a>
                    </li>
                </ul>
            </li>
        </ul>
        <div class="clearfix"></div>
    </div>

</nav>