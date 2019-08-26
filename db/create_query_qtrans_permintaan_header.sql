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

-- Dumping structure for view rma.qtrans_permintaan_header
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `qtrans_permintaan_header`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `qtrans_permintaan_header` AS SELECT
	a.id,
	a.tgl_permintaan,
	a.no_wo,
	a.bagian,
	a.pic,
	a.keterangan,
	a.status_permintaan,
	a.status_input,
	COUNT(b.id) AS jml_item
FROM
	trans_permintaan_header a
	LEFT OUTER JOIN trans_permintaan_detail b ON a.id = b.id_header
GROUP BY
	a.id,
	a.tgl_permintaan,
	a.no_wo,
	a.bagian,
	a.pic,
	a.keterangan,
	a.status_permintaan,
	a.status_input;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
