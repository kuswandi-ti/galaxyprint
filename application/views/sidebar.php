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
                        <a href="<?=base_url('master/currency')?>">Mata Uang</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                    <li class="">
                        <a href="<?=base_url()?>">Supplier</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                    <li class="">
                        <a href="<?=base_url('master/customer')?>">Customer</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                    <li class="">
                        <a href="<?=base_url('master/subcon')?>">Subcon</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                    <li class="">
                        <a href="<?=base_url('master/satuan')?>">Satuan</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                    <li class="">
                        <a href="<?=base_url('master/bahan_baku')?>">Bahan Baku & Penolong</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                    <li class="">
                    <a href="<?=base_url('master/barang_jadi')?>">Barang Jadi</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                    <li class="">
                        <a href="<?=base_url('master/barang_sisa')?>">Barang Sisa</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                    <li class="">
                        <a href="<?=base_url()?>">Master Akun</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                    <li class="">
                        <a href="<?=base_url('master/akun_default')?>">Akun Default</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;"><span class="title">Buku Besar</span>
                <span class=" arrow"></span></a>
                <span class="icon-thumbnail"><i class="pg-tables"></i></span>
                <ul class="sub-menu">
                    <li class="">
                        <a href="<?=base_url()?>">Jurnal Umum</a>
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
                        <a href="<?=base_url()?>">Pembayaran</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                    <li class="">
                        <a href="<?=base_url()?>">Penerimaan</a>
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
                        <a href="<?=base_url('pembelian/po')?>">Pesanan Pembelian/PO</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                    <li class="">
                        <a href="<?=base_url('pembelian/faktur')?>">Faktur Pembelian</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                    <li class="">
                        <a href="<?=base_url('pembelian/pembayaran')?>">Pembayaran Pembelian</a>
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
                        <a href="<?=base_url()?>">Penerimaan Barang</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                    <li class="">
                        <a href="<?=base_url()?>">Pemakaian Bahan Baku</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                    <li class="">
                        <a href="<?=base_url()?>">Stok Opname</a>
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
                        <a href="<?=base_url()?>">Work Order</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                    <li class="">
                        <a href="<?=base_url()?>">Bill of Material Master</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                    <li class="">
                        <a href="<?=base_url()?>">Permintaan Bahan Baku</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                    <li class="">
                        <a href="<?=base_url()?>">Pencatatan Scrap</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                    <li class="">
                        <a href="<?=base_url()?>">Penyelesaian Scrap</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                    <li class="">
                        <a href="<?=base_url()?>">SO Scrap</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                    <li class="">
                        <a href="<?=base_url()?>">Hasil Produksi</a>
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
                        <a href="<?=base_url()?>">Pengiriman Barang</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                    <li class="">
                        <a href="<?=base_url()?>">Faktur Penjualan</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                    <li class="">
                        <a href="<?=base_url()?>">Penerimaan Penjualan</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                    <li class="">
                        <a href="<?=base_url()?>">Stock Opname</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;"><span class="title">Assets</span>
                <span class=" arrow"></span></a>
                <span class="icon-thumbnail"><i class="pg-tables"></i></span>
                <ul class="sub-menu">
                    <li class="">
                        <a href="<?=base_url()?>">Aktiva Tetap</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                    <li class="">
                        <a href="<?=base_url()?>">Penerimaan</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                    <li class="">
                        <a href="<?=base_url()?>">Pengeluaran</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                    <li class="">
                        <a href="<?=base_url()?>">Stock Opname</a>
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
                        <a href="<?=base_url()?>">Laporan Keuangan</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                    <li class="">
                        <a href="<?=base_url()?>">Laporan IT Inventory</a>
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
                        <a href="<?=base_url()?>">User Groups</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                    <li class="">
                        <a href="<?=base_url()?>">Users</a>
                        <!-- <span class="icon-thumbnail">c</span> -->
                    </li>
                </ul>
            </li>
        </ul>
        <div class="clearfix"></div>
    </div>

</nav>