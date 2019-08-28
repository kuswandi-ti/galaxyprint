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

-- Dumping structure for view rma.qacc_pembayaran_header
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `qacc_pembayaran_header`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `qacc_pembayaran_header` AS SELECT
	a.id,
	a.tgl_transaksi,
	a.kode_penerima AS supplier_id,
	b.supplier_name,
	a.kode_akun,
	c.nama_akun AS nama_akun,
	a.kode_akun_terbayar,
	d.nama_akun AS nama_akun_terbayar,
	a.total_pembayaran,
	a.currency,
	a.no_cek,
	a.tgl_cek,
	a.keterangan
FROM
	acc_pembayaran_header a
	LEFT OUTER JOIN master_supplier b ON a.kode_penerima = b.supplier_id
	LEFT OUTER JOIN acc_master_akun c ON a.kode_akun = c.kode_akun
	LEFT OUTER JOIN acc_master_akun d ON a.kode_akun = d.kode_akun ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
