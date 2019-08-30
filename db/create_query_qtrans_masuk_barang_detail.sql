-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.35-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for view rma.qtrans_masuk_barang_detail
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `qtrans_masuk_barang_detail`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `qtrans_masuk_barang_detail` AS SELECT
	a.id,
	a.id_header,
	a.kode_barang,
	a.nama_barang,
	a.spesifikasi_barang,
	a.hs_barang,
	a.satuan_barang,
	a.qty,
	a.qty_keluar,
	a.harga_barang,
	a.qty * a.harga_barang AS total,
	a.currency,
	a.id_wo_detail,
	a.gudang AS nama_gudang,
	b.keterangan AS keterangan_gudang,
	a.status_input
FROM
	trans_masuk_barang_detail a
	LEFT OUTER JOIN master_gudang b ON a.gudang = b.nama_gudang ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
