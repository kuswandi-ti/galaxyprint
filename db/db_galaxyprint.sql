/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100129
 Source Host           : localhost:3306
 Source Schema         : rma

 Target Server Type    : MySQL
 Target Server Version : 100129
 File Encoding         : 65001

 Date: 02/10/2020 07:50:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for acc_aktiva_header
-- ----------------------------
DROP TABLE IF EXISTS `acc_aktiva_header`;
CREATE TABLE `acc_aktiva_header`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode_kategori` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kode_barang` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_barang` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `spesifikasi_barang` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `hs_barang` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `satuan` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `currency` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `harga_barang` decimal(20, 2) DEFAULT 0.00,
  `qty` decimal(20, 2) DEFAULT 0.00,
  `usia_pakai` int(11) DEFAULT 0,
  `tgl_perolehan` date DEFAULT NULL,
  `kode_akun_1` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kode_akun_2` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kode_akun_3` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kode_akun_4` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kode_akun_5` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keluar_1` decimal(20, 2) DEFAULT 0.00,
  `keluar_2` decimal(20, 2) DEFAULT 0.00,
  `aktif` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'Y',
  `created_at` datetime(0) DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_from` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1565240284 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of acc_aktiva_header
-- ----------------------------
INSERT INTO `acc_aktiva_header` VALUES (1565239655, '05001', 'TN001', 'Tanah Lahan', '4000 M2', NULL, 'Unit', 'IDR', 750000000.00, 1.00, 0, '2018-01-01', '1.2.1', '1.2.6', '6.5.1', '1.1.1.3', '', 750000000.00, 0.00, 'Y', '2019-08-08 11:50:02', 'admin', '127.0.0.1');
INSERT INTO `acc_aktiva_header` VALUES (1565239822, '05002', 'GD001', 'Geudung Kantor', '-', NULL, 'Unit', 'IDR', 300000000.00, 1.00, 240, '2018-09-10', '1.2.2', '1.2.6', '6.5.1', '1.1.1.4', '', 300000000.00, 0.00, 'Y', '2019-08-08 11:51:36', 'admin', '127.0.0.1');
INSERT INTO `acc_aktiva_header` VALUES (1565240193, '05003', 'KN0001', 'Mobil Dinas Direktur', 'Toyota Alpard', NULL, 'Unit', 'IDR', 450000000.00, 1.00, 240, '2019-04-29', '1.2.4', '1.2.8', '6.5.3', '1.1.1.4', '', 450000000.00, 0.00, 'Y', '2019-08-08 11:57:42', 'admin', '127.0.0.1');
INSERT INTO `acc_aktiva_header` VALUES (1565240283, '03001', 'MS001', 'Mesin Moulding', 'SN:00012992', NULL, 'Unit', 'IDR', 120000000.00, 2.00, 240, '2019-07-01', '1.2.3', '1.2.7', '6.5.2', '1.1.1.3', '', 120000000.00, 0.00, 'Y', '2019-08-08 11:59:26', 'admin', '127.0.0.1');

-- ----------------------------
-- Table structure for acc_bank_pembayaran
-- ----------------------------
DROP TABLE IF EXISTS `acc_bank_pembayaran`;
CREATE TABLE `acc_bank_pembayaran`  (
  `id` int(11) NOT NULL,
  `tgl_pembayaran` date DEFAULT NULL,
  `kode_akun` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `penerima` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_cek` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_cek` date DEFAULT NULL,
  `total_pembayaran` decimal(20, 2) DEFAULT 0.00,
  `keterangan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_input` int(11) DEFAULT 0,
  `created_at` datetime(0) DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_from` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of acc_bank_pembayaran
-- ----------------------------
INSERT INTO `acc_bank_pembayaran` VALUES (1565232456, '2019-08-08', '1.1.1.1', 'Pak Lomri', '', '0000-00-00', 180000.00, 'Service Komputer', 1, '2019-08-08 09:48:00', 'admin', '127.0.0.1');

