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

-- Dumping structure for view rma.qtrans_masuk_barang_header
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `qtrans_masuk_barang_header`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `qtrans_masuk_barang_header` AS SELECT
	a.id,
	a.tgl_masuk,
	a.no_wo,
	a.kode_produksi,
	a.subcon AS subcon_code,
	c.subcon_name,
	a.bukti_penerimaan,
	a.no_aju,
	a.jenis_dokumen,
	a.no_dokumen,
	a.tgl_dokumen,
	a.gudang AS nama_gudang,
	d.keterangan AS keterangan_gudang,
	COUNT(b.id) AS jml_item,
	COALESCE(SUM(b.qty * b.harga_barang), 0) AS grand_total
FROM
	trans_masuk_barang_header a
	LEFT OUTER JOIN trans_masuk_barang_detail b ON a.id = b.id_header
	LEFT OUTER JOIN master_subcon c ON a.subcon = c.subcon_id
	LEFT OUTER JOIN master_gudang d ON a.gudang = d.nama_gudang
GROUP BY
	a.id,
	a.tgl_masuk,
	a.no_wo,
	a.kode_produksi,
	a.subcon,
	c.subcon_name,
	a.bukti_penerimaan,
	a.no_aju,
	a.jenis_dokumen,
	a.no_dokumen,
	a.tgl_dokumen,
	a.gudang,
	d.keterangan;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