-- ----------------------------
-- Table structure for acc_bank_penerimaan
-- ----------------------------
DROP TABLE IF EXISTS `acc_bank_penerimaan`;
CREATE TABLE `acc_bank_penerimaan`  (
  `id` int(11) NOT NULL,
  `tgl_penerimaan` date DEFAULT NULL,
  `kode_akun` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `pengirim` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `total_penerimaan` decimal(20, 2) DEFAULT 0.00,
  `keterangan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_input` int(11) DEFAULT 0,
  `created_at` datetime(0) DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_from` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of acc_bank_penerimaan
-- ----------------------------
INSERT INTO `acc_bank_penerimaan` VALUES (1565232813, '2019-08-08', '1.1.1.2', 'CV. udin Jaya', 800000.00, 'Penjualan Sampah Plastik', 1, '2019-08-08 09:56:38', 'admin', '127.0.0.1');

-- ----------------------------
-- Table structure for acc_bukti_transaksi
-- ----------------------------
DROP TABLE IF EXISTS `acc_bukti_transaksi`;
CREATE TABLE `acc_bukti_transaksi`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tgl_transaksi` datetime(0) DEFAULT NULL,
  `keterangan` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_at` datetime(0) DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_from` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_input` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1565233512 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of acc_bukti_transaksi
-- ----------------------------
INSERT INTO `acc_bukti_transaksi` VALUES (1, '2019-08-27 00:00:00', 'DSA', '2019-08-27 10:15:45', NULL, NULL, 0);
INSERT INTO `acc_bukti_transaksi` VALUES (1565233509, '2019-08-08 10:05:08', 'Beli pulpen', '2019-08-08 10:06:20', 'admin', '127.0.0.1', 1);
INSERT INTO `acc_bukti_transaksi` VALUES (1565233511, '2019-08-27 00:00:00', 'DSA', '2019-08-27 10:17:01', NULL, NULL, 0);

-- ----------------------------
-- Table structure for acc_hpp_header
-- ----------------------------
DROP TABLE IF EXISTS `acc_hpp_header`;
CREATE TABLE `acc_hpp_header`  (
  `id` int(11) NOT NULL,
  `tgl_transaksi` datetime(0) DEFAULT NULL,
  `no_wo` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kode_akun` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `total` decimal(20, 2) DEFAULT 0.00,
  `status_input` int(11) DEFAULT 0,
  `created_at` datetime(0) DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_from` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for acc_hutang
-- ----------------------------
DROP TABLE IF EXISTS `acc_hutang`;
CREATE TABLE `acc_hutang`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tgl_hutang` date DEFAULT NULL,
  `supplier` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_referensi` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_invoice` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keterangan` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `currency` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kurs` decimal(20, 2) DEFAULT 1.00,
  `total_hutang` decimal(20, 2) DEFAULT 0.00,
  `potongan_persen` decimal(10, 2) DEFAULT 0.00,
  `ppn_persen` decimal(10, 2) DEFAULT 0.00,
  `potongan` decimal(20, 2) DEFAULT 0.00,
  `ppn` decimal(20, 2) DEFAULT 0.00,
  `biaya_lain` decimal(20, 2) DEFAULT 0.00,
  `grand_total` decimal(20, 2) DEFAULT 0.00,
  `jatuh_tempo` date DEFAULT NULL,
  `kode_pembayaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_paid` datetime(0) DEFAULT NULL,
  `idpo` int(11) DEFAULT NULL,
  `kode_akun_1` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kode_akun_2` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kode_akun_3` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_hutang` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'NEW',
  `created_at` datetime(0) DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_from` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_input` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1565282087 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of acc_hutang
-- ----------------------------
INSERT INTO `acc_hutang` VALUES (1565231672, '2019-08-08', 'SUP001', 'PO/DS/VIII/002/2019', 'INV/MMS/002/2019', '', 'IDR', 1.00, 240000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 240000.00, '2019-09-07', '1565231712', '2019-08-08 09:35:28', 0, '1.1.3.3', '2.1.1.1', NULL, 'PAID', '2019-08-08 09:34:53', 'admin', '127.0.0.1', 1);
INSERT INTO `acc_hutang` VALUES (1565282085, '2019-08-08', 'CHN001', 'PO/DS/VIII/001/2019', 'MS/INV', '', 'USD', 14500.00, 691.35, 0.00, 0.00, 0.00, 0.00, 0.00, 691.35, '2019-09-07', NULL, NULL, 0, '1.1.3.3', '2.1.1.2', NULL, 'NEW', '2019-08-08 23:35:20', 'admin', '127.0.0.1', 1);
INSERT INTO `acc_hutang` VALUES (1565282086, '2019-08-21', 'CHN001', '12345', '54321', 'test', 'USD', 1.00, 50632.00, 0.00, 0.00, 5000.00, 0.00, 0.00, 80000.00, '2019-08-21', '', NULL, NULL, NULL, NULL, NULL, 'NEW', '2019-08-21 06:20:48', NULL, NULL, 0);

-- ----------------------------
-- Table structure for acc_hutang_detail
-- ----------------------------
DROP TABLE IF EXISTS `acc_hutang_detail`;
CREATE TABLE `acc_hutang_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_header` int(11) DEFAULT NULL,
  `idpoheader` int(10) DEFAULT NULL,
  `idpodetail` int(100) DEFAULT NULL,
  `kode_barang` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_barang` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0.00',
  `spesifikasi_barang` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `satuan` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `qty` decimal(20, 2) DEFAULT 0.00,
  `harga` decimal(20, 2) DEFAULT 0.00,
  `currency` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kurs` decimal(20, 2) DEFAULT 1.00,
  `status_input` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of acc_hutang_detail
-- ----------------------------
INSERT INTO `acc_hutang_detail` VALUES (13, 1565231672, 1565186519, 18, 'BP0001', 'Sarung Tangan Katun', 'Miera 12 AP', 'Pack', 30.00, 6000.00, 'IDR', 1.00, 1);
INSERT INTO `acc_hutang_detail` VALUES (14, 1565231672, 1565186519, 19, 'BP0002', 'Isolasi Hitam', 'Merk Daiwa', 'Pcs', 50.00, 1200.00, 'IDR', 1.00, 1);
INSERT INTO `acc_hutang_detail` VALUES (15, 1565282085, 1565185368, 16, 'MK0002', 'Pipa Besi', 'Diameter 5\"', 'Batang', 15.00, 24.79, 'USD', 14500.00, 1);
INSERT INTO `acc_hutang_detail` VALUES (16, 1565282085, 1565185368, 17, 'MK0001', 'Pipa PPC 21 Inchi', 'Diameter 16x24', 'Kg', 25.00, 12.78, 'USD', 14500.00, 1);
INSERT INTO `acc_hutang_detail` VALUES (17, 1565282086, NULL, NULL, 'BP0001', 'Sarung Tangan Katun', NULL, 'Pack', 50.00, 6000.00, '15000', NULL, 0);
INSERT INTO `acc_hutang_detail` VALUES (18, 1565282086, NULL, NULL, 'BP0002', 'Isolasi Hitam', NULL, 'Pcs', 50.00, 1200.00, '15000', NULL, 0);
INSERT INTO `acc_hutang_detail` VALUES (19, 1565282087, NULL, NULL, 'BP0001', 'Sarung Tangan Katun', NULL, 'Pack', 50.00, 6000.00, '15000', NULL, 0);
INSERT INTO `acc_hutang_detail` VALUES (20, 1565282087, NULL, NULL, 'BP0002', 'Isolasi Hitam', NULL, 'Pcs', 50.00, 1200.00, '15000', NULL, 0);

-- ----------------------------
-- Table structure for acc_jurnal_aktiva
-- ----------------------------
DROP TABLE IF EXISTS `acc_jurnal_aktiva`;
CREATE TABLE `acc_jurnal_aktiva`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_header` int(11) DEFAULT NULL,
  `kode_akun` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_akun` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `debet` decimal(20, 2) DEFAULT NULL,
  `kredit` decimal(20, 2) DEFAULT 0.00,
  `catatan` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_input` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of acc_jurnal_aktiva
-- ----------------------------
INSERT INTO `acc_jurnal_aktiva` VALUES (32, 1565239655, '1.2.1', 'Tanah', 750000000.00, 0.00, 'Aktiva Tetap', 1);
INSERT INTO `acc_jurnal_aktiva` VALUES (33, 1565239655, '1.1.1.3', 'Bank BCA', 0.00, 750000000.00, 'Aktiva Tetap', 1);
INSERT INTO `acc_jurnal_aktiva` VALUES (34, 1565239822, '1.2.2', 'Bangunan', 300000000.00, 0.00, 'Aktiva Tetap', 1);
INSERT INTO `acc_jurnal_aktiva` VALUES (35, 1565239822, '1.1.1.4', 'Bank BNI', 0.00, 300000000.00, 'Aktiva Tetap', 1);
INSERT INTO `acc_jurnal_aktiva` VALUES (36, 1565240193, '1.2.4', 'Kendaraan', 450000000.00, 0.00, 'Aktiva Tetap', 1);
INSERT INTO `acc_jurnal_aktiva` VALUES (37, 1565240193, '1.1.1.4', 'Bank BNI', 0.00, 450000000.00, 'Aktiva Tetap', 1);
INSERT INTO `acc_jurnal_aktiva` VALUES (38, 1565240283, '1.2.3', 'Mesin', 240000000.00, 0.00, 'Aktiva Tetap', 1);
INSERT INTO `acc_jurnal_aktiva` VALUES (39, 1565240283, '1.1.1.3', 'Bank BCA', 0.00, 240000000.00, 'Aktiva Tetap', 1);

-- ----------------------------
-- Table structure for acc_jurnal_bank
-- ----------------------------
DROP TABLE IF EXISTS `acc_jurnal_bank`;
CREATE TABLE `acc_jurnal_bank`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_header` int(11) DEFAULT NULL,
  `kode_akun` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_akun` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `debet` decimal(20, 2) DEFAULT NULL,
  `kredit` decimal(20, 2) DEFAULT 0.00,
  `catatan` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_input` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of acc_jurnal_bank
-- ----------------------------
INSERT INTO `acc_jurnal_bank` VALUES (30, 1565231712, '2.1.1.1', 'Hutang Usaha IDR', 240000.00, 0.00, 'Pembayaran pembelian', 1);
INSERT INTO `acc_jurnal_bank` VALUES (31, 1565231712, '1.1.1.1', 'Kas Kecil', 0.00, 240000.00, 'Pembayaran pembelian', 1);
INSERT INTO `acc_jurnal_bank` VALUES (36, 1565232456, '6.6.4', 'Pemeliharaan Peralatan Kantor', 180000.00, 0.00, '', 1);
INSERT INTO `acc_jurnal_bank` VALUES (37, 1565232456, '1.1.1.1', 'Kas Kecil', 0.00, 180000.00, 'Pak Lomri', 1);
INSERT INTO `acc_jurnal_bank` VALUES (40, 1565232813, '7.1', 'Pendapatan Lain-lain Diluar Usaha', 0.00, 800000.00, '', 1);
INSERT INTO `acc_jurnal_bank` VALUES (41, 1565232813, '1.1.1.2', 'Kas Besar', 800000.00, 0.00, NULL, 1);
INSERT INTO `acc_jurnal_bank` VALUES (42, 1565668559, '1.1.1.5', 'Bank Mandiri', 2963820.00, 0.00, 'Penerimaan pembayaran', 1);
INSERT INTO `acc_jurnal_bank` VALUES (43, 1565668559, '1.1.2.2', 'Piutang Usaha USD', 0.00, 2963820.00, 'Penerimaan pembayaran', 1);

-- ----------------------------
-- Table structure for acc_jurnal_hpp
-- ----------------------------
DROP TABLE IF EXISTS `acc_jurnal_hpp`;
CREATE TABLE `acc_jurnal_hpp`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_header` int(11) DEFAULT NULL,
  `kode_akun` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_akun` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `debet` decimal(20, 2) DEFAULT NULL,
  `kredit` decimal(20, 2) DEFAULT 0.00,
  `catatan` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_input` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for acc_jurnal_hutang
-- ----------------------------
DROP TABLE IF EXISTS `acc_jurnal_hutang`;
CREATE TABLE `acc_jurnal_hutang`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_header` int(11) DEFAULT NULL,
  `kode_akun` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_akun` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `debet` decimal(20, 2) DEFAULT NULL,
  `kredit` decimal(20, 2) DEFAULT 0.00,
  `catatan` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_input` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of acc_jurnal_hutang
-- ----------------------------
INSERT INTO `acc_jurnal_hutang` VALUES (32, 1565231672, '1.1.3.3', 'Persediaan Bahan Baku', 240000.00, 0.00, 'Faktur Pembelian Inv: INV/MMS/002/2019', 1);
INSERT INTO `acc_jurnal_hutang` VALUES (33, 1565231672, '2.1.1.1', 'Hutang Usaha IDR', 0.00, 240000.00, 'Faktur Pembelian Inv: INV/MMS/002/2019', 1);
INSERT INTO `acc_jurnal_hutang` VALUES (34, 1565282085, '1.1.3.3', 'Persediaan Bahan Baku', 10024575.00, 0.00, 'Faktur Pembelian Inv: MS/INV', 1);
INSERT INTO `acc_jurnal_hutang` VALUES (35, 1565282085, '2.1.1.2', 'Hutang Usaha USD', 0.00, 10024575.00, 'Faktur Pembelian Inv: MS/INV', 1);

-- ----------------------------
-- Table structure for acc_jurnal_persediaan
-- ----------------------------
DROP TABLE IF EXISTS `acc_jurnal_persediaan`;
CREATE TABLE `acc_jurnal_persediaan`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_header` int(11) DEFAULT NULL,
  `kode_akun` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_akun` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `debet` decimal(20, 2) DEFAULT NULL,
  `kredit` decimal(20, 2) DEFAULT 0.00,
  `catatan` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_input` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 88 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of acc_jurnal_persediaan
-- ----------------------------
INSERT INTO `acc_jurnal_persediaan` VALUES (40, 1565281347, '1.1.3.2', 'Persediaan Barang Dalam Proses', 359600.00, 0.00, 'Pemakaian Bahan Baku: wo:WO1', 1);
INSERT INTO `acc_jurnal_persediaan` VALUES (41, 1565281347, '1.1.3.3', 'Persediaan Bahan Baku', 0.00, 359600.00, 'Pemakaian Bahan Baku: wo:WO1', 1);
INSERT INTO `acc_jurnal_persediaan` VALUES (42, 1565281347, '5.2.3', 'Biaya Overhead Pabrik', 1000.00, 0.00, 'Pemakaian Bahan Penolong: wo: WO1', 1);
INSERT INTO `acc_jurnal_persediaan` VALUES (43, 1565281347, '1.1.3.4', 'Persediaan Bahan Penolong', 0.00, 1000.00, 'Pemakaian Bahan Penolong: wo: WO1', 1);
INSERT INTO `acc_jurnal_persediaan` VALUES (44, 1565356015, '5.2.3', 'Biaya Overhead Pabrik', 1500.00, NULL, 'Pemakaian Bahan Penolong: wo: WO/DS/VIII/2019', 1);
INSERT INTO `acc_jurnal_persediaan` VALUES (45, 1565356015, '1.1.3.4', 'Persediaan Bahan Penolong', NULL, 1500.00, 'Pemakaian Bahan Penolong: wo: WO/DS/VIII/2019', 1);
INSERT INTO `acc_jurnal_persediaan` VALUES (50, 1565361601, '5.2.3', 'Biaya Overhead Pabrik', 1500.00, NULL, 'Pemakaian Bahan Penolong: wo: WO1', 1);
INSERT INTO `acc_jurnal_persediaan` VALUES (51, 1565361601, '1.1.3.4', 'Persediaan Bahan Penolong', NULL, 1500.00, 'Pemakaian Bahan Penolong: wo: WO1', 1);
INSERT INTO `acc_jurnal_persediaan` VALUES (58, 1565361546, '1.1.3.3', 'Persediaan Bahan Baku', 10024575.00, 0.00, 'Penerimaan Barang Bahan Baku: PO/DS/VIII/001/2019', 1);
INSERT INTO `acc_jurnal_persediaan` VALUES (59, 1565361546, '2.1.4', 'Hutang Terima Barang', 0.00, 10024575.00, 'Penerimaan Barang Bahan Baku: PO/DS/VIII/001/2019', 1);
INSERT INTO `acc_jurnal_persediaan` VALUES (64, 1565361271, '1.1.3.4', 'Persediaan Bahan Penolong', 240000.00, NULL, 'Penerimaan Barang Bahan Penolong: PO/DS/VIII/002/2019', 1);
INSERT INTO `acc_jurnal_persediaan` VALUES (65, 1565361271, '2.1.4', 'Hutang Terima Barang', NULL, 240000.00, 'Penerimaan Barang Bahan Penolong: PO/DS/VIII/002/2019', 1);
INSERT INTO `acc_jurnal_persediaan` VALUES (86, 1565663566, '1.1.3.6', 'Barang Jadi Terkirim', 2963820.00, 0.00, 'Pengiriman Barang', 1);
INSERT INTO `acc_jurnal_persediaan` VALUES (87, 1565663566, '1.1.3.1', 'Persediaan Barang Jadi', 0.00, 2963820.00, 'Pengiriman Barang', 1);

-- ----------------------------
-- Table structure for acc_jurnal_piutang
-- ----------------------------
DROP TABLE IF EXISTS `acc_jurnal_piutang`;
CREATE TABLE `acc_jurnal_piutang`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_header` int(11) DEFAULT NULL,
  `kode_akun` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_akun` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `debet` decimal(20, 2) DEFAULT NULL,
  `kredit` decimal(20, 2) DEFAULT 0.00,
  `catatan` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_input` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of acc_jurnal_piutang
-- ----------------------------
INSERT INTO `acc_jurnal_piutang` VALUES (1, 1565666413, '1.1.2.2', 'Piutang Usaha USD', 2963820.00, 0.00, 'Invoice Penjualan', 1);
INSERT INTO `acc_jurnal_piutang` VALUES (2, 1565666413, '4.1', 'Penjualan Produk', 0.00, 2963820.00, 'Invoice Penjualan', 1);

-- ----------------------------
-- Table structure for acc_jurnal_umum
-- ----------------------------
DROP TABLE IF EXISTS `acc_jurnal_umum`;
CREATE TABLE `acc_jurnal_umum`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_header` int(11) DEFAULT NULL,
  `kode_akun` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_akun` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `debet` decimal(20, 2) DEFAULT NULL,
  `kredit` decimal(20, 2) DEFAULT 0.00,
  `catatan` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_input` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of acc_jurnal_umum
-- ----------------------------
INSERT INTO `acc_jurnal_umum` VALUES (30, 1565233509, '6.2', 'Alat Tulis Kantor', 17500.00, 0.00, '', 1);
INSERT INTO `acc_jurnal_umum` VALUES (31, 1565233509, '1.1.1.1', 'Kas Kecil', 0.00, 17500.00, '', 1);
INSERT INTO `acc_jurnal_umum` VALUES (36, 1565233511, '1.1', '1.1-AKTIVA LANCAR', 10.00, 0.00, 'TEST', 0);
INSERT INTO `acc_jurnal_umum` VALUES (37, 1565233511, '1.2', '1.2-AKTIVA TETAP', 0.00, 10.00, 'TEST2', 0);

-- ----------------------------
-- Table structure for acc_master_akun
-- ----------------------------
DROP TABLE IF EXISTS `acc_master_akun`;
CREATE TABLE `acc_master_akun`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode_akun` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_akun` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `saldo_awal` decimal(20, 2) DEFAULT 0.00,
  `tanggal` date DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `level_1` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `level_2` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `level_3` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `level_4` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keterangan` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 274 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of acc_master_akun
-- ----------------------------
INSERT INTO `acc_master_akun` VALUES (164, '1.1', 'AKTIVA LANCAR', 0.00, NULL, 2, '1', NULL, NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (165, '1.2', 'AKTIVA TETAP', 0.00, NULL, 2, '1', NULL, NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (166, '2.1', 'KEWAJIBAN LANCAR', 0.00, NULL, 2, '2', NULL, NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (167, '2.2', 'KEWAJIBAN JANGKA PANJANG', 0.00, NULL, 2, '2', NULL, NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (168, '3.1', 'Modal Saham', 0.00, NULL, 2, '3', NULL, NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (169, '3.2', 'Laba Ditahan', 0.00, NULL, 2, '3', NULL, NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (170, '4.1', 'Penjualan Produk', 0.00, NULL, 2, '4', NULL, NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (171, '4.2', 'Retur Penjualan Produk', 0.00, NULL, 2, '4', NULL, NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (172, '1.1.1', 'Kas & Bank', 0.00, NULL, 3, NULL, '1.1', NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (173, '1.1.1.1', 'Kas Kecil', 0.00, NULL, 4, NULL, NULL, '1.1.1', NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (174, '1.1.1.2', 'Kas Besar', 0.00, NULL, 4, NULL, NULL, '1.1.1', NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (175, '1.1.1.3', 'Bank BCA', 0.00, NULL, 4, NULL, NULL, '1.1.1', NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (176, '1.1.1.4', 'Bank BNI', 0.00, NULL, 4, NULL, NULL, '1.1.1', NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (177, '1.1.1.5', 'Bank Mandiri', 0.00, NULL, 4, NULL, NULL, '1.1.1', NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (179, '1.1.2', 'Piutang', 0.00, NULL, 3, NULL, '1.1', NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (180, '1.1.2.1', 'Piutang Usaha IDR', 0.00, NULL, 4, NULL, NULL, '1.1.2', NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (181, '1.1.2.2', 'Piutang Usaha USD', 0.00, NULL, 4, NULL, NULL, '1.1.2', NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (182, '1.1.2.3', 'Piutang Karyawan', 0.00, NULL, 4, NULL, NULL, '1.1.2', NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (183, '1.1.3', 'Persediaan', 0.00, NULL, 3, NULL, '1.1', NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (184, '1.1.3.1', 'Persediaan Barang Jadi', 0.00, NULL, 4, NULL, NULL, '1.1.3', NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (185, '1.1.3.2', 'Persediaan Barang Dalam Proses', 0.00, NULL, 4, NULL, NULL, '1.1.3', NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (186, '1.1.3.3', 'Persediaan Bahan Baku', 0.00, NULL, 4, NULL, NULL, '1.1.3', NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (187, '1.1.3.4', 'Persediaan Bahan Penolong', 0.00, NULL, 4, NULL, NULL, '1.1.3', NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (188, '1.1.3.5', 'Persediaan Sparepart', 0.00, NULL, 4, NULL, NULL, '1.1.3', NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (189, '1.1.4', 'Asuransi Dibayar Dimuka', 0.00, NULL, 3, NULL, '1.1', NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (190, '1.2.1', 'Tanah', 0.00, NULL, 3, NULL, '1.2', NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (191, '1.2.2', 'Bangunan', 0.00, NULL, 3, NULL, '1.2', NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (192, '1.2.3', 'Mesin', 0.00, NULL, 3, NULL, '1.2', NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (193, '1.2.4', 'Kendaraan', 0.00, NULL, 3, NULL, '1.2', NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (194, '1.2.5', 'Peralatan Kantor', 0.00, NULL, 3, NULL, '1.2', NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (195, '1.2.6', 'Akum. Penyusutan Bangunan', 0.00, NULL, 3, NULL, '1.2', NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (196, '1.2.7', 'Akum. Penyusutan Mesin', 0.00, NULL, 3, NULL, '1.2', NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (197, '1.2.8', 'Akum. Penyusutan Kendaraan', 0.00, NULL, 3, NULL, '1.2', NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (198, '1.2.9', 'Akum. Penyusutan Peralatan Kantor', 0.00, NULL, 3, NULL, '1.2', NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (199, '1.3', 'AKTIVA TIDAK BERWUJUD', 0.00, NULL, 2, '1', NULL, NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (200, '1.3.1', 'Merk Dagang', 0.00, NULL, 3, NULL, '1.3', NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (201, '1.3.2', 'Hak Cipta', 0.00, NULL, 3, NULL, '1.3', NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (202, '1.3.3', 'Goodwill', 0.00, NULL, 3, NULL, '1.3', NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (203, '1.3.4', 'Aktiva Tetap dalam Proses', 0.00, NULL, 3, NULL, '1.3', NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (204, '2.1.1', 'Hutang Usaha', 0.00, NULL, 3, NULL, '2.1', NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (205, '2.1.2', 'Hutang PPN', 0.00, NULL, 3, NULL, '2.1', NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (206, '2.1.3', 'Income Tax Payable', 0.00, NULL, 3, NULL, '2.1', NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (207, '2.1.4', 'Hutang Terima Barang', 0.00, NULL, 3, NULL, '2.1', NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (208, '2.2.1', 'Hutang Jangka Panjang', 0.00, NULL, 3, NULL, '2.2', NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (209, '5.1', 'Persediaan Barang Jadi Awal', 0.00, NULL, 2, '5', NULL, NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (210, '5.2', 'Biaya Produksi', 0.00, NULL, 2, '5', NULL, NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (211, '5.3', 'Persediaan Barang Jadi Akhir', 0.00, NULL, 2, '5', NULL, NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (212, '2.1.5', 'Hutang Lancar Lainnya', 0.00, NULL, 3, NULL, '2.1', NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (213, '5.4', 'HPP Lainnya', 0.00, NULL, 2, '5', NULL, NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (217, '6.1', 'Beban Gaji & THR', 0.00, NULL, 2, '6', NULL, NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (227, '6.2', 'Alat Tulis Kantor', 0.00, NULL, 2, '6', NULL, NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (228, '6.3', 'Transport / Perjalanan Dinas', 0.00, NULL, 2, '6', NULL, NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (229, '6.4', 'Biaya Utilitas', 0.00, NULL, 2, '6', NULL, NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (230, '6.4.1', 'Listrik', 0.00, NULL, 3, NULL, '6.4', NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (231, '6.4.2', 'Telepon', 0.00, NULL, 3, NULL, '6.4', NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (232, '6.4.3', 'Internet', 0.00, NULL, 3, NULL, '6.4', NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (233, '6.5', 'Biaya Penyusutan', 0.00, NULL, 2, '6', NULL, NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (234, '6.6', 'Biaya Pemeliharaan', 0.00, NULL, 2, '6', NULL, NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (235, '6.7', 'Biaya Penjualan & Pemasaran', 0.00, NULL, 2, '6', NULL, NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (236, '6.8', 'Biaya Usaha Lainnya', 0.00, NULL, 2, '6', NULL, NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (237, '7.1', 'Pendapatan Lain-lain Diluar Usaha', 0.00, NULL, 2, '7', NULL, NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (238, '7.2', 'Biaya Lain-lain Diluar Usaha', 0.00, NULL, 2, '7', NULL, NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (239, '1.1.3.6', 'Barang Jadi Terkirim', 0.00, NULL, 4, NULL, NULL, '1.1.3', NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (241, '6.5.1', 'Biaya Penyusutan Bangunan', 0.00, NULL, 3, NULL, '6.5', NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (242, '6.5.2', 'Biaya Penyusutan Mesin', 0.00, NULL, 3, NULL, '6.5', NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (243, '6.5.3', 'Biaya Penyusutan Kendaraan', 0.00, NULL, 3, NULL, '6.5', NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (244, '6.5.4', 'Biaya Penyusutan Peralatan Kantor', 0.00, NULL, 3, NULL, '6.5', NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (245, '6.6.1', 'Pemeliharaan Gedung', 0.00, NULL, 3, NULL, '6.6', NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (246, '6.6.2', 'Pemeliharaan Mesin', 0.00, NULL, 3, NULL, '6.6', NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (247, '6.6.3', 'Pemeliharaan Kendaraan', 0.00, NULL, 3, NULL, '6.6', NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (248, '6.6.4', 'Pemeliharaan Peralatan Kantor', 0.00, NULL, 3, NULL, '6.6', NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (249, '2.1.2.1', 'Hutang PPN Masukan', 0.00, NULL, 4, NULL, NULL, '2.1.2', NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (250, '2.1.2.2', 'Hutang PPN Keluaran', 0.00, NULL, 4, NULL, NULL, '2.1.2', NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (251, '2.1.3.1', 'Hutang PPH 21', 0.00, NULL, 4, NULL, NULL, '2.1.3', NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (252, '2.1.3.2', 'Hutang PPH 22', 0.00, NULL, 4, NULL, NULL, '2.1.3', NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (253, '2.1.3.3', 'Hutang PPH 23', 0.00, NULL, 4, NULL, NULL, '2.1.3', NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (254, '2.1.3.4', 'Hutang PPH 29', 0.00, NULL, 4, NULL, NULL, '2.1.3', NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (255, '1.1.2.4', 'Potongan Pembelian', 0.00, NULL, 4, NULL, NULL, '1.1.2', NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (256, '1.1.2.5', 'Potongan Penjualan', 0.00, NULL, 4, NULL, NULL, '1.1.2', NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (257, '5.2.1', 'Biaya Pemakaian Bahan Baku', 0.00, NULL, 3, NULL, '5.2', NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (258, '5.2.2', 'Biaya Tenaga Kerja Langsung', 0.00, NULL, 3, NULL, '5.2', NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (259, '5.2.3', 'Biaya Overhead Pabrik', 0.00, NULL, 3, NULL, '5.2', NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (260, '5.2.4', 'Barang Dalam Proses Awal', 0.00, NULL, 3, NULL, '5.2', NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (261, '5.2.5', 'Barang Dalam Proses Akhir', 0.00, NULL, 3, NULL, '5.2', NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (262, '5.3.1', 'HPP Barang Jadi', 0.00, NULL, 3, NULL, '5.3', NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (263, '5.3.2', 'Work In Process (WIP) Barang Jadi', 0.00, NULL, 3, NULL, '5.3', NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (264, '5.4.1', 'HPP Bahan Baku', 0.00, NULL, 3, NULL, '5.4', NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (265, '5.4.2', 'HPP Lainnya', 0.00, NULL, 3, NULL, '5.4', NULL, NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (266, '2.1.1.1', 'Hutang Usaha IDR', 0.00, NULL, 4, NULL, NULL, '2.1.1', NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (267, '2.1.1.2', 'Hutang Usaha USD', 0.00, NULL, 4, NULL, NULL, '2.1.1', NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (268, '5.2.3.1', 'Bahan Baku Tidak Langsung', 0.00, NULL, 4, NULL, NULL, '5.2.3', NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (269, '5.2.3.2', 'Tenaga Kerja Tidak Langsung', 0.00, NULL, 4, NULL, NULL, '5.2.3', NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (270, '5.2.3.3', 'Depresiasi Mesin', 0.00, NULL, 4, NULL, NULL, '5.2.3', NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (271, '5.2.3.4', 'Biaya Sewa', 0.00, NULL, 4, NULL, NULL, '5.2.3', NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (272, '5.2.3.5', 'Biaya Utility', 0.00, NULL, 4, NULL, NULL, '5.2.3', NULL, NULL);
INSERT INTO `acc_master_akun` VALUES (273, '5.2.2.1', 'Gaji & Upah Pegawai', 0.00, NULL, 4, NULL, NULL, '5.2.2', NULL, NULL);

-- ----------------------------
-- Table structure for acc_master_type
-- ----------------------------
DROP TABLE IF EXISTS `acc_master_type`;
CREATE TABLE `acc_master_type`  (
  `kode_akun` int(11) NOT NULL AUTO_INCREMENT,
  `nama_akun` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `type_akun` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`kode_akun`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of acc_master_type
-- ----------------------------
INSERT INTO `acc_master_type` VALUES (1, 'AKTIVA', 'D');
INSERT INTO `acc_master_type` VALUES (2, 'KEWAJIBAN', 'K');
INSERT INTO `acc_master_type` VALUES (3, 'EKUITAS', 'K');
INSERT INTO `acc_master_type` VALUES (4, 'PENDAPATAN', 'K');
INSERT INTO `acc_master_type` VALUES (5, 'HARGA POKOK PENJUALAN & PRODUKSI', 'D');
INSERT INTO `acc_master_type` VALUES (6, 'BIAYA USAHA', 'D');
INSERT INTO `acc_master_type` VALUES (7, 'PENDAPATAN & BIAYA LAIN-LAIN', 'K');

-- ----------------------------
-- Table structure for acc_pembayaran_detail
-- ----------------------------
DROP TABLE IF EXISTS `acc_pembayaran_detail`;
CREATE TABLE `acc_pembayaran_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_header` int(11) DEFAULT NULL,
  `id_hutang` int(11) DEFAULT NULL,
  `no_invoice` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_invoice` date DEFAULT NULL,
  `jatuh_tempo` date DEFAULT NULL,
  `total_invoice` decimal(20, 2) DEFAULT 0.00,
  `currency` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keterangan` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_input` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of acc_pembayaran_detail
-- ----------------------------
INSERT INTO `acc_pembayaran_detail` VALUES (16, 1565231712, 1565231672, 'INV/MMS/002/2019', '2019-08-08', '2019-09-07', 240000.00, 'IDR', '', 1);
INSERT INTO `acc_pembayaran_detail` VALUES (17, 1565231715, NULL, 'MS/INV', '0000-00-00', '2019-09-07', 691.35, 'null', 'test', 0);
INSERT INTO `acc_pembayaran_detail` VALUES (18, 1565231715, NULL, '54321', '0000-00-00', '0000-00-00', 0.00, 'null', 'test2', 0);
INSERT INTO `acc_pembayaran_detail` VALUES (19, 1565231716, NULL, '54321', '2019-08-21', '2019-08-21', 80000.00, 'USD', 'test', 0);
INSERT INTO `acc_pembayaran_detail` VALUES (20, 1565231716, NULL, 'MS/INV', '2019-08-08', '2019-09-07', 691.35, 'USD', 'test', 0);

-- ----------------------------
-- Table structure for acc_pembayaran_header
-- ----------------------------
DROP TABLE IF EXISTS `acc_pembayaran_header`;
CREATE TABLE `acc_pembayaran_header`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tgl_transaksi` date DEFAULT NULL,
  `kode_penerima` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kode_akun` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kode_akun_terbayar` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `total_pembayaran` decimal(20, 2) DEFAULT 0.00,
  `currency` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_cek` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_cek` date DEFAULT NULL,
  `keterangan` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_at` datetime(0) DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_from` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_input` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1565231717 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of acc_pembayaran_header
-- ----------------------------
INSERT INTO `acc_pembayaran_header` VALUES (1, NULL, 'CHN001', '173', '249', NULL, '', '4354', '2019-08-21', 'test2', '2019-08-21 11:28:26', NULL, NULL, 0);
INSERT INTO `acc_pembayaran_header` VALUES (1565231712, '2019-08-08', 'SUP001', '1.1.1.1', '2.1.1.1', 240000.00, 'IDR', '', '0000-00-00', '', '2019-08-08 09:35:45', 'admin', '127.0.0.1', 1);
INSERT INTO `acc_pembayaran_header` VALUES (1565231713, NULL, 'CHN001', '173', '249', NULL, '', '4354', '2019-08-21', 'test2', '2019-08-21 11:29:05', NULL, NULL, 0);
INSERT INTO `acc_pembayaran_header` VALUES (1565231714, NULL, 'CHN001', '173', '249', NULL, '', '4354', '2019-08-21', 'test2', '2019-08-21 11:29:39', NULL, NULL, 0);
INSERT INTO `acc_pembayaran_header` VALUES (1565231715, NULL, 'CHN001', '173', '249', NULL, '', '4354', '2019-08-21', 'test2', '2019-08-21 11:29:56', NULL, NULL, 0);
INSERT INTO `acc_pembayaran_header` VALUES (1565231716, NULL, 'CHN001', '173', '249', 80691.35, 'USD', '12345', '2019-08-22', 'test', '2019-08-22 12:00:45', NULL, NULL, 0);

-- ----------------------------
-- Table structure for acc_penerimaan_detail
-- ----------------------------
DROP TABLE IF EXISTS `acc_penerimaan_detail`;
CREATE TABLE `acc_penerimaan_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_header` int(11) DEFAULT NULL,
  `id_invoice` int(11) DEFAULT NULL,
  `no_invoice` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_invoice` date DEFAULT NULL,
  `jatuh_tempo` date DEFAULT NULL,
  `total_invoice` decimal(20, 2) DEFAULT 0.00,
  `currency` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kurs` decimal(20, 2) DEFAULT 1.00,
  `keterangan` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_input` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of acc_penerimaan_detail
-- ----------------------------
INSERT INTO `acc_penerimaan_detail` VALUES (3, 1565668559, 1565666413, 'INV/DSI/002/2019', '2019-08-13', '2019-09-12', 210.20, 'USD', 1.00, '', 1);
INSERT INTO `acc_penerimaan_detail` VALUES (4, 0, 1565666413, 'INV/DSI/002/2019', '2019-08-13', '2019-09-12', 210.20, 'USD', 1.00, 'test', 0);
INSERT INTO `acc_penerimaan_detail` VALUES (5, 0, 1565666415, '789', '2019-08-26', '2019-08-26', 210.20, 'USD', 1.00, 'test', 0);

-- ----------------------------
-- Table structure for acc_penerimaan_header
-- ----------------------------
DROP TABLE IF EXISTS `acc_penerimaan_header`;
CREATE TABLE `acc_penerimaan_header`  (
  `id` int(11) NOT NULL,
  `tgl_penerimaan` date DEFAULT NULL,
  `kode_customer` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kode_akun_debet` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kode_akun_kredit` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `total_penerimaan` decimal(20, 2) DEFAULT 0.00,
  `currency` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kurs` decimal(20, 2) DEFAULT 1.00,
  `no_cek` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_cek` date DEFAULT NULL,
  `keterangan` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_input` int(11) DEFAULT 0,
  `created_at` datetime(0) DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_from` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of acc_penerimaan_header
-- ----------------------------
INSERT INTO `acc_penerimaan_header` VALUES (0, '2019-08-26', 'CR001', '1.1', '1.2', 420.40, 'USD', 12500.00, '5432`', '2019-08-26', 'test', 0, '2019-08-26 06:32:15', NULL, NULL);
INSERT INTO `acc_penerimaan_header` VALUES (1565668559, '2019-08-13', 'NDS001', '1.1.1.5', '1.1.2.2', 210.20, 'USD', 1.00, '', '0000-00-00', '', 1, '2019-08-13 10:56:44', 'admin', '127.0.0.1');

-- ----------------------------
-- Table structure for acc_piutang_detail
-- ----------------------------
DROP TABLE IF EXISTS `acc_piutang_detail`;
CREATE TABLE `acc_piutang_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_header` int(11) DEFAULT NULL,
  `id_delivery_header` int(10) DEFAULT NULL,
  `id_delivery_detail` int(11) DEFAULT NULL,
  `no_delivery` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kode_barang` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_barang` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0.00',
  `spesifikasi_barang` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `hs_barang` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `satuan_barang` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `harga_barang` decimal(20, 2) DEFAULT 0.00,
  `qty` decimal(20, 2) DEFAULT 0.00,
  `currency` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kurs` decimal(20, 2) DEFAULT 1.00,
  `status_input` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of acc_piutang_detail
-- ----------------------------
INSERT INTO `acc_piutang_detail` VALUES (12, 1565666413, 1565663566, 12, 'DO/001/2019', 'BA0001', 'Barang Jadi 1', 'Type AC001', '-', 'Pcs', 8.34, 10.00, 'USD', 14100.00, 1);
INSERT INTO `acc_piutang_detail` VALUES (13, 1565666413, 1565663566, 13, 'DO/001/2019', 'BA0002', 'Barang Jadi 2', 'Type AC003', '-', 'Pcs', 12.68, 10.00, 'USD', 14100.00, 1);
INSERT INTO `acc_piutang_detail` VALUES (14, 1565666414, 1565663566, 13, 'DO/001/2019', 'BA0002', 'Barang Jadi 2', NULL, '0', 'Pcs', 12.68, 10.00, 'USD', 1.00, 0);
INSERT INTO `acc_piutang_detail` VALUES (15, 1565666415, 1565663566, 12, 'DO/001/2019', 'BA0001', 'Barang Jadi 1', NULL, '0', 'Pcs', 8.34, 10.00, 'USD', 1.00, 0);
INSERT INTO `acc_piutang_detail` VALUES (16, 1565666415, 1565663566, 13, 'DO/001/2019', 'BA0002', 'Barang Jadi 2', NULL, '0', 'Pcs', 12.68, 10.00, 'USD', 1.00, 0);

-- ----------------------------
-- Table structure for acc_piutang_header
-- ----------------------------
DROP TABLE IF EXISTS `acc_piutang_header`;
CREATE TABLE `acc_piutang_header`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tgl_invoice` date DEFAULT NULL,
  `no_invoice` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kode_customer` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_po` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tempo` int(11) DEFAULT NULL,
  `jatuh_tempo` date DEFAULT NULL,
  `total_invoice` decimal(20, 2) DEFAULT 0.00,
  `potongan` decimal(20, 2) DEFAULT 0.00,
  `pajak` decimal(20, 2) DEFAULT 0.00,
  `grand_total` decimal(20, 2) DEFAULT 0.00,
  `currency` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kurs` decimal(20, 2) DEFAULT 1.00,
  `keterangan` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_invoice` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'NEW',
  `tgl_paid` datetime(0) DEFAULT NULL,
  `id_penerimaan` int(11) DEFAULT NULL,
  `kode_akun` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_input` int(11) DEFAULT 0,
  `created_at` datetime(0) DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_from` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1565666416 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of acc_piutang_header
-- ----------------------------
INSERT INTO `acc_piutang_header` VALUES (1, NULL, 'dsa', NULL, '3424', NULL, '2019-08-26', NULL, 0.00, NULL, 136.80, 'USD', 1.00, 'ewqe', 'NEW', NULL, NULL, '180', 0, '2019-08-26 06:19:01', NULL, NULL);
INSERT INTO `acc_piutang_header` VALUES (1565666413, '2019-08-13', 'INV/DSI/002/2019', 'NDS001', '', NULL, '2019-09-12', 210.20, 0.00, 0.00, 210.20, 'USD', 1.00, '', 'PAID', '2019-08-13 10:56:20', 1565668559, '1.1.2.2', 1, '2019-08-13 10:24:05', 'admin', '127.0.0.1');
INSERT INTO `acc_piutang_header` VALUES (1565666414, NULL, 'dsa', NULL, '3424', NULL, '2019-08-26', NULL, 0.00, NULL, 136.80, 'USD', 1.00, 'ewqe', 'NEW', NULL, NULL, '180', 0, '2019-08-26 06:19:46', NULL, NULL);
INSERT INTO `acc_piutang_header` VALUES (1565666415, '2019-08-26', '789', 'NDS001', '4321', NULL, '2019-08-26', 210.20, 0.00, 10.00, 220.20, 'USD', 1.00, 'uyt', 'NEW', NULL, NULL, '1.1.2.1', 0, '2019-08-26 06:29:32', NULL, NULL);

-- ----------------------------
-- Table structure for acc_setting
-- ----------------------------
DROP TABLE IF EXISTS `acc_setting`;
CREATE TABLE `acc_setting`  (
  `id` int(11) NOT NULL,
  `hutang` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `penerimaan_barang` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `potongan_pembelian` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ppn_masukan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bahan_baku` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bahan_penolong` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bahan_sparepart` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `barang_wip` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `barang_jadi` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `penjualan_produk` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `piutang` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `pengiriman_barang` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `potongan_penjualan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ppn_keluaran` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `biaya_bahan_baku` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `biaya_tkl` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `biaya_overhead` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_at` datetime(0) DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_from` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `update_at` datetime(0) DEFAULT NULL,
  `update_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `update_from` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of acc_setting
-- ----------------------------
INSERT INTO `acc_setting` VALUES (1564627438, '2.1.1', '2.1.4', '1.1.2.4', '2.1.2.1', '1.1.3.3', '1.1.3.4', '1.1.3.5', '1.1.3.2', '1.1.3.1', '4.1', '1.1.2.1', '1.1.3.6', '1.1.2.5', '2.1.2.2', '5.2.1', '5.2.2', '5.2.3', '2019-08-01 09:43:58', 'admin', '127.0.0.1', '2019-08-07 19:32:29', 'admin', '127.0.0.1');

-- ----------------------------
-- Table structure for ci_sessions
-- ----------------------------
DROP TABLE IF EXISTS `ci_sessions`;
CREATE TABLE `ci_sessions`  (
  `id` varchar(40) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ci_sessions_timestamp`(`timestamp`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ci_sessions
-- ----------------------------
INSERT INTO `ci_sessions` VALUES ('16b3251c3aa6f024bc779797bcfe501d1e2e6759', '127.0.0.1', 1565674114, 0x5F5F63695F6C6173745F726567656E65726174657C693A313536353637343131343B);
INSERT INTO `ci_sessions` VALUES ('6599d2c02b2031fdc52eed07f9e7dab577ab36d2', '127.0.0.1', 1565687747, 0x5F5F63695F6C6173745F726567656E65726174657C693A313536353638353933343B557365724E616D657C733A353A2261646D696E223B4964557365727C733A313A2231223B5265616C4E616D657C733A31333A2241646D696E6973747261746F72223B456D61696C7C733A32313A226C6F6D72692E646F616E6B40676D61696C2E636F6D223B48616B7C733A3130313A22312C322C332C342C352C362C372C382C392C31302C31312C31362C31372C32312C32322C32362C32372C32392C33312C33322C33332C33362C33372C33382C33392C34302C34312C34372C34382C35302C35312C35362C35372C36312C36322C36332C3634223B50686F746F7C733A393A2261646D696E2E706E67223B54616D6261687C733A313A2259223B456469747C733A313A2259223B48617075737C733A313A2259223B53746174696F6E7C733A393A22756E646566696E6564223B506C6174666F726D7C733A393A2257696E646F77732037223B42726F777365727C733A31323A2246697265666F782036382E30223B5065727573616861616E7C733A33323A226530353130656335633262306364633465363539376436666438653739336430223B6C6F676765645F696E7C623A313B);
INSERT INTO `ci_sessions` VALUES ('7eeecafc88787b3dac3cb833eca234f71f6b4f6f', '120.188.32.188', 1565692670, 0x5F5F63695F6C6173745F726567656E65726174657C693A313536353639313735383B557365724E616D657C733A353A2261646D696E223B4964557365727C733A313A2231223B5265616C4E616D657C733A31333A2241646D696E6973747261746F72223B456D61696C7C733A32313A226C6F6D72692E646F616E6B40676D61696C2E636F6D223B48616B7C733A3130313A22312C322C332C342C352C362C372C382C392C31302C31312C31362C31372C32312C32322C32362C32372C32392C33312C33322C33332C33362C33372C33382C33392C34302C34312C34372C34382C35302C35312C35362C35372C36312C36322C36332C3634223B50686F746F7C733A393A2261646D696E2E706E67223B54616D6261687C733A313A2259223B456469747C733A313A2259223B48617075737C733A313A2259223B53746174696F6E7C733A393A22756E646566696E6564223B506C6174666F726D7C733A393A2257696E646F77732037223B42726F777365727C733A31323A2246697265666F782036382E30223B5065727573616861616E7C733A33323A226530353130656335633262306364633465363539376436666438653739336430223B6C6F676765645F696E7C623A313B);

-- ----------------------------
-- Table structure for groups
-- ----------------------------
DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of groups
-- ----------------------------
INSERT INTO `groups` VALUES (1, 'admin', 'Administrator');
INSERT INTO `groups` VALUES (2, 'members', 'General User');
INSERT INTO `groups` VALUES (3, 'Bos', 'bossss');

-- ----------------------------
-- Table structure for login_attempts
-- ----------------------------
DROP TABLE IF EXISTS `login_attempts`;
CREATE TABLE `login_attempts`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `login` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for master_asal_bahan
-- ----------------------------
DROP TABLE IF EXISTS `master_asal_bahan`;
CREATE TABLE `master_asal_bahan`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode_asal` varchar(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_asal` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of master_asal_bahan
-- ----------------------------
INSERT INTO `master_asal_bahan` VALUES (1, '01', 'Fasilitas Pembebasan');
INSERT INTO `master_asal_bahan` VALUES (2, '02', 'Lokal');
INSERT INTO `master_asal_bahan` VALUES (3, '03', 'Import Umum (PIB)');
INSERT INTO `master_asal_bahan` VALUES (4, '04', 'Lain-lain');

-- ----------------------------
-- Table structure for master_barang
-- ----------------------------
DROP TABLE IF EXISTS `master_barang`;
CREATE TABLE `master_barang`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode_barang` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_barang` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kode_kategori` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `spesifikasi_barang` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `hs_barang` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `satuan` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `hpp` decimal(20, 4) DEFAULT 0.0000,
  `harga_barang` decimal(20, 4) DEFAULT 0.0000,
  `currency` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `aktif` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'Y',
  `created_at` datetime(0) DEFAULT NULL,
  `created_from` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `kode`(`kode_barang`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of master_barang
-- ----------------------------
INSERT INTO `master_barang` VALUES (4, 'BA0001', 'Barang Jadi 1', '', 'Type AC001', '-', 'Pcs', 12.0000, 17.0000, 'USD', 'Y', '2019-08-07 19:35:29', '127.0.0.1', 'admin');
INSERT INTO `master_barang` VALUES (5, 'BA0002', 'Barang Jadi 2', '', 'Type AC003', '-', 'Pcs', 8.7500, 12.6800, 'USD', 'Y', '2019-08-07 19:36:13', '127.0.0.1', 'admin');
INSERT INTO `master_barang` VALUES (6, 'B003', 'Barang Jadi 3', '01001', 'TEST', '-', 'Kg', 3456.0000, 1234.0000, 'IDR', 'Y', '2019-08-28 03:23:59', NULL, NULL);

-- ----------------------------
-- Table structure for master_bom
-- ----------------------------
DROP TABLE IF EXISTS `master_bom`;
CREATE TABLE `master_bom`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode_barang` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kode_bom` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `hs_bom` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_bom` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `spek_bom` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jumlah_bom` decimal(20, 2) DEFAULT 0.00,
  `satuan_bom` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `harga_bom` decimal(20, 4) DEFAULT 0.0000,
  `currency` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_at` datetime(0) DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of master_bom
-- ----------------------------
INSERT INTO `master_bom` VALUES (16, 'BA0001', 'MK0002', '-', 'Pipa Besi', 'Diameter 5\"', 2.00, 'Pcs', 4.9600, 'USD', '2019-08-08 11:24:36', 'admin');
INSERT INTO `master_bom` VALUES (17, 'BA0001', 'MK0001', '-', 'Pipa PPC 21 Inchi', 'Diameter 16x24', 25.00, 'Gram', 0.0100, 'USD', '2019-08-08 11:24:58', 'admin');
INSERT INTO `master_bom` VALUES (19, 'BA0002', 'BP0001', '-', 'Sarung Tangan Katun', 'Miera 12 AP', 4.00, 'Pcs', 500.0000, 'IDR', '2019-08-08 11:32:26', 'admin');
INSERT INTO `master_bom` VALUES (20, 'BA0002', 'BP0002', '-', 'Isolasi Hitam', 'Merk Daiwa', 1.00, 'Pcs', 1200.0000, 'IDR', '2019-08-08 11:32:34', 'admin');

-- ----------------------------
-- Table structure for master_bom_detail
-- ----------------------------
DROP TABLE IF EXISTS `master_bom_detail`;
CREATE TABLE `master_bom_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_header` bigint(20) NOT NULL DEFAULT 0,
  `kode_material` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_material` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `hs_material` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `satuan_material` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `spesifikasi_bom` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jumlah_bom` decimal(20, 2) DEFAULT 0.00,
  `harga_bom` decimal(20, 4) DEFAULT 0.0000,
  `currency_bom` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_at` datetime(0) DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of master_bom_detail
-- ----------------------------
INSERT INTO `master_bom_detail` VALUES (1, 1, 'BP0002', 'Isolasi Hitam', '-', 'Pcs', 'Merk Daiwa', 10.00, 20.0000, 'EURO', '2019-08-27 03:19:27', NULL);
INSERT INTO `master_bom_detail` VALUES (2, 1, 'BP0001', 'Sarung Tangan Katun', '-', 'Pack', 'Miera 12 AP', 10.00, 220.0000, 'USD', '2019-08-27 03:19:27', NULL);
INSERT INTO `master_bom_detail` VALUES (3, 2, 'BP0002', 'Isolasi Hitam', '-', 'Pcs', 'Merk Daiwa', 10.00, 10.0000, 'IDR', '2019-08-28 03:24:23', NULL);

-- ----------------------------
-- Table structure for master_bom_header
-- ----------------------------
DROP TABLE IF EXISTS `master_bom_header`;
CREATE TABLE `master_bom_header`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `kode_barang` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_barang` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `spesifikasi` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `unit` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `currency` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_at` datetime(0) DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of master_bom_header
-- ----------------------------
INSERT INTO `master_bom_header` VALUES (1, 'BA0001', 'Barang Jadi 1', 'Type AC001', 'Pcs', 'USD', '2019-08-27 03:19:27', NULL);
INSERT INTO `master_bom_header` VALUES (2, 'B003', 'Barang Jadi 3', 'TEST', 'Kg', 'IDR', '2019-08-28 03:23:59', NULL);

-- ----------------------------
-- Table structure for master_currency
-- ----------------------------
DROP TABLE IF EXISTS `master_currency`;
CREATE TABLE `master_currency`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_currency` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nilai_kurs_idr` decimal(20, 2) DEFAULT 0.00,
  `update_terakhir` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of master_currency
-- ----------------------------
INSERT INTO `master_currency` VALUES (1, 'IDR', 1.00, '2019-08-15 18:22:10');
INSERT INTO `master_currency` VALUES (2, 'USD', 14100.00, '2019-08-01 09:16:46');
INSERT INTO `master_currency` VALUES (3, 'EURO', 16700.00, '2019-08-01 09:17:18');

-- ----------------------------
-- Table structure for master_customer
-- ----------------------------
DROP TABLE IF EXISTS `master_customer`;
CREATE TABLE `master_customer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `customer_name` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `customer_address` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `customer_country` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `customer_contact` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `customer_phone` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `currency` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tempo` int(11) DEFAULT 0,
  `active` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'Y',
  `created_at` datetime(0) DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_from` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cid`(`customer_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of master_customer
-- ----------------------------
INSERT INTO `master_customer` VALUES (1, 'CR001', 'Holiday None', 'Jl. Raya Serang Cibarusah', 'INDONESIA', 'Yuan', '082237961085', NULL, 0, 'Y', '2019-03-16 13:44:35', 'admin', '127.0.0.1');
INSERT INTO `master_customer` VALUES (2, 'CR002', 'Diana Logistik', 'Jakarta', 'INDONESIA', '', '', 'USD', 30, 'Y', '2019-03-16 13:46:01', 'admin', '127.0.0.1');
INSERT INTO `master_customer` VALUES (3, 'NDS001', 'CV. Nuansa Data Abadi', 'Jl. Kalimalang No. 18', 'INDONESIA', 'Tasudin', '007', 'USD', 30, 'Y', '2019-07-20 15:41:11', 'admin', '127.0.0.1');

-- ----------------------------
-- Table structure for master_dokumen
-- ----------------------------
DROP TABLE IF EXISTS `master_dokumen`;
CREATE TABLE `master_dokumen`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode_dokumen` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_dokumen` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `flag` varchar(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `kode_dokumen`(`kode_dokumen`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of master_dokumen
-- ----------------------------
INSERT INTO `master_dokumen` VALUES (1, 'BC23', 'BC.2.3', NULL, '1');
INSERT INTO `master_dokumen` VALUES (2, 'BC24', 'BC.2.4', NULL, '2');
INSERT INTO `master_dokumen` VALUES (3, 'BC25', 'BC.2.5', NULL, '2');
INSERT INTO `master_dokumen` VALUES (4, 'BC261', 'BC.2.6.1', NULL, '2');
INSERT INTO `master_dokumen` VALUES (5, 'BC262', 'BC.2.6.2', NULL, '1');
INSERT INTO `master_dokumen` VALUES (6, 'BC27', 'BC.2.7', NULL, '1,2');
INSERT INTO `master_dokumen` VALUES (7, 'BC30', 'BC.3.0', NULL, '2');
INSERT INTO `master_dokumen` VALUES (8, 'BC40', 'BC.4.0', NULL, '1');
INSERT INTO `master_dokumen` VALUES (9, 'BC41', 'BC.4.1', NULL, '2');

-- ----------------------------
-- Table structure for master_group
-- ----------------------------
DROP TABLE IF EXISTS `master_group`;
CREATE TABLE `master_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `group_access` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `allow_add` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'Y',
  `allow_update` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'Y',
  `allow_delete` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'Y',
  `created_at` datetime(0) DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of master_group
-- ----------------------------
INSERT INTO `master_group` VALUES (1, 'ADMIN', '1,2,3,4,5,6,7,8,9,10,11,16,17,21,22,26,27,29,31,32,33,36,37,38,39,40,41,47,48,50,51,56,57,61,62,63,64', 'Y', 'Y', 'Y', '2016-12-30 17:41:06', 'admin');

-- ----------------------------
-- Table structure for master_gudang
-- ----------------------------
DROP TABLE IF EXISTS `master_gudang`;
CREATE TABLE `master_gudang`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jenis` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_gudang` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `aktif` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'Y',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of master_gudang
-- ----------------------------
INSERT INTO `master_gudang` VALUES (1, 'BB', 'WH BB01', 'Gudang Bahan Baku 01', 'Y');
INSERT INTO `master_gudang` VALUES (2, 'BB', 'WH BB02', 'Gudang Bahan Baku 02', 'Y');
INSERT INTO `master_gudang` VALUES (3, 'WP', 'WH WIP', 'Gudang WIP', 'Y');
INSERT INTO `master_gudang` VALUES (4, 'FG', 'WH FG01', 'Gudang Hasil Produksi 01', 'Y');
INSERT INTO `master_gudang` VALUES (5, 'FG', 'WH FG02', 'Gudang Hasil Produksi 02', 'Y');
INSERT INTO `master_gudang` VALUES (6, 'SC', 'WH SCR', 'Gudang Barang Reject / Scrap', 'Y');

-- ----------------------------
-- Table structure for master_instansi
-- ----------------------------
DROP TABLE IF EXISTS `master_instansi`;
CREATE TABLE `master_instansi`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_instansi` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_instansi` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `alamat_instansi` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `daerah_instansi` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kota_instansi` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kodepos_instansi` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `telepon_instansi` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `fax_instansi` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `hp` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kpbc` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_skep` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `npwp` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ttd` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jabatan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `serial` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `nama_aplikasi` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `icon_footer` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of master_instansi
-- ----------------------------
INSERT INTO `master_instansi` VALUES (1, '000005', 'PT. ZEPHYR INDONESIA', 'Jl. RE. Martadinata ByPass Cikarang', 'Bekasi', 'Bekasi', '17530', '021-8990530', '021-8900570', '082237961085', 'edp@ishikawa.co.id', '050400', '2511/KM.4/2015', '02.744.450.4-413.000', 'Dian Hendrawan', 'Head of Procurement & GA', 'e0510ec5c2b0cdc4e6597d6fd8e793d0', 'Aplikasi Pencatatan', 'Inv App');

-- ----------------------------
-- Table structure for master_jenis_keluar
-- ----------------------------
DROP TABLE IF EXISTS `master_jenis_keluar`;
CREATE TABLE `master_jenis_keluar`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_keluar` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of master_jenis_keluar
-- ----------------------------
INSERT INTO `master_jenis_keluar` VALUES (1, 'Produksi');
INSERT INTO `master_jenis_keluar` VALUES (2, 'Subcon');
INSERT INTO `master_jenis_keluar` VALUES (3, 'Retur');
INSERT INTO `master_jenis_keluar` VALUES (4, 'Lainnya');

-- ----------------------------
-- Table structure for master_kategori
-- ----------------------------
DROP TABLE IF EXISTS `master_kategori`;
CREATE TABLE `master_kategori`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode_jenis` varchar(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kode_kategori` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_kategori` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keterangan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `aktif` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'Y',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of master_kategori
-- ----------------------------
INSERT INTO `master_kategori` VALUES (1, '01', '01001', 'Bahan Baku', 'Material', 'Y');
INSERT INTO `master_kategori` VALUES (2, '01', '01002', 'Bahan Penolong', 'Material', 'Y');
INSERT INTO `master_kategori` VALUES (3, '01', '01003', 'Sparepart', 'Material', 'Y');
INSERT INTO `master_kategori` VALUES (4, '01', '01004', 'Bahan Lain-lain', 'Material', 'Y');
INSERT INTO `master_kategori` VALUES (5, '01', '01005', NULL, 'Material', NULL);
INSERT INTO `master_kategori` VALUES (6, '02', '02001', '---', 'FG', NULL);
INSERT INTO `master_kategori` VALUES (7, '02', '02002', '----', 'FG', NULL);
INSERT INTO `master_kategori` VALUES (8, '02', '02003', '-----', 'FG', NULL);
INSERT INTO `master_kategori` VALUES (9, '02', '02004', '-------', 'FG', NULL);
INSERT INTO `master_kategori` VALUES (10, '02', '02005', '--------', 'FG', NULL);
INSERT INTO `master_kategori` VALUES (11, '03', '03001', 'Machine', 'Mesin', 'Y');
INSERT INTO `master_kategori` VALUES (12, '03', '03002', 'Equipment', 'Mesin', 'Y');
INSERT INTO `master_kategori` VALUES (13, '03', '03003', 'Tools', 'Mesin', 'Y');
INSERT INTO `master_kategori` VALUES (14, '03', '03004', 'Office', 'Mesin', 'Y');
INSERT INTO `master_kategori` VALUES (15, '03', '03005', 'Other', 'Mesin', 'Y');
INSERT INTO `master_kategori` VALUES (16, '04', '04001', 'Sisa Produksi', 'Scrap', 'Y');
INSERT INTO `master_kategori` VALUES (17, '04', '04002', 'Sisa Pengemas', 'Scrap', 'Y');
INSERT INTO `master_kategori` VALUES (18, '04', '04003', 'Mesin/Peralatan', 'Scrap', 'Y');
INSERT INTO `master_kategori` VALUES (19, '04', '04004', 'Limbah Cair', 'Scrap', 'Y');
INSERT INTO `master_kategori` VALUES (20, '04', '04005', 'Lainnya', 'Scrap', 'Y');
INSERT INTO `master_kategori` VALUES (21, '05', '05001', 'Tanah', NULL, 'Y');
INSERT INTO `master_kategori` VALUES (22, '05', '05002', 'Gedung', NULL, 'Y');
INSERT INTO `master_kategori` VALUES (23, '05', '05003', 'Kendaraan', NULL, 'Y');

-- ----------------------------
-- Table structure for master_kpbc
-- ----------------------------
DROP TABLE IF EXISTS `master_kpbc`;
CREATE TABLE `master_kpbc`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `kpbc_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kpbc_name` varchar(75) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `address_1` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `address_2` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `city` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `user_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx`(`kpbc_id`) USING BTREE,
  INDEX `namax`(`kpbc_name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 143 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of master_kpbc
-- ----------------------------
INSERT INTO `master_kpbc` VALUES (13, '010000', 'KANWIL SUMUT', 'KANWIL DJBC SUMATERA UTARA', '', '', '');
INSERT INTO `master_kpbc` VALUES (14, '010700', 'BELAWAN', 'KANTOR PELAYANAN BEA CUKAI BELAWAN', '', '', '');
INSERT INTO `master_kpbc` VALUES (15, '010800', 'MEDAN', 'KANTOR PELAYANAN BEA CUKAI MEDAN', '', '', '');
INSERT INTO `master_kpbc` VALUES (16, '010900', 'PANGKALAN SUSU', 'KANTOR PELAYANAN BEA CUKAI PANGKALAN SUSU', '', '', '');
INSERT INTO `master_kpbc` VALUES (17, '011000', 'PEMATANG SIANTAR', 'KANTOR PELAYANAN BEA CUKAI PEMATANG SIANTAR', '', '', '');
INSERT INTO `master_kpbc` VALUES (18, '011100', 'TELUK NIBUNG', 'KANTOR PELAYANAN BEA CUKAI TELUK NIBUNG', '', '', '');
INSERT INTO `master_kpbc` VALUES (19, '011200', 'KUALA TANJUNG', 'KANTOR PELAYANAN BEA CUKAI KUALA TANJUNG', '', '', '');
INSERT INTO `master_kpbc` VALUES (20, '011300', 'SIBOLGA', 'KANTOR PELAYANAN BEA CUKAI SIBOLGA', '', '', '');
INSERT INTO `master_kpbc` VALUES (21, '011500', 'TELUK BAYUR', 'KANTOR PELAYANAN BEA CUKAI TELUK BAYUR', '', '', '');
INSERT INTO `master_kpbc` VALUES (22, '020000', 'KANWIL KEPRI', 'KANWIL DJBC KEPULAUAN RIAU', '', '', '');
INSERT INTO `master_kpbc` VALUES (23, '020100', 'TANJUNG BALAI KARIMUN', 'KANTOR PELAYANAN BEA CUKAI TANJUNG BALAI KARIMUN', '', '', '');
INSERT INTO `master_kpbc` VALUES (24, '020200', 'SAMBU BELAKANG PADANG', 'KANTOR PELAYANAN BEA CUKAI SAMBU BELAKANG PADANG', '', '', '');
INSERT INTO `master_kpbc` VALUES (25, '020300', 'SELAT PANJANG', 'KANTOR PELAYANAN BEA CUKAI SELAT PANJANG', '', '', '');
INSERT INTO `master_kpbc` VALUES (26, '020400', 'KPU BATAM', 'KPU BATAM', '', '', '');
INSERT INTO `master_kpbc` VALUES (27, '020500', 'TANJUNG PINANG', 'KANTOR PELAYANAN BEA CUKAI TANJUNG PINANG', '', '', '');
INSERT INTO `master_kpbc` VALUES (28, '020600', 'TANJUNG UBAN', 'KANTOR PELAYANAN BEA CUKAI TANJUNG UBAN', '', '', '');
INSERT INTO `master_kpbc` VALUES (29, '020800', 'DABO SINGKEP', 'KANTOR PELAYANAN BEA CUKAI DABO SINGKEP', '', '', '');
INSERT INTO `master_kpbc` VALUES (30, '020900', 'DUMAI', 'KANTOR PELAYANAN BEA CUKAI DUMAI', '', '', '');
INSERT INTO `master_kpbc` VALUES (31, '021000', 'BAGAN SIAPI-API', 'KANTOR PELAYANAN BEA CUKAI BAGAN SIAPI-API', '', '', '');
INSERT INTO `master_kpbc` VALUES (32, '021100', 'BENGKALIS', 'KANTOR PELAYANAN BEA CUKAI BENGKALIS', '', '', '');
INSERT INTO `master_kpbc` VALUES (33, '021200', 'PEKANBARU', 'KANTOR PELAYANAN BEA CUKAI PEKANBARU', '', '', '');
INSERT INTO `master_kpbc` VALUES (34, '021300', 'SIAK SRI INDRAPURA', 'KANTOR PELAYANAN BEA CUKAI SIAK SRI INDRAPURA', '', '', '');
INSERT INTO `master_kpbc` VALUES (35, '021500', 'KUALA ENOK', 'KANTOR PELAYANAN BEA CUKAI KUALA ENOK', '', '', '');
INSERT INTO `master_kpbc` VALUES (36, '021700', 'RANAI', 'KANTOR PELAYANAN BEA CUKAI RANAI', '', '', '');
INSERT INTO `master_kpbc` VALUES (37, '030000', 'KANWIL SUMBAGSEL', 'KANWIL DJBC SUMATERA BAGIAN SELATAN', '', '', '');
INSERT INTO `master_kpbc` VALUES (38, '030100', 'PALEMBANG', 'KANTOR PELAYANAN BEA CUKAI PALEMBANG', '', '', '');
INSERT INTO `master_kpbc` VALUES (39, '030200', 'BENGKULU', 'KANTOR PELAYANAN BEA CUKAI BENGKULU', '', '', '');
INSERT INTO `master_kpbc` VALUES (40, '030300', 'PANGKAL PINANG', 'KANTOR PELAYANAN BEA CUKAI PANGKAL PINANG', '', '', '');
INSERT INTO `master_kpbc` VALUES (41, '030500', 'TANJUNG PANDAN', 'KANTOR PELAYANAN BEA CUKAI TANJUNG PANDAN', '', '', '');
INSERT INTO `master_kpbc` VALUES (42, '030600', 'JAMBI', 'KANTOR PELAYANAN BEA CUKAI JAMBI', '', '', '');
INSERT INTO `master_kpbc` VALUES (43, '030700', 'BANDAR LAMPUNG', 'KANTOR PELAYANAN BEA CUKAI BANDAR LAMPUNG', '', '', '');
INSERT INTO `master_kpbc` VALUES (44, '040000', 'KANWIL JAKARTA', 'KANWIL DJBC JAKARTA', '', '', '');
INSERT INTO `master_kpbc` VALUES (45, '040100', 'TANJUNG PRIOK I', 'KANTOR PELAYANAN BEA CUKAI TANJUNG PRIOK I', '', '', '');
INSERT INTO `master_kpbc` VALUES (46, '040200', 'TANJUNG PRIOK II', 'KANTOR PELAYANAN BEA CUKAI TANJUNG PRIOK II', '', '', '');
INSERT INTO `master_kpbc` VALUES (47, '040300', 'KPU TANJUNG PRIOK', 'KPU TANJUNG PRIOK', '', '', '');
INSERT INTO `master_kpbc` VALUES (48, '040400', 'JAKARTA', 'KANTOR PELAYANAN BEA CUKAI JAKARTA', '', '', '');
INSERT INTO `master_kpbc` VALUES (49, '040600', 'KANTOR POS PASAR BARU', 'KANTOR PELAYANAN BEA CUKAI KANTOR POS PASAR BARU', '', '', '');
INSERT INTO `master_kpbc` VALUES (50, '050000', 'KANWIL JABAR', 'KANWIL DJBC JAWA BARAT', '', '', '');
INSERT INTO `master_kpbc` VALUES (51, '050100', 'SUKARNO-HATTA', 'KANTOR PELAYANAN BEA CUKAI SUKARNO-HATTA', '', '', '');
INSERT INTO `master_kpbc` VALUES (52, '050300', 'BOGOR', 'KANTOR PELAYANAN BEA CUKAI BOGOR', '', '', '');
INSERT INTO `master_kpbc` VALUES (53, '050400', 'MERAK', 'KANTOR PELAYANAN BEA CUKAI MERAK', '', '', '');
INSERT INTO `master_kpbc` VALUES (54, '050500', 'BANDUNG', 'KANTOR PELAYANAN BEA CUKAI BANDUNG', '', '', '');
INSERT INTO `master_kpbc` VALUES (55, '050600', 'TASIKMALAYA', 'KANTOR PELAYANAN BEA CUKAI TASIKMALAYA', '', '', '');
INSERT INTO `master_kpbc` VALUES (56, '050700', 'CIREBON', 'KANTOR PELAYANAN BEA CUKAI CIREBON', '', '', '');
INSERT INTO `master_kpbc` VALUES (57, '050800', 'PURWAKARTA', 'KANTOR PELAYANAN BEA CUKAI PURWAKARTA', '', '', '');
INSERT INTO `master_kpbc` VALUES (58, '050900', 'BEKASI', 'KANTOR PELAYANAN BEA CUKAI BEKASI', '', '', '');
INSERT INTO `master_kpbc` VALUES (59, '060000', 'KANWIL JATENG', 'KANWIL DJBC JAWA TENGAH DAN DIY', '', '', '');
INSERT INTO `master_kpbc` VALUES (60, '060100', 'TANJUNG EMAS', 'KANTOR PELAYANAN BEA CUKAI TANJUNG EMAS', '', '', '');
INSERT INTO `master_kpbc` VALUES (61, '060200', 'PEKALONGAN', 'KANTOR PELAYANAN BEA CUKAI PEKALONGAN', '', '', '');
INSERT INTO `master_kpbc` VALUES (62, '060300', 'KUDUS', 'KANTOR PELAYANAN BEA CUKAI KUDUS', '', '', '');
INSERT INTO `master_kpbc` VALUES (63, '060400', 'CILACAP', 'KANTOR PELAYANAN BEA CUKAI CILACAP', '', '', '');
INSERT INTO `master_kpbc` VALUES (64, '060600', 'SURAKARTA', 'KANTOR PELAYANAN BEA CUKAI SURAKARTA', '', '', '');
INSERT INTO `master_kpbc` VALUES (65, '060700', 'YOGYAKARTA', 'KANTOR PELAYANAN BEA CUKAI YOGYAKARTA', '', '', '');
INSERT INTO `master_kpbc` VALUES (66, '061000', 'TEGAL', 'KANTOR PELAYANAN BEA CUKAI TEGAL', '', '', '');
INSERT INTO `master_kpbc` VALUES (67, '070000', 'KANWIL JATIM I', 'KANWIL DJBC JAWA TIMUR I', '', '', '');
INSERT INTO `master_kpbc` VALUES (68, '070100', 'TANJUNG PERAK', 'KANTOR PELAYANAN BEA CUKAI TANJUNG PERAK', '', '', '');
INSERT INTO `master_kpbc` VALUES (69, '070200', 'KALIANGET', 'KANTOR PELAYANAN BEA CUKAI KALIANGET', '', '', '');
INSERT INTO `master_kpbc` VALUES (70, '070300', 'GRESIK', 'KANTOR PELAYANAN BEA CUKAI GRESIK', '', '', '');
INSERT INTO `master_kpbc` VALUES (71, '070400', 'BOJONEGORO', 'KANTOR PELAYANAN BEA CUKAI BOJONEGORO', '', '', '');
INSERT INTO `master_kpbc` VALUES (72, '070500', 'JUANDA', 'KANTOR PELAYANAN BEA CUKAI JUANDA', '', '', '');
INSERT INTO `master_kpbc` VALUES (73, '070600', 'MALANG', 'KANTOR PELAYANAN BEA CUKAI MALANG', '', '', '');
INSERT INTO `master_kpbc` VALUES (74, '070700', 'BLITAR', 'KANTOR PELAYANAN BEA CUKAI BLITAR', '', '', '');
INSERT INTO `master_kpbc` VALUES (75, '070800', 'KEDIRI', 'KANTOR PELAYANAN BEA CUKAI KEDIRI', '', '', '');
INSERT INTO `master_kpbc` VALUES (76, '070900', 'TULUNGAGUNG', 'KANTOR PELAYANAN BEA CUKAI TULUNGAGUNG', '', '', '');
INSERT INTO `master_kpbc` VALUES (77, '071000', 'MADIUN', 'KANTOR PELAYANAN BEA CUKAI MADIUN', '', '', '');
INSERT INTO `master_kpbc` VALUES (78, '071100', 'PANARUKAN', 'KANTOR PELAYANAN BEA CUKAI PANARUKAN', '', '', '');
INSERT INTO `master_kpbc` VALUES (79, '071200', 'PROBOLINGGO', 'KANTOR PELAYANAN BEA CUKAI PROBOLINGGO', '', '', '');
INSERT INTO `master_kpbc` VALUES (80, '071300', 'PASURUAN', 'KANTOR PELAYANAN BEA CUKAI PASURUAN', '', '', '');
INSERT INTO `master_kpbc` VALUES (81, '080000', 'KANWIL BALI', 'KANWIL DJBC BALI, NTB DAN BTT', '', '', '');
INSERT INTO `master_kpbc` VALUES (82, '080100', 'NGURAH RAI', 'KANTOR PELAYANAN BEA CUKAI NGURAH RAI', '', '', '');
INSERT INTO `master_kpbc` VALUES (83, '080300', 'MATARAM', 'KANTOR PELAYANAN BEA CUKAI MATARAM', '', '', '');
INSERT INTO `master_kpbc` VALUES (84, '080400', 'BIMA', 'KANTOR PELAYANAN BEA CUKAI BIMA', '', '', '');
INSERT INTO `master_kpbc` VALUES (85, '080500', 'KUPANG', 'KANTOR PELAYANAN BEA CUKAI KUPANG', '', '', '');
INSERT INTO `master_kpbc` VALUES (86, '080700', 'MAUMERE', 'KANTOR PELAYANAN BEA CUKAI MAUMERE', '', '', '');
INSERT INTO `master_kpbc` VALUES (87, '081200', 'BENOA', 'KANTOR PELAYANAN BEA CUKAI BENOA', '', '', '');
INSERT INTO `master_kpbc` VALUES (88, '081300', 'ATAPUPU', 'KANTOR PELAYANAN BEA CUKAI ATAPUPU', '', '', '');
INSERT INTO `master_kpbc` VALUES (89, '090000', 'KANWIL KALBAGBAR', 'KANWIL DJBC KALIMANTAN BAGIAN BARAT', '', '', '');
INSERT INTO `master_kpbc` VALUES (90, '090100', 'PONTIANAK', 'KANTOR PELAYANAN BEA CUKAI PONTIANAK', '', '', '');
INSERT INTO `master_kpbc` VALUES (91, '090200', 'ENTIKONG', 'KANTOR PELAYANAN BEA CUKAI ENTIKONG', '', '', '');
INSERT INTO `master_kpbc` VALUES (92, '090300', 'TELUK AIR', 'KANTOR PELAYANAN BEA CUKAI TELUK AIR', '', '', '');
INSERT INTO `master_kpbc` VALUES (93, '090400', 'KETAPANG', 'KANTOR PELAYANAN BEA CUKAI KETAPANG', '', '', '');
INSERT INTO `master_kpbc` VALUES (94, '090500', 'SINTETE', 'KANTOR PELAYANAN BEA CUKAI SINTETE', '', '', '');
INSERT INTO `master_kpbc` VALUES (95, '090700', 'SAMPIT', 'KANTOR PELAYANAN BEA CUKAI SAMPIT', '', '', '');
INSERT INTO `master_kpbc` VALUES (96, '090800', 'PANGKALAN BUN', 'KANTOR PELAYANAN BEA CUKAI PANGKALAN BUN', '', '', '');
INSERT INTO `master_kpbc` VALUES (97, '090900', 'PULANG PISAU', 'KANTOR PELAYANAN BEA CUKAI PULANG PISAU', '', '', '');
INSERT INTO `master_kpbc` VALUES (98, '100000', 'KANWIL KALBAGTIM', 'KANWIL DJBC KALIMANTAN BAGIAN TIMUR', '', '', '');
INSERT INTO `master_kpbc` VALUES (99, '100100', 'BANJARMASIN', 'KANTOR PELAYANAN BEA CUKAI BANJARMASIN', '', '', '');
INSERT INTO `master_kpbc` VALUES (100, '100200', 'KOTABARU', 'KANTOR PELAYANAN BEA CUKAI KOTABARU', '', '', '');
INSERT INTO `master_kpbc` VALUES (101, '100300', 'BALIKPAPAN', 'KANTOR PELAYANAN BEA CUKAI BALIKPAPAN', '', '', '');
INSERT INTO `master_kpbc` VALUES (102, '100500', 'SAMARINDA', 'KANTOR PELAYANAN BEA CUKAI SAMARINDA', '', '', '');
INSERT INTO `master_kpbc` VALUES (103, '100600', 'BONTANG', 'KANTOR PELAYANAN BEA CUKAI BONTANG', '', '', '');
INSERT INTO `master_kpbc` VALUES (104, '100800', 'TARAKAN', 'KANTOR PELAYANAN BEA CUKAI TARAKAN', '', '', '');
INSERT INTO `master_kpbc` VALUES (105, '100900', 'NUNUKAN', 'KANTOR PELAYANAN BEA CUKAI NUNUKAN', '', '', '');
INSERT INTO `master_kpbc` VALUES (106, '101000', 'TANJUNG BARA /SANGATA', 'KANTOR PELAYANAN BEA CUKAI TANJUNG BARA /SANGATA', '', '', '');
INSERT INTO `master_kpbc` VALUES (107, '110000', 'KANWIL SULAWESI', 'KANWIL DJBC SULAWESI', '', '', '');
INSERT INTO `master_kpbc` VALUES (108, '110100', 'MAKASAR', 'KANTOR PELAYANAN BEA CUKAI MAKASAR', '', '', '');
INSERT INTO `master_kpbc` VALUES (109, '110300', 'PARE-PARE', 'KANTOR PELAYANAN BEA CUKAI PARE-PARE', '', '', '');
INSERT INTO `master_kpbc` VALUES (110, '110400', 'MALILI', 'KANTOR PELAYANAN BEA CUKAI MALILI', '', '', '');
INSERT INTO `master_kpbc` VALUES (111, '110500', 'BAJO\'E', 'KANTOR PELAYANAN BEA CUKAI BAJO\'E', '', '', '');
INSERT INTO `master_kpbc` VALUES (112, '110600', 'KENDARI', 'KANTOR PELAYANAN BEA CUKAI KENDARI', '', '', '');
INSERT INTO `master_kpbc` VALUES (113, '110700', 'POMALAA', 'KANTOR PELAYANAN BEA CUKAI POMALAA', '', '', '');
INSERT INTO `master_kpbc` VALUES (114, '110800', 'PANTOLOAN', 'KANTOR PELAYANAN BEA CUKAI PANTOLOAN', '', '', '');
INSERT INTO `master_kpbc` VALUES (115, '110900', 'POSO', 'KANTOR PELAYANAN BEA CUKAI POSO', '', '', '');
INSERT INTO `master_kpbc` VALUES (116, '111000', 'LUWUK', 'KANTOR PELAYANAN BEA CUKAI LUWUK', '', '', '');
INSERT INTO `master_kpbc` VALUES (117, '111100', 'BITUNG', 'KANTOR PELAYANAN BEA CUKAI BITUNG', '', '', '');
INSERT INTO `master_kpbc` VALUES (118, '111200', 'MANADO', 'KANTOR PELAYANAN BEA CUKAI MANADO', '', '', '');
INSERT INTO `master_kpbc` VALUES (119, '111300', 'GORONTALO', 'KANTOR PELAYANAN BEA CUKAI GORONTALO', '', '', '');
INSERT INTO `master_kpbc` VALUES (120, '120000', 'KANWIL MALUKU', 'KANWIL DJBC MALUKU, PAPUA DAN IRIAN JAYA BARAT', '', '', '');
INSERT INTO `master_kpbc` VALUES (121, '120100', 'AMBON', 'KANTOR PELAYANAN BEA CUKAI AMBON', '', '', '');
INSERT INTO `master_kpbc` VALUES (122, '120200', 'TERNATE', 'KANTOR PELAYANAN BEA CUKAI TERNATE', '', '', '');
INSERT INTO `master_kpbc` VALUES (123, '120300', 'SORONG', 'KANTOR PELAYANAN BEA CUKAI SORONG', '', '', '');
INSERT INTO `master_kpbc` VALUES (124, '120400', 'MANOKWARI', 'KANTOR PELAYANAN BEA CUKAI MANOKWARI', '', '', '');
INSERT INTO `master_kpbc` VALUES (125, '120500', 'FAK-FAK', 'KANTOR PELAYANAN BEA CUKAI FAK-FAK', '', '', '');
INSERT INTO `master_kpbc` VALUES (126, '120600', 'JAYAPURA', 'KANTOR PELAYANAN BEA CUKAI JAYAPURA', '', '', '');
INSERT INTO `master_kpbc` VALUES (127, '120700', 'MERAUKE', 'KANTOR PELAYANAN BEA CUKAI MERAUKE', '', '', '');
INSERT INTO `master_kpbc` VALUES (128, '120800', 'AMAMAPARE', 'KANTOR PELAYANAN BEA CUKAI AMAMAPARE', '', '', '');
INSERT INTO `master_kpbc` VALUES (129, '120900', 'BIAK', 'KANTOR PELAYANAN BEA CUKAI BIAK', '', '', '');
INSERT INTO `master_kpbc` VALUES (130, '121000', 'TUAL', 'KANTOR PELAYANAN BEA CUKAI TUAL', '', '', '');
INSERT INTO `master_kpbc` VALUES (131, '130000', 'KANWIL ACEH', 'KANWIL DJBC NANGGROE ACEH DARUSSALAM', '', '', '');
INSERT INTO `master_kpbc` VALUES (132, '130100', 'ULEELHEUE', 'KANTOR PELAYANAN BEA CUKAI ULEELHEUE', '', '', '');
INSERT INTO `master_kpbc` VALUES (133, '130200', 'ISKANDAR MUDA', 'KANTOR PELAYANAN BEA CUKAI ISKANDAR MUDA', '', '', '');
INSERT INTO `master_kpbc` VALUES (134, '130300', 'SABANG', 'KANTOR PELAYANAN BEA CUKAI SABANG', '', '', '');
INSERT INTO `master_kpbc` VALUES (135, '130400', 'MEULABOH', 'KANTOR PELAYANAN BEA CUKAI MEULABOH', '', '', '');
INSERT INTO `master_kpbc` VALUES (136, '130500', 'LHOK SEUMAWE', 'KANTOR PELAYANAN BEA CUKAI LHOK SEUMAWE', '', '', '');
INSERT INTO `master_kpbc` VALUES (137, '130600', 'KUALA LANGSA', 'KANTOR PELAYANAN BEA CUKAI KUALA LANGSA', '', '', '');
INSERT INTO `master_kpbc` VALUES (138, '140000', 'KANWIL RIAU', 'KANWIL DJBC RIAU DAN SUMATERA BARAT', '', '', '');
INSERT INTO `master_kpbc` VALUES (139, '150000', 'KANWIL BANTEN', 'KANWIL DJBC BANTEN', '', '', '');
INSERT INTO `master_kpbc` VALUES (140, '150300', 'TANGERANG', 'KANTOR PELAYANAN BEA CUKAI TANGERANG', '', '', '');
INSERT INTO `master_kpbc` VALUES (141, '160000', 'KANWIL JATIM II', 'KANWIL DJBC JAWA TIMUR II', '', '', '');
INSERT INTO `master_kpbc` VALUES (142, '160200', 'SUNDA KELAPA', 'KANTOR PELAYANAN BEA CUKAI SUNDA KELAPA', '', '', '');

-- ----------------------------
-- Table structure for master_material
-- ----------------------------
DROP TABLE IF EXISTS `master_material`;
CREATE TABLE `master_material`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode_barang` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_barang` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kode_kategori` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `spesifikasi_barang` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `hs_barang` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `satuan_besar` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `satuan_kecil` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `content` decimal(20, 2) DEFAULT 0.00,
  `harga_satuan_besar` decimal(20, 4) DEFAULT 0.0000,
  `harga_satuan_kecil` decimal(20, 6) DEFAULT 0.000000,
  `currency` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `negara_asal` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `asal_fasilitas` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `aktif` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'Y',
  `created_at` datetime(0) DEFAULT NULL,
  `created_from` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `kode`(`kode_barang`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of master_material
-- ----------------------------
INSERT INTO `master_material` VALUES (7, 'MK0001', 'Pipa PPC 21 Inchi', '01001', 'Diameter 16x24', '-', 'Kg', 'Gram', 1000.00, 12.7800, 0.012780, 'IDR', NULL, '01', 'Y', '2019-08-07 18:53:18', '127.0.0.1', 'admin');
INSERT INTO `master_material` VALUES (8, 'MK0002', 'Pipa Besi', '01001', 'Diameter 5\"', '-', 'Batang', 'Pcs', 5.00, 24.7900, 4.958000, 'USD', NULL, '01', 'Y', '2019-08-07 18:56:55', '127.0.0.1', 'admin');
INSERT INTO `master_material` VALUES (9, 'BP0001', 'Sarung Tangan Katun', '01002', 'Miera 12 AP', '-', 'Pack', 'Pcs', 12.00, 6000.0000, 500.000000, 'IDR', NULL, '02', 'Y', '2019-08-07 19:38:58', '127.0.0.1', 'admin');
INSERT INTO `master_material` VALUES (10, 'BP0002', 'Isolasi Hitam', '01002', 'Merk Daiwa', '-', 'Pcs', 'Pcs', 1.00, 1200.0000, 1200.000000, 'IDR', NULL, '02', 'Y', '2019-08-07 19:40:25', '127.0.0.1', 'admin');
INSERT INTO `master_material` VALUES (11, '345', 'fdsf', '01002', NULL, 'df', 'Ea', 'Gram', 456.00, 123.0000, 134.000000, 'USD', NULL, NULL, 'Y', NULL, NULL, NULL);
INSERT INTO `master_material` VALUES (12, '34', 'fsd', '01004', 'fdsfsdf', '45', 'Ea', 'Kg', 12.00, 321.0000, 32.000000, 'IDR', NULL, NULL, 'Y', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for master_menu_utama
-- ----------------------------
DROP TABLE IF EXISTS `master_menu_utama`;
CREATE TABLE `master_menu_utama`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order` int(11) DEFAULT NULL,
  `label` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tampil` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'Y',
  `icon` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of master_menu_utama
-- ----------------------------
INSERT INTO `master_menu_utama` VALUES (1, 1, 'Home', NULL, NULL);
INSERT INTO `master_menu_utama` VALUES (2, 2, 'Preferensi', 'Y', 'fa-database');
INSERT INTO `master_menu_utama` VALUES (3, 3, 'Buku Besar', 'Y', 'fa-user');
INSERT INTO `master_menu_utama` VALUES (4, 4, 'Kas & Bank', 'Y', 'fa-hdd-o');
INSERT INTO `master_menu_utama` VALUES (5, 5, 'Pembelian', 'Y', 'fa-home');
INSERT INTO `master_menu_utama` VALUES (6, 6, 'Warehouse', 'Y', 'fa-glass');
INSERT INTO `master_menu_utama` VALUES (7, 7, 'Produksi', 'Y', 'fa-home');
INSERT INTO `master_menu_utama` VALUES (8, 8, 'Penjualan', 'Y', 'fa-laptop');
INSERT INTO `master_menu_utama` VALUES (9, 9, 'Laporan', 'Y', 'fa-briefcase ');
INSERT INTO `master_menu_utama` VALUES (10, 10, 'Utility', 'Y', 'fa-cog');
INSERT INTO `master_menu_utama` VALUES (11, 11, NULL, 'Y', 'fa-hdd-o');
INSERT INTO `master_menu_utama` VALUES (12, 12, '--', NULL, NULL);
INSERT INTO `master_menu_utama` VALUES (13, 13, '--', NULL, NULL);

-- ----------------------------
-- Table structure for master_negara
-- ----------------------------
DROP TABLE IF EXISTS `master_negara`;
CREATE TABLE `master_negara`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_negara` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 217 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of master_negara
-- ----------------------------
INSERT INTO `master_negara` VALUES (1, 'ARMENIA');
INSERT INTO `master_negara` VALUES (2, 'AFGANISTAN');
INSERT INTO `master_negara` VALUES (3, 'AFRIKA SELATAN');
INSERT INTO `master_negara` VALUES (4, 'ALBANIA');
INSERT INTO `master_negara` VALUES (5, 'ALJAZAIR');
INSERT INTO `master_negara` VALUES (6, 'AMERIKA SERIKAT');
INSERT INTO `master_negara` VALUES (7, 'ANDORRA');
INSERT INTO `master_negara` VALUES (8, 'ANGOLA');
INSERT INTO `master_negara` VALUES (9, 'ANGUILLA & MONTSERRAT');
INSERT INTO `master_negara` VALUES (10, 'ANTILA BELANDA');
INSERT INTO `master_negara` VALUES (11, 'ARGENTINA');
INSERT INTO `master_negara` VALUES (12, 'ARUBA');
INSERT INTO `master_negara` VALUES (13, 'AUSTRALIA');
INSERT INTO `master_negara` VALUES (14, 'AUSTRIA');
INSERT INTO `master_negara` VALUES (15, 'AZERBAIJAN');
INSERT INTO `master_negara` VALUES (16, 'BAHAMA');
INSERT INTO `master_negara` VALUES (17, 'BAHRAIN');
INSERT INTO `master_negara` VALUES (18, 'BANGLADES');
INSERT INTO `master_negara` VALUES (19, 'BARBADOS');
INSERT INTO `master_negara` VALUES (20, 'BELANDA');
INSERT INTO `master_negara` VALUES (21, 'BELARUSIA');
INSERT INTO `master_negara` VALUES (22, 'BELGIA');
INSERT INTO `master_negara` VALUES (23, 'BELIZE');
INSERT INTO `master_negara` VALUES (24, 'BENIN');
INSERT INTO `master_negara` VALUES (25, 'BERMUDA');
INSERT INTO `master_negara` VALUES (26, 'BHUTAN');
INSERT INTO `master_negara` VALUES (27, 'BOLIVIA');
INSERT INTO `master_negara` VALUES (28, 'BOSNIA');
INSERT INTO `master_negara` VALUES (29, 'BOSNIA HERZEGOVINA');
INSERT INTO `master_negara` VALUES (30, 'BOTSWANA');
INSERT INTO `master_negara` VALUES (31, 'BRAZIL');
INSERT INTO `master_negara` VALUES (32, 'BRUNEI DAARUSALAM');
INSERT INTO `master_negara` VALUES (33, 'BULGARIA');
INSERT INTO `master_negara` VALUES (34, 'BURKINA');
INSERT INTO `master_negara` VALUES (35, 'BURUNDI');
INSERT INTO `master_negara` VALUES (36, 'CHAD');
INSERT INTO `master_negara` VALUES (37, 'CILE');
INSERT INTO `master_negara` VALUES (38, 'CINA');
INSERT INTO `master_negara` VALUES (39, 'DENMARK');
INSERT INTO `master_negara` VALUES (40, 'DJIBOUTI');
INSERT INTO `master_negara` VALUES (41, 'EKUADOR');
INSERT INTO `master_negara` VALUES (42, 'EL SAVADOR');
INSERT INTO `master_negara` VALUES (43, 'ERITREA');
INSERT INTO `master_negara` VALUES (44, 'ESTONIA');
INSERT INTO `master_negara` VALUES (45, 'ETHIOPIA');
INSERT INTO `master_negara` VALUES (46, 'FIJI');
INSERT INTO `master_negara` VALUES (47, 'FILIPINA');
INSERT INTO `master_negara` VALUES (48, 'FINLANDIA');
INSERT INTO `master_negara` VALUES (49, 'GABON');
INSERT INTO `master_negara` VALUES (50, 'GAMBIA');
INSERT INTO `master_negara` VALUES (51, 'GEORGIA');
INSERT INTO `master_negara` VALUES (52, 'GHANA');
INSERT INTO `master_negara` VALUES (53, 'GREENLAND');
INSERT INTO `master_negara` VALUES (54, 'GRENADA');
INSERT INTO `master_negara` VALUES (55, 'GUADELOUPE');
INSERT INTO `master_negara` VALUES (56, 'GUAM');
INSERT INTO `master_negara` VALUES (57, 'GUATEMALA');
INSERT INTO `master_negara` VALUES (58, 'GUINEA');
INSERT INTO `master_negara` VALUES (59, 'GUINEA BISSAU');
INSERT INTO `master_negara` VALUES (60, 'GUINEA EKUATORIAL');
INSERT INTO `master_negara` VALUES (61, 'GUYANA');
INSERT INTO `master_negara` VALUES (62, 'GUYANA PRANCIS');
INSERT INTO `master_negara` VALUES (63, 'HAITI');
INSERT INTO `master_negara` VALUES (64, 'HONDURAS');
INSERT INTO `master_negara` VALUES (65, 'HUNGARIA');
INSERT INTO `master_negara` VALUES (66, 'INDIA');
INSERT INTO `master_negara` VALUES (67, 'INDONESIA');
INSERT INTO `master_negara` VALUES (68, 'INGGRIS');
INSERT INTO `master_negara` VALUES (69, 'IRAN');
INSERT INTO `master_negara` VALUES (70, 'IRAQ');
INSERT INTO `master_negara` VALUES (71, 'IRLANDIA');
INSERT INTO `master_negara` VALUES (72, 'ISLANDIA');
INSERT INTO `master_negara` VALUES (73, 'ISRAEL');
INSERT INTO `master_negara` VALUES (74, 'ITALIA');
INSERT INTO `master_negara` VALUES (75, 'JAMAIKA');
INSERT INTO `master_negara` VALUES (76, 'JEPANG');
INSERT INTO `master_negara` VALUES (77, 'JERMAN');
INSERT INTO `master_negara` VALUES (78, 'KALEDONIA BARU');
INSERT INTO `master_negara` VALUES (79, 'KAMBOJA');
INSERT INTO `master_negara` VALUES (80, 'KAMERUN');
INSERT INTO `master_negara` VALUES (81, 'KANADA');
INSERT INTO `master_negara` VALUES (82, 'KAZAKSTAN');
INSERT INTO `master_negara` VALUES (83, 'KENYA');
INSERT INTO `master_negara` VALUES (84, 'KEP. MARIANA UTARA');
INSERT INTO `master_negara` VALUES (85, 'KEP. WALLIS & FUTUNA');
INSERT INTO `master_negara` VALUES (86, 'KEPULAUAN CAYMAN');
INSERT INTO `master_negara` VALUES (87, 'KEPULAUAN COOK');
INSERT INTO `master_negara` VALUES (88, 'KEPULAUAN FAEROE');
INSERT INTO `master_negara` VALUES (89, 'KEPULAUAN FALKLAND');
INSERT INTO `master_negara` VALUES (90, 'KEPULAUAN MARSHALL');
INSERT INTO `master_negara` VALUES (91, 'KEPULAUAN SOLOMON');
INSERT INTO `master_negara` VALUES (92, 'KEPULAUAN TURK & CAICOS');
INSERT INTO `master_negara` VALUES (93, 'KEPULAUAN VIRGINIA');
INSERT INTO `master_negara` VALUES (94, 'KIRGISTAN');
INSERT INTO `master_negara` VALUES (95, 'KIRIBATI');
INSERT INTO `master_negara` VALUES (96, 'KOLOMBIA');
INSERT INTO `master_negara` VALUES (97, 'KOMORO');
INSERT INTO `master_negara` VALUES (98, 'KONGO');
INSERT INTO `master_negara` VALUES (99, 'KOREA SELATAN');
INSERT INTO `master_negara` VALUES (100, 'KOREA UTARA');
INSERT INTO `master_negara` VALUES (101, 'KOSTA RIKA');
INSERT INTO `master_negara` VALUES (102, 'KROASIA');
INSERT INTO `master_negara` VALUES (103, 'KUBA');
INSERT INTO `master_negara` VALUES (104, 'KUWAIT');
INSERT INTO `master_negara` VALUES (105, 'LAOS');
INSERT INTO `master_negara` VALUES (106, 'LATVIA');
INSERT INTO `master_negara` VALUES (107, 'LEBANON');
INSERT INTO `master_negara` VALUES (108, 'LESOTHO');
INSERT INTO `master_negara` VALUES (109, 'LIBERIA');
INSERT INTO `master_negara` VALUES (110, 'LIBYA');
INSERT INTO `master_negara` VALUES (111, 'LIECHTENSTEIN');
INSERT INTO `master_negara` VALUES (112, 'LITHUANIA');
INSERT INTO `master_negara` VALUES (113, 'LUXEMBURG');
INSERT INTO `master_negara` VALUES (114, 'MADAGASKAR');
INSERT INTO `master_negara` VALUES (115, 'MAKAU');
INSERT INTO `master_negara` VALUES (116, 'MAKEDONIA');
INSERT INTO `master_negara` VALUES (117, 'MALADEWA');
INSERT INTO `master_negara` VALUES (118, 'MALAWI');
INSERT INTO `master_negara` VALUES (119, 'MALAYSIA');
INSERT INTO `master_negara` VALUES (120, 'MALI');
INSERT INTO `master_negara` VALUES (121, 'MALTA');
INSERT INTO `master_negara` VALUES (122, 'MAROKO');
INSERT INTO `master_negara` VALUES (123, 'MARTINIQUE');
INSERT INTO `master_negara` VALUES (124, 'MARTINIQUE');
INSERT INTO `master_negara` VALUES (125, 'MAURITANIA');
INSERT INTO `master_negara` VALUES (126, 'MAURITIUS');
INSERT INTO `master_negara` VALUES (127, 'MEKSIKO');
INSERT INTO `master_negara` VALUES (128, 'MESIR');
INSERT INTO `master_negara` VALUES (129, 'MOLDOVA');
INSERT INTO `master_negara` VALUES (130, 'MONAKO');
INSERT INTO `master_negara` VALUES (131, 'MONGOLIA');
INSERT INTO `master_negara` VALUES (132, 'MOZAMBIK');
INSERT INTO `master_negara` VALUES (133, 'MYANMAR');
INSERT INTO `master_negara` VALUES (134, 'NAMIBIA');
INSERT INTO `master_negara` VALUES (135, 'NAURU');
INSERT INTO `master_negara` VALUES (136, 'NEPAL');
INSERT INTO `master_negara` VALUES (137, 'NIGER');
INSERT INTO `master_negara` VALUES (138, 'NIGERIA');
INSERT INTO `master_negara` VALUES (139, 'NIKARAGUA');
INSERT INTO `master_negara` VALUES (140, 'NIUE');
INSERT INTO `master_negara` VALUES (141, 'NORWEGIA');
INSERT INTO `master_negara` VALUES (142, 'OMAN');
INSERT INTO `master_negara` VALUES (143, 'PAKISTAN');
INSERT INTO `master_negara` VALUES (144, 'PALAU');
INSERT INTO `master_negara` VALUES (145, 'PANAMA');
INSERT INTO `master_negara` VALUES (146, 'PANTAI GADING');
INSERT INTO `master_negara` VALUES (147, 'PAPUA NUGINI');
INSERT INTO `master_negara` VALUES (148, 'PARAGUAY');
INSERT INTO `master_negara` VALUES (149, 'PERU');
INSERT INTO `master_negara` VALUES (150, 'POLANDIA');
INSERT INTO `master_negara` VALUES (151, 'POLINESIA PRANCIS');
INSERT INTO `master_negara` VALUES (152, 'PORTUGAL');
INSERT INTO `master_negara` VALUES (153, 'PRANCIS');
INSERT INTO `master_negara` VALUES (154, 'PUERTO RIKO');
INSERT INTO `master_negara` VALUES (155, 'QATAR');
INSERT INTO `master_negara` VALUES (156, 'REP. DEMOKRATIK KONGO');
INSERT INTO `master_negara` VALUES (157, 'REPUBLIK AFRIKA TENGAH');
INSERT INTO `master_negara` VALUES (158, 'REPUBLIK CEKO');
INSERT INTO `master_negara` VALUES (159, 'REPUBLIK DOMINIKA');
INSERT INTO `master_negara` VALUES (160, 'RUMANIA');
INSERT INTO `master_negara` VALUES (161, 'RWANDA');
INSERT INTO `master_negara` VALUES (162, 'SAINT HELENA');
INSERT INTO `master_negara` VALUES (163, 'SAINT KITTS & NEVIS');
INSERT INTO `master_negara` VALUES (164, 'SAINT LUCIA');
INSERT INTO `master_negara` VALUES (165, 'SAMOA');
INSERT INTO `master_negara` VALUES (166, 'SAMOA AMERIKA');
INSERT INTO `master_negara` VALUES (167, 'SAN MARINO');
INSERT INTO `master_negara` VALUES (168, 'SAO TOME & PRINCIPE');
INSERT INTO `master_negara` VALUES (169, 'SAUDI ARABIA');
INSERT INTO `master_negara` VALUES (170, 'SELANDIA BARU');
INSERT INTO `master_negara` VALUES (171, 'SENEGAL');
INSERT INTO `master_negara` VALUES (172, 'SERBIA MONTENEGRO');
INSERT INTO `master_negara` VALUES (173, 'SEYCHELLES');
INSERT INTO `master_negara` VALUES (174, 'SIERRA LEONE');
INSERT INTO `master_negara` VALUES (175, 'SINGAPURA');
INSERT INTO `master_negara` VALUES (176, 'SIPRUS');
INSERT INTO `master_negara` VALUES (177, 'SLOVENIA');
INSERT INTO `master_negara` VALUES (178, 'SLOWAKIA');
INSERT INTO `master_negara` VALUES (179, 'SOMALIA');
INSERT INTO `master_negara` VALUES (180, 'SPANYOL');
INSERT INTO `master_negara` VALUES (181, 'SRI LANKA');
INSERT INTO `master_negara` VALUES (182, 'ST. VINCENT & GRENADIN');
INSERT INTO `master_negara` VALUES (183, 'SUDAN');
INSERT INTO `master_negara` VALUES (184, 'SURIAH');
INSERT INTO `master_negara` VALUES (185, 'SURINAME');
INSERT INTO `master_negara` VALUES (186, 'SWAZILAND');
INSERT INTO `master_negara` VALUES (187, 'SWEDIA');
INSERT INTO `master_negara` VALUES (188, 'SWISS');
INSERT INTO `master_negara` VALUES (189, 'TAIWAN');
INSERT INTO `master_negara` VALUES (190, 'TAJIKISTAN');
INSERT INTO `master_negara` VALUES (191, 'TANJUNG VERDE');
INSERT INTO `master_negara` VALUES (192, 'TANZANIA');
INSERT INTO `master_negara` VALUES (193, 'THAILAND');
INSERT INTO `master_negara` VALUES (194, 'TIMOR LESTE');
INSERT INTO `master_negara` VALUES (195, 'TOGO');
INSERT INTO `master_negara` VALUES (196, 'TONGA');
INSERT INTO `master_negara` VALUES (197, 'TRINIDAD & TOBAGO');
INSERT INTO `master_negara` VALUES (198, 'TUNISIA');
INSERT INTO `master_negara` VALUES (199, 'TURKI');
INSERT INTO `master_negara` VALUES (200, 'TURKMENISTAN');
INSERT INTO `master_negara` VALUES (201, 'TUVALU');
INSERT INTO `master_negara` VALUES (202, 'UGANDA');
INSERT INTO `master_negara` VALUES (203, 'UKRAINA');
INSERT INTO `master_negara` VALUES (204, 'UNI EMIRAT ARAB');
INSERT INTO `master_negara` VALUES (205, 'URUGUAY');
INSERT INTO `master_negara` VALUES (206, 'UZBEKISTAN');
INSERT INTO `master_negara` VALUES (207, 'VANUATU');
INSERT INTO `master_negara` VALUES (208, 'VATIKAN');
INSERT INTO `master_negara` VALUES (209, 'VENEZUELA');
INSERT INTO `master_negara` VALUES (210, 'VIETNAM');
INSERT INTO `master_negara` VALUES (211, 'YAMAN');
INSERT INTO `master_negara` VALUES (212, 'YORDANIA');
INSERT INTO `master_negara` VALUES (213, 'YUNANI');
INSERT INTO `master_negara` VALUES (214, 'ZAMBIA');
INSERT INTO `master_negara` VALUES (215, 'ZIMBABWE');
INSERT INTO `master_negara` VALUES (216, 'HONG KONG');

-- ----------------------------
-- Table structure for master_satuan
-- ----------------------------
DROP TABLE IF EXISTS `master_satuan`;
CREATE TABLE `master_satuan`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `kode_satuan` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `nama_satuan` varchar(24) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `kode_satuan`(`kode_satuan`) USING BTREE,
  INDEX `nama_satuan`(`nama_satuan`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 110 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of master_satuan
-- ----------------------------
INSERT INTO `master_satuan` VALUES (103, 'UN01', 'Kg');
INSERT INTO `master_satuan` VALUES (104, 'UN02', 'Gram');
INSERT INTO `master_satuan` VALUES (105, 'UN03', 'Pcs');
INSERT INTO `master_satuan` VALUES (106, 'UN04', 'Unit');
INSERT INTO `master_satuan` VALUES (107, 'UN05', 'Ea');
INSERT INTO `master_satuan` VALUES (108, 'UN06', 'Batang');
INSERT INTO `master_satuan` VALUES (109, 'UN07', 'Pack');

-- ----------------------------
-- Table structure for master_scrap
-- ----------------------------
DROP TABLE IF EXISTS `master_scrap`;
CREATE TABLE `master_scrap`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode_barang` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_barang` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kode_kategori` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `spesifikasi_barang` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `hs_barang` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `satuan` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `harga_barang` decimal(20, 4) DEFAULT 0.0000,
  `currency` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `aktif` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'Y',
  `created_at` datetime(0) DEFAULT NULL,
  `created_from` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `kode`(`kode_barang`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of master_scrap
-- ----------------------------
INSERT INTO `master_scrap` VALUES (4, 'SC001', 'Gram Besi', '04001', '-', '-', 'Kg', 400.0000, 'IDR', 'Y', '2019-03-27 13:36:24', '127.0.0.1', 'admin');
INSERT INTO `master_scrap` VALUES (5, 'SC002', 'Sampah Plastik', '04002', '-', '-', 'Kg', 200.0000, 'IDR', 'Y', '2019-03-27 13:42:07', '127.0.0.1', 'admin');

-- ----------------------------
-- Table structure for master_setting
-- ----------------------------
DROP TABLE IF EXISTS `master_setting`;
CREATE TABLE `master_setting`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tinggi_div_data` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `posisi_menu` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of master_setting
-- ----------------------------
INSERT INTO `master_setting` VALUES (1, '450px', 'top');

-- ----------------------------
-- Table structure for master_smtp
-- ----------------------------
DROP TABLE IF EXISTS `master_smtp`;
CREATE TABLE `master_smtp`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `smtp_host` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `smtp_port` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `smtp_user` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `smtp_pass` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sender_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `update_at` datetime(0) DEFAULT NULL,
  `update_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `update_from` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of master_smtp
-- ----------------------------
INSERT INTO `master_smtp` VALUES (1, 'ssl://mail.jas-aero.com', '465', 'qis-admin@jas-aero.com', 'JasAero7777777', 'Quality Information System (QIS) - ADMINISTRATOR', '2018-09-25 09:59:06', 'lomri', '192.155.10.1');

-- ----------------------------
-- Table structure for master_sub_menu
-- ----------------------------
DROP TABLE IF EXISTS `master_sub_menu`;
CREATE TABLE `master_sub_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order` int(11) DEFAULT NULL,
  `menu_utama_id` int(11) DEFAULT NULL,
  `label_sub_menu` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `link` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `icon` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `parameter` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `aktif` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'Y',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 144 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of master_sub_menu
-- ----------------------------
INSERT INTO `master_sub_menu` VALUES (1, 1, 2, 'Mata Uang', 'currency', NULL, NULL, 'Y');
INSERT INTO `master_sub_menu` VALUES (2, 2, 2, 'Supplier', 'supplier', NULL, NULL, 'Y');
INSERT INTO `master_sub_menu` VALUES (3, 3, 2, 'Customer', 'customer', NULL, NULL, 'Y');
INSERT INTO `master_sub_menu` VALUES (4, 4, 2, 'Subcon', 'subcon', NULL, NULL, 'Y');
INSERT INTO `master_sub_menu` VALUES (5, 5, 2, 'Satuan', 'satuan', NULL, NULL, 'Y');
INSERT INTO `master_sub_menu` VALUES (6, 6, 2, 'Bahan Baku & Penolong', 'material', NULL, NULL, 'Y');
INSERT INTO `master_sub_menu` VALUES (7, 7, 2, 'Barang Jadi', 'barang', NULL, NULL, 'Y');
INSERT INTO `master_sub_menu` VALUES (8, 8, 2, 'Barang Sisa', 'scrap', NULL, NULL, 'Y');
INSERT INTO `master_sub_menu` VALUES (9, 9, 2, 'Aktiva Tetap', 'acc_aktiva', NULL, NULL, 'Y');
INSERT INTO `master_sub_menu` VALUES (10, 10, 2, 'Master Akun', 'acc_akun', NULL, NULL, 'Y');
INSERT INTO `master_sub_menu` VALUES (11, 11, 2, 'Akun Default', 'acc_setting', NULL, NULL, 'Y');
INSERT INTO `master_sub_menu` VALUES (12, 12, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `master_sub_menu` VALUES (13, 13, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `master_sub_menu` VALUES (14, 14, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `master_sub_menu` VALUES (15, 15, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `master_sub_menu` VALUES (16, 1, 3, 'Jurnal Umum', 'acc_jurnal', NULL, NULL, 'Y');
INSERT INTO `master_sub_menu` VALUES (17, 2, 3, 'Biaya Produksi', 'hpp', NULL, NULL, NULL);
INSERT INTO `master_sub_menu` VALUES (18, 3, 3, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `master_sub_menu` VALUES (19, 4, 3, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `master_sub_menu` VALUES (20, 5, 3, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `master_sub_menu` VALUES (21, 1, 4, 'Pembayaran', 'acc_bank_pembayaran', NULL, NULL, 'Y');
INSERT INTO `master_sub_menu` VALUES (22, 2, 4, 'Penerimaan', 'acc_bank_penerimaan', NULL, NULL, 'Y');
INSERT INTO `master_sub_menu` VALUES (23, 3, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `master_sub_menu` VALUES (24, 4, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `master_sub_menu` VALUES (25, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `master_sub_menu` VALUES (26, 1, 5, 'Pesanan Pembelian/PO', 'po', NULL, NULL, 'Y');
INSERT INTO `master_sub_menu` VALUES (27, 2, 5, 'Faktur Pembelian', 'acc_hutang', NULL, NULL, 'Y');
INSERT INTO `master_sub_menu` VALUES (28, 3, 5, 'Retur Pembelian', NULL, NULL, NULL, NULL);
INSERT INTO `master_sub_menu` VALUES (29, 4, 5, 'Pembayaran Pembelian', 'acc_pembayaran', NULL, NULL, 'Y');
INSERT INTO `master_sub_menu` VALUES (30, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `master_sub_menu` VALUES (31, 1, 6, 'Penerimaan Barang', 'masukmaterial', NULL, NULL, 'Y');
INSERT INTO `master_sub_menu` VALUES (32, 2, 6, 'Pemakaian Bahan Baku', 'keluarmaterial', NULL, NULL, 'Y');
INSERT INTO `master_sub_menu` VALUES (33, 3, 6, 'Stock Opname', 'stockopname', NULL, NULL, 'Y');
INSERT INTO `master_sub_menu` VALUES (34, 4, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `master_sub_menu` VALUES (35, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `master_sub_menu` VALUES (36, 1, 7, 'Work Order', 'wo', NULL, NULL, 'Y');
INSERT INTO `master_sub_menu` VALUES (37, 2, 7, 'Bill of Material Master', 'konversi', NULL, NULL, 'Y');
INSERT INTO `master_sub_menu` VALUES (38, 3, 7, 'Permintaan Bahan Baku', 'permintaan', NULL, NULL, 'Y');
INSERT INTO `master_sub_menu` VALUES (39, 4, 7, 'Pencatatan Scrap', 'masukscrap', NULL, NULL, 'Y');
INSERT INTO `master_sub_menu` VALUES (40, 5, 7, 'Penyelesaian Scrap', 'keluarscrap', NULL, NULL, 'Y');
INSERT INTO `master_sub_menu` VALUES (41, 6, 7, 'Hasil Produksi', 'produksi', NULL, NULL, 'Y');
INSERT INTO `master_sub_menu` VALUES (42, 7, 7, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `master_sub_menu` VALUES (43, 8, 7, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `master_sub_menu` VALUES (44, 9, 7, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `master_sub_menu` VALUES (45, 10, 7, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `master_sub_menu` VALUES (46, 1, 8, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `master_sub_menu` VALUES (47, 2, 8, 'Pengiriman Barang', 'delivery', NULL, NULL, 'Y');
INSERT INTO `master_sub_menu` VALUES (48, 3, 8, 'Faktur Penjualan', 'acc_piutang', NULL, NULL, 'Y');
INSERT INTO `master_sub_menu` VALUES (49, 4, 8, 'Retur Penjualan', NULL, NULL, NULL, NULL);
INSERT INTO `master_sub_menu` VALUES (50, 5, 8, 'Penerimaan Penjualan', 'acc_penerimaan', NULL, NULL, 'Y');
INSERT INTO `master_sub_menu` VALUES (51, 6, 8, 'Stock Opname', 'stockopnamebarang', NULL, NULL, 'Y');
INSERT INTO `master_sub_menu` VALUES (52, 7, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `master_sub_menu` VALUES (53, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `master_sub_menu` VALUES (54, 9, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `master_sub_menu` VALUES (55, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `master_sub_menu` VALUES (56, 1, 9, 'Laporan Keuangan', 'acc_laporan', NULL, NULL, 'Y');
INSERT INTO `master_sub_menu` VALUES (57, 2, 9, 'Laporan IT Inventory', 'lapbeacukai', NULL, NULL, 'Y');
INSERT INTO `master_sub_menu` VALUES (58, 3, 9, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `master_sub_menu` VALUES (59, 4, 9, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `master_sub_menu` VALUES (60, 5, 9, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `master_sub_menu` VALUES (61, 1, 10, 'User Groups', 'usergroup', NULL, NULL, 'Y');
INSERT INTO `master_sub_menu` VALUES (62, 2, 10, 'Users', 'permission', NULL, NULL, 'Y');
INSERT INTO `master_sub_menu` VALUES (63, 3, 10, 'User History', 'riwayat', NULL, NULL, 'Y');
INSERT INTO `master_sub_menu` VALUES (64, 4, 10, 'Backup Database', 'backup', NULL, NULL, 'Y');
INSERT INTO `master_sub_menu` VALUES (65, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `master_sub_menu` VALUES (66, 6, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `master_sub_menu` VALUES (67, 7, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `master_sub_menu` VALUES (68, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `master_sub_menu` VALUES (69, 9, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `master_sub_menu` VALUES (70, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `master_sub_menu` VALUES (143, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for master_sub_menu_2
-- ----------------------------
DROP TABLE IF EXISTS `master_sub_menu_2`;
CREATE TABLE `master_sub_menu_2`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_sub` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `label` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `link` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `aktif` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'Y',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for master_subcon
-- ----------------------------
DROP TABLE IF EXISTS `master_subcon`;
CREATE TABLE `master_subcon`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subcon_id` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `subcon_name` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `subcon_address` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `subcon_country` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `subcon_contact` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `subcon_phone` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `currency` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tempo` int(11) DEFAULT 0,
  `active` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'Y',
  `created_at` datetime(0) DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_from` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sid`(`subcon_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of master_subcon
-- ----------------------------
INSERT INTO `master_subcon` VALUES (1, 'SUB001', 'PT. Gunung Garuda Tbk', 'Jl. Raya Serang Cibarusah', 'INDONESIA', 'Yuan', '082237961085', NULL, 0, 'Y', '2019-03-16 13:44:35', 'admin', '127.0.0.1');
INSERT INTO `master_subcon` VALUES (2, 'SUB002', 'PT. SHOWA MPG', 'Cikarang - Bekasi', 'INDONESIA', '', '', NULL, 0, 'Y', '2019-03-16 13:46:01', 'admin', '127.0.0.1');

-- ----------------------------
-- Table structure for master_supplier
-- ----------------------------
DROP TABLE IF EXISTS `master_supplier`;
CREATE TABLE `master_supplier`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `supplier_name` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `supplier_address` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `supplier_country` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `supplier_contact` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `supplier_phone` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `currency` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tempo` int(11) DEFAULT 0,
  `active` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'Y',
  `created_at` datetime(0) DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_from` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sid`(`supplier_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of master_supplier
-- ----------------------------
INSERT INTO `master_supplier` VALUES (1, 'SUP001', 'PT. Multi Mekanika Serasi', 'Jl. Raya Serang Cibarusah', 'INDONESIA', 'Yuan', '082237961085', 'IDR', 30, 'Y', '2019-03-16 13:44:35', 'admin', '127.0.0.1');
INSERT INTO `master_supplier` VALUES (2, 'SUP002', 'Hanna Logistik', 'Bekasi Utara', 'INDONESIA', '', '', 'IDR', 60, 'Y', '2019-03-16 13:46:01', 'admin', '127.0.0.1');
INSERT INTO `master_supplier` VALUES (3, 'CHN001', 'Meisho Trading', 'Nagoya Japan', 'JEPANG', '-', '-', 'USD', 30, 'Y', '2019-08-07 20:24:32', 'admin', '127.0.0.1');

-- ----------------------------
-- Table structure for master_users
-- ----------------------------
DROP TABLE IF EXISTS `master_users`;
CREATE TABLE `master_users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `username` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `realname` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `password` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `email` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `station` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `aktif` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'Y',
  `created_at` datetime(0) DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_from` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ern` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `auth_no` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `dept` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `position` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `phone` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `last_login` datetime(0) DEFAULT NULL,
  `login_from` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of master_users
-- ----------------------------
INSERT INTO `master_users` VALUES (1, 1, 'admin', 'Administrator', '21232f297a57a5a743894a0e4a801fc3', 'lomri.doank@gmail.com', 'admin.png', 'undefined', 'Y', '2015-08-03 15:20:18', NULL, NULL, 'undefined', 'undefined', 'undefined', 'undefined', '02189110680', '2019-08-13 17:22:43', '120.188.32.188');
INSERT INTO `master_users` VALUES (2, 1, 'lomri', 'Lomri', 'e10adc3949ba59abbe56e057f20f883e', 'aku@gmail.com', NULL, 'undefined', 'Y', '2019-07-22 09:55:23', 'admin', NULL, 'undefined', 'undefined', 'undefined', 'undefined', '02171329457', NULL, NULL);

-- ----------------------------
-- Table structure for trans_bom_list
-- ----------------------------
DROP TABLE IF EXISTS `trans_bom_list`;
CREATE TABLE `trans_bom_list`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_header_wo` int(11) DEFAULT NULL,
  `no_wo` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `customer` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_po` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kode_barang` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kode_bom` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_bom` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `spek_bom` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `hs_bom` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `harga_bom` decimal(20, 2) DEFAULT 0.00,
  `currency` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `qty_bom` decimal(20, 2) DEFAULT NULL,
  `satuan` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of trans_bom_list
-- ----------------------------
INSERT INTO `trans_bom_list` VALUES (55, 1565687042, 'WO/001/2019', 'CR002', 'PO/DL/001/2019', 'BA0001', 'MK0002', 'Pipa Besi', 'Diameter 5\"', '-', 4.96, 'USD', 2.00, 'Pcs');
INSERT INTO `trans_bom_list` VALUES (56, 1565687042, 'WO/001/2019', 'CR002', 'PO/DL/001/2019', 'BA0001', 'MK0001', 'Pipa PPC 21 Inchi', 'Diameter 16x24', '-', 0.01, 'USD', 25.00, 'Gram');

-- ----------------------------
-- Table structure for trans_keluar_barang_detail
-- ----------------------------
DROP TABLE IF EXISTS `trans_keluar_barang_detail`;
CREATE TABLE `trans_keluar_barang_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_header` int(11) DEFAULT NULL,
  `no_wo` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `customer_po` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kode_barang` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_barang` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `spesifikasi_barang` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `hs_barang` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `satuan_barang` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `harga_barang` decimal(20, 4) DEFAULT 0.0000,
  `qty` decimal(20, 2) DEFAULT 0.00,
  `qty_tertagih` decimal(20, 2) DEFAULT 0.00,
  `currency` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kurs` decimal(20, 2) DEFAULT 1.00,
  `id_wo_detail` int(11) DEFAULT NULL,
  `gudang` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_input` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of trans_keluar_barang_detail
-- ----------------------------
INSERT INTO `trans_keluar_barang_detail` VALUES (12, 1565663566, 'WO1', 'PO1', 'BA0001', 'Barang Jadi 1', 'Type AC001', '-', 'Pcs', 8.3400, 10.00, 10.00, 'USD', 14100.00, 39, '4', 1);
INSERT INTO `trans_keluar_barang_detail` VALUES (13, 1565663566, 'WO1', 'PO1', 'BA0002', 'Barang Jadi 2', 'Type AC003', '-', 'Pcs', 12.6800, 10.00, 10.00, 'USD', 14100.00, 40, '4', 1);

-- ----------------------------
-- Table structure for trans_keluar_barang_header
-- ----------------------------
DROP TABLE IF EXISTS `trans_keluar_barang_header`;
CREATE TABLE `trans_keluar_barang_header`  (
  `id` int(11) NOT NULL,
  `tgl_keluar` datetime(0) DEFAULT NULL,
  `no_do` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `customer` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_invoice` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_invoice` date DEFAULT NULL,
  `no_packinglist` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_aju` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jenis_dokumen` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_dokumen` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_dokumen` date DEFAULT NULL,
  `status_input` int(11) DEFAULT 0,
  `created_at` datetime(0) DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_from` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of trans_keluar_barang_header
-- ----------------------------
INSERT INTO `trans_keluar_barang_header` VALUES (1565663566, '2019-08-13 09:32:45', 'DO/001/2019', 'NDS001', 'INV/001/2019', '2019-08-15', NULL, '000000', 'BC30', '00005', '2019-08-13', 1, '2019-08-13 09:33:47', 'admin', '127.0.0.1');

-- ----------------------------
-- Table structure for trans_keluar_material_detail
-- ----------------------------
DROP TABLE IF EXISTS `trans_keluar_material_detail`;
CREATE TABLE `trans_keluar_material_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_header` int(11) DEFAULT NULL,
  `kode_barang` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_barang` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `spesifikasi_barang` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `hs_barang` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `satuan_barang` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `qty` decimal(20, 2) DEFAULT 0.00,
  `harga_barang` decimal(20, 4) DEFAULT 0.0000,
  `currency` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kurs` decimal(20, 2) DEFAULT 1.00,
  `dok_asal` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_asal` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_asal` date DEFAULT NULL,
  `id_masuk_detail` int(11) DEFAULT NULL,
  `gudang` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_input` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for trans_keluar_material_header
-- ----------------------------
DROP TABLE IF EXISTS `trans_keluar_material_header`;
CREATE TABLE `trans_keluar_material_header`  (
  `id` int(11) NOT NULL,
  `tgl_keluar` datetime(0) DEFAULT NULL,
  `tujuan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_wo` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bagian` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_aju` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jenis_dokumen` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_dokumen` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_dokumen` date DEFAULT NULL,
  `subcon` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `supplier` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_bukti` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_at` datetime(0) DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_from` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_input` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for trans_keluar_mesin_detail
-- ----------------------------
DROP TABLE IF EXISTS `trans_keluar_mesin_detail`;
CREATE TABLE `trans_keluar_mesin_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_header` int(11) DEFAULT NULL,
  `kode_barang` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_barang` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `spesifikasi_barang` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `hs_barang` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `satuan_barang` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `qty` decimal(20, 2) DEFAULT 0.00,
  `qty_keluar` decimal(20, 2) DEFAULT 0.00,
  `harga_barang` decimal(20, 4) DEFAULT 0.0000,
  `currency` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_masuk_detail` int(11) DEFAULT NULL,
  `gudang` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_input` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for trans_keluar_mesin_header
-- ----------------------------
DROP TABLE IF EXISTS `trans_keluar_mesin_header`;
CREATE TABLE `trans_keluar_mesin_header`  (
  `id` int(11) NOT NULL,
  `tgl_keluar` datetime(0) DEFAULT NULL,
  `no_do` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_invoice` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_packinglist` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `penerima` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_aju` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jenis_dokumen` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_dokumen` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_dokumen` date DEFAULT NULL,
  `status_input` int(11) DEFAULT 0,
  `created_at` datetime(0) DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_from` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for trans_keluar_scrap_detail
-- ----------------------------
DROP TABLE IF EXISTS `trans_keluar_scrap_detail`;
CREATE TABLE `trans_keluar_scrap_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_header` int(11) DEFAULT NULL,
  `kode_barang` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_barang` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `spesifikasi_barang` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `hs_barang` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `satuan_barang` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `qty` decimal(20, 2) DEFAULT 0.00,
  `qty_keluar` decimal(20, 2) DEFAULT 0.00,
  `harga_barang` decimal(20, 4) DEFAULT 0.0000,
  `currency` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_masuk_detail` int(11) DEFAULT NULL,
  `status_input` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of trans_keluar_scrap_detail
-- ----------------------------
INSERT INTO `trans_keluar_scrap_detail` VALUES (2, 1565364128, 'SC002', 'Sampah Plastik', '-', '-', 'Kg', 10.00, 0.00, 200.0000, 'IDR', NULL, 1);
INSERT INTO `trans_keluar_scrap_detail` VALUES (3, 1565364128, 'SC001', 'Gram Besi', '-', '-', 'Kg', 5.00, 0.00, 400.0000, 'IDR', NULL, 1);

-- ----------------------------
-- Table structure for trans_keluar_scrap_header
-- ----------------------------
DROP TABLE IF EXISTS `trans_keluar_scrap_header`;
CREATE TABLE `trans_keluar_scrap_header`  (
  `id` int(11) NOT NULL,
  `tgl_keluar` datetime(0) DEFAULT NULL,
  `no_do` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_invoice` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_packinglist` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `penerima` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_aju` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jenis_dokumen` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_dokumen` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_dokumen` date DEFAULT NULL,
  `status_input` int(11) DEFAULT 0,
  `created_at` datetime(0) DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_from` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of trans_keluar_scrap_header
-- ----------------------------
INSERT INTO `trans_keluar_scrap_header` VALUES (1565364128, '2019-08-09 22:22:08', 'DO/SCR/VIII/2019', '-', NULL, 'NDS001', '012909921', 'BC24', '00001', '2019-08-09', 1, '2019-08-09 22:23:04', 'admin', '127.0.0.1');

-- ----------------------------
-- Table structure for trans_keluar_wip_detail
-- ----------------------------
DROP TABLE IF EXISTS `trans_keluar_wip_detail`;
CREATE TABLE `trans_keluar_wip_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_header` int(11) DEFAULT NULL,
  `no_wo` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `customer_po` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kode_barang` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_barang` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `spesifikasi_barang` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `hs_barang` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `satuan_barang` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `harga_barang` decimal(20, 4) DEFAULT 0.0000,
  `qty` decimal(20, 2) DEFAULT 0.00,
  `qty_tertagih` decimal(20, 2) DEFAULT 0.00,
  `currency` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_wo_detail` int(11) DEFAULT NULL,
  `gudang` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_input` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for trans_keluar_wip_header
-- ----------------------------
DROP TABLE IF EXISTS `trans_keluar_wip_header`;
CREATE TABLE `trans_keluar_wip_header`  (
  `id` int(11) NOT NULL,
  `tgl_keluar` datetime(0) DEFAULT NULL,
  `no_do` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `penerima` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bukti_pengeluaran` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_packinglist` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_aju` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jenis_dokumen` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_dokumen` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_dokumen` date DEFAULT NULL,
  `status_input` int(11) DEFAULT 0,
  `created_at` datetime(0) DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_from` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for trans_logs
-- ----------------------------
DROP TABLE IF EXISTS `trans_logs`;
CREATE TABLE `trans_logs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime(0) DEFAULT NULL,
  `username` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `activity` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `address` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `browser` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4370 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of trans_logs
-- ----------------------------
INSERT INTO `trans_logs` VALUES (3030, '2019-03-16 12:09:04', 'admin', 'success login', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3031, '2019-03-16 12:09:13', 'admin', 'success logout', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3032, '2019-03-18 11:56:59', 'admin', 'success login', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3033, '2019-03-18 11:59:25', 'admin', 'update group id 1', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3034, '2019-03-18 11:59:28', 'admin', 'success logout', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3035, '2019-03-18 11:59:30', 'admin', 'success login', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3036, '2019-03-18 12:09:27', 'admin', 'update group id 1', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3037, '2019-03-18 12:09:30', 'admin', 'success logout', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3038, '2019-03-18 12:09:33', 'admin', 'success login', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3039, '2019-03-18 12:37:57', 'admin', 'update supplier data id: SUP002', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3040, '2019-03-18 12:38:15', 'admin', 'update supplier data id: SUP001', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3041, '2019-03-18 12:40:30', 'admin', 'disactive supplier id SUP002 name Hanna Logistik', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3042, '2019-03-18 12:48:37', 'admin', 'update subcon data id: SUB002', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3043, '2019-03-18 12:48:54', 'admin', 'update subcon data id: SUB001', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3044, '2019-03-18 13:09:37', 'admin', 'update group id 1', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3045, '2019-03-18 13:09:41', 'admin', 'success logout', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3046, '2019-03-18 13:09:43', 'admin', 'success login', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3047, '2019-03-18 13:10:48', 'admin', 'update group id 1', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3048, '2019-03-18 13:10:55', 'admin', 'success logout', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3049, '2019-03-18 13:10:57', 'admin', 'success login', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3050, '2019-03-18 13:12:04', 'admin', 'edit data satuan kode: UN15', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3051, '2019-03-18 13:32:36', 'admin', 'update group id 1', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3052, '2019-03-18 13:32:40', 'admin', 'success logout', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3053, '2019-03-18 13:32:42', 'admin', 'success login', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3054, '2019-03-18 13:33:20', 'admin', 'update group id 1', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3055, '2019-03-18 13:33:23', 'admin', 'success logout', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3056, '2019-03-18 13:33:26', 'admin', 'success login', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3057, '2019-03-18 13:47:58', 'admin', 'update group id 1', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3058, '2019-03-18 13:48:01', 'admin', 'success logout', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3059, '2019-03-18 13:48:03', 'admin', 'success login', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3060, '2019-03-18 13:59:36', 'admin', 'update group id 1', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3061, '2019-03-18 13:59:42', 'admin', 'success logout', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3062, '2019-03-18 13:59:57', 'admin', 'success login', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3063, '2019-03-18 14:02:15', 'admin', 'update group id 1', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3064, '2019-03-18 14:02:18', 'admin', 'success logout', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3065, '2019-03-18 14:02:21', 'admin', 'success login', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3066, '2019-03-18 14:06:07', 'admin', 'update group id 1', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3067, '2019-03-18 14:06:10', 'admin', 'success logout', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3068, '2019-03-18 14:06:12', 'admin', 'success login', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3069, '2019-03-18 14:08:38', 'admin', 'update group id 1', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3070, '2019-03-18 14:09:09', 'admin', 'success logout', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3071, '2019-03-18 14:09:11', 'admin', 'success login', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3072, '2019-03-18 14:11:46', 'admin', 'update company information at 2019-03-18 14:11:46', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3073, '2019-03-18 14:11:47', 'admin', 'success logout', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3074, '2019-03-18 14:11:49', 'admin', 'success login', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3075, '2019-03-19 09:40:10', 'admin', 'tambah material baru kode: BR001', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3076, '2019-03-19 09:41:27', 'admin', 'tambah material baru kode: BR002', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3077, '2019-03-19 09:54:40', 'admin', 'update data material kode: BR002', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3078, '2019-03-19 09:57:11', 'admin', 'disactive barang kode BR001 nama', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3079, '2019-03-19 10:09:53', 'admin', 'tambah material baru kode: BR001', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3080, '2019-03-19 10:53:53', 'admin', 'update data barang kode: BR003', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3081, '2019-03-19 10:54:09', 'admin', 'update data barang kode: BR001', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3082, '2019-03-19 10:54:13', 'admin', 'update data barang kode: BR002', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3083, '2019-03-19 10:57:32', 'admin', 'update group id 1', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3084, '2019-03-19 10:58:47', 'admin', 'update group id 1', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3085, '2019-03-19 10:59:02', 'admin', 'success logout', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3086, '2019-03-19 10:59:04', 'admin', 'success login', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3087, '2019-03-19 11:13:58', 'admin', 'success logout', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3088, '2019-03-19 11:14:01', 'admin', 'success login', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3089, '2019-03-19 11:20:55', 'admin', 'update data mesin kode: MS001', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3090, '2019-03-19 11:21:03', 'admin', 'update data mesin kode: MS003', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3091, '2019-03-19 11:21:11', 'admin', 'update data mesin kode: MS002', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3092, '2019-03-19 11:21:50', 'admin', 'update data mesin kode: MS001', '127.0.0.1', 'Linux - Firefox 65.0');
INSERT INTO `trans_logs` VALUES (3093, '2019-03-27 13:08:04', 'admin', 'success login', '127.0.0.1', 'Linux - Chrome 73.0.3683.75');
INSERT INTO `trans_logs` VALUES (3094, '2019-03-27 13:36:24', 'admin', 'tambah scrap baru kode: SC001', '127.0.0.1', 'Linux - Chrome 73.0.3683.75');
INSERT INTO `trans_logs` VALUES (3095, '2019-03-27 13:41:22', 'admin', 'update data scrap kode: SC001', '127.0.0.1', 'Linux - Chrome 73.0.3683.75');
INSERT INTO `trans_logs` VALUES (3096, '2019-03-27 13:41:40', 'admin', 'update data scrap kode: SC001', '127.0.0.1', 'Linux - Chrome 73.0.3683.75');
INSERT INTO `trans_logs` VALUES (3097, '2019-03-27 13:42:07', 'admin', 'tambah scrap baru kode: SC002', '127.0.0.1', 'Linux - Chrome 73.0.3683.75');
INSERT INTO `trans_logs` VALUES (3098, '2019-03-27 14:29:47', 'admin', 'hapus item konversi id: 3', '127.0.0.1', 'Linux - Chrome 73.0.3683.75');
INSERT INTO `trans_logs` VALUES (3099, '2019-04-02 13:23:53', 'admin', 'success login', '127.0.0.1', 'Linux - Chrome 73.0.3683.86');
INSERT INTO `trans_logs` VALUES (3100, '2019-04-24 07:51:34', 'admin', 'success login', '127.0.0.1', 'Linux - Firefox 66.0');
INSERT INTO `trans_logs` VALUES (3101, '2019-04-24 11:18:28', 'admin', 'update group id 1', '127.0.0.1', 'Linux - Firefox 66.0');
INSERT INTO `trans_logs` VALUES (3102, '2019-04-24 11:18:31', 'admin', 'success logout', '127.0.0.1', 'Linux - Firefox 66.0');
INSERT INTO `trans_logs` VALUES (3103, '2019-04-24 11:18:34', 'admin', 'success login', '127.0.0.1', 'Linux - Firefox 66.0');
INSERT INTO `trans_logs` VALUES (3104, '2019-04-24 11:43:35', 'admin', 'update group id 1', '127.0.0.1', 'Linux - Firefox 66.0');
INSERT INTO `trans_logs` VALUES (3105, '2019-04-24 11:43:39', 'admin', 'success logout', '127.0.0.1', 'Linux - Firefox 66.0');
INSERT INTO `trans_logs` VALUES (3106, '2019-04-24 11:43:41', 'admin', 'success login', '127.0.0.1', 'Linux - Firefox 66.0');
INSERT INTO `trans_logs` VALUES (3107, '2019-04-24 11:43:56', 'admin', 'update group id 1', '127.0.0.1', 'Linux - Firefox 66.0');
INSERT INTO `trans_logs` VALUES (3108, '2019-04-24 11:43:59', 'admin', 'success logout', '127.0.0.1', 'Linux - Firefox 66.0');
INSERT INTO `trans_logs` VALUES (3109, '2019-04-24 11:44:02', 'admin', 'success login', '127.0.0.1', 'Linux - Firefox 66.0');
INSERT INTO `trans_logs` VALUES (3110, '2019-05-06 08:18:05', 'admin', 'success login', '127.0.0.1', 'Linux - Chrome 73.0.3683.103');
INSERT INTO `trans_logs` VALUES (3111, '2019-05-06 08:22:33', 'admin', 'success logout', '127.0.0.1', 'Linux - Chrome 73.0.3683.103');
INSERT INTO `trans_logs` VALUES (3112, '2019-05-06 08:22:41', 'admin', 'success login', '127.0.0.1', 'Linux - Chrome 73.0.3683.103');
INSERT INTO `trans_logs` VALUES (3113, '2019-05-10 13:00:54', 'admin', 'success login', '127.0.0.1', 'Linux - Firefox 66.0');
INSERT INTO `trans_logs` VALUES (3114, '2019-06-19 11:58:45', 'admin', 'success login', '127.0.0.1', 'Linux - Chrome 75.0.3770.80');
INSERT INTO `trans_logs` VALUES (3115, '2019-06-19 12:13:39', 'admin', 'success logout', '127.0.0.1', 'Linux - Chrome 75.0.3770.80');
INSERT INTO `trans_logs` VALUES (3116, '2019-06-29 09:24:00', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3117, '2019-06-29 09:39:04', 'admin', 'update group id 1', '127.0.0.1', 'Windows 7 - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3118, '2019-06-29 09:39:08', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3119, '2019-06-29 09:39:13', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3120, '2019-06-29 09:57:52', 'admin', 'update group id 1', '127.0.0.1', 'Windows 7 - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3121, '2019-06-29 09:57:55', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3122, '2019-06-29 09:58:00', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3123, '2019-06-29 11:44:39', 'admin', 'add new group Tes', '127.0.0.1', 'Windows 7 - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3124, '2019-06-29 11:44:43', 'admin', 'delete group id 2', '127.0.0.1', 'Windows 7 - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3125, '2019-06-29 12:04:46', 'admin', 'tambah wo baru nomor : 20190629120446', '127.0.0.1', 'Windows 7 - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3126, '2019-06-29 12:06:20', 'admin', 'tambah wo baru nomor : 20190629120620', '127.0.0.1', 'Windows 7 - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3127, '2019-06-29 12:06:36', 'admin', 'tambah wo baru nomor : 20190629120635', '127.0.0.1', 'Windows 7 - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3128, '2019-07-04 16:56:15', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3129, '2019-07-11 11:28:07', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3130, '2019-07-11 11:56:34', 'admin', 'update wo  nomor : 20190711115633', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3131, '2019-07-11 11:56:51', 'admin', 'update wo  nomor : 20190711115651', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3132, '2019-07-11 12:01:48', 'admin', 'hapus wo id: 3 no 20190711115651', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3133, '2019-07-11 16:45:28', 'admin', 'update data pemasukan material id:', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3134, '2019-07-11 16:48:09', 'admin', 'try direct access to material controller (save_barang)', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3135, '2019-07-11 16:51:38', 'admin', 'tambah pemasukan material id: 1562838663', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3136, '2019-07-11 17:02:41', 'admin', 'delete pemauskan barang id 1562838663', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3137, '2019-07-11 17:06:01', 'admin', 'tambah pemasukan material id: 1562839533', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3138, '2019-07-11 17:11:29', 'admin', 'update data pemasukan material id: 1562839533', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3139, '2019-07-11 17:13:07', 'admin', 'update data pemasukan material id: 1562839533', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3140, '2019-07-11 17:31:21', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3141, '2019-07-11 17:31:54', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3142, '2019-07-11 17:39:28', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3143, '2019-07-12 07:46:17', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3144, '2019-07-12 07:47:50', 'admin', 'update data pemasukan material id: 1562839533', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3145, '2019-07-12 07:49:03', 'admin', 'update data pemasukan material id: 1562839533', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3146, '2019-07-12 07:53:48', 'admin', 'update data pemasukan material id: 1562839533', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3147, '2019-07-12 07:54:48', 'admin', 'update data pemasukan material id: 1562839533', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3148, '2019-07-12 09:57:19', 'admin', 'tambah wo baru nomor : 20190712095719', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3149, '2019-07-12 09:59:16', 'admin', 'update wo  nomor : WO/01/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3150, '2019-07-12 10:08:38', 'admin', 'tambah wo baru nomor : WO/01/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3151, '2019-07-12 10:08:45', 'admin', 'update wo  nomor : WO/01/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3152, '2019-07-12 10:10:00', 'admin', 'tambah wo baru nomor : WO/02/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3153, '2019-07-12 10:10:10', 'admin', 'update wo  nomor : WO/02/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3154, '2019-07-12 10:31:10', 'admin', 'update wo  nomor : WO/01/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3155, '2019-07-12 10:35:12', 'admin', 'update wo  nomor : WO/01/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3156, '2019-07-12 10:35:24', 'admin', 'update wo  nomor : WO/02/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3157, '2019-07-12 10:36:50', 'admin', 'update wo  nomor : WO/01/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3158, '2019-07-12 10:37:03', 'admin', 'update wo  nomor : WO/01/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3159, '2019-07-12 10:42:50', 'admin', 'tambah wo baru nomor : WO/123/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3160, '2019-07-12 10:43:34', 'admin', 'hapus wo id: 1562902947 no WO/123/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3161, '2019-07-12 10:46:13', 'admin', 'update data barang kode: BR003', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3162, '2019-07-12 10:48:49', 'admin', 'tambah wo baru nomor : WO/123/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3163, '2019-07-12 10:53:28', 'admin', 'update wo  nomor : WO/123/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3164, '2019-07-12 10:54:07', 'admin', 'update wo  nomor : WO/123/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3165, '2019-07-12 10:55:25', 'admin', 'update wo  nomor : WO/123/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3166, '2019-07-12 10:56:38', 'admin', 'update wo  nomor : WO/123/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3167, '2019-07-12 11:01:29', 'admin', 'tambah wo baru nomor : WO/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3168, '2019-07-12 15:04:22', 'admin', 'tambah pengeluaran material id: 1562918643', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3169, '2019-07-12 15:05:25', 'admin', 'tambah pengeluaran material id: 1562918681', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3170, '2019-07-12 15:14:39', 'admin', 'update data pengeluaran material id: 1562918681', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3171, '2019-07-12 15:15:29', 'admin', 'delete pengeluaran material id 1562918643', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3172, '2019-07-12 15:46:08', 'admin', 'update data pengeluaran material id: 1562918681', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3173, '2019-07-12 15:48:06', 'admin', 'update data pengeluaran material id: 1562918681', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3174, '2019-07-12 15:48:26', 'admin', 'update data pengeluaran material id: 1562918681', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3175, '2019-07-12 15:48:56', 'admin', 'update data pengeluaran material id: 1562918681', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3176, '2019-07-12 15:49:04', 'admin', 'delete pengeluaran material id 1562918681', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3177, '2019-07-13 08:21:32', 'admin', 'tambah wo baru nomor :', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3178, '2019-07-13 08:21:43', 'admin', 'hapus wo id: 1562980877 no', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3179, '2019-07-13 09:42:52', 'admin', 'hapus item konversi id: 4', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3180, '2019-07-13 09:42:53', 'admin', 'hapus item konversi id: 5', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3181, '2019-07-13 09:45:15', 'admin', 'update data material kode: MT003', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3182, '2019-07-13 09:48:32', 'admin', 'hapus item konversi id: 6', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3183, '2019-07-13 09:48:33', 'admin', 'hapus item konversi id: 7', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3184, '2019-07-13 10:13:46', 'admin', 'hapus wo id: 1562904050 no WO/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3185, '2019-07-13 10:14:45', 'admin', 'tambah wo baru nomor : WO/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3186, '2019-07-13 10:15:16', 'admin', 'update wo  nomor : WO/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3187, '2019-07-13 10:15:18', 'admin', 'hapus wo id: 1562987637 no WO/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3188, '2019-07-13 10:16:08', 'admin', 'tambah wo baru nomor : wo/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3189, '2019-07-13 12:50:47', 'admin', 'update data pemasukan material id: 1562839533', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3190, '2019-07-13 12:53:22', 'admin', 'update data pemasukan material id: 1562839533', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3191, '2019-07-13 12:54:17', 'admin', 'delete pemauskan barang id 1562839533', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3192, '2019-07-13 12:55:38', 'admin', 'tambah pemasukan material id: 1562997265', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3193, '2019-07-13 13:41:39', 'admin', 'tambah pengeluaran material id: 1563000071', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3194, '2019-07-13 14:15:08', 'admin', 'proses stock opname tanggal :2019-07-13 14:15:02', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3195, '2019-07-13 14:15:51', 'admin', 'download stock opname bahan baku2019-07-13 14:15:02', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3196, '2019-07-13 14:16:37', 'admin', 'hapus stock opname nomor :20190700001 tanggal : 2019-07-13 14:15:02', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3197, '2019-07-13 14:17:00', 'admin', 'proses stock opname tanggal :2019-01-31 09:00:00', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3198, '2019-07-13 14:26:45', 'admin', 'cetak laporan mutasi bahan baku periode 2019-07-13 00:00:00 s/d 2019-07-13 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3199, '2019-07-13 14:27:10', 'admin', 'cetak laporan mutasi bahan baku periode 2019-07-13 00:00:00 s/d 2019-07-13 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3200, '2019-07-13 14:27:22', 'admin', 'download laporan mutasi bahan baku periode 2019-07-13 00:00:00 s/d 2019-07-13 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3201, '2019-07-13 14:55:51', 'admin', 'cetak laporan mutasi bahan baku periode 2019-07-13 00:00:00 s/d 2019-07-13 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3202, '2019-07-15 13:39:22', 'admin', 'update group id 1', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3203, '2019-07-15 13:39:24', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3204, '2019-07-15 13:39:31', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3205, '2019-07-15 13:51:52', 'admin', 'update group id 1', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3206, '2019-07-15 13:51:56', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3207, '2019-07-15 13:52:01', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3208, '2019-07-15 14:02:00', 'admin', 'update supplier data id: SUP001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3209, '2019-07-15 14:03:31', 'admin', 'update supplier data id: SUP002', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3210, '2019-07-16 11:05:39', 'admin', 'tambah po baru no: PO/123', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3211, '2019-07-16 11:12:56', 'admin', 'tambah po baru no: PO/124', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3212, '2019-07-16 11:23:46', 'admin', 'update data purchase order no : PO/123', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3213, '2019-07-16 11:24:11', 'admin', 'update data purchase order no : PO/124', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3214, '2019-07-16 11:25:44', 'admin', 'update data purchase order no : PO/123', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3215, '2019-07-16 11:26:01', 'admin', 'update data purchase order no : PO/124', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3216, '2019-07-16 11:28:23', 'admin', 'update data purchase order no : PO/123', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3217, '2019-07-16 11:29:41', 'admin', 'delete po id 1563250330 no PO/124', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3218, '2019-07-16 11:30:26', 'admin', 'tambah po baru no: PO/124', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3219, '2019-07-16 12:40:26', 'admin', 'delete pemauskan barang id 1562997265', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3220, '2019-07-16 13:59:36', 'admin', 'tambah pemasukan material id: 1563260283', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3221, '2019-07-16 14:00:16', 'admin', 'delete pemauskan barang id 1563260283', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3222, '2019-07-16 14:18:28', 'admin', 'tambah pemasukan material id: 1563261481 dari po PO/123', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3223, '2019-07-16 14:25:28', 'admin', 'tambah pemasukan material id: 1563261907 dari po PO/124', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3224, '2019-07-16 14:41:06', 'admin', 'delete pemasukan barang id 1563261907', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3225, '2019-07-16 14:44:35', 'admin', 'update data pemasukan material id: 1563261481', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3226, '2019-07-16 14:45:00', 'admin', 'tambah pemasukan material id: 1563263087 dari po PO/123', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3227, '2019-07-16 14:47:38', 'admin', 'update data pemasukan material id: 1563263087', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3228, '2019-07-16 14:50:16', 'admin', 'update data pemasukan material id: 1563263087', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3229, '2019-07-16 14:54:30', 'admin', 'tambah pemasukan material id: 1563263655 dari po PO/124', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3230, '2019-07-16 14:55:37', 'admin', 'delete pemasukan barang id 1563261481', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3231, '2019-07-16 14:55:41', 'admin', 'delete pemasukan barang id 1563263087', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3232, '2019-07-16 14:55:43', 'admin', 'delete pemasukan barang id 1563263655', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3233, '2019-07-16 15:09:23', 'admin', 'tambah pemasukan material id: 1563264552 dari po PO/123', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3234, '2019-07-16 15:09:36', 'admin', 'tambah pemasukan material id: 1563264565 dari po PO/124', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3235, '2019-07-16 15:12:11', 'admin', 'delete pemasukan barang id 1563264552', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3236, '2019-07-16 15:12:14', 'admin', 'delete pemasukan barang id 1563264565', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3237, '2019-07-16 15:12:35', 'admin', 'tambah pemasukan material id: 1563264746 dari po PO/124', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3238, '2019-07-16 15:12:45', 'admin', 'tambah pemasukan material id: 1563264757 dari po PO/123', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3239, '2019-07-16 15:13:40', 'admin', 'tambah pemasukan material id: 1563264812 dari po PO/123', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3240, '2019-07-16 15:13:58', 'admin', 'delete pemasukan barang id 1563264812', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3241, '2019-07-16 15:14:01', 'admin', 'delete pemasukan barang id 1563264757', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3242, '2019-07-16 15:14:04', 'admin', 'delete pemasukan barang id 1563264746', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3243, '2019-07-16 15:14:21', 'admin', 'delete po id 1563249893 no PO/123', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3244, '2019-07-16 15:14:24', 'admin', 'delete po id 1563251393 no PO/124', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3245, '2019-07-16 16:46:14', 'admin', 'success login', '127.0.0.1', 'Linux - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3246, '2019-07-16 16:47:35', 'admin', 'success logout', '127.0.0.1', 'Linux - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3247, '2019-07-16 16:47:39', 'admin', 'success login', '127.0.0.1', 'Linux - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3248, '2019-07-16 19:01:59', 'admin', 'tambah wo baru nomor : DL/0001', '127.0.0.1', 'Linux - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3249, '2019-07-16 19:31:15', 'admin', 'tambah pemasukan material id: 1563280261 dari po', '127.0.0.1', 'Linux - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3250, '2019-07-16 19:37:03', 'admin', 'delete pemasukan hasil produksi id 1563280261 kode produksi pr0003', '127.0.0.1', 'Linux - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3251, '2019-07-16 19:39:48', 'admin', 'tambah pemasukan hasil produksi id: 1563280777 dari wo wo/001/2019', '127.0.0.1', 'Linux - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3252, '2019-07-16 19:40:42', 'admin', 'delete pemasukan hasil produksi id 1563280777 kode produksi tr', '127.0.0.1', 'Linux - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3253, '2019-07-16 19:41:10', 'admin', 'tambah pemasukan hasil produksi id: 1563280860 dari wo wo/001/2019', '127.0.0.1', 'Linux - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3254, '2019-07-16 19:41:20', 'admin', 'tambah pemasukan hasil produksi id: 1563280871 dari wo DL/0001', '127.0.0.1', 'Linux - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3255, '2019-07-16 19:47:14', 'admin', 'tambah pemasukan hasil produksi id: 1563281201 dari wo wo/001/2019', '127.0.0.1', 'Linux - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3256, '2019-07-16 19:49:21', 'admin', 'delete pemasukan hasil produksi id 1563280860 kode produksi rt', '127.0.0.1', 'Linux - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3257, '2019-07-16 19:49:24', 'admin', 'delete pemasukan hasil produksi id 1563280871 kode produksi tu', '127.0.0.1', 'Linux - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3258, '2019-07-16 19:49:27', 'admin', 'delete pemasukan hasil produksi id 1563281201 kode produksi 2323', '127.0.0.1', 'Linux - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3259, '2019-07-16 19:52:12', 'admin', 'tambah pemasukan hasil produksi id: 1563281521 dari wo wo/001/2019', '127.0.0.1', 'Linux - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3260, '2019-07-16 19:52:43', 'admin', 'tambah pemasukan hasil produksi id: 1563281555 dari wo DL/0001', '127.0.0.1', 'Linux - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3261, '2019-07-16 19:53:12', 'admin', 'delete pemasukan hasil produksi id 1563281521 kode produksi RET', '127.0.0.1', 'Linux - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3262, '2019-07-16 20:10:51', 'admin', 'tambah pemasukan hasil produksi id: 1563282611 dari wo', '127.0.0.1', 'Linux - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3263, '2019-07-16 20:16:12', 'admin', 'tambah pemasukan hasil produksi id: 1563282950 dari wo wo/001/2019', '127.0.0.1', 'Linux - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3264, '2019-07-16 20:17:49', 'admin', 'delete pemasukan hasil produksi id 1563281555 kode produksi DD', '127.0.0.1', 'Linux - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3265, '2019-07-16 20:17:52', 'admin', 'delete pemasukan hasil produksi id 1563282611 kode produksi REP/02/2019', '127.0.0.1', 'Linux - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3266, '2019-07-16 20:17:55', 'admin', 'delete pemasukan hasil produksi id 1563282950 kode produksi P/001/2019', '127.0.0.1', 'Linux - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3267, '2019-07-16 20:18:03', 'admin', 'delete pengeluaran material id 1563000071', '127.0.0.1', 'Linux - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3268, '2019-07-16 20:22:44', 'admin', 'tambah po baru no: PO/001/2019', '127.0.0.1', 'Linux - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3269, '2019-07-16 20:23:25', 'admin', 'tambah pemasukan material id: 1563283370 dari po PO/001/2019', '127.0.0.1', 'Linux - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3270, '2019-07-16 20:24:15', 'admin', 'tambah pengeluaran material id: 1563283420', '127.0.0.1', 'Linux - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3271, '2019-07-16 20:25:37', 'admin', 'tambah pemasukan hasil produksi id: 1563283521 dari wo wo/001/2019', '127.0.0.1', 'Linux - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3272, '2019-07-16 20:52:59', 'admin', 'update data pengeluaran material id: 1563283420', '127.0.0.1', 'Linux - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3273, '2019-07-16 21:17:20', 'admin', 'update data hasil produksi id: 1563283521 kode produksi PM/0023/2019', '127.0.0.1', 'Linux - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3274, '2019-07-16 21:18:03', 'admin', 'tambah pemasukan hasil produksi id: 1563286668 dari wo wo/001/2019', '127.0.0.1', 'Linux - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3275, '2019-07-16 21:20:53', 'admin', 'success logout', '127.0.0.1', 'Linux - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3276, '2019-07-17 10:16:11', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3277, '2019-07-20 09:27:02', 'admin', 'tambah delivery order id: 1563589566 no do DO/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3278, '2019-07-20 09:36:17', 'admin', 'update delivery order id: 1563589566 no do DO/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3279, '2019-07-20 09:36:33', 'admin', 'delete delivery order id 1563589566 nodo DO/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3280, '2019-07-20 09:37:54', 'admin', 'tambah delivery order id: 1563590223 no do DO/OK/004/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3281, '2019-07-20 09:58:19', 'admin', 'proses stock opname barang jadi tanggal :2019-07-20 09:58:15', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3282, '2019-07-20 09:59:20', 'admin', 'hapus stock opname nomor :20190700001 tanggal : 2019-07-20 09:58:15', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3283, '2019-07-20 09:59:40', 'admin', 'proses stock opname barang jadi tanggal :2019-07-20 10:00:00', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3284, '2019-07-20 10:05:36', 'admin', 'download stock opname barang jadi 2019-07-20 10:00:00', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3285, '2019-07-20 10:05:55', 'admin', 'download stock opname barang jadi 2019-07-20 10:00:00', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3286, '2019-07-20 10:10:21', 'admin', 'hapus stock opname nomor :20190700001 tanggal : 2019-07-20 10:00:00', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3287, '2019-07-20 10:10:30', 'admin', 'proses stock opname barang jadi tanggal :2019-07-20 10:00:00', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3288, '2019-07-20 10:19:21', 'admin', 'cetak laporan mutasi barang jadi periode 2019-07-20 00:00:00 s/d 2019-07-20 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3289, '2019-07-20 10:19:27', 'admin', 'download laporan mutasi barang jadi periode 2019-07-20 00:00:00 s/d 2019-07-20 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3290, '2019-07-20 12:46:30', 'admin', 'tambah pemasukan asset id: 1563601531 no po PO/MSN/009/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3291, '2019-07-20 12:49:07', 'admin', 'update pemasukan asset  id: 1563601531 no po PO/MSN/009/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3292, '2019-07-20 12:49:23', 'admin', 'update pemasukan asset  id: 1563601531 no po PO/MSN/004/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3293, '2019-07-20 12:51:14', 'admin', 'delete pemasukan asset id 1563601531 nopo PO/MSN/004/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3294, '2019-07-20 13:05:26', 'admin', 'cetak riwayat user periode 2019-07-20 00:00:00 s/d 2019-07-20 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3295, '2019-07-20 13:55:00', 'admin', 'tambah pengeluaran asset id: 1563605569 no do DO/MSN/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3296, '2019-07-20 13:56:04', 'admin', 'update pengeluaran asset  id: 1563605569 no do', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3297, '2019-07-20 13:56:09', 'admin', 'delete pengeluaran asset id 1563605569 nodpo DO/MSN/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3298, '2019-07-20 13:57:22', 'admin', 'tambah pengeluaran asset id: 1563605782 no do DO/SUB/002/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3299, '2019-07-20 14:14:30', 'admin', 'proses stock opname mesin tanggal :2019-07-20 14:14:24', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3300, '2019-07-20 14:17:00', 'admin', 'tambah pemasukan asset id: 1563606936 no po PO/MSN/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3301, '2019-07-20 14:17:10', 'admin', 'hapus stock opname mesin nomor :20190700001 tanggal : 2019-07-20 14:14:24', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3302, '2019-07-20 14:17:17', 'admin', 'proses stock opname mesin tanggal :2019-07-20 14:17:13', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3303, '2019-07-20 14:17:55', 'admin', 'download stock opname mesin2019-07-20 14:17:13', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3304, '2019-07-20 14:27:54', 'admin', 'cetak laporan mutasi asset periode 2019-07-20 00:00:00 s/d 2019-07-20 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3305, '2019-07-20 14:28:04', 'admin', 'download laporan mutasi asset periode 2019-07-20 00:00:00 s/d 2019-07-20 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3306, '2019-07-20 14:53:16', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3307, '2019-07-20 14:53:30', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3308, '2019-07-20 15:22:43', 'admin', 'tambah pemasukan scrap id: 1563610919 kode produksi PR/001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3309, '2019-07-20 15:24:00', 'admin', 'update pemasukan scrap  id: 1563610919 kode PR/001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3310, '2019-07-20 15:25:00', 'admin', 'delete pemasukan scrap id 1563610919 kode produksi PR/001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3311, '2019-07-20 15:26:06', 'admin', 'tambah pemasukan scrap id: 1563611131 kode produksi PR001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3312, '2019-07-20 15:26:31', 'admin', 'tambah pemasukan scrap id: 1563611169 kode produksi PR002/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3313, '2019-07-20 15:27:01', 'admin', 'tambah pemasukan scrap id: 1563611197 kode produksi PR003/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3314, '2019-07-20 15:39:17', 'admin', 'tambah pengeluaran asset id: 1563611872 no do DO/SCR/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3315, '2019-07-20 15:39:31', 'admin', 'update pengeluaran asset  id: 1563611872 no do', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3316, '2019-07-20 15:39:35', 'admin', 'delete pengeluaran asset id 1563611872 nodpo DO/SCR/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3317, '2019-07-20 15:41:11', 'admin', 'addd new customer id: NDS001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3318, '2019-07-20 15:41:55', 'admin', 'tambah pengeluaran asset id: 1563611984 no do DO/SCR/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3319, '2019-07-20 16:49:33', 'admin', 'success login', '127.0.0.1', 'Linux - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3320, '2019-07-20 17:00:49', 'admin', 'proses stock opname scrap tanggal :2019-07-20 17:00:43', '127.0.0.1', 'Linux - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3321, '2019-07-20 17:01:12', 'admin', 'download stock opname scrap2019-07-20 17:00:43', '127.0.0.1', 'Linux - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3322, '2019-07-20 17:01:18', 'admin', 'hapus stock opname scrap nomor :20190700001 tanggal : 2019-07-20 17:00:43', '127.0.0.1', 'Linux - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3323, '2019-07-20 17:10:58', 'admin', 'cetak laporan mutasi scrap periode 2019-07-20 00:00:00 s/d 2019-07-20 23:59:59', '127.0.0.1', 'Linux - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3324, '2019-07-20 17:11:03', 'admin', 'download laporan mutasi scrap periode 2019-07-20 00:00:00 s/d 2019-07-20 23:59:59', '127.0.0.1', 'Linux - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3325, '2019-07-20 18:24:17', 'admin', 'cetak laporan pemasukan barang perdokumen periode 2019-07-01 00:00:00 s/d 2019-07-20 23:59:59', '127.0.0.1', 'Linux - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3326, '2019-07-20 18:24:25', 'admin', 'download laporan pemasukan barang perdokumen periode 2019-07-01 00:00:00 s/d 2019-07-20 23:59:59', '127.0.0.1', 'Linux - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3327, '2019-07-20 18:24:41', 'admin', 'cetak laporan pemasukan barang perdokumen periode 2019-07-01 00:00:00 s/d 2019-07-20 23:59:59', '127.0.0.1', 'Linux - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3328, '2019-07-20 18:49:50', 'admin', 'cetak laporan pengeluaran barang perdokumen periode 2019-07-01 00:00:00 s/d 2019-07-20 23:59:59', '127.0.0.1', 'Linux - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3329, '2019-07-20 18:50:01', 'admin', 'cetak laporan pengeluaran barang perdokumen periode 2019-07-01 00:00:00 s/d 2019-07-20 23:59:59', '127.0.0.1', 'Linux - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3330, '2019-07-20 18:57:36', 'admin', 'tambah pengeluaran material id: 1563623817', '127.0.0.1', 'Linux - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3331, '2019-07-20 19:01:06', 'admin', 'tambah pemasukan hasil produksi id: 1563624041 dari wo DL/0001', '127.0.0.1', 'Linux - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3332, '2019-07-20 19:16:32', 'admin', 'cetak laporan wip  23:59:00', '127.0.0.1', 'Linux - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3333, '2019-07-20 19:17:22', 'admin', 'cetak laporan wip 2019-07-20 23:59:00', '127.0.0.1', 'Linux - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3334, '2019-07-20 19:18:19', 'admin', 'cetak laporan wip 2019-07-20 23:59:00', '127.0.0.1', 'Linux - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3335, '2019-07-20 19:18:23', 'admin', 'download laporan wip 2019-07-20 23:59:00', '127.0.0.1', 'Linux - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3336, '2019-07-20 19:18:48', 'admin', 'cetak laporan wip 2019-07-20 23:59:00', '127.0.0.1', 'Linux - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3337, '2019-07-20 19:38:24', 'admin', 'cetak laporan wip 2019-07-20 23:59:00', '127.0.0.1', 'Linux - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3338, '2019-07-20 19:39:17', 'admin', 'cetak laporan wip 2019-07-20 23:59:00', '127.0.0.1', 'Linux - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3339, '2019-07-20 19:39:38', 'admin', 'cetak laporan wip 2019-07-20 23:59:00', '127.0.0.1', 'Linux - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3340, '2019-07-20 21:42:35', 'admin', 'tambah pengeluaran material id: 1563633728', '127.0.0.1', 'Linux - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3341, '2019-07-20 22:03:43', 'admin', 'success logout', '127.0.0.1', 'Linux - Firefox 67.0');
INSERT INTO `trans_logs` VALUES (3342, '2019-07-22 09:55:23', 'admin', 'add new user lomri', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3343, '2019-07-22 11:07:22', 'admin', 'tambah akun baru nama: Kewajiban Lancar', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3344, '2019-07-22 11:08:15', 'admin', 'tambah akun baru nama: Kewajiban Jangka Panjang', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3345, '2019-07-22 11:08:49', 'admin', 'tambah akun baru nama: Modal Saham', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3346, '2019-07-22 11:09:12', 'admin', 'tambah akun baru nama: Laba Ditahan', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3347, '2019-07-22 11:11:04', 'admin', 'tambah akun baru nama: Penjualan Produk', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3348, '2019-07-22 11:11:20', 'admin', 'tambah akun baru nama: Retur dan Potongan Penjualan', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3349, '2019-07-22 11:11:36', 'admin', 'tambah akun baru nama: Barang Jadi Awal', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3350, '2019-07-22 11:11:51', 'admin', 'tambah akun baru nama: Biaya Produksi', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3351, '2019-07-22 11:12:04', 'admin', 'tambah akun baru nama: Barang Jadi Akhir', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3352, '2019-07-22 11:12:15', 'admin', 'tambah akun baru nama: HPP Lainnya', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3353, '2019-07-22 11:12:29', 'admin', 'tambah akun baru nama: Beban Penjualan dan Pemasaran', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3354, '2019-07-22 11:12:49', 'admin', 'tambah akun baru nama: Beban Adm dan Umum', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3355, '2019-07-22 11:13:03', 'admin', 'tambah akun baru nama: Pendapatan Bunga', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3356, '2019-07-22 11:13:16', 'admin', 'tambah akun baru nama: Pendapatan Sewa', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3357, '2019-07-22 11:13:24', 'admin', 'tambah akun baru nama: Selisih Kurs', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3358, '2019-07-22 11:13:37', 'admin', 'tambah akun baru nama: Beban Bunga', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3359, '2019-07-22 11:13:45', 'admin', 'tambah akun baru nama: Beban Adm Bank', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3360, '2019-07-22 11:13:53', 'admin', 'tambah akun baru nama: Pajak Penghasilan Badan', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3361, '2019-07-22 11:18:57', 'admin', 'edit data akun id: 21', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3362, '2019-07-22 11:19:02', 'admin', 'edit data akun id: 21', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3363, '2019-07-22 11:22:59', 'admin', 'hapus data akun id: 21 kode akun 8.3', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3364, '2019-07-22 11:23:10', 'admin', 'tambah akun baru nama: Pajak Penghasilan Badan', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3365, '2019-07-22 12:19:52', 'admin', 'tambah akun baru nama: Piutang Usaha', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3366, '2019-07-22 12:20:16', 'admin', 'tambah akun baru nama: Persediaan', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3367, '2019-07-22 12:20:32', 'admin', 'tambah akun baru nama: Pembayaran Dimuka', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3368, '2019-07-22 12:20:46', 'admin', 'tambah akun baru nama: Biaya Dibayar Dimuka', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3369, '2019-07-22 12:20:58', 'admin', 'tambah akun baru nama: Uang Muka Pembelian', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3370, '2019-07-22 12:21:07', 'admin', 'tambah akun baru nama: Harta Lancar Lainnya', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3371, '2019-07-22 12:21:20', 'admin', 'tambah akun baru nama: Tanah', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3372, '2019-07-22 12:21:38', 'admin', 'tambah akun baru nama: Nilai Buku Gedung', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3373, '2019-07-22 12:21:51', 'admin', 'tambah akun baru nama: Nilai Buku Mesin', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3374, '2019-07-22 12:22:01', 'admin', 'tambah akun baru nama: Nilai Buku Kendaan', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3375, '2019-07-22 12:25:05', 'admin', 'tambah akun baru nama: Merk Dagang', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3376, '2019-07-22 12:25:19', 'admin', 'tambah akun baru nama: Hak Cipta', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3377, '2019-07-22 12:25:30', 'admin', 'tambah akun baru nama: Goodwill', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3378, '2019-07-22 12:25:44', 'admin', 'tambah akun baru nama: Aktiva Tetap dalam Proses', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3379, '2019-07-22 12:26:58', 'admin', 'hapus data akun id: 3 kode akun 1.3', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3380, '2019-07-22 12:27:04', 'admin', 'tambah akun baru nama: Aktiva Tetap dalam Proses', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3381, '2019-07-22 12:31:32', 'admin', 'tambah akun baru nama: Harta Tidak Berwujud', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3382, '2019-07-22 12:39:33', 'admin', 'tambah akun baru nama: Harta Tidak Berwujud', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3383, '2019-07-22 12:44:45', 'admin', 'edit data akun id: 23', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3384, '2019-07-22 12:44:51', 'admin', 'edit data akun id: 23', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3385, '2019-07-22 12:45:48', 'admin', 'tambah akun baru nama: Kredit Bank', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3386, '2019-07-22 12:46:04', 'admin', 'tambah akun baru nama: Utang Usaha', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3387, '2019-07-22 12:58:04', 'admin', 'tambah akun baru nama: Kas Kecil', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3388, '2019-07-22 13:01:04', 'admin', 'edit data akun id: 44', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3389, '2019-07-22 13:01:14', 'admin', 'hapus data akun id: 44 kode akun 1.1.1.1', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3390, '2019-07-22 13:01:20', 'admin', 'tambah akun baru nama: Kas Kecil', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3391, '2019-07-22 13:01:26', 'admin', 'tambah akun baru nama: Kas IDR', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3392, '2019-07-22 13:01:33', 'admin', 'tambah akun baru nama: Kas USD', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3393, '2019-07-22 13:02:43', 'admin', 'tambah akun baru nama: Kas USD Exchange', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3394, '2019-07-22 13:02:52', 'admin', 'tambah akun baru nama: Undeposited Funds', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3395, '2019-07-22 13:03:07', 'admin', 'tambah akun baru nama: BNI', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3396, '2019-07-22 13:03:12', 'admin', 'tambah akun baru nama: Mandiri', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3397, '2019-07-22 13:03:16', 'admin', 'tambah akun baru nama: BCA', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3398, '2019-07-22 13:04:45', 'admin', 'tambah akun baru nama: Pendpatan Bunga Bank', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3399, '2019-07-22 13:04:56', 'admin', 'tambah akun baru nama: Pajak Bunga Bank', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3400, '2019-07-22 13:07:13', 'admin', 'tambah akun baru nama: Piutang Usaha IDR', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3401, '2019-07-22 13:07:30', 'admin', 'tambah akun baru nama: Piutang Usaha USD', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3402, '2019-07-22 13:07:45', 'admin', 'tambah akun baru nama: Piutang USD Exchange', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3403, '2019-07-22 13:07:54', 'admin', 'tambah akun baru nama: Piutang Usaha Lainnya', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3404, '2019-07-22 13:08:20', 'admin', 'tambah akun baru nama: Persediaan Bahan Baku', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3405, '2019-07-22 13:08:41', 'admin', 'tambah akun baru nama: Persediaan Bahan Penolong', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3406, '2019-07-22 13:08:56', 'admin', 'tambah akun baru nama: Persediaan Bahan WIP', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3407, '2019-07-22 13:09:05', 'admin', 'tambah akun baru nama: Persediaan Barang Jadi', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3408, '2019-07-22 13:09:23', 'admin', 'tambah akun baru nama: Sewa dibayar dimuka', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3409, '2019-07-22 13:09:35', 'admin', 'tambah akun baru nama: Asuransi dibayar dimuka', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3410, '2019-07-22 13:09:51', 'admin', 'tambah akun baru nama: PPN Masukan', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3411, '2019-07-22 13:10:04', 'admin', 'tambah akun baru nama: Pajak 22 dibayar dimuka', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3412, '2019-07-22 13:10:14', 'admin', 'tambah akun baru nama: Pajak 23 dibayar dimuka', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3413, '2019-07-22 13:10:46', 'admin', 'tambah akun baru nama: Pajak 25 dibayar dimuka', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3414, '2019-07-22 13:11:02', 'admin', 'tambah akun baru nama: Uang Muka Pembelian IDR', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3415, '2019-07-22 13:11:17', 'admin', 'tambah akun baru nama: Uang Muka Pembelian USD', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3416, '2019-07-22 13:11:44', 'admin', 'tambah akun baru nama: Gedung Kantor', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3417, '2019-07-22 13:12:13', 'admin', 'tambah akun baru nama: Gedung Pabrik', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3418, '2019-07-22 13:12:38', 'admin', 'tambah akun baru nama: Akumulasi Penyusutan Gedung Kantor', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3419, '2019-07-22 13:12:50', 'admin', 'tambah akun baru nama: Akumulasi Penyusutan Gedung Pabrik', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3420, '2019-07-22 13:13:04', 'admin', 'tambah akun baru nama: Mesin Pabrik', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3421, '2019-07-22 13:13:12', 'admin', 'tambah akun baru nama: Mesin Kantor', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3422, '2019-07-22 13:13:21', 'admin', 'tambah akun baru nama: Akumulasi Penyusutan Mesin Pabrik', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3423, '2019-07-22 13:13:30', 'admin', 'tambah akun baru nama: Akumulasi Penyusutan Mesin Kantor', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3424, '2019-07-22 13:13:45', 'admin', 'tambah akun baru nama: Kendaraan Pabrik', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3425, '2019-07-22 13:13:52', 'admin', 'tambah akun baru nama: Kendaraan Kantor', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3426, '2019-07-22 13:14:01', 'admin', 'tambah akun baru nama: Akumulasi Penyusutan Kendaraan Pabrik', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3427, '2019-07-22 13:14:09', 'admin', 'tambah akun baru nama: Akumulasi Penyusutan Kendaraan Kantor', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3428, '2019-07-22 13:36:23', 'admin', 'tambah akun baru nama: Kartu Kredit Bank BNI', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3429, '2019-07-22 13:36:35', 'admin', 'tambah akun baru nama: Kartu Kredit Bank Mandiri', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3430, '2019-07-22 13:36:42', 'admin', 'tambah akun baru nama: Kartu Kredit Bank BCA', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3431, '2019-07-22 13:36:57', 'admin', 'tambah akun baru nama: Utang Usaha IDR', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3432, '2019-07-22 13:37:01', 'admin', 'tambah akun baru nama: Utang Usaha USD', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3433, '2019-07-22 13:37:13', 'admin', 'tambah akun baru nama: Utang Terima Barang', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3434, '2019-07-22 13:37:24', 'admin', 'tambah akun baru nama: Utang Usaha Lainnya', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3435, '2019-07-22 13:38:14', 'admin', 'tambah akun baru nama: Utang PPN', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3436, '2019-07-22 13:38:26', 'admin', 'tambah akun baru nama: Income Tax Payable', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3437, '2019-07-22 13:38:38', 'admin', 'tambah akun baru nama: Utang Biaya', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3438, '2019-07-22 13:39:00', 'admin', 'tambah akun baru nama: Uang Muka Penjualan', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3439, '2019-07-22 13:39:11', 'admin', 'tambah akun baru nama: Utang Lancar Lainnya', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3440, '2019-07-22 13:42:16', 'admin', 'tambah akun baru nama: PPN Masukan', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3441, '2019-07-22 13:42:26', 'admin', 'tambah akun baru nama: PPN Keluaran', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3442, '2019-07-22 13:42:31', 'admin', 'tambah akun baru nama: Utang PPN', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3443, '2019-07-22 13:42:47', 'admin', 'tambah akun baru nama: Utang PPH 21', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3444, '2019-07-22 13:42:51', 'admin', 'tambah akun baru nama: Utang PPH 22', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3445, '2019-07-22 13:42:54', 'admin', 'tambah akun baru nama: Utang PPH 23', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3446, '2019-07-22 13:43:03', 'admin', 'tambah akun baru nama: Utang PPH 29', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3447, '2019-07-22 13:43:14', 'admin', 'tambah akun baru nama: Utang Pajak Lainnya', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3448, '2019-07-22 13:43:29', 'admin', 'tambah akun baru nama: Utang Gaji dan Upah', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3449, '2019-07-22 13:43:39', 'admin', 'tambah akun baru nama: Utang Iklan', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3450, '2019-07-22 13:43:51', 'admin', 'tambah akun baru nama: Utang Utilitas', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3451, '2019-07-22 13:44:00', 'admin', 'tambah akun baru nama: Utang Biaya Lain-lain', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3452, '2019-07-22 13:44:10', 'admin', 'tambah akun baru nama: Uang Muka Penjualan IDR', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3453, '2019-07-22 13:44:20', 'admin', 'tambah akun baru nama: Uang Muka Penjualan USD', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3454, '2019-07-22 13:44:35', 'admin', 'tambah akun baru nama: Utang Bank', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3455, '2019-07-22 13:44:42', 'admin', 'tambah akun baru nama: Utang Jangka Panjang Lainnya', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3456, '2019-07-22 13:45:46', 'admin', 'tambah akun baru nama: Pendapatan Usaha Lainnya', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3457, '2019-07-22 13:47:15', 'admin', 'tambah akun baru nama: Biaya Bahan Baku', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3458, '2019-07-22 13:47:23', 'admin', 'tambah akun baru nama: Biaya Tenaga Kerja Langsung', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3459, '2019-07-22 13:47:30', 'admin', 'tambah akun baru nama: Biaya Overhead Pabrik', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3460, '2019-07-22 13:47:38', 'admin', 'tambah akun baru nama: Barang dalam proses awal', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3461, '2019-07-22 13:47:45', 'admin', 'tambah akun baru nama: Barang dalam proses akhir', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3462, '2019-07-22 13:47:55', 'admin', 'tambah akun baru nama: HPP Barang Jadi', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3463, '2019-07-22 13:48:03', 'admin', 'tambah akun baru nama: Work In Process (WIP) Barang Jadi', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3464, '2019-07-22 13:48:13', 'admin', 'tambah akun baru nama: HPP Bahan Baku', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3465, '2019-07-22 13:48:19', 'admin', 'tambah akun baru nama: HPP Lainnya', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3466, '2019-07-22 13:48:54', 'admin', 'tambah akun baru nama: Beban Gaji Penjualan', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3467, '2019-07-22 13:49:02', 'admin', 'tambah akun baru nama: Beban Transportasi Penjualan', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3468, '2019-07-22 13:49:10', 'admin', 'tambah akun baru nama: Beban Promosi dan Iklan', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3469, '2019-07-22 13:49:27', 'admin', 'tambah akun baru nama: Beban Marketing Lainnya', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3470, '2019-07-22 13:49:41', 'admin', 'tambah akun baru nama: Gaji Penjualan', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3471, '2019-07-22 13:49:52', 'admin', 'tambah akun baru nama: Komisi dan Bonus Penjualan', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3472, '2019-07-22 13:49:59', 'admin', 'tambah akun baru nama: Gaji Upah Penjualan Lainnya', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3473, '2019-07-22 13:50:10', 'admin', 'tambah akun baru nama: Transportasi Penjualan', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3474, '2019-07-22 13:50:17', 'admin', 'tambah akun baru nama: Entertain Penjualan', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3475, '2019-07-22 13:50:25', 'admin', 'tambah akun baru nama: Negosiasi Penjualan', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3476, '2019-07-22 13:50:33', 'admin', 'tambah akun baru nama: Transportasi Penjualan Lainnya', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3477, '2019-07-22 13:50:43', 'admin', 'tambah akun baru nama: Iklan di Internet', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3478, '2019-07-22 13:50:51', 'admin', 'tambah akun baru nama: Beban Promosi Lainnya', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3479, '2019-07-22 13:51:04', 'admin', 'tambah akun baru nama: Beban Penjualan Lain-lain', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3480, '2019-07-22 13:51:18', 'admin', 'tambah akun baru nama: Beban Gaji Adm dan Umum', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3481, '2019-07-22 13:51:32', 'admin', 'tambah akun baru nama: Beban Transportasi Adm dan Umum', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3482, '2019-07-22 13:51:40', 'admin', 'tambah akun baru nama: Beban Utilitas', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3483, '2019-07-22 13:51:48', 'admin', 'tambah akun baru nama: Beban Adm dan Umum Lainnya', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3484, '2019-07-22 13:51:59', 'admin', 'tambah akun baru nama: Gaji Adm Umum', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3485, '2019-07-22 13:52:07', 'admin', 'tambah akun baru nama: Tunjangan dan Insentif Adm Umum', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3486, '2019-07-22 13:52:14', 'admin', 'tambah akun baru nama: Bonus Adm Umum', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3487, '2019-07-22 13:52:21', 'admin', 'tambah akun baru nama: Gaji Adm dan Umuj Lainnya', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3488, '2019-07-22 13:52:30', 'admin', 'tambah akun baru nama: Transportasi Adm Umum', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3489, '2019-07-22 13:52:36', 'admin', 'tambah akun baru nama: Pemeliharaan', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3490, '2019-07-22 13:52:43', 'admin', 'tambah akun baru nama: Transportasi Umum Lainnya', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3491, '2019-07-22 13:52:53', 'admin', 'tambah akun baru nama: Listrik', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3492, '2019-07-22 13:52:57', 'admin', 'tambah akun baru nama: Telepon', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3493, '2019-07-22 13:53:00', 'admin', 'tambah akun baru nama: Air', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3494, '2019-07-22 13:53:13', 'admin', 'tambah akun baru nama: Internet', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3495, '2019-07-22 13:53:16', 'admin', 'tambah akun baru nama: Beban Utilitas Lainnya', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3496, '2019-07-22 13:53:26', 'admin', 'tambah akun baru nama: Beban Kerugian Piutang', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3497, '2019-07-22 13:53:34', 'admin', 'tambah akun baru nama: Beban Adm Umum Lainnya', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3498, '2019-07-23 09:48:08', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Chrome 75.0.3770.142');
INSERT INTO `trans_logs` VALUES (3499, '2019-07-23 10:00:56', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Chrome 75.0.3770.142');
INSERT INTO `trans_logs` VALUES (3500, '2019-07-23 10:01:19', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Chrome 75.0.3770.142');
INSERT INTO `trans_logs` VALUES (3501, '2019-07-23 10:17:00', 'anonymous', 'try login with username admin and password adminv', '127.0.0.1', 'Windows 7 - Chrome 75.0.3770.142');
INSERT INTO `trans_logs` VALUES (3502, '2019-07-23 10:17:03', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Chrome 75.0.3770.142');
INSERT INTO `trans_logs` VALUES (3503, '2019-07-23 10:26:48', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Internet Explorer 11.0');
INSERT INTO `trans_logs` VALUES (3504, '2019-07-23 10:38:24', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Chrome 75.0.3770.142');
INSERT INTO `trans_logs` VALUES (3505, '2019-07-23 10:42:00', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Chrome 75.0.3770.142');
INSERT INTO `trans_logs` VALUES (3506, '2019-07-23 10:42:05', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Chrome 75.0.3770.142');
INSERT INTO `trans_logs` VALUES (3507, '2019-07-23 11:03:13', 'admin', 'update company information at 2019-07-23 11:03:13', '127.0.0.1', 'Windows 7 - Chrome 75.0.3770.142');
INSERT INTO `trans_logs` VALUES (3508, '2019-07-23 11:03:15', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Chrome 75.0.3770.142');
INSERT INTO `trans_logs` VALUES (3509, '2019-07-23 11:03:19', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Chrome 75.0.3770.142');
INSERT INTO `trans_logs` VALUES (3510, '2019-07-23 11:05:33', 'admin', 'cetak laporan pemasukan barang perdokumen periode 2019-07-23 00:00:00 s/d 2019-07-23 23:59:59', '127.0.0.1', 'Windows 7 - Chrome 75.0.3770.142');
INSERT INTO `trans_logs` VALUES (3511, '2019-07-23 11:09:45', 'admin', 'cetak laporan wip 2019-07-23 23:59:00', '127.0.0.1', 'Windows 7 - Chrome 75.0.3770.142');
INSERT INTO `trans_logs` VALUES (3512, '2019-07-23 15:02:10', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3513, '2019-07-23 15:03:18', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3514, '2019-07-23 15:12:06', 'anonymous', 'success logout', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3515, '2019-07-23 15:12:13', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3516, '2019-07-23 15:15:41', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Chrome 75.0.3770.142');
INSERT INTO `trans_logs` VALUES (3517, '2019-07-23 15:16:00', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3518, '2019-07-23 15:17:41', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3519, '2019-07-23 15:17:45', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Chrome 75.0.3770.142');
INSERT INTO `trans_logs` VALUES (3520, '2019-07-23 15:17:49', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Chrome 75.0.3770.142');
INSERT INTO `trans_logs` VALUES (3521, '2019-07-23 15:17:56', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3522, '2019-07-23 15:18:07', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3523, '2019-07-23 15:19:21', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3524, '2019-07-23 15:20:10', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Chrome 75.0.3770.142');
INSERT INTO `trans_logs` VALUES (3525, '2019-07-23 15:20:14', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Chrome 75.0.3770.142');
INSERT INTO `trans_logs` VALUES (3526, '2019-07-23 15:20:22', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3527, '2019-07-23 15:20:25', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3528, '2019-07-23 15:21:14', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3529, '2019-07-23 15:21:19', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3530, '2019-07-23 15:21:26', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Chrome 75.0.3770.142');
INSERT INTO `trans_logs` VALUES (3531, '2019-07-23 15:21:30', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Chrome 75.0.3770.142');
INSERT INTO `trans_logs` VALUES (3532, '2019-07-23 15:21:36', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Chrome 75.0.3770.142');
INSERT INTO `trans_logs` VALUES (3533, '2019-07-23 15:21:40', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3534, '2019-07-23 15:22:36', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Internet Explorer 11.0');
INSERT INTO `trans_logs` VALUES (3535, '2019-07-23 15:22:52', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Internet Explorer 11.0');
INSERT INTO `trans_logs` VALUES (3536, '2019-07-23 15:23:37', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3537, '2019-07-23 15:23:52', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Chrome 75.0.3770.142');
INSERT INTO `trans_logs` VALUES (3538, '2019-07-23 15:36:14', 'anonymous', 'try direct access to pasien controller', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3539, '2019-07-23 15:36:18', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3540, '2019-07-23 15:36:31', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Chrome 75.0.3770.142');
INSERT INTO `trans_logs` VALUES (3541, '2019-07-23 15:36:40', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Internet Explorer 11.0');
INSERT INTO `trans_logs` VALUES (3542, '2019-07-23 15:39:25', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Internet Explorer 11.0');
INSERT INTO `trans_logs` VALUES (3543, '2019-07-23 15:39:30', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Internet Explorer 11.0');
INSERT INTO `trans_logs` VALUES (3544, '2019-07-23 15:39:37', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Chrome 75.0.3770.142');
INSERT INTO `trans_logs` VALUES (3545, '2019-07-23 15:39:41', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Chrome 75.0.3770.142');
INSERT INTO `trans_logs` VALUES (3546, '2019-07-23 15:39:53', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Chrome 75.0.3770.142');
INSERT INTO `trans_logs` VALUES (3547, '2019-07-23 15:39:57', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Chrome 75.0.3770.142');
INSERT INTO `trans_logs` VALUES (3548, '2019-07-23 15:40:05', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3549, '2019-07-23 15:40:08', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3550, '2019-07-23 15:42:53', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Internet Explorer 11.0');
INSERT INTO `trans_logs` VALUES (3551, '2019-07-23 15:44:10', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Internet Explorer 11.0');
INSERT INTO `trans_logs` VALUES (3552, '2019-07-23 15:45:06', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Internet Explorer 11.0');
INSERT INTO `trans_logs` VALUES (3553, '2019-07-23 15:45:54', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Internet Explorer 11.0');
INSERT INTO `trans_logs` VALUES (3554, '2019-07-23 15:48:18', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Internet Explorer 11.0');
INSERT INTO `trans_logs` VALUES (3555, '2019-07-23 15:51:33', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3556, '2019-07-23 15:51:46', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3557, '2019-07-23 15:52:19', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Chrome 75.0.3770.142');
INSERT INTO `trans_logs` VALUES (3558, '2019-07-23 15:52:42', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Chrome 75.0.3770.142');
INSERT INTO `trans_logs` VALUES (3559, '2019-07-23 15:52:56', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Chrome 75.0.3770.142');
INSERT INTO `trans_logs` VALUES (3560, '2019-07-23 15:53:09', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Chrome 75.0.3770.142');
INSERT INTO `trans_logs` VALUES (3561, '2019-07-23 16:01:59', 'admin', 'update company information at 2019-07-23 16:01:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3562, '2019-07-23 16:02:01', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3563, '2019-07-23 16:02:05', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3564, '2019-07-23 20:28:18', 'admin', 'tambah jurnal umum id: 1563888449 ket Bayar Internet', '127.0.0.1', 'Windows 7 - Chrome 75.0.3770.142');
INSERT INTO `trans_logs` VALUES (3565, '2019-07-23 20:32:18', 'admin', 'update transaksi jurnal id: 1563888449', '127.0.0.1', 'Windows 7 - Chrome 75.0.3770.142');
INSERT INTO `trans_logs` VALUES (3566, '2019-07-23 20:35:26', 'admin', 'delete jurnal id 1563888449 (Bayar Internet Juli 2019)', '127.0.0.1', 'Windows 7 - Chrome 75.0.3770.142');
INSERT INTO `trans_logs` VALUES (3567, '2019-07-23 20:36:32', 'admin', 'tambah jurnal umum id: 1563888948 ket Bayar Internet Bulan Juni 2019', '127.0.0.1', 'Windows 7 - Chrome 75.0.3770.142');
INSERT INTO `trans_logs` VALUES (3568, '2019-07-23 20:40:27', 'admin', 'update transaksi jurnal id: 1563888948', '127.0.0.1', 'Windows 7 - Chrome 75.0.3770.142');
INSERT INTO `trans_logs` VALUES (3569, '2019-07-23 20:51:47', 'admin', 'tambah jurnal umum id: 1563889870 ket Pembayaran jasa Service AC', '127.0.0.1', 'Windows 7 - Chrome 75.0.3770.142');
INSERT INTO `trans_logs` VALUES (3570, '2019-07-23 21:00:58', 'admin', 'tambah jurnal umum id: 1563890422 ket Jasa Service Komputer', '127.0.0.1', 'Windows 7 - Chrome 75.0.3770.142');
INSERT INTO `trans_logs` VALUES (3571, '2019-07-23 21:02:20', 'admin', 'update transaksi jurnal id: 1563890422', '127.0.0.1', 'Windows 7 - Chrome 75.0.3770.142');
INSERT INTO `trans_logs` VALUES (3572, '2019-07-23 21:03:30', 'admin', 'tambah jurnal umum id: 1563890570 ket Penambahan Kas', '127.0.0.1', 'Windows 7 - Chrome 75.0.3770.142');
INSERT INTO `trans_logs` VALUES (3573, '2019-07-23 21:59:45', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Chrome 75.0.3770.142');
INSERT INTO `trans_logs` VALUES (3574, '2019-07-24 09:29:32', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Internet Explorer 11.0');
INSERT INTO `trans_logs` VALUES (3575, '2019-07-24 09:29:58', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Internet Explorer 11.0');
INSERT INTO `trans_logs` VALUES (3576, '2019-07-24 11:51:31', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3577, '2019-07-24 11:51:53', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3578, '2019-07-24 11:55:33', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3579, '2019-07-24 12:27:11', 'admin', 'update group id 1', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3580, '2019-07-24 12:27:14', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3581, '2019-07-24 12:27:18', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3582, '2019-07-24 12:33:43', 'admin', 'update group id 1', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3583, '2019-07-24 12:33:47', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3584, '2019-07-24 12:33:51', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3585, '2019-07-24 12:34:05', 'admin', 'update group id 1', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3586, '2019-07-24 12:34:08', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3587, '2019-07-24 12:34:12', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3588, '2019-07-24 13:02:48', 'admin', 'edit data akun id: 34', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3589, '2019-07-24 13:19:48', 'admin', 'update data mesin kode: MS003', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3590, '2019-07-24 13:22:09', 'admin', 'update data mesin kode: MS003', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3591, '2019-07-24 13:22:42', 'admin', 'update data mesin kode: MS001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3592, '2019-07-24 13:23:14', 'admin', 'update data mesin kode: MS002', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3593, '2019-07-24 14:07:47', 'admin', 'edit data akun id: 30', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3594, '2019-07-24 14:07:58', 'admin', 'tambah akun baru nama: Harta Lancar Lainnya', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3595, '2019-07-24 14:13:54', 'admin', 'tambah jurnal umum id: 1563952098 ket Pembelian ATK Bulan Juni 2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3596, '2019-07-24 14:29:35', 'admin', 'delete pemasukan barang id 1563283370', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3597, '2019-07-26 09:56:01', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3598, '2019-07-26 10:25:14', 'admin', 'tambah pemasukan material id: 1564111473 dari po PO/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3599, '2019-07-26 10:27:44', 'admin', 'tambah pemasukan material id: 1564111633 dari po PO/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3600, '2019-07-26 10:29:57', 'admin', 'tambah pemasukan material id: 1564111768 dari po PO/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3601, '2019-07-26 10:31:13', 'admin', 'delete pemasukan barang id 1564111768', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3602, '2019-07-26 10:37:32', 'admin', 'tambah pemasukan material id: 1564112228 dari po PO/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3603, '2019-07-26 10:39:08', 'admin', 'delete pemasukan barang id 1564112228', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3604, '2019-07-26 10:39:41', 'admin', 'tambah pemasukan material id: 1564112354 dari po PO/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3605, '2019-07-26 10:40:22', 'admin', 'delete pemasukan barang id 1564112354', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3606, '2019-07-26 10:44:38', 'admin', 'tambah pemasukan material id: 1564112655 dari po PO/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3607, '2019-07-26 10:45:18', 'admin', 'delete pemasukan barang id 1564112655', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3608, '2019-07-26 10:45:43', 'admin', 'tambah pemasukan material id: 1564112721 dari po PO/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3609, '2019-07-26 10:46:13', 'admin', 'delete pemasukan barang id 1564112721', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3610, '2019-07-26 10:46:41', 'admin', 'tambah pemasukan material id: 1564112779 dari po PO/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3611, '2019-07-26 10:51:30', 'admin', 'delete pemasukan barang id 1564112779', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3612, '2019-07-26 10:51:48', 'admin', 'tambah pemasukan material id: 1564113099 dari po PO/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3613, '2019-07-26 10:51:59', 'admin', 'delete pemasukan barang id 1564113099', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3614, '2019-07-26 10:52:48', 'admin', 'tambah pemasukan material id: 1564113160 dari po PO/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3615, '2019-07-26 10:53:00', 'admin', 'delete pemasukan barang id 1564113160', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3616, '2019-07-26 11:00:42', 'admin', 'tambah pemasukan material id: 1564113633 dari po PO/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3617, '2019-07-26 11:00:48', 'admin', 'delete pemasukan barang id 1564113633', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3618, '2019-07-26 11:01:21', 'admin', 'tambah pemasukan material id: 1564113674 dari po PO/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3619, '2019-07-26 11:01:28', 'admin', 'delete pemasukan barang id 1564113674', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3620, '2019-07-26 11:02:40', 'admin', 'tambah pemasukan material id: 1564113752 dari po PO/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3621, '2019-07-26 11:02:55', 'admin', 'delete pemasukan barang id 1564113752', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3622, '2019-07-26 11:03:59', 'admin', 'tambah pemasukan material id: 1564113827 dari po PO/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3623, '2019-07-26 11:04:12', 'admin', 'delete pemasukan barang id 1564113827', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3624, '2019-07-26 11:06:21', 'admin', 'tambah pemasukan material id: 1564113974 dari po PO/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3625, '2019-07-26 11:06:30', 'admin', 'delete pemasukan barang id 1564113974', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3626, '2019-07-26 11:08:35', 'admin', 'tambah pemasukan material id: 1564114077 dari po PO/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3627, '2019-07-26 11:11:38', 'admin', 'delete pemasukan barang id 1564114077', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3628, '2019-07-26 11:12:12', 'admin', 'tambah pemasukan material id: 1564114300 dari po PO/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3629, '2019-07-26 15:46:51', 'admin', 'tambah data hutang id: 1564130684 ket PO Outstanding Bulan Lalu', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3630, '2019-07-26 16:01:58', 'admin', 'delete hutang id 1564130684 () No.Reff: PO/MMS/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3631, '2019-07-26 16:03:14', 'admin', 'delete hutang id 1564130684 () No.Reff: PO/MMS/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3632, '2019-07-26 16:04:29', 'admin', 'delete hutang id 1564130684 () No.Reff: PO/MMS/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3633, '2019-07-26 16:05:38', 'admin', 'tambah data hutang id: 1564131872 ket Tes', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3634, '2019-07-26 16:22:09', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3635, '2019-07-27 08:32:05', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3636, '2019-07-27 08:32:21', 'admin', 'delete hutang id 1564114115 () No.Reff: PO/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3637, '2019-07-27 08:32:51', 'admin', 'delete pemasukan barang id 1564114300', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3638, '2019-07-27 08:35:44', 'admin', 'tambah pemasukan material id: 1564191308 dari po PO/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3639, '2019-07-27 09:11:25', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Internet Explorer 11.0');
INSERT INTO `trans_logs` VALUES (3640, '2019-07-27 09:17:55', 'admin', 'update data hutang id: 1564191344 ket Incoming System', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3641, '2019-07-27 09:18:36', 'admin', 'update data hutang id: 1564191344 ket Incoming System', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3642, '2019-07-27 10:14:41', 'admin', 'tambah data hutang id: 1564197126 ket TES', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3643, '2019-07-27 10:18:45', 'admin', 'delete hutang id 1564131872 () No.Reff: PO/HN/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3644, '2019-07-27 10:18:48', 'admin', 'delete hutang id 1564191344 () No.Reff: PO/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3645, '2019-07-27 10:19:03', 'admin', 'update data hutang id: 1564197126 ket TES', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3646, '2019-07-27 10:22:38', 'admin', 'delete pemasukan barang id 1564191308', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3647, '2019-07-27 10:34:41', 'admin', 'tambah pemasukan material id: 1564198447 dari po PO/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3648, '2019-07-27 10:37:17', 'admin', 'delete hutang id 1564198481 () No.Reff: PO/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3649, '2019-07-27 10:37:25', 'admin', 'delete pemasukan barang id 1564198447', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3650, '2019-07-27 10:37:59', 'admin', 'tambah pemasukan material id: 1564198651 dari po PO/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3651, '2019-07-27 11:38:35', 'admin', 'tambah akun baru nama: Biaya Penyusutan & Amoritisasi', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3652, '2019-07-27 11:39:02', 'admin', 'tambah akun baru nama: Biaya Penyusutan Gedung', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3653, '2019-07-27 11:39:12', 'admin', 'tambah akun baru nama: Biaya Penyusutan Kendaraan', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3654, '2019-07-27 11:40:07', 'admin', 'tambah akun baru nama: Biaya Penyusutan Mesin Pabrik', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3655, '2019-07-27 11:40:21', 'admin', 'tambah akun baru nama: Biaya Penyusutan Peralatan Kantor', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3656, '2019-07-27 12:16:22', 'admin', 'update data mesin kode: MS003', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3657, '2019-07-27 12:17:29', 'admin', 'update data mesin kode: MS003', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3658, '2019-07-27 12:21:23', 'admin', 'update data mesin kode: MS003', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3659, '2019-07-27 12:22:33', 'admin', 'update data mesin kode: MS002', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3660, '2019-07-27 12:22:56', 'admin', 'update data mesin kode: MS001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3661, '2019-07-27 12:24:43', 'admin', 'update data mesin kode: MS003', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3662, '2019-07-27 12:24:56', 'admin', 'update data mesin kode: MS003', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3663, '2019-07-27 12:25:02', 'admin', 'update data mesin kode: MS001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3664, '2019-07-27 12:25:08', 'admin', 'update data mesin kode: MS002', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3665, '2019-07-27 12:25:18', 'admin', 'update data mesin kode: MS002', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3666, '2019-07-27 12:25:35', 'admin', 'update data mesin kode: MS003', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3667, '2019-07-27 12:25:39', 'admin', 'update data mesin kode: MS001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3668, '2019-07-27 12:25:44', 'admin', 'update data mesin kode: MS002', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3669, '2019-07-27 12:26:22', 'admin', 'update data mesin kode: MS001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3670, '2019-07-27 12:26:48', 'admin', 'update data mesin kode: MS002', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3671, '2019-07-27 12:37:31', 'admin', 'tambah mesin baru kode: MS004', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3672, '2019-07-27 12:53:15', 'admin', 'update data mesin kode: MS003', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3673, '2019-07-27 12:53:38', 'admin', 'update data mesin kode: MS004', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3674, '2019-07-27 12:53:52', 'admin', 'update data mesin kode: MS002', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3675, '2019-07-27 12:53:56', 'admin', 'update data mesin kode: MS004', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3676, '2019-07-27 12:54:01', 'admin', 'update data mesin kode: MS001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3677, '2019-07-27 12:54:05', 'admin', 'update data mesin kode: MS003', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3678, '2019-07-27 12:54:49', 'admin', 'update data mesin kode: MS004', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3679, '2019-07-27 12:57:02', 'admin', 'update data mesin kode: MS003', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3680, '2019-07-27 12:57:06', 'admin', 'update data mesin kode: MS001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3681, '2019-07-27 12:57:11', 'admin', 'update data mesin kode: MS004', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3682, '2019-07-27 12:57:15', 'admin', 'update data mesin kode: MS002', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3683, '2019-07-27 13:03:21', 'admin', 'update data mesin kode: MS004', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3684, '2019-07-27 13:08:55', 'admin', 'update data mesin kode: MS004', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3685, '2019-07-27 13:09:18', 'admin', 'update data mesin kode: MS004', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3686, '2019-07-27 13:09:41', 'admin', 'update data mesin kode: MS004', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3687, '2019-07-27 13:11:05', 'admin', 'update data mesin kode: MS004', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3688, '2019-07-27 13:11:25', 'admin', 'update data mesin kode: MS003', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3689, '2019-07-27 13:11:30', 'admin', 'update data mesin kode: MS001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3690, '2019-07-27 13:11:39', 'admin', 'update data mesin kode: MS004', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3691, '2019-07-27 13:11:45', 'admin', 'update data mesin kode: MS002', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3692, '2019-07-27 13:31:48', 'admin', 'tambah akun baru nama: Barang Jadi Terkirim', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3693, '2019-07-27 13:32:34', 'admin', 'delete delivery order id 1563590223 nodo DO/OK/004/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3694, '2019-07-27 16:02:39', 'admin', 'tambah aktiva tetap kode: KND0001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3695, '2019-07-27 16:05:12', 'admin', 'tambah aktiva tetap kode: KND001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3696, '2019-07-27 16:16:07', 'admin', 'tambah aktiva tetap kode: KND001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3697, '2019-07-27 16:17:39', 'admin', 'tambah aktiva tetap kode: KDN001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3698, '2019-07-27 17:22:20', 'admin', 'update aktiva tetap kode: KDN001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3699, '2019-07-27 17:23:17', 'admin', 'update aktiva tetap kode: KDN001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3700, '2019-07-27 17:28:06', 'admin', 'disactive aktiva tetap kode KDN001 nama Motor Dinas Marketing', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3701, '2019-07-27 17:33:23', 'admin', 'disactive aktiva tetap kode KDN001 nama Motor Dinas Marketing', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3702, '2019-07-27 19:16:07', 'admin', 'edit data akun id: 50', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3703, '2019-07-27 19:16:13', 'admin', 'edit data akun id: 51', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3704, '2019-07-27 19:16:19', 'admin', 'edit data akun id: 52', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3705, '2019-07-27 23:58:57', 'admin', 'tambah data pembayaran id: 1564246699 ket', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3706, '2019-07-28 00:16:32', 'admin', 'upadate data pembayaran id: 1564246699 ket Invoice: INV/MMS/VII/01/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3707, '2019-07-28 00:19:31', 'admin', 'upadate data pembayaran id: 1564246699 ket Invoice: INV/MMS/VII/01/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3708, '2019-07-28 00:22:46', 'admin', 'update transaksi jurnal id: 1563890422', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3709, '2019-07-28 00:28:50', 'admin', 'delete pembayaran hutang id 1564246699 (PT. Multi Mekanika Serasi) Sebesar: 17500000.00', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3710, '2019-07-28 00:29:59', 'admin', 'tambah data pembayaran id: 1564248574 ket', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3711, '2019-07-28 00:34:31', 'admin', 'upadate data pembayaran id: 1564248574 ket', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3712, '2019-07-28 00:37:30', 'admin', 'tambah data pembayaran id: 1564249003 ket', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3713, '2019-07-28 00:42:55', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3714, '2019-07-28 00:43:36', 'anonymous', 'success logout', '127.0.0.1', 'Windows 7 - Internet Explorer 11.0');
INSERT INTO `trans_logs` VALUES (3715, '2019-07-28 00:43:47', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Internet Explorer 11.0');
INSERT INTO `trans_logs` VALUES (3716, '2019-07-28 00:44:09', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Internet Explorer 11.0');
INSERT INTO `trans_logs` VALUES (3717, '2019-07-28 09:31:24', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3718, '2019-07-28 09:44:25', 'admin', 'hapus data akun id: 159 kode akun 1.1.4.5', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3719, '2019-07-28 09:50:42', 'admin', 'edit data akun id: 58', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3720, '2019-07-28 09:50:47', 'admin', 'tambah akun baru nama: Piutang Usaha Lainnya', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3721, '2019-07-28 09:56:37', 'admin', 'hapus data akun id: 160 kode akun 1.1.3.5', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3722, '2019-07-28 09:56:43', 'admin', 'edit data akun id: 58', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3723, '2019-07-28 09:56:58', 'admin', 'tambah akun baru nama: Barang Jadi Terkirim', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3724, '2019-07-28 10:38:14', 'admin', 'tambah delivery order id: 1564285027 no do DO/01/VII/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3725, '2019-07-28 10:38:58', 'admin', 'delete delivery order id 1564285027 nodo DO/01/VII/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3726, '2019-07-28 10:40:36', 'admin', 'tambah delivery order id: 1564285175 no do DO/VII/005/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3727, '2019-07-28 10:41:34', 'admin', 'delete delivery order id 1564285175 nodo DO/VII/005/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3728, '2019-07-28 10:42:30', 'admin', 'tambah delivery order id: 1564285297 no do DO/VII/002/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3729, '2019-07-28 10:43:33', 'admin', 'update delivery order id: 1564285297 no do DO/VII/002/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3730, '2019-07-28 15:52:55', 'admin', 'tambah data pembayaran id: 1564303556 ket -', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3731, '2019-07-28 16:04:32', 'admin', 'update data invoice id: 1564303556 no OKS/INV/VII/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3732, '2019-07-28 16:05:34', 'admin', 'delete invoice penjualan id 1564303556 (CV. Nuansa Data Abadi) No: OKS/INV/VII/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3733, '2019-07-28 16:30:04', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3734, '2019-07-29 10:22:52', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3735, '2019-07-29 11:50:36', 'admin', 'tambah data invoice id: 1564375764 no OKS/INV/012/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3736, '2019-07-29 14:42:52', 'admin', 'delete pembayaran hutang id 1564249003 (PT. Gunung Garuda Tbk) Sebesar: 6000000.00', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3737, '2019-07-29 14:46:17', 'admin', 'tambah data pembayaran id: 1564386353 ket', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3738, '2019-07-29 14:46:42', 'admin', 'delete pembayaran hutang id 1564248574 (PT. Multi Mekanika Serasi) Sebesar: 17500000.00', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3739, '2019-07-29 14:47:03', 'admin', 'tambah data pembayaran id: 1564386406 ket', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3740, '2019-07-29 14:51:17', 'admin', 'delete pembayaran hutang id 1564386353 (PT. Gunung Garuda Tbk) Sebesar: 6000000.00', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3741, '2019-07-29 20:01:42', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Internet Explorer 11.0');
INSERT INTO `trans_logs` VALUES (3742, '2019-07-29 20:59:30', 'admin', 'tambah data penerimaan id: 1564408599 ket Tes', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3743, '2019-07-29 21:10:31', 'admin', 'upadate data penerimaan id: 1564408599 ket Pembayaran Token', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3744, '2019-07-29 21:17:54', 'admin', 'delete penerimaan pembayaran id 1564408599 (Holiday None) Sebesar: 4875000.00', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3745, '2019-07-29 21:19:01', 'admin', 'tambah data penerimaan id: 1564409902 ket', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3746, '2019-07-29 21:20:11', 'admin', 'upadate data penerimaan id: 1564409902 ket Bayar dimuka', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3747, '2019-07-29 21:20:46', 'admin', 'upadate data pembayaran id: 1564386406 ket Coba', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3748, '2019-07-29 21:35:44', 'admin', 'update group id 1', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3749, '2019-07-29 21:35:47', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3750, '2019-07-29 21:35:51', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3751, '2019-07-29 22:10:57', 'admin', 'try direct access to acc_hutang controller', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3752, '2019-07-29 22:11:02', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3753, '2019-07-29 22:13:18', 'admin', 'try direct access to acc_penerimaan controller', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3754, '2019-07-29 22:13:24', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3755, '2019-07-29 22:13:50', 'admin', 'try direct access to acc_hutang controller', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3756, '2019-07-29 22:14:00', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3757, '2019-07-29 22:18:09', 'admin', 'try direct access to acc_hutang controller', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3758, '2019-07-29 22:18:14', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3759, '2019-07-29 22:18:44', 'admin', 'try direct access to acc_pembayaran controller', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3760, '2019-07-29 22:18:51', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3761, '2019-07-29 22:35:34', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3762, '2019-07-29 22:35:38', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3763, '2019-07-29 22:36:06', 'admin', 'update group id 1', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3764, '2019-07-29 22:36:09', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3765, '2019-07-29 22:36:13', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3766, '2019-07-29 22:36:36', 'admin', 'try direct access to acc_hutang controller', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3767, '2019-07-29 22:36:41', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3768, '2019-07-29 22:36:50', 'admin', 'update group id 1', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3769, '2019-07-29 22:36:53', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3770, '2019-07-29 22:36:57', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3771, '2019-07-30 08:58:23', 'admin', 'delete hutang id 1564197126 () No.Reff: GG/PO/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3772, '2019-07-30 09:33:14', 'admin', 'tambah po baru no: PO/OKS/002/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3773, '2019-07-30 09:36:40', 'admin', 'tambah pemasukan material id: 1564454169 dari po PO/OKS/002/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3774, '2019-07-30 09:37:03', 'admin', 'delete pemasukan barang id 1564454169', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3775, '2019-07-30 09:38:40', 'admin', 'tambah pemasukan material id: 1564454293 dari po PO/OKS/002/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3776, '2019-07-30 12:31:50', 'admin', 'edit data akun id: 58', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3777, '2019-07-30 12:34:43', 'admin', 'tambah akun baru nama: Potongan Pembelian', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3778, '2019-07-30 12:45:16', 'admin', 'tambah data hutang id: 1564465235 ket', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3779, '2019-07-30 12:47:13', 'admin', 'delete hutang id 1564465235 () No.Reff: OKS/PO/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3780, '2019-07-30 12:48:10', 'admin', 'tambah data hutang id: 1564465651 ket -', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3781, '2019-07-30 12:50:43', 'admin', 'delete hutang id 1564465651 () No.Reff: 2121', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3782, '2019-07-30 12:51:13', 'admin', 'tambah data hutang id: 1564465848 ket', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3783, '2019-07-30 12:51:46', 'admin', 'delete hutang id 1564465848 () No.Reff: 45454', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3784, '2019-07-30 12:52:29', 'admin', 'tambah data hutang id: 1564465920 ket', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3785, '2019-07-30 13:01:27', 'admin', 'delete hutang id 1564465920 () No.Reff: 5656', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3786, '2019-07-30 13:02:11', 'admin', 'tambah data hutang id: 1564466489 ket', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3787, '2019-07-30 13:09:22', 'admin', 'tambah data hutang id: 1564466929 ket', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3788, '2019-07-30 13:09:41', 'admin', 'delete hutang id 1564466929 () No.Reff: hyui', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3789, '2019-07-30 13:12:27', 'admin', 'tambah data hutang id: 1564467121 ket', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3790, '2019-07-30 13:12:40', 'admin', 'delete hutang id 1564467121 () No.Reff: tttt', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3791, '2019-07-30 13:13:17', 'admin', 'delete hutang id 1564466489 () No.Reff: 3434', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3792, '2019-07-30 13:13:56', 'admin', 'tambah data hutang id: 1564467205 ket', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3793, '2019-07-30 13:14:31', 'admin', 'tambah data hutang id: 1564467242 ket', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3794, '2019-07-30 13:15:34', 'admin', 'tambah data hutang id: 1564467280 ket', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3795, '2019-07-30 13:22:22', 'admin', 'tambah data hutang id: 1564467470 ket', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3796, '2019-07-30 13:25:18', 'admin', 'delete hutang id 1564467470 () No.Reff: bh0009', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3797, '2019-07-30 13:28:15', 'admin', 'tambah data hutang id: 1564467922 ket', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3798, '2019-07-30 13:30:19', 'admin', 'delete hutang id 1564467922 () No.Reff: 777', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3799, '2019-07-30 13:31:01', 'admin', 'tambah data hutang id: 1564468221 ket', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3800, '2019-07-30 13:39:31', 'admin', 'update data hutang id: 1564467205 ket', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3801, '2019-07-30 13:40:08', 'admin', 'delete pembayaran hutang id 1564386406 (PT. Multi Mekanika Serasi) Sebesar: 17500000.00', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3802, '2019-07-30 13:40:47', 'admin', 'tambah data pembayaran id: 1564468810 ket', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3803, '2019-07-30 13:42:39', 'admin', 'delete pembayaran hutang id 1564468810 (PT. Gunung Garuda Tbk) Sebesar: 500000.00', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3804, '2019-07-30 13:43:35', 'admin', 'tambah data pembayaran id: 1564468971 ket', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3805, '2019-07-30 13:44:07', 'admin', 'delete pembayaran hutang id 1564468971 (PT. Gunung Garuda Tbk) Sebesar: 500000.00', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3806, '2019-07-30 13:52:28', 'admin', 'tambah data pembayaran id: 1564469527 ket', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3807, '2019-07-30 14:16:32', 'admin', 'delete hutang id 1564468221 () No.Reff: 00000', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3808, '2019-07-30 14:16:35', 'admin', 'delete hutang id 1564467280 () No.Reff: 2121212', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3809, '2019-07-30 14:16:37', 'admin', 'delete hutang id 1564467242 () No.Reff: 34567', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3810, '2019-07-30 14:16:40', 'admin', 'delete hutang id 1564467205 () No.Reff: 1111', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3811, '2019-07-30 15:46:37', 'admin', 'tambah data hutang id: 1564476323 ket', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3812, '2019-07-30 15:47:52', 'admin', 'tambah data pembayaran id: 1564476434 ket', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3813, '2019-07-30 15:55:43', 'admin', 'tambah aktiva tetap kode: SP0001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3814, '2019-07-30 15:56:18', 'admin', 'update aktiva tetap kode: SP0001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3815, '2019-07-30 18:46:08', 'admin', 'tambah data invoice id: 1564487108 no INV/OKS/005/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3816, '2019-07-30 20:23:34', 'admin', 'tambah jurnal umum id: 1564492937 ket Tes', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3817, '2019-07-30 20:29:00', 'admin', 'delete jurnal id 1564492937 (Tes)', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3818, '2019-07-30 20:38:01', 'admin', 'delete kas & bank pembayaran  id 1564492937 (Tes) penerima Lomri', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3819, '2019-07-30 20:39:04', 'admin', 'tambah jurnal umum id: 1564493896 ket Benerin Komputer', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3820, '2019-07-30 20:54:19', 'admin', 'update kas & bank Pembayaran id: 1564493896 ket Benerin Komputer Install', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3821, '2019-07-30 20:55:10', 'admin', 'update kas & bank Pembayaran id: 1564493896 ket Benerin Komputer Install', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3822, '2019-07-30 20:55:50', 'admin', 'update kas & bank Pembayaran id: 1564493896 ket Benerin Komputer Install', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3823, '2019-07-30 21:47:40', 'admin', 'tambah penerimaan kas & bank id: 1564498009 ket Penjualan Sampah', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3824, '2019-07-30 21:49:36', 'admin', 'update kas & bank penerimaan id: 1564498009 ket Penjualan Sampah', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3825, '2019-07-30 21:50:03', 'admin', 'delete kas & bank penerimaan  id 1564498009 (Penjualan Sampah) penerima', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3826, '2019-07-30 21:51:12', 'admin', 'tambah penerimaan kas & bank id: 1564498210 ket KOMISI MARKETING', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3827, '2019-07-30 22:05:12', 'admin', 'tambah mesin baru kode: msk001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3828, '2019-07-30 22:24:08', 'admin', 'update data mesin kode: MS001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3829, '2019-07-30 22:38:26', 'admin', 'update aktiva tetap kode: KND001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3830, '2019-07-30 22:38:47', 'admin', 'update aktiva tetap kode: KDN001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3831, '2019-07-30 22:38:55', 'admin', 'update aktiva tetap kode: SP0001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3832, '2019-07-30 22:57:01', 'admin', 'tambah aktiva tetap kode: ML001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3833, '2019-07-30 23:00:55', 'admin', 'hapus stock opname mesin nomor :20190700001 tanggal : 2019-07-20 14:17:13', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3834, '2019-07-30 23:01:00', 'admin', 'proses stock opname mesin tanggal :2019-07-30 23:00:56', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3835, '2019-07-30 23:18:07', 'admin', 'update aktiva tetap kode: ML001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3836, '2019-07-30 23:18:23', 'admin', 'update aktiva tetap kode: ML001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3837, '2019-07-30 23:19:26', 'admin', 'update aktiva tetap kode: ML001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3838, '2019-07-30 23:19:49', 'admin', 'update aktiva tetap kode: KND001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3839, '2019-07-30 23:19:59', 'admin', 'update aktiva tetap kode: KDN001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3840, '2019-07-30 23:20:07', 'admin', 'update aktiva tetap kode: SP0001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3841, '2019-07-30 23:24:43', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3842, '2019-07-31 09:17:24', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3843, '2019-07-31 10:09:57', 'admin', 'edit data akun id: 96', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3844, '2019-07-31 10:10:03', 'admin', 'edit data akun id: 95', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3845, '2019-07-31 12:18:02', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3846, '2019-07-31 12:33:43', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3847, '2019-07-31 15:43:59', 'admin', 'hapus data akun id: 30 kode akun 1.1.8', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3848, '2019-07-31 15:44:10', 'admin', 'tambah akun baru nama: ATK & Perlengkapan Kantor', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3849, '2019-07-31 21:03:03', 'admin', 'tambah akun baru nama: AKTIVA LANCAR', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3850, '2019-07-31 21:03:11', 'admin', 'tambah akun baru nama: AKTIVA TETAP', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3851, '2019-07-31 21:03:40', 'admin', 'tambah akun baru nama: KEWAJIBAN LANCAR', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3852, '2019-07-31 21:03:49', 'admin', 'tambah akun baru nama: KEWAJIBAN JANGKA PANJANG', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3853, '2019-07-31 21:04:14', 'admin', 'tambah akun baru nama: Modal Saham', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3854, '2019-07-31 21:04:20', 'admin', 'tambah akun baru nama: Laba Ditahan', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3855, '2019-07-31 21:04:44', 'admin', 'tambah akun baru nama: Penjualan Barang', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3856, '2019-07-31 21:05:00', 'admin', 'tambah akun baru nama: Retur Penjualan Barang', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3857, '2019-07-31 21:07:28', 'admin', 'tambah akun baru nama: Kas Kecil', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3858, '2019-07-31 21:16:06', 'admin', 'edit data akun id: 172', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3859, '2019-07-31 21:16:13', 'admin', 'tambah akun baru nama: Kas Kecil', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3860, '2019-07-31 21:16:19', 'admin', 'tambah akun baru nama: Kas Besar', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3861, '2019-07-31 21:16:44', 'admin', 'tambah akun baru nama: Bank BCA', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3862, '2019-07-31 21:16:50', 'admin', 'tambah akun baru nama: Bank BNI', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3863, '2019-07-31 21:16:58', 'admin', 'tambah akun baru nama: Bank Mandiri', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3864, '2019-07-31 21:17:18', 'admin', 'tambah akun baru nama: Piutang', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3865, '2019-07-31 21:17:27', 'admin', 'hapus data akun id: 178 kode akun 1.1.1.6', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3866, '2019-07-31 21:17:37', 'admin', 'tambah akun baru nama: Piutang', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3867, '2019-07-31 21:17:54', 'admin', 'tambah akun baru nama: Piutang Dagang', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3868, '2019-07-31 21:18:07', 'admin', 'tambah akun baru nama: Cadangan Kerugian Piutang', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3869, '2019-07-31 21:18:15', 'admin', 'tambah akun baru nama: Piutang Karyawan', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3870, '2019-07-31 21:18:39', 'admin', 'tambah akun baru nama: Persediaan', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3871, '2019-07-31 21:19:02', 'admin', 'tambah akun baru nama: Persediaan Barang Jadi', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3872, '2019-07-31 21:19:11', 'admin', 'tambah akun baru nama: Persediaan Barang dalam Proses', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3873, '2019-07-31 21:19:31', 'admin', 'tambah akun baru nama: Persediaan Bahan Baku', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3874, '2019-07-31 21:19:46', 'admin', 'tambah akun baru nama: Persediaan Bahan Penolong', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3875, '2019-07-31 21:20:01', 'admin', 'tambah akun baru nama: Persediaan Sparepart', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3876, '2019-07-31 21:20:35', 'admin', 'tambah akun baru nama: Asuransi Dibayar Dimuka', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3877, '2019-07-31 21:20:53', 'admin', 'tambah akun baru nama: Tanah', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3878, '2019-07-31 21:21:07', 'admin', 'tambah akun baru nama: Bangunan', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3879, '2019-07-31 21:21:12', 'admin', 'tambah akun baru nama: Mesin', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3880, '2019-07-31 21:21:24', 'admin', 'tambah akun baru nama: Kendaraan', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3881, '2019-07-31 21:21:40', 'admin', 'tambah akun baru nama: Peralatan Kantor', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3882, '2019-07-31 21:25:42', 'admin', 'tambah akun baru nama: Akum. Penyusutan Bangunan', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3883, '2019-07-31 21:25:56', 'admin', 'tambah akun baru nama: Akum. Penyusutan Mesin', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3884, '2019-07-31 21:26:06', 'admin', 'tambah akun baru nama: Akum. Penyusutan Kendaraan', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3885, '2019-07-31 21:26:17', 'admin', 'tambah akun baru nama: Akum. Penyusutan Peralatan Kantor', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3886, '2019-07-31 21:26:58', 'admin', 'tambah akun baru nama: AKTIVA TIDAK BERWUJUD', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3887, '2019-07-31 21:27:15', 'admin', 'tambah akun baru nama: Merk Dagang', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3888, '2019-07-31 21:27:24', 'admin', 'tambah akun baru nama: Hak Cipta', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3889, '2019-07-31 21:27:40', 'admin', 'tambah akun baru nama: Goodwill', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3890, '2019-07-31 21:27:54', 'admin', 'tambah akun baru nama: Aktiva Tetap dalam Proses', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3891, '2019-07-31 21:28:39', 'admin', 'tambah akun baru nama: Hutang Dagang', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3892, '2019-07-31 21:28:49', 'admin', 'tambah akun baru nama: PPN Keluaran', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3893, '2019-07-31 21:28:58', 'admin', 'tambah akun baru nama: PPN Masukan', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3894, '2019-07-31 21:29:08', 'admin', 'tambah akun baru nama: Hutang Lancar Lainnya', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3895, '2019-07-31 21:29:20', 'admin', 'tambah akun baru nama: Hutang Jangka Panjang', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3896, '2019-07-31 21:29:54', 'admin', 'tambah akun baru nama: Pemakaian Bahan Baku', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3897, '2019-07-31 21:30:03', 'admin', 'tambah akun baru nama: Tenaga Kerja Langsung', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3898, '2019-07-31 21:30:11', 'admin', 'tambah akun baru nama: Biaya Overhead Pabrik', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3899, '2019-07-31 21:31:35', 'admin', 'edit data akun id: 204', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3900, '2019-07-31 21:31:53', 'admin', 'edit data akun id: 207', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3901, '2019-07-31 21:31:58', 'admin', 'tambah akun baru nama: Hutang Lancar Lainnya', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3902, '2019-07-31 21:32:47', 'admin', 'tambah akun baru nama: Persediaan Awal Barang dalam Proses', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3903, '2019-07-31 21:35:03', 'admin', 'tambah akun baru nama: Persediaan Akhir Barang dalam Proses', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3904, '2019-07-31 21:35:11', 'admin', 'tambah akun baru nama: Persediaan Awal Barang Jadi', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3905, '2019-07-31 21:35:19', 'admin', 'tambah akun baru nama: Persediaan Akhir Barang Jadi', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3906, '2019-07-31 21:36:44', 'admin', 'tambah akun baru nama: Gaji', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3907, '2019-07-31 21:36:51', 'admin', 'tambah akun baru nama: Alat Tulis Kantor', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3908, '2019-07-31 21:37:04', 'admin', 'tambah akun baru nama: Transport / Perjalanan Dinas', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3909, '2019-07-31 21:37:25', 'admin', 'tambah akun baru nama: Listrik, Telpon & Internet', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3910, '2019-07-31 21:39:11', 'admin', 'edit data akun id: 220', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3911, '2019-07-31 21:39:18', 'admin', 'tambah akun baru nama: Biaya Internet', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3912, '2019-07-31 21:39:26', 'admin', 'tambah akun baru nama: Biaya Penyusutan', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3913, '2019-07-31 21:39:32', 'admin', 'tambah akun baru nama: Biaya Sewa', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3914, '2019-07-31 21:39:41', 'admin', 'tambah akun baru nama: Biaya Penjualan & Pemasaran', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3915, '2019-07-31 21:40:43', 'admin', 'tambah akun baru nama: Biaya Usaha Lainnya', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3916, '2019-07-31 21:41:47', 'admin', 'tambah akun baru nama: Tes', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3917, '2019-07-31 21:41:54', 'admin', 'hapus data akun id: 226 kode akun 6.10', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3918, '2019-07-31 21:43:32', 'admin', 'hapus data akun id: 225 kode akun 6.9', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3919, '2019-07-31 21:43:34', 'admin', 'hapus data akun id: 224 kode akun 6.8', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3920, '2019-07-31 21:43:36', 'admin', 'hapus data akun id: 223 kode akun 6.7', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3921, '2019-07-31 21:43:39', 'admin', 'hapus data akun id: 222 kode akun 6.6', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3922, '2019-07-31 21:43:41', 'admin', 'hapus data akun id: 221 kode akun 6.5', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3923, '2019-07-31 21:43:43', 'admin', 'hapus data akun id: 220 kode akun 6.4', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3924, '2019-07-31 21:43:45', 'admin', 'hapus data akun id: 219 kode akun 6.3', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3925, '2019-07-31 21:43:47', 'admin', 'hapus data akun id: 218 kode akun 6.2', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3926, '2019-07-31 21:45:00', 'admin', 'edit data akun id: 217', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3927, '2019-07-31 21:45:16', 'admin', 'tambah akun baru nama: Alat Tulis Kantor', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3928, '2019-07-31 21:45:24', 'admin', 'tambah akun baru nama: Transport / Perjalanan Dinas', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3929, '2019-07-31 21:45:47', 'admin', 'tambah akun baru nama: Biaya Utilitas', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3930, '2019-07-31 21:46:06', 'admin', 'tambah akun baru nama: Listrik', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3931, '2019-07-31 21:46:15', 'admin', 'tambah akun baru nama: Telepon', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3932, '2019-07-31 21:46:34', 'admin', 'tambah akun baru nama: Internet', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3933, '2019-07-31 21:46:50', 'admin', 'tambah akun baru nama: Biaya Penyusutan', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3934, '2019-07-31 21:46:58', 'admin', 'tambah akun baru nama: Biaya Sewa', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3935, '2019-07-31 21:47:12', 'admin', 'tambah akun baru nama: Biaya Penjualan & Pemasaran', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3936, '2019-07-31 21:47:22', 'admin', 'tambah akun baru nama: Biaya Usaha Lainnya', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3937, '2019-07-31 21:47:36', 'admin', 'tambah akun baru nama: Pendapatan Lain-lain Diluar Usaha', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3938, '2019-07-31 21:47:44', 'admin', 'tambah akun baru nama: Biaya Lain-lain Diluar Usaha', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3939, '2019-07-31 21:55:09', 'admin', 'tambah akun baru nama: Barang Jadi Terkirim', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3940, '2019-07-31 22:01:08', 'admin', 'tambah jurnal umum id: 1564585119 ket Modal Awal', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3941, '2019-07-31 22:03:50', 'admin', 'tambah pemasukan material id: 1564585386 dari po PO/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3942, '2019-07-31 22:04:36', 'admin', 'tambah pemasukan material id: 1564585435 dari po PO/OKS/002/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3943, '2019-07-31 22:11:54', 'admin', 'tambah akun baru nama: Biaya Pemeliharaan', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3944, '2019-07-31 22:12:50', 'admin', 'hapus data akun id: 240 kode akun 6.9', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3945, '2019-07-31 22:13:06', 'admin', 'edit data akun id: 217', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3946, '2019-07-31 22:13:26', 'admin', 'edit data akun id: 217', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3947, '2019-07-31 22:14:28', 'admin', 'tambah akun baru nama: Biaya Penyusutan Mesin', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3948, '2019-07-31 22:14:45', 'admin', 'edit data akun id: 241', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3949, '2019-07-31 22:14:52', 'admin', 'tambah akun baru nama: Biaya Penyusutan Mesin', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3950, '2019-07-31 22:15:01', 'admin', 'tambah akun baru nama: Biaya Penyusutan Kendaraan', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3951, '2019-07-31 22:15:12', 'admin', 'tambah akun baru nama: Biaya Penyusutan Peralatan Kantor', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3952, '2019-07-31 22:16:56', 'admin', 'edit data akun id: 234', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3953, '2019-07-31 22:17:06', 'admin', 'tambah akun baru nama: Pemeliharaan Gedung', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3954, '2019-07-31 22:17:33', 'admin', 'tambah akun baru nama: Pemeliharaan Mesin', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3955, '2019-07-31 22:17:38', 'admin', 'tambah akun baru nama: Pemeliharaan Kendaraan', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3956, '2019-07-31 22:17:49', 'admin', 'tambah akun baru nama: Pemeliharaan Peralatan Kantor', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3957, '2019-07-31 22:23:15', 'admin', 'tambah pembayaran kas & bank id: 1564586359 ket', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3958, '2019-07-31 22:24:06', 'admin', 'edit data akun id: 205', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3959, '2019-07-31 22:24:18', 'admin', 'tambah akun baru nama: Hutang PPN Masukan', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3960, '2019-07-31 22:24:35', 'admin', 'tambah akun baru nama: Hutang PPN Keluaran', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3961, '2019-07-31 22:24:59', 'admin', 'edit data akun id: 206', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3962, '2019-07-31 22:25:13', 'admin', 'tambah akun baru nama: Hutang PPH 21', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3963, '2019-07-31 22:25:24', 'admin', 'tambah akun baru nama: Hutang PPH 22', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3964, '2019-07-31 22:25:30', 'admin', 'tambah akun baru nama: Hutang PPH 23', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3965, '2019-07-31 22:25:35', 'admin', 'tambah akun baru nama: Hutang PPH 29', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3966, '2019-07-31 22:27:03', 'admin', 'delete kas & bank pembayaran  id 1564586359 () penerima Pak Lomri', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3967, '2019-07-31 22:28:27', 'admin', 'tambah jurnal umum id: 1564586836 ket Install Komputer', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3968, '2019-07-31 22:34:31', 'admin', 'update transaksi jurnal id: 1564586836', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3969, '2019-07-31 22:37:18', 'admin', 'update transaksi jurnal id: 1564586836', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3970, '2019-07-31 23:14:38', 'admin', 'tambah data hutang id: 1564589636 ket', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3971, '2019-07-31 23:17:48', 'admin', 'tambah data pembayaran id: 1564589844 ket', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3972, '2019-07-31 23:31:00', 'admin', 'tambah akun baru nama: Potongan Pembelian', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3973, '2019-07-31 23:55:18', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3974, '2019-08-01 08:18:12', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3975, '2019-08-01 09:43:58', 'admin', 'insert setting default akun', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3976, '2019-08-01 09:48:29', 'admin', 'insert setting default akun', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3977, '2019-08-01 09:53:19', 'admin', 'tambah akun baru nama: Potongan Penjualan', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3978, '2019-08-01 09:53:48', 'admin', 'insert setting default akun', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3979, '2019-08-01 10:06:50', 'admin', 'insert setting default akun', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3980, '2019-08-01 10:07:07', 'admin', 'edit data akun id: 180', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3981, '2019-08-01 10:07:42', 'admin', 'insert setting default akun', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3982, '2019-08-01 10:32:35', 'admin', 'edit data akun id: 170', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3983, '2019-08-01 10:32:45', 'admin', 'edit data akun id: 171', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3984, '2019-08-01 10:33:14', 'admin', 'insert setting default akun', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3985, '2019-08-01 10:40:34', 'admin', 'tambah delivery order id: 1564630768 no do PL/001/VIII/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3986, '2019-08-01 10:48:32', 'admin', 'tambah jurnal umum id: 1564631260 ket Tes Persediaan Barang Jadi', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3987, '2019-08-01 10:51:11', 'admin', 'tambah data invoice id: 1564631425 no INV/OKS/VIII/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3988, '2019-08-01 10:55:34', 'admin', 'delete invoice penjualan id 1564631425 (Holiday None) No: INV/OKS/VIII/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3989, '2019-08-01 10:56:17', 'admin', 'tambah data invoice id: 1564631741 no OKS/INV/VIII/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3990, '2019-08-01 10:56:45', 'admin', 'update data invoice id: 1564631741 no OKS/INV/VIII/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3991, '2019-08-01 10:59:54', 'admin', 'tambah data hutang id: 1564631919 ket', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3992, '2019-08-01 11:00:18', 'admin', 'update data hutang id: 1564631919 ket', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3993, '2019-08-01 11:00:38', 'admin', 'update data hutang id: 1564631919 ket', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3994, '2019-08-01 11:01:57', 'admin', 'tambah data pembayaran id: 1564632092 ket', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3995, '2019-08-02 13:31:46', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3996, '2019-08-03 19:17:21', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3997, '2019-08-04 01:03:50', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3998, '2019-08-06 08:54:52', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (3999, '2019-08-06 08:56:15', 'admin', 'edit data akun id: 185', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4000, '2019-08-06 10:49:06', 'admin', 'update data material kode: MT003', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4001, '2019-08-06 10:49:55', 'admin', 'tambah material baru kode: BP0001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4002, '2019-08-06 10:50:06', 'admin', 'update data material kode: MT002', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4003, '2019-08-06 10:51:06', 'admin', 'tambah material baru kode: BP002', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4004, '2019-08-06 10:51:44', 'admin', 'tambah material baru kode: SP001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4005, '2019-08-06 11:29:03', 'admin', 'tambah po baru no: NEW/PO/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4006, '2019-08-06 11:29:26', 'admin', 'tambah pemasukan material id: 1565065750 dari po NEW/PO/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4007, '2019-08-06 11:31:00', 'admin', 'delete pemasukan barang id 1565065750', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4008, '2019-08-06 11:35:00', 'admin', 'tambah pemasukan material id: 1565066083 dari po NEW/PO/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4009, '2019-08-06 11:36:42', 'admin', 'update data pemasukan material id: 1565066083', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4010, '2019-08-06 11:37:01', 'admin', 'tambah pemasukan material id: 1565066214 dari po NEW/PO/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4011, '2019-08-06 11:39:33', 'admin', 'delete pemasukan barang id 1565066214', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4012, '2019-08-06 11:39:36', 'admin', 'delete pemasukan barang id 1565066083', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4013, '2019-08-06 11:39:44', 'admin', 'tambah pemasukan material id: 1565066378 dari po NEW/PO/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4014, '2019-08-06 11:54:21', 'admin', 'delete jurnal id 1564631260 (Tes Persediaan Barang Jadi)', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4015, '2019-08-06 11:55:41', 'admin', 'tambah jurnal umum id: 1565067301 ket Tes WIP', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4016, '2019-08-06 11:57:14', 'admin', 'tambah jurnal umum id: 1565067397 ket Tes', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4017, '2019-08-06 12:09:22', 'admin', 'tambah pengeluaran material id: 1565068119', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4018, '2019-08-06 12:10:18', 'admin', 'update data pengeluaran material id: 1565068119', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4019, '2019-08-06 12:28:20', 'admin', 'tambah wo baru nomor : NDA001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4020, '2019-08-06 14:23:29', 'admin', 'tambah pemasukan hasil produksi id: 1565076194 dari wo DL/0001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4021, '2019-08-06 14:24:49', 'admin', 'update data hasil produksi id: 1565076194 kode produksi PR/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4022, '2019-08-06 20:24:47', 'admin', 'edit data akun id: 209', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4023, '2019-08-06 20:25:02', 'admin', 'edit data akun id: 210', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4024, '2019-08-06 20:25:22', 'admin', 'edit data akun id: 211', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4025, '2019-08-06 20:25:38', 'admin', 'edit data akun id: 213', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4026, '2019-08-06 20:25:42', 'admin', 'hapus data akun id: 214 kode akun 5.5', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4027, '2019-08-06 20:25:45', 'admin', 'hapus data akun id: 216 kode akun 5.7', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4028, '2019-08-06 20:25:48', 'admin', 'hapus data akun id: 215 kode akun 5.6', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4029, '2019-08-06 20:26:05', 'admin', 'tambah akun baru nama: Biaya Bahan Baku', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4030, '2019-08-06 20:26:16', 'admin', 'tambah akun baru nama: Biaya Tenaga Kerja Langsung', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4031, '2019-08-06 20:26:25', 'admin', 'tambah akun baru nama: Biaya Overhead Pabrik', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4032, '2019-08-06 20:26:50', 'admin', 'tambah akun baru nama: Barang Dalam Proses Awal', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4033, '2019-08-06 20:27:09', 'admin', 'tambah akun baru nama: Barang Dalam Proses Akhir', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4034, '2019-08-06 20:27:27', 'admin', 'tambah akun baru nama: HPP Barang Jadi', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4035, '2019-08-06 20:27:41', 'admin', 'tambah akun baru nama: Work In Process (WIP) Barang Jadi', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4036, '2019-08-06 20:27:54', 'admin', 'tambah akun baru nama: HPP Bahan Baku', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4037, '2019-08-06 20:28:08', 'admin', 'tambah akun baru nama: HPP Lainnya', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4038, '2019-08-06 20:43:37', 'admin', 'update data pengeluaran material id: 1565068119', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4039, '2019-08-06 20:44:28', 'admin', 'update data pengeluaran material id: 1565068119', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4040, '2019-08-06 21:19:33', 'admin', 'edit data akun id: 257', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4041, '2019-08-06 21:37:33', 'admin', 'edit data akun id: 257', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4042, '2019-08-06 21:38:03', 'admin', 'insert setting default akun', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4043, '2019-08-06 21:45:53', 'admin', 'update data pengeluaran material id: 1565068119', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4044, '2019-08-06 23:09:09', 'admin', 'tambah data invoice id: 1565107706 no INV/VIII/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4045, '2019-08-06 23:12:31', 'admin', 'tambah jurnal umum id: 1565107870 ket Retur barang x rusak', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4046, '2019-08-06 23:23:22', 'admin', 'edit data akun id: 209', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4047, '2019-08-06 23:23:31', 'admin', 'edit data akun id: 211', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4048, '2019-08-06 23:38:52', 'admin', 'tambah jurnal umum id: 1565109461 ket Biaya Listrik', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4049, '2019-08-06 23:50:09', 'admin', 'tambah jurnal umum id: 1565110168 ket Fee Wartawan', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4050, '2019-08-06 23:52:02', 'admin', 'update transaksi jurnal id: 1565110168', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4051, '2019-08-06 23:57:24', 'admin', 'tambah jurnal umum id: 1565110577 ket Uang Scrap', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4052, '2019-08-06 23:59:51', 'admin', 'delete jurnal id 1565110577 (Uang Scrap)', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4053, '2019-08-07 00:04:36', 'admin', 'tambah jurnal umum id: 1565111039 ket Penjualan Scrap', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4054, '2019-08-07 00:06:10', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4055, '2019-08-07 13:00:12', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4056, '2019-08-07 13:40:47', 'admin', 'update group id 1', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4057, '2019-08-07 13:41:00', 'admin', 'update group id 1', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4058, '2019-08-07 13:41:26', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4059, '2019-08-07 13:41:29', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4060, '2019-08-07 13:45:39', 'admin', 'update group id 1', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4061, '2019-08-07 13:45:45', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4062, '2019-08-07 13:45:49', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4063, '2019-08-07 16:14:47', 'admin', 'update supplier data id: SUP002', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4064, '2019-08-07 16:15:51', 'admin', 'update supplier data id: SUP001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4065, '2019-08-07 16:18:27', 'admin', 'update customer data id: CR002', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4066, '2019-08-07 16:19:58', 'admin', 'update customer data id: CR002', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4067, '2019-08-07 16:21:34', 'admin', 'update customer data id: CR002', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4068, '2019-08-07 16:21:46', 'admin', 'update customer data id: NDS001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4069, '2019-08-07 16:21:56', 'admin', 'update customer data id: CR001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4070, '2019-08-07 18:31:11', 'admin', 'tambah satuan baru kode: UN01', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4071, '2019-08-07 18:31:19', 'admin', 'tambah satuan baru kode: UN02', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4072, '2019-08-07 18:31:26', 'admin', 'tambah satuan baru kode: UN03', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4073, '2019-08-07 18:31:31', 'admin', 'tambah satuan baru kode: UN04', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4074, '2019-08-07 18:31:35', 'admin', 'tambah satuan baru kode: UN05', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4075, '2019-08-07 18:31:42', 'admin', 'tambah satuan baru kode: UN06', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4076, '2019-08-07 18:53:18', 'admin', 'tambah material baru kode: MK0001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4077, '2019-08-07 18:55:16', 'admin', 'update data material kode: MK0001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4078, '2019-08-07 18:56:55', 'admin', 'tambah material baru kode: MK0002', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4079, '2019-08-07 19:03:06', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4080, '2019-08-07 19:03:58', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4081, '2019-08-07 19:21:20', 'admin', 'update data barang kode: BR001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4082, '2019-08-07 19:21:32', 'admin', 'update data barang kode: BR003', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4083, '2019-08-07 19:21:40', 'admin', 'update data barang kode: BR002', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4084, '2019-08-07 19:25:26', 'admin', 'update data scrap kode: SC002', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4085, '2019-08-07 19:32:29', 'admin', 'insert setting default akun', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4086, '2019-08-07 19:35:29', 'admin', 'tambah barang baru kode: BA0001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4087, '2019-08-07 19:36:13', 'admin', 'tambah barang baru kode: BA0002', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4088, '2019-08-07 19:37:44', 'admin', 'tambah satuan baru kode: UN07', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4089, '2019-08-07 19:38:58', 'admin', 'tambah material baru kode: BP0001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4090, '2019-08-07 19:40:25', 'admin', 'tambah material baru kode: BP0002', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4091, '2019-08-07 19:42:17', 'admin', 'update group id 1', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4092, '2019-08-07 19:45:20', 'admin', 'update group id 1', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4093, '2019-08-07 19:45:23', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4094, '2019-08-07 19:45:27', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4095, '2019-08-07 20:24:32', 'admin', 'addd new supplier id: CHN001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4096, '2019-08-07 20:46:15', 'admin', 'tambah po baru no: PO/DS/VIII/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4097, '2019-08-07 20:55:17', 'admin', 'update data purchase order no : PO/DS/VIII/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4098, '2019-08-07 21:02:57', 'admin', 'tambah po baru no: PO/DS/VIII/002/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4099, '2019-08-07 21:40:40', 'admin', 'tambah pemasukan material id: 1565188767 dari po PO/DS/VIII/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4100, '2019-08-07 21:45:07', 'admin', 'tambah pemasukan material id: 1565189082 dari po PO/DS/VIII/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4101, '2019-08-07 21:46:14', 'admin', 'update data pemasukan material id: 1565189082', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4102, '2019-08-07 22:29:53', 'admin', 'tambah akun baru nama: Hutang Usaha IDR', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4103, '2019-08-07 22:30:02', 'admin', 'tambah akun baru nama: Hutang Usaha USD', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4104, '2019-08-07 22:32:03', 'admin', 'edit data akun id: 180', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4105, '2019-08-07 22:32:20', 'admin', 'edit data akun id: 181', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4106, '2019-08-07 22:32:28', 'admin', 'edit data akun id: 181', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4107, '2019-08-07 22:38:32', 'admin', 'tambah data hutang id: 1565192006 ket', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4108, '2019-08-07 22:41:32', 'admin', 'delete hutang id 1565192006 () No.Reff: -', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4109, '2019-08-07 22:58:47', 'admin', 'tambah data hutang id: 1565193486 ket', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4110, '2019-08-07 23:01:54', 'admin', 'update data hutang id: 1565193486 ket Tes', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4111, '2019-08-07 23:04:07', 'admin', 'update data pemasukan material id: 1565189082', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4112, '2019-08-07 23:18:10', 'admin', 'delete hutang id 1565193486 () No.Reff: PO/DS/VIII/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4113, '2019-08-07 23:18:21', 'admin', 'delete pemasukan barang id 1565189082', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4114, '2019-08-07 23:50:02', 'admin', 'tambah pemasukan material id: 1565196539 dari po PO/DS/VIII/002/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4115, '2019-08-07 23:52:15', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4116, '2019-08-08 06:06:17', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4117, '2019-08-08 06:47:41', 'admin', 'update data pemasukan material id: 1565196539', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4118, '2019-08-08 06:50:20', 'admin', 'tambah pemasukan material id: 1565221799 dari po PO/DS/VIII/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4119, '2019-08-08 08:48:34', 'admin', 'update data pemasukan material id: 1565221799', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4120, '2019-08-08 08:52:53', 'admin', 'tambah data hutang id: 1565229128 ket', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4121, '2019-08-08 09:08:25', 'admin', 'tambah data hutang id: 1565230081 ket', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4122, '2019-08-08 09:09:53', 'admin', 'tambah data pembayaran id: 1565230113 ket', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4123, '2019-08-08 09:14:34', 'admin', 'tambah jurnal umum id: 1565230432 ket Prive', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4124, '2019-08-08 09:14:50', 'admin', 'update transaksi jurnal id: 1565230432', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4125, '2019-08-08 09:21:33', 'admin', 'delete jurnal id 1565230432 (Prive Lomri)', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4126, '2019-08-08 09:22:09', 'admin', 'delete pembayaran hutang id 1565230113 (PT. Multi Mekanika Serasi) Sebesar: 240000.00', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4127, '2019-08-08 09:22:17', 'admin', 'delete hutang id 1565230081 () No.Reff: PO/DS/VIII/002/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4128, '2019-08-08 09:22:20', 'admin', 'delete hutang id 1565229128 () No.Reff: PO/DS/VIII/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4129, '2019-08-08 09:22:31', 'admin', 'delete pemasukan barang id 1565221799', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4130, '2019-08-08 09:22:34', 'admin', 'delete pemasukan barang id 1565196539', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4131, '2019-08-08 09:29:10', 'admin', 'tambah pemasukan material id: 1565231329 dari po PO/DS/VIII/002/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4132, '2019-08-08 09:33:24', 'admin', 'tambah data hutang id: 1565231566 ket', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4133, '2019-08-08 09:34:24', 'admin', 'delete hutang id 1565231566 () No.Reff: PO/DS/VIII/002/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4134, '2019-08-08 09:34:53', 'admin', 'tambah data hutang id: 1565231672 ket', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4135, '2019-08-08 09:35:45', 'admin', 'tambah data pembayaran id: 1565231712 ket', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4136, '2019-08-08 09:41:28', 'admin', 'tambah pembayaran kas & bank id: 1565232038 ket', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4137, '2019-08-08 09:45:46', 'admin', 'update kas & bank Pembayaran id: 1565232038 ket', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4138, '2019-08-08 09:45:50', 'admin', 'update kas & bank Pembayaran id: 1565232038 ket', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4139, '2019-08-08 09:47:29', 'admin', 'update kas & bank Pembayaran id: 1565232038 ket', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4140, '2019-08-08 09:47:34', 'admin', 'delete kas & bank pembayaran  id 1565232038 () penerima Pak Lomri', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4141, '2019-08-08 09:48:00', 'admin', 'tambah pembayaran kas & bank id: 1565232456 ket Service Komputer', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4142, '2019-08-08 09:51:11', 'admin', 'tambah penerimaan kas & bank id: 1565232553 ket Penjualan Sampah Plastik', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4143, '2019-08-08 09:53:14', 'admin', 'delete kas & bank penerimaan  id 1565232553 (Penjualan Sampah Plastik) penerima', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4144, '2019-08-08 09:56:38', 'admin', 'tambah penerimaan kas & bank id: 1565232813 ket Penjualan Sampah Plastik', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4145, '2019-08-08 10:06:20', 'admin', 'tambah jurnal umum id: 1565233509 ket Beli pulpen', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4146, '2019-08-08 10:06:59', 'admin', 'update transaksi jurnal id: 1565233509', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4147, '2019-08-08 10:14:02', 'admin', 'delete pemasukan barang id 1565231329', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4148, '2019-08-08 10:42:23', 'admin', 'tambah pemasukan material id: 1565235734 dari po PO/DS/VIII/002/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4149, '2019-08-08 10:42:42', 'admin', 'update data pemasukan material id: 1565235734', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4150, '2019-08-08 10:52:03', 'admin', 'update data pemasukan material id: 1565235734', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4151, '2019-08-08 11:22:21', 'admin', 'hapus item konversi id: 15', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4152, '2019-08-08 11:31:59', 'admin', 'hapus item konversi id: 18', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4153, '2019-08-08 11:31:59', 'admin', 'hapus item konversi id: 18', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4154, '2019-08-08 11:50:02', 'admin', 'tambah aktiva tetap kode: TN001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4155, '2019-08-08 11:51:36', 'admin', 'tambah aktiva tetap kode: GD001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4156, '2019-08-08 11:57:42', 'admin', 'tambah aktiva tetap kode: KN0001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4157, '2019-08-08 11:59:26', 'admin', 'tambah aktiva tetap kode: MS001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4158, '2019-08-08 19:54:48', 'admin', 'tambah wo baru nomor : WO1', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4159, '2019-08-08 19:56:31', 'admin', 'hapus wo id: 1565268866 no WO1', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4160, '2019-08-08 19:58:04', 'admin', 'tambah wo baru nomor : WO1', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4161, '2019-08-08 19:58:45', 'admin', 'update wo  nomor : WO1', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4162, '2019-08-08 20:04:53', 'admin', 'hapus wo id: 1565269065 no WO1', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4163, '2019-08-08 20:09:58', 'admin', 'hapus wo id: 1565269652 no Wo1', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4164, '2019-08-08 20:11:44', 'admin', 'hapus wo id: 1565269819 no WO1', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4165, '2019-08-08 20:12:05', 'admin', 'tambah wo baru nomor : WO1', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4166, '2019-08-08 20:12:16', 'admin', 'update wo  nomor : WO1', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4167, '2019-08-08 21:41:45', 'admin', 'tambah data permintaan id: 1565275283 nowo WO1', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4168, '2019-08-08 21:49:33', 'admin', 'update data permintaan id: 1565275283 nowo WO1', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4169, '2019-08-08 21:53:07', 'admin', 'update data permintaan id: 1565275283 nowo WO1', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4170, '2019-08-08 22:33:19', 'admin', 'tambah data permintaan id: 1565278373 nowo WO1', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4171, '2019-08-08 22:34:11', 'admin', 'update data permintaan id: 1565278373 nowo WO1', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4172, '2019-08-08 22:34:53', 'admin', 'delete permintaan id 1565275283(Line) Nowo : WO1', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4173, '2019-08-08 22:46:11', 'admin', 'update data permintaan id: 1565278373 nowo WO1', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4174, '2019-08-08 23:04:45', 'admin', 'tambah pemasukan material id: 1565280246 dari po PO/DS/VIII/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4175, '2019-08-08 23:28:02', 'admin', 'tambah pengeluaran material id: 1565281347', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4176, '2019-08-08 23:35:20', 'admin', 'tambah data hutang id: 1565282085 ket', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4177, '2019-08-08 23:37:10', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4178, '2019-08-09 07:49:36', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4179, '2019-08-09 07:55:59', 'admin', 'update group id 1', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4180, '2019-08-09 07:56:04', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4181, '2019-08-09 07:56:08', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4182, '2019-08-09 10:57:25', 'admin', 'tambah wo baru nomor : WO/DS/VIII/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4183, '2019-08-09 13:41:36', 'admin', 'tambah akun baru nama: Bahan Baku Tidak Langsung', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4184, '2019-08-09 13:42:01', 'admin', 'tambah akun baru nama: Tenaga Kerja Tidak Langsung', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4185, '2019-08-09 13:42:29', 'admin', 'tambah akun baru nama: Depresiasi Mesin', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4186, '2019-08-09 13:42:52', 'admin', 'tambah akun baru nama: Biaya Sewa', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4187, '2019-08-09 13:43:19', 'admin', 'tambah akun baru nama: Biaya Utility', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4188, '2019-08-09 13:50:58', 'admin', 'tambah akun baru nama: Gaji Pegawai', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4189, '2019-08-09 13:51:21', 'admin', 'edit data akun id: 273', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4190, '2019-08-09 14:44:19', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4191, '2019-08-09 16:47:00', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4192, '2019-08-09 19:10:03', 'admin', 'tambah jurnal biaya hpp nowo : WO/DS/VIII/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4193, '2019-08-09 19:13:17', 'admin', 'tambah jurnal biaya hpp nowo : WO1', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4194, '2019-08-09 19:16:29', 'admin', 'tambah jurnal biaya hpp nowo : WO1', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4195, '2019-08-09 19:28:12', 'admin', 'tambah jurnal biaya hpp nowo : WO1', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4196, '2019-08-09 19:28:33', 'admin', 'tambah jurnal biaya hpp nowo : WO1', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4197, '2019-08-09 19:40:45', 'admin', 'hapus biaya dari nowo : WO1', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4198, '2019-08-09 19:50:48', 'admin', 'hapus biaya dari nowo : WO1', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4199, '2019-08-09 19:51:07', 'admin', 'tambah jurnal biaya hpp nowo : WO1', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4200, '2019-08-09 19:58:12', 'admin', 'tambah jurnal biaya hpp nowo : WO1', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4201, '2019-08-09 19:58:58', 'admin', 'tambah jurnal biaya hpp nowo : WO/DS/VIII/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4202, '2019-08-09 20:07:33', 'admin', 'tambah pengeluaran material id: 1565356015', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4203, '2019-08-09 21:17:31', 'admin', 'proses stock opname tanggal :2019-08-09 21:17:29', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4204, '2019-08-09 21:32:24', 'admin', 'hapus stock opname nomor :20190800001 tanggal : 2019-08-09 21:17:29', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4205, '2019-08-09 21:32:40', 'admin', 'delete pemasukan barang id 1565235734', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4206, '2019-08-09 21:32:43', 'admin', 'delete pemasukan barang id 1565280246', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4207, '2019-08-09 21:32:52', 'admin', 'delete pengeluaran material id 1565356015', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4208, '2019-08-09 21:32:55', 'admin', 'delete pengeluaran material id 1565281347', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4209, '2019-08-09 21:34:53', 'admin', 'tambah pemasukan material id: 1565361271 dari po PO/DS/VIII/002/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4210, '2019-08-09 21:39:17', 'admin', 'tambah pemasukan material id: 1565361546 dari po PO/DS/VIII/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4211, '2019-08-09 21:40:32', 'admin', 'tambah pengeluaran material id: 1565361601', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4212, '2019-08-09 21:41:01', 'admin', 'proses stock opname tanggal :2019-08-09 21:40:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4213, '2019-08-09 22:11:03', 'admin', 'tambah pemasukan scrap id: 1565363342 kode produksi PR001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4214, '2019-08-09 22:11:18', 'admin', 'update pemasukan scrap  id: 1565363342 kode PR001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4215, '2019-08-09 22:23:04', 'admin', 'tambah pengeluaran asset id: 1565364128 no do DO/SCR/VIII/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4216, '2019-08-09 22:33:50', 'admin', 'tambah pemasukan hasil produksi id: 1565364687 dari wo WO1', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4217, '2019-08-09 22:50:45', 'admin', 'delete pemasukan hasil produksi id 1565364687 kode produksi PR001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4218, '2019-08-10 08:36:58', 'admin', 'hapus biaya dari nowo : WO/DS/VIII/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4219, '2019-08-10 08:37:05', 'admin', 'hapus biaya dari nowo : WO1', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4220, '2019-08-10 08:37:11', 'admin', 'hapus biaya dari nowo : WO1', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4221, '2019-08-10 08:37:13', 'admin', 'hapus biaya dari nowo : WO1', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4222, '2019-08-10 08:37:15', 'admin', 'hapus biaya dari nowo : WO1', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4223, '2019-08-10 08:58:02', 'admin', 'try direct access to laporan akuntansi asset controller', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4224, '2019-08-10 08:58:05', 'anonymous', 'try direct access to laporan beacukai controller', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4225, '2019-08-10 08:58:10', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4226, '2019-08-10 09:01:00', 'admin', 'try direct access to laporan akuntansi asset controller', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4227, '2019-08-10 09:01:05', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4228, '2019-08-10 09:52:04', 'admin', 'update subcon data id: SUB001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4229, '2019-08-10 09:52:13', 'admin', 'update subcon data id: SUB002', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4230, '2019-08-10 10:25:15', 'admin', 'update data pemasukan material id: 1565361546', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4231, '2019-08-10 10:25:28', 'admin', 'update data pemasukan material id: 1565361271', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4232, '2019-08-10 10:29:35', 'admin', 'update data pemasukan material id: 1565361546', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4233, '2019-08-10 10:29:48', 'admin', 'update data pemasukan material id: 1565361271', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4234, '2019-08-10 10:33:06', 'admin', 'update data pemasukan material id: 1565361271', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4235, '2019-08-10 10:34:29', 'anonymous', 'try direct access to laporan beacukai controller', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4236, '2019-08-10 10:34:34', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4237, '2019-08-10 10:47:03', 'admin', 'cetak laporan pemasukan bahan baku perdokumen periode 2019-08-01 00:00:00 s/d 2019-08-10 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4238, '2019-08-10 10:47:34', 'admin', 'cetak laporan pemasukan bahan baku perdokumen periode 2019-08-01 00:00:00 s/d 2019-08-10 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4239, '2019-08-10 10:48:16', 'admin', 'cetak laporan pemasukan bahan baku perdokumen periode 2019-08-01 00:00:00 s/d 2019-08-10 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4240, '2019-08-10 10:48:43', 'admin', 'update data pemasukan material id: 1565361271', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4241, '2019-08-10 10:48:55', 'admin', 'cetak laporan pemasukan bahan baku perdokumen periode 2019-08-01 00:00:00 s/d 2019-08-10 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4242, '2019-08-10 10:49:02', 'admin', 'cetak laporan pemasukan bahan baku perdokumen periode 2019-08-01 00:00:00 s/d 2019-08-10 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4243, '2019-08-10 10:51:56', 'admin', 'download laporan pemasukan bahan baku perdokumen periode 2019-08-01 00:00:00 s/d 2019-08-10 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4244, '2019-08-10 10:52:51', 'admin', 'cetak laporan pemasukan bahan baku perdokumen periode 2019-08-01 00:00:00 s/d 2019-08-10 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4245, '2019-08-10 11:45:43', 'admin', 'cetak laporan pemkakain bahan baku periode 2019-08-01 00:00:00 s/d 2019-08-10 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4246, '2019-08-10 11:47:21', 'admin', 'cetak laporan pemkakain bahan baku periode 2019-08-01 00:00:00 s/d 2019-08-10 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4247, '2019-08-10 11:47:32', 'admin', 'cetak laporan pemkakain bahan baku periode 2019-08-01 00:00:00 s/d 2019-08-10 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4248, '2019-08-10 11:48:48', 'admin', 'download laporan pemakaian bahan baku  2019-08-01 00:00:00 s/d 2019-08-10 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4249, '2019-08-10 11:49:10', 'admin', 'cetak laporan pemkakain bahan baku periode 2019-08-01 00:00:00 s/d 2019-08-10 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4250, '2019-08-10 12:33:47', 'admin', 'cetak laporan pemkakain barang wip dalam rangka subkon 2019-08-01 00:00:00 s/d 2019-08-10 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4251, '2019-08-10 12:36:33', 'admin', 'download laporan pemakaian bahan dalam rangka subkon  2019-08-01 00:00:00 s/d 2019-08-10 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4252, '2019-08-10 12:37:03', 'admin', 'download laporan pemakaian bahan dalam rangka subkon  2019-08-01 00:00:00 s/d 2019-08-10 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4253, '2019-08-10 13:00:56', 'admin', 'tambah pemasukan hasil produksi id: 1565416840 dari wo WO1', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4254, '2019-08-10 13:10:48', 'admin', 'delete pemasukan hasil produksi id 1565416840 kode produksi PR001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4255, '2019-08-10 13:12:22', 'admin', 'cetak laporan pemasukan barang hasil produksi 2019-08-01 00:00:00 s/d 2019-08-10 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4256, '2019-08-10 13:12:46', 'admin', 'cetak laporan pemasukan barang hasil produksi 2019-08-01 00:00:00 s/d 2019-08-10 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4257, '2019-08-10 13:12:54', 'admin', 'cetak laporan pemasukan barang hasil produksi 2019-08-01 00:00:00 s/d 2019-08-10 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4258, '2019-08-10 13:13:49', 'admin', 'download laporan pemauskan hasil produksi  2019-08-01 00:00:00 s/d 2019-08-10 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4259, '2019-08-10 13:39:29', 'admin', 'tambah pemasukan hasil produksi id: 1565419043 dari wo WO1', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4260, '2019-08-10 13:39:47', 'admin', 'cetak laporan pemasukan barang hasil produksi 2019-08-01 00:00:00 s/d 2019-08-10 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4261, '2019-08-10 13:39:58', 'admin', 'cetak laporan pemasukan barang hasil produksi 2019-08-01 00:00:00 s/d 2019-08-10 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4262, '2019-08-10 13:40:04', 'admin', 'cetak laporan pemasukan barang hasil produksi 2019-08-01 00:00:00 s/d 2019-08-10 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4263, '2019-08-10 13:40:09', 'admin', 'download laporan pemauskan hasil produksi  2019-08-01 00:00:00 s/d 2019-08-10 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4264, '2019-08-10 13:41:08', 'admin', 'cetak laporan pemasukan barang hasil produksi 2019-08-01 00:00:00 s/d 2019-08-10 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4265, '2019-08-10 13:42:21', 'admin', 'cetak laporan pemasukan barang hasil produksi 2019-08-01 00:00:00 s/d 2019-08-10 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4266, '2019-08-10 13:43:08', 'admin', 'cetak laporan pemasukan barang hasil produksi 2019-08-01 00:00:00 s/d 2019-08-10 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4267, '2019-08-10 13:43:13', 'admin', 'download laporan pemauskan hasil produksi  2019-08-01 00:00:00 s/d 2019-08-10 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4268, '2019-08-10 13:54:13', 'admin', 'delete pemasukan hasil produksi id 1565419043 kode produksi PR001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4269, '2019-08-10 14:14:45', 'admin', 'hapus stock opname nomor :20190800001 tanggal : 2019-08-09 21:40:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4270, '2019-08-10 14:15:07', 'admin', 'proses stock opname tanggal :2019-08-09 18:00:00', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4271, '2019-08-10 14:15:20', 'admin', 'hapus stock opname nomor :20190800001 tanggal : 2019-08-09 18:00:00', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4272, '2019-08-10 14:15:24', 'admin', 'proses stock opname tanggal :2019-08-10 14:15:22', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4273, '2019-08-10 14:15:49', 'admin', 'hapus stock opname nomor :20190800001 tanggal : 2019-08-10 14:15:22', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4274, '2019-08-10 14:16:02', 'admin', 'proses stock opname tanggal :2019-08-09 21:00:00', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4275, '2019-08-10 14:16:09', 'admin', 'hapus stock opname nomor :20190800001 tanggal : 2019-08-09 21:00:00', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4276, '2019-08-10 14:17:50', 'admin', 'proses stock opname tanggal :2019-08-09 21:40:00', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4277, '2019-08-10 14:23:45', 'admin', 'hapus stock opname nomor :20190800001 tanggal : 2019-08-09 21:40:00', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4278, '2019-08-10 15:35:03', 'admin', 'tambah delivery order id: 1565426047 no do D/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4279, '2019-08-10 15:44:46', 'admin', 'update delivery order id: 1565426047 no do D/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4280, '2019-08-10 15:45:46', 'admin', 'update delivery order id: 1565426047 no do D/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4281, '2019-08-10 15:45:56', 'admin', 'update delivery order id: 1565426047 no do D/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4282, '2019-08-12 08:30:24', 'anonymous', 'try direct access to delivery controller', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4283, '2019-08-12 08:50:34', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4284, '2019-08-12 09:01:19', 'admin', 'update delivery order id: 1565426047 no do D/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4285, '2019-08-12 09:04:19', 'admin', 'update delivery order id: 1565426047 no do D/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4286, '2019-08-12 09:05:01', 'admin', 'tambah delivery order id: 1565575476 no do SEwsa', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4287, '2019-08-12 09:05:12', 'admin', 'update delivery order id: 1565575476 no do SEwsa', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4288, '2019-08-12 09:05:16', 'admin', 'delete delivery order id 1565575476 nodo SEwsa', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4289, '2019-08-12 09:42:38', 'admin', 'cetak laporan pengeluaran barang hasil produksi 2019-08-01 00:00:00 s/d 2019-08-12 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4290, '2019-08-12 09:42:50', 'admin', 'download laporan pengeluaran hasil produksi  2019-08-01 00:00:00 s/d 2019-08-12 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4291, '2019-08-12 10:07:50', 'admin', 'cetak laporan mutasi bahan baku periode 2019-08-01 00:00:00 s/d 2019-08-12 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4292, '2019-08-12 10:08:30', 'admin', 'cetak laporan mutasi bahan baku periode 2019-08-01 00:00:00 s/d 2019-08-12 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4293, '2019-08-12 10:09:29', 'admin', 'cetak laporan mutasi bahan baku periode 2019-08-01 00:00:00 s/d 2019-08-12 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4294, '2019-08-12 10:10:00', 'admin', 'cetak laporan mutasi bahan baku periode 2019-08-01 00:00:00 s/d 2019-08-12 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4295, '2019-08-12 10:10:29', 'admin', 'cetak laporan mutasi bahan baku periode 2019-08-01 00:00:00 s/d 2019-08-12 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4296, '2019-08-12 10:10:43', 'admin', 'cetak laporan mutasi bahan baku periode 2019-08-01 00:00:00 s/d 2019-08-12 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4297, '2019-08-12 10:14:28', 'admin', 'download laporan mutasi bahan baku periode 2019-08-01 00:00:00 s/d 2019-08-12 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4298, '2019-08-12 10:14:46', 'admin', 'cetak laporan mutasi bahan baku periode 2019-08-01 00:00:00 s/d 2019-08-12 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4299, '2019-08-12 10:14:50', 'admin', 'download laporan mutasi bahan baku periode 2019-08-01 00:00:00 s/d 2019-08-12 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4300, '2019-08-12 10:50:53', 'admin', 'proses stock opname barang jadi tanggal :2019-08-12 10:50:51', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4301, '2019-08-12 10:57:21', 'admin', 'hapus stock opname nomor :20190800001 tanggal : 2019-08-12 10:50:51', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4302, '2019-08-12 11:05:13', 'admin', 'cetak laporan mutasi hasil produksi periode 2019-08-01 00:00:00 s/d 2019-08-12 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4303, '2019-08-12 11:06:54', 'admin', 'download laporan mutasi hasil produksi periode 2019-08-01 00:00:00 s/d 2019-08-12 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4304, '2019-08-12 11:13:41', 'admin', 'update pengeluaran asset  id: 1565364128 no do', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4305, '2019-08-12 11:28:10', 'admin', 'cetak laporan penyelesian scrap/waste 2019-08-01 00:00:00 s/d 2019-08-12 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4306, '2019-08-12 11:28:25', 'admin', 'download laporan penyelesaian scrap  2019-08-01 00:00:00 s/d 2019-08-12 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4307, '2019-08-12 11:47:31', 'admin', 'update customer data id: NDS001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4308, '2019-08-12 11:48:08', 'admin', 'update customer data id: NDS001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4309, '2019-08-12 11:48:32', 'admin', 'update customer data id: CR002', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4310, '2019-08-12 11:58:10', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4311, '2019-08-13 08:52:10', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4312, '2019-08-13 08:54:30', 'admin', 'delete delivery order id 1565426047 nodo D/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4313, '2019-08-13 09:07:07', 'admin', 'tambah delivery order id: 1565661981 no do DO/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4314, '2019-08-13 09:07:18', 'admin', 'delete delivery order id 1565661981 nodo DO/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4315, '2019-08-13 09:14:40', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4316, '2019-08-13 09:14:45', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4317, '2019-08-13 09:33:47', 'admin', 'tambah delivery order id: 1565663566 no do DO/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4318, '2019-08-13 09:36:20', 'admin', 'update delivery order id: 1565663566 no do DO/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4319, '2019-08-13 09:37:34', 'admin', 'update customer data id: NDS001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4320, '2019-08-13 10:24:05', 'admin', 'tambah data invoice id: 1565666413 no INV/DSI/002/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4321, '2019-08-13 10:56:44', 'admin', 'tambah data penerimaan id: 1565668559 ket', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4322, '2019-08-13 12:28:34', 'admin', 'success logout', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4323, '2019-08-13 12:38:01', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4324, '2019-08-13 12:52:55', 'admin', 'cetak laporan pemasukan bahan baku perdokumen periode 2019-08-01 00:00:00 s/d 2019-08-13 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4325, '2019-08-13 12:53:28', 'admin', 'download laporan pemasukan bahan baku perdokumen periode 2019-08-01 00:00:00 s/d 2019-08-13 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4326, '2019-08-13 12:56:26', 'admin', 'cetak laporan pemasukan bahan baku perdokumen periode 2019-08-01 00:00:00 s/d 2019-08-13 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4327, '2019-08-13 13:04:16', 'admin', 'cetak laporan pemkakain bahan baku periode 2019-08-01 00:00:00 s/d 2019-08-13 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4328, '2019-08-13 13:04:49', 'admin', 'cetak laporan pemkakain bahan baku periode 2019-08-01 00:00:00 s/d 2019-08-13 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4329, '2019-08-13 13:05:18', 'admin', 'download laporan pemakaian bahan baku  2019-08-01 00:00:00 s/d 2019-08-13 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4330, '2019-08-13 13:06:02', 'admin', 'cetak laporan pemkakain bahan baku periode 2019-08-01 00:00:00 s/d 2019-08-13 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4331, '2019-08-13 13:06:07', 'admin', 'cetak laporan pemkakain bahan baku periode 2019-08-01 00:00:00 s/d 2019-08-13 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4332, '2019-08-13 13:06:37', 'admin', 'cetak laporan pemkakain bahan baku periode 2019-08-01 00:00:00 s/d 2019-08-13 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4333, '2019-08-13 13:06:44', 'admin', 'download laporan pemakaian bahan baku  2019-08-01 00:00:00 s/d 2019-08-13 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4334, '2019-08-13 13:15:01', 'admin', 'cetak laporan mutasi bahan baku periode 2019-08-01 00:00:00 s/d 2019-08-13 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4335, '2019-08-13 13:15:54', 'admin', 'cetak laporan mutasi bahan baku periode 2019-08-01 00:00:00 s/d 2019-08-13 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4336, '2019-08-13 13:17:11', 'admin', 'cetak laporan mutasi bahan baku periode 2019-08-01 00:00:00 s/d 2019-08-13 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4337, '2019-08-13 13:18:28', 'admin', 'download laporan mutasi bahan baku periode 2019-08-01 00:00:00 s/d 2019-08-13 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4338, '2019-08-13 13:39:26', 'admin', 'cetak laporan mutasi bahan baku periode 2019-08-01 00:00:00 s/d 2019-08-13 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4339, '2019-08-13 13:45:29', 'admin', 'cetak laporan mutasi barang jadi periode 2019-08-01 00:00:00 s/d 2019-08-13 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4340, '2019-08-13 13:46:46', 'admin', 'download laporan mutasi barang jadi periode 2019-08-01 00:00:00 s/d 2019-08-13 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4341, '2019-08-13 13:47:07', 'admin', 'cetak laporan mutasi barang jadi periode 2019-08-01 00:00:00 s/d 2019-08-13 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4342, '2019-08-13 13:49:56', 'admin', 'update pengeluaran asset  id: 1565364128 no do', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4343, '2019-08-13 13:50:53', 'admin', 'cetak laporan mutasi barang jadi periode 2019-08-01 00:00:00 s/d 2019-08-13 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4344, '2019-08-13 13:54:29', 'admin', 'cetak laporan mutasi bahan baku periode 2019-08-01 00:00:00 s/d 2019-08-13 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4345, '2019-08-13 14:03:55', 'admin', 'cetak laporan mutasi mesin & peralatan kantor periode 2019-08-01 00:00:00 s/d 2019-08-13 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4346, '2019-08-13 14:04:55', 'admin', 'cetak laporan mutasi mesin & peralatan kantor periode 2019-08-01 00:00:00 s/d 2019-08-13 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4347, '2019-08-13 14:05:55', 'admin', 'download laporan mutasi mesin & peralatan periode 2019-08-01 00:00:00 s/d 2019-08-13 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4348, '2019-08-13 14:12:56', 'admin', 'cetak laporan mutasi scrap(barang sisa) periode 2019-08-01 00:00:00 s/d 2019-08-13 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4349, '2019-08-13 14:13:07', 'admin', 'download laporan mutasi scrap(barang sisa) periode 2019-08-01 00:00:00 s/d 2019-08-13 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4350, '2019-08-13 14:21:55', 'admin', 'cetak laporan mutasi scrap(barang sisa) periode 2019-08-01 00:00:00 s/d 2019-08-13 23:59:59', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4351, '2019-08-13 14:22:30', 'admin', 'cetak laporan wip 2019-08-13 23:59:00', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4352, '2019-08-13 14:22:48', 'admin', 'cetak laporan wip 2019-08-13 23:59:00', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4353, '2019-08-13 14:23:47', 'admin', 'cetak laporan wip 2019-08-13 23:59:00', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4354, '2019-08-13 14:26:09', 'admin', 'cetak laporan wip 2019-08-13 23:59:00', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4355, '2019-08-13 14:26:37', 'admin', 'download laporan wip 2019-08-13 23:59:00', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4356, '2019-08-13 15:38:47', 'admin', 'delete permintaan id 1565278373(Line1) Nowo : WO1', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4357, '2019-08-13 15:38:54', 'admin', 'delete pengeluaran material id 1565361601', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4358, '2019-08-13 15:41:28', 'admin', 'hapus wo id: 1565322998 no WO/DS/VIII/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4359, '2019-08-13 15:41:31', 'admin', 'hapus wo id: 1565269906 no WO1', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4360, '2019-08-13 15:45:33', 'admin', 'try direct access to hpp controller', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4361, '2019-08-13 15:45:38', 'admin', 'success login', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4362, '2019-08-13 15:55:32', 'admin', 'tambah wo baru nomor : WO002/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4363, '2019-08-13 16:01:49', 'admin', 'hapus wo id: 1565686003 no WO002/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4364, '2019-08-13 16:05:11', 'admin', 'tambah wo baru nomor : WO/001/2019', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4365, '2019-08-13 16:15:28', 'admin', 'update data barang kode: BA0001', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4366, '2019-08-13 16:15:46', 'admin', 'update data barang kode: BA0002', '127.0.0.1', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4367, '2019-08-13 17:22:43', 'admin', 'success login', '120.188.32.188', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4368, '2019-08-13 17:25:34', 'admin', 'update data barang kode: BA0002', '120.188.32.188', 'Windows 7 - Firefox 68.0');
INSERT INTO `trans_logs` VALUES (4369, '2019-08-13 17:37:50', 'admin', 'hapus file : backup-on-2019-05-18-15-53-36.zip', '120.188.32.188', 'Windows 7 - Firefox 68.0');

-- ----------------------------
-- Table structure for trans_masuk_barang_detail
-- ----------------------------
DROP TABLE IF EXISTS `trans_masuk_barang_detail`;
CREATE TABLE `trans_masuk_barang_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_header` int(11) DEFAULT NULL,
  `kode_barang` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_barang` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `spesifikasi_barang` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `hs_barang` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `satuan_barang` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `qty` decimal(20, 2) DEFAULT 0.00,
  `qty_keluar` decimal(20, 2) DEFAULT 0.00,
  `harga_barang` decimal(20, 4) DEFAULT 0.0000,
  `currency` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_wo_detail` int(11) DEFAULT NULL,
  `gudang` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_input` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for trans_masuk_barang_header
-- ----------------------------
DROP TABLE IF EXISTS `trans_masuk_barang_header`;
CREATE TABLE `trans_masuk_barang_header`  (
  `id` int(11) NOT NULL,
  `tgl_masuk` datetime(0) DEFAULT NULL,
  `no_wo` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kode_produksi` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `subcon` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bukti_penerimaan` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_aju` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jenis_dokumen` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_dokumen` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_dokumen` date DEFAULT NULL,
  `created_at` datetime(0) DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_from` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_input` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for trans_masuk_material_detail
-- ----------------------------
DROP TABLE IF EXISTS `trans_masuk_material_detail`;
CREATE TABLE `trans_masuk_material_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_header` int(11) DEFAULT NULL,
  `kode_barang` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_barang` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `spesifikasi_barang` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `hs_barang` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `satuan_besar` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `harga_besar` decimal(20, 4) DEFAULT 0.0000,
  `qty_besar` decimal(20, 2) DEFAULT 0.00,
  `content` decimal(20, 4) DEFAULT 0.0000,
  `satuan_barang` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `qty` decimal(20, 2) DEFAULT 0.00,
  `qty_keluar` decimal(20, 2) DEFAULT 0.00,
  `harga_barang` decimal(20, 4) DEFAULT 0.0000,
  `currency` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kurs` decimal(20, 2) DEFAULT 1.00,
  `gudang` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_po_detail` int(11) DEFAULT NULL,
  `status_input` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 146 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of trans_masuk_material_detail
-- ----------------------------
INSERT INTO `trans_masuk_material_detail` VALUES (142, 1565361271, 'BP0001', 'Sarung Tangan Katun', 'Miera 12 AP', NULL, 'Pack', 6000.0000, 30.00, 12.0000, 'Pcs', 360.00, 0.00, 500.0000, 'IDR', 1.00, '1', 18, 1);
INSERT INTO `trans_masuk_material_detail` VALUES (143, 1565361271, 'BP0002', 'Isolasi Hitam', 'Merk Daiwa', NULL, 'Pcs', 1200.0000, 50.00, 1.0000, 'Pcs', 50.00, 0.00, 1200.0000, 'IDR', 1.00, '2', 19, 1);
INSERT INTO `trans_masuk_material_detail` VALUES (144, 1565361546, 'MK0002', 'Pipa Besi', 'Diameter 5\"', NULL, 'Batang', 24.7900, 15.00, 5.0000, 'Pcs', 75.00, 0.00, 4.9580, 'USD', 14500.00, '1', 16, 1);
INSERT INTO `trans_masuk_material_detail` VALUES (145, 1565361546, 'MK0001', 'Pipa PPC 21 Inchi', 'Diameter 16x24', NULL, 'Kg', 12.7800, 25.00, 1000.0000, 'Gram', 25000.00, 0.00, 0.0128, 'USD', 14500.00, '1', 17, 1);

-- ----------------------------
-- Table structure for trans_masuk_material_header
-- ----------------------------
DROP TABLE IF EXISTS `trans_masuk_material_header`;
CREATE TABLE `trans_masuk_material_header`  (
  `id` int(11) NOT NULL,
  `tgl_masuk` datetime(0) DEFAULT NULL,
  `supplier` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_po` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_invoice` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_packinglist` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jenis_dokumen` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_aju` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_dokumen` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_dokumen` date DEFAULT NULL,
  `created_at` datetime(0) DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_from` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_input` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of trans_masuk_material_header
-- ----------------------------
INSERT INTO `trans_masuk_material_header` VALUES (1565361271, '2019-08-09 21:34:31', 'SUP001', 'PO/DS/VIII/002/2019', '-', NULL, 'BC27', '', '000002', '2019-08-02', '2019-08-09 21:34:53', 'admin', '127.0.0.1', 1);
INSERT INTO `trans_masuk_material_header` VALUES (1565361546, '2019-08-09 21:39:05', 'CHN001', 'PO/DS/VIII/001/2019', '-', NULL, 'BC23', '', '00001', '2019-08-01', '2019-08-09 21:39:17', 'admin', '127.0.0.1', 1);

-- ----------------------------
-- Table structure for trans_masuk_mesin_detail
-- ----------------------------
DROP TABLE IF EXISTS `trans_masuk_mesin_detail`;
CREATE TABLE `trans_masuk_mesin_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_header` int(11) DEFAULT NULL,
  `kode_barang` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_barang` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `spesifikasi_barang` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `hs_barang` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `satuan_barang` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `qty` decimal(20, 2) DEFAULT 0.00,
  `qty_keluar` decimal(20, 2) DEFAULT 0.00,
  `harga_barang` decimal(20, 4) DEFAULT 0.0000,
  `currency` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_po_detail` int(11) DEFAULT NULL,
  `gudang` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_input` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of trans_masuk_mesin_detail
-- ----------------------------
INSERT INTO `trans_masuk_mesin_detail` VALUES (16, 1563610841, 'SC001', 'Gram Besi', '-', '-', 'Kg', 15.00, 0.00, 400.0000, 'IDR', NULL, NULL, 0);

-- ----------------------------
-- Table structure for trans_masuk_mesin_header
-- ----------------------------
DROP TABLE IF EXISTS `trans_masuk_mesin_header`;
CREATE TABLE `trans_masuk_mesin_header`  (
  `id` int(11) NOT NULL,
  `tgl_masuk` datetime(0) DEFAULT NULL,
  `no_po` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_invoice` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_packinglist` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `pengirim` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_aju` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jenis_dokumen` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_dokumen` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_dokumen` date DEFAULT NULL,
  `status_input` int(11) DEFAULT 0,
  `created_at` datetime(0) DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_from` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of trans_masuk_mesin_header
-- ----------------------------
INSERT INTO `trans_masuk_mesin_header` VALUES (0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2019-08-27 09:58:12', NULL, NULL);

-- ----------------------------
-- Table structure for trans_masuk_scrap_detail
-- ----------------------------
DROP TABLE IF EXISTS `trans_masuk_scrap_detail`;
CREATE TABLE `trans_masuk_scrap_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_header` int(11) DEFAULT NULL,
  `kode_barang` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_barang` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `spesifikasi_barang` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `hs_barang` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `satuan_barang` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `qty` decimal(20, 2) DEFAULT 0.00,
  `qty_keluar` decimal(20, 2) DEFAULT 0.00,
  `harga_barang` decimal(20, 4) DEFAULT 0.0000,
  `currency` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_input` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of trans_masuk_scrap_detail
-- ----------------------------
INSERT INTO `trans_masuk_scrap_detail` VALUES (1, 1565363342, 'SC001', 'Gram Besi', '-', '-', 'Kg', 15.00, 0.00, 400.0000, 'IDR', 1);
INSERT INTO `trans_masuk_scrap_detail` VALUES (2, 1565363342, 'SC002', 'Sampah Plastik', '-', '-', 'Kg', 25.00, 0.00, 200.0000, 'IDR', 0);

-- ----------------------------
-- Table structure for trans_masuk_scrap_header
-- ----------------------------
DROP TABLE IF EXISTS `trans_masuk_scrap_header`;
CREATE TABLE `trans_masuk_scrap_header`  (
  `id` int(11) NOT NULL,
  `tgl_masuk` datetime(0) DEFAULT NULL,
  `kode_produksi` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bagian` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_aju` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jenis_dokumen` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_dokumen` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_dokumen` date DEFAULT NULL,
  `status_input` int(11) DEFAULT 0,
  `created_at` datetime(0) DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_from` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of trans_masuk_scrap_header
-- ----------------------------
INSERT INTO `trans_masuk_scrap_header` VALUES (1565363342, '2019-08-09 22:09:02', 'PR001', 'Line1', NULL, NULL, NULL, NULL, 1, '2019-08-09 22:11:03', 'admin', '127.0.0.1');

-- ----------------------------
-- Table structure for trans_permintaan_detail
-- ----------------------------
DROP TABLE IF EXISTS `trans_permintaan_detail`;
CREATE TABLE `trans_permintaan_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_header` int(11) DEFAULT NULL,
  `kode_barang` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_barang` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `spesifikasi_barang` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `qty` decimal(20, 4) DEFAULT 0.0000,
  `qty_kirim` decimal(20, 4) DEFAULT 0.0000,
  `satuan_kecil` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `harga_kecil` decimal(20, 6) DEFAULT 0.000000,
  `currency` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keterangan` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_input` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for trans_permintaan_header
-- ----------------------------
DROP TABLE IF EXISTS `trans_permintaan_header`;
CREATE TABLE `trans_permintaan_header`  (
  `id` int(11) NOT NULL,
  `tgl_permintaan` datetime(0) DEFAULT NULL,
  `no_wo` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bagian` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `pic` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keterangan` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_permintaan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'NEW',
  `status_input` int(11) DEFAULT 0,
  `created_at` datetime(0) DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_from` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for trans_po_detail
-- ----------------------------
DROP TABLE IF EXISTS `trans_po_detail`;
CREATE TABLE `trans_po_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_header` int(11) DEFAULT NULL,
  `kode_barang` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_barang` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `spesifikasi_barang` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `satuan` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `qty` decimal(20, 2) DEFAULT 0.00,
  `harga` decimal(20, 4) DEFAULT 0.0000,
  `currency` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `qty_datang` decimal(20, 2) DEFAULT 0.00,
  `qty_dibayar` decimal(20, 2) DEFAULT 0.00,
  `status_input` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of trans_po_detail
-- ----------------------------
INSERT INTO `trans_po_detail` VALUES (16, 1565185368, 'MK0002', 'Pipa Besi', 'Diameter 5\"', 'Batang', 15.00, 24.7900, 'USD', 15.00, 15.00, 1);
INSERT INTO `trans_po_detail` VALUES (17, 1565185368, 'MK0001', 'Pipa PPC 21 Inchi', 'Diameter 16x24', 'Kg', 25.00, 12.7800, 'USD', 25.00, 25.00, 1);
INSERT INTO `trans_po_detail` VALUES (18, 1565186519, 'BP0001', 'Sarung Tangan Katun', 'Miera 12 AP', 'Pack', 30.00, 6000.0000, 'IDR', 30.00, 30.00, 1);
INSERT INTO `trans_po_detail` VALUES (19, 1565186519, 'BP0002', 'Isolasi Hitam', 'Merk Daiwa', 'Pcs', 50.00, 1200.0000, 'IDR', 50.00, 50.00, 1);
INSERT INTO `trans_po_detail` VALUES (20, 1, 'BP0001', 'Sarung Tangan Katun', NULL, 'Pack', 50.00, 6000.0000, 'USD', 0.00, 0.00, 0);
INSERT INTO `trans_po_detail` VALUES (21, 1, 'BP0002', 'Isolasi Hitam', NULL, 'Pcs', 50.00, 1200.0000, 'USD', 0.00, 0.00, 0);

-- ----------------------------
-- Table structure for trans_po_header
-- ----------------------------
DROP TABLE IF EXISTS `trans_po_header`;
CREATE TABLE `trans_po_header`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tgl_po` date DEFAULT NULL,
  `no_po` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `supplier` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `currency` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kurs` decimal(20, 2) DEFAULT 0.00,
  `tempo` int(11) DEFAULT NULL,
  `total` decimal(20, 4) DEFAULT 0.0000,
  `potongan_persen` decimal(10, 2) DEFAULT 0.00,
  `potongan` decimal(20, 4) DEFAULT 0.0000,
  `ppn_persen` decimal(10, 2) DEFAULT 0.00,
  `ppn` decimal(20, 4) DEFAULT 0.0000,
  `biaya_lain` decimal(20, 4) DEFAULT 0.0000,
  `grand_total` decimal(20, 4) DEFAULT 0.0000,
  `status_po` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'NEW',
  `kode_pembayaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_at` datetime(0) DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_from` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_input` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1565186520 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of trans_po_header
-- ----------------------------
INSERT INTO `trans_po_header` VALUES (1, '2019-08-21', '12345', 'CHN001', 'USD', 15000.00, 30, 60000.0000, 0.00, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 'NEW', NULL, NULL, NULL, NULL, 0);
INSERT INTO `trans_po_header` VALUES (1565185368, '2019-08-07', 'PO/DS/VIII/001/2019', 'CHN001', 'USD', 14500.00, 30, 691.3500, 0.00, 0.0000, 0.00, 0.0000, 0.0000, 691.3500, 'CLOSE', NULL, '2019-08-07 20:46:15', 'admin', '127.0.0.1', 1);
INSERT INTO `trans_po_header` VALUES (1565186519, '2019-08-07', 'PO/DS/VIII/002/2019', 'SUP001', 'IDR', 1.00, 30, 240000.0000, 0.00, 0.0000, 0.00, 0.0000, 0.0000, 240000.0000, 'CLOSE', NULL, '2019-08-07 21:02:57', 'admin', '127.0.0.1', 1);

-- ----------------------------
-- Table structure for trans_stockopname_barang
-- ----------------------------
DROP TABLE IF EXISTS `trans_stockopname_barang`;
CREATE TABLE `trans_stockopname_barang`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no_opname` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_opname` datetime(0) DEFAULT NULL,
  `kode_barang` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_barang` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `spesifikasi_barang` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `hs_barang` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `satuan_barang` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `stok_akhir` decimal(20, 2) DEFAULT NULL,
  `stok_opname` decimal(20, 2) DEFAULT NULL,
  `selisih` decimal(20, 2) DEFAULT NULL,
  `penyesuaian` decimal(20, 2) DEFAULT NULL,
  `gudang` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keterangan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `user_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `noopname`(`no_opname`) USING BTREE,
  INDEX `kode_barang`(`kode_barang`) USING BTREE,
  INDEX `tgl_opname`(`tgl_opname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for trans_stockopname_material
-- ----------------------------
DROP TABLE IF EXISTS `trans_stockopname_material`;
CREATE TABLE `trans_stockopname_material`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no_opname` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_opname` datetime(0) DEFAULT NULL,
  `kode_barang` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_barang` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `spesifikasi_barang` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `hs_barang` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `satuan_barang` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `stok_akhir` decimal(20, 2) DEFAULT NULL,
  `stok_opname` decimal(20, 2) DEFAULT NULL,
  `selisih` decimal(20, 2) DEFAULT NULL,
  `penyesuaian` decimal(20, 2) DEFAULT NULL,
  `gudang` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keterangan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `user_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `noopname`(`no_opname`) USING BTREE,
  INDEX `kode_barang`(`kode_barang`) USING BTREE,
  INDEX `tgl_opname`(`tgl_opname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for trans_stockopname_mesin
-- ----------------------------
DROP TABLE IF EXISTS `trans_stockopname_mesin`;
CREATE TABLE `trans_stockopname_mesin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no_opname` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_opname` datetime(0) DEFAULT NULL,
  `kode_barang` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_barang` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `spesifikasi_barang` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `hs_barang` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `satuan_barang` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `stok_akhir` decimal(20, 2) DEFAULT NULL,
  `stok_opname` decimal(20, 2) DEFAULT NULL,
  `selisih` decimal(20, 2) DEFAULT NULL,
  `penyesuaian` decimal(20, 2) DEFAULT NULL,
  `gudang` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keterangan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `user_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `noopname`(`no_opname`) USING BTREE,
  INDEX `kode_barang`(`kode_barang`) USING BTREE,
  INDEX `tgl_opname`(`tgl_opname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for trans_stockopname_scrap
-- ----------------------------
DROP TABLE IF EXISTS `trans_stockopname_scrap`;
CREATE TABLE `trans_stockopname_scrap`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no_opname` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_opname` datetime(0) DEFAULT NULL,
  `kode_barang` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_barang` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `spesifikasi_barang` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `hs_barang` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `satuan_barang` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `stok_akhir` decimal(20, 2) DEFAULT NULL,
  `stok_opname` decimal(20, 2) DEFAULT NULL,
  `selisih` decimal(20, 2) DEFAULT NULL,
  `penyesuaian` decimal(20, 2) DEFAULT NULL,
  `gudang` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keterangan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `user_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `noopname`(`no_opname`) USING BTREE,
  INDEX `kode_barang`(`kode_barang`) USING BTREE,
  INDEX `tgl_opname`(`tgl_opname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for trans_wo_detail
-- ----------------------------
DROP TABLE IF EXISTS `trans_wo_detail`;
CREATE TABLE `trans_wo_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_header` int(11) DEFAULT NULL,
  `no_wo` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kode_barang` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_barang` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `spesifikasi_barang` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `hs_barang` varchar(75) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `qty` decimal(20, 2) DEFAULT 0.00,
  `satuan` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `harga_barang` decimal(20, 4) DEFAULT NULL,
  `currency` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kurs` decimal(20, 2) DEFAULT 1.00,
  `qty_selesai` decimal(20, 2) DEFAULT 0.00,
  `qty_kirim` decimal(20, 2) DEFAULT 0.00,
  `status_input` int(11) DEFAULT 0,
  `material` decimal(20, 6) DEFAULT NULL,
  `tkl` decimal(20, 6) DEFAULT NULL,
  `bop` decimal(20, 6) DEFAULT NULL,
  `hpp` decimal(20, 6) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of trans_wo_detail
-- ----------------------------
INSERT INTO `trans_wo_detail` VALUES (47, 1565687042, 'WO/001/2019', 'BA0001', 'Barang Jadi 1', 'Type AC001', '-', 50.00, 'Pcs', 8.3400, 'USD', 14100.00, 0.00, 0.00, 1, 10.170000, 30.000000, 20.000000, 15.255000);
INSERT INTO `trans_wo_detail` VALUES (48, 0, '123', 'BA0001', 'Barang Jadi 1', 'Type AC001', '-', 0.00, 'Pcs', 17.0000, 'USD', 1.00, 0.00, 0.00, 0, 10.000000, 20.000000, 30.000000, 40.000000);

-- ----------------------------
-- Table structure for trans_wo_header
-- ----------------------------
DROP TABLE IF EXISTS `trans_wo_header`;
CREATE TABLE `trans_wo_header`  (
  `id` int(11) NOT NULL,
  `no_wo` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_wo` date DEFAULT NULL,
  `customer` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `customer_po` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `wo_status` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_at` datetime(0) DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_from` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_input` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `no_wo`(`no_wo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of trans_wo_header
-- ----------------------------
INSERT INTO `trans_wo_header` VALUES (0, '123', '2019-08-23', 'CR001', '654645', NULL, '2019-08-23 03:40:34', NULL, NULL, NULL);
INSERT INTO `trans_wo_header` VALUES (1565687042, 'WO/001/2019', '2019-08-13', 'CR002', 'PO/DL/001/2019', 'NEW', '2019-08-13 16:05:11', 'admin', '127.0.0.1', 1);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `activation_selector` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activation_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `forgotten_password_selector` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `forgotten_password_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_selector` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `remember_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `last_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `company` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uc_email`(`email`) USING BTREE,
  UNIQUE INDEX `uc_activation_selector`(`activation_selector`) USING BTREE,
  UNIQUE INDEX `uc_forgotten_password_selector`(`forgotten_password_selector`) USING BTREE,
  UNIQUE INDEX `uc_remember_selector`(`remember_selector`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, '127.0.0.1', 'administrator', '$2y$12$x2m/KYwdZDZigcjLn2RqTeBK.MK3IvXxTMNQ8A308CFgUJECXZhDO', 'admin', NULL, '', NULL, NULL, NULL, NULL, NULL, 1268889823, 1601540492, 1, 'Admin', 'istrator', 'ADMIN', '0');
INSERT INTO `users` VALUES (2, '::1', 'agani', '$2y$10$7Th0dmqcVdH92w4EOBzrauEEt.BFzHFyqni5GE7tig94OWQAnUarS', 'agani', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1567742936, 1567759674, 1, 'agani', 'gan', 'cmw', '081293307289');
INSERT INTO `users` VALUES (3, '::1', 'abdulghanni2@gmail.com', '$2y$10$Kk3GeZJUN8LAO11OzyDPROSMeBxGLYoyTuuRFOkWWyQw3Pi.ba9pO', 'abdulghanni2@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1567755349, NULL, 1, 'adad', 'gfdg', 'cmw', '081293307289');

-- ----------------------------
-- Table structure for users_groups
-- ----------------------------
DROP TABLE IF EXISTS `users_groups`;
CREATE TABLE `users_groups`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uc_users_groups`(`user_id`, `group_id`) USING BTREE,
  INDEX `fk_users_groups_users1_idx`(`user_id`) USING BTREE,
  INDEX `fk_users_groups_groups1_idx`(`group_id`) USING BTREE,
  CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users_groups
-- ----------------------------
INSERT INTO `users_groups` VALUES (1, 1, 1);
INSERT INTO `users_groups` VALUES (2, 1, 2);
INSERT INTO `users_groups` VALUES (3, 2, 2);
INSERT INTO `users_groups` VALUES (4, 3, 2);

-- ----------------------------
-- View structure for akun_level_2
-- ----------------------------
DROP VIEW IF EXISTS `akun_level_2`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `akun_level_2` AS select `acc_master_akun`.`kode_akun` AS `kode_akun`,`acc_master_akun`.`nama_akun` AS `nama_akun`,`acc_master_type`.`nama_akun` AS `induk`,`acc_master_type`.`kode_akun` AS `kode_induk` from (`acc_master_akun` join `acc_master_type` on(`acc_master_type`.`kode_akun` = `acc_master_akun`.`level_1`)) where `acc_master_akun`.`level` = 2 ; ;

-- ----------------------------
-- View structure for qacc_penerimaan_header
-- ----------------------------
DROP VIEW IF EXISTS `qacc_penerimaan_header`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `qacc_penerimaan_header` AS SELECT
	a.id,
	a.tgl_penerimaan,
	a.kode_customer,
	b.customer_name,
	a.kode_akun_debet,
	c.nama_akun AS nama_akun_debet,
	a.kode_akun_kredit,
	d.nama_akun as nama_akun_kredit,
	a.total_penerimaan,
	a.currency,
	a.kurs,
	a.no_cek,
	a.tgl_cek,
	a.keterangan,
	a.status_input,
	a.created_at,
	a.created_by,
	a.created_from
FROM
	acc_penerimaan_header a
	LEFT JOIN master_customer b ON a.kode_customer = b.customer_id
	LEFT JOIN acc_master_akun c ON a.kode_akun_debet = c.nama_akun
	LEFT JOIN acc_master_akun d ON a.kode_akun_kredit = d.nama_akun ; ;

-- ----------------------------
-- View structure for qjurnal_umum
-- ----------------------------
DROP VIEW IF EXISTS `qjurnal_umum`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `qjurnal_umum` AS SELECT a.id, tgl_transaksi, sum(debet) jumlah, keterangan FROM acc_bukti_transaksi a, acc_jurnal_umum j
where a.id = j.id_header
group by a.id, tgl_transaksi ;

-- ----------------------------
-- View structure for qmaster_bom_header
-- ----------------------------
DROP VIEW IF EXISTS `qmaster_bom_header`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `qmaster_bom_header` AS SELECT
	a.id,
	a.kode_barang,
	a.nama_barang,
	a.spesifikasi,
	a.unit,
	a.currency,
	COUNT(b.id) AS jml_bahan_baku
FROM
	master_bom_header a
	LEFT OUTER JOIN master_bom_detail b ON a.id = b.id_header
GROUP BY
	a.id,
	a.kode_barang,
	a.nama_barang,
	a.spesifikasi,
	a.unit,
	a.currency ;

-- ----------------------------
-- View structure for qtrans_wo_header
-- ----------------------------
DROP VIEW IF EXISTS `qtrans_wo_header`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `qtrans_wo_header` AS SELECT
	a.id,
	a.no_wo,
	a.tgl_wo,
	a.customer AS customer_code,
	b.customer_name,
	a.customer_po,
	a.wo_status,
	a.created_at,
	a.created_by,
	a.created_from,
	a.status_input
FROM
	trans_wo_header a
	LEFT JOIN master_customer b ON a.customer = b.customer_id ; ;

-- ----------------------------
-- View structure for view_penerima
-- ----------------------------
DROP VIEW IF EXISTS `view_penerima`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `view_penerima` AS select `master_supplier`.`supplier_id` AS `kode_penerima`,`master_supplier`.`supplier_name` AS `nama_penerima`,'SUPPLIER' AS `ket`,`master_supplier`.`tempo` AS `tempo`,`master_supplier`.`currency` AS `currency`,`master_supplier`.`supplier_country` AS `negara` from `master_supplier` where (`master_supplier`.`active` = 'Y') union all select `master_customer`.`customer_id` AS `customer_id`,`master_customer`.`customer_name` AS `customer_name`,'CUSTOMER' AS `ket`,`master_customer`.`tempo` AS `tempo`,`master_customer`.`currency` AS `currency`,`master_customer`.`customer_country` AS `customer_country` from `master_customer` where (`master_customer`.`active` = 'Y') union all select `master_subcon`.`subcon_id` AS `subcon_id`,`master_subcon`.`subcon_name` AS `subcon_name`,'SUBCON' AS `ket`,`master_subcon`.`tempo` AS `tempo`,`master_subcon`.`currency` AS `currency`,`master_subcon`.`subcon_country` AS `subcon_country` from `master_subcon` where (`master_subcon`.`active` = 'Y') ;

SET FOREIGN_KEY_CHECKS = 1;
