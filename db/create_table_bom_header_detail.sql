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

-- Dumping structure for table rma.master_bom_detail
CREATE TABLE IF NOT EXISTS `master_bom_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_header` bigint(20) NOT NULL DEFAULT '0',
  `kode_material` varchar(200) DEFAULT NULL,
  `nama_material` varchar(200) DEFAULT NULL,
  `hs_material` varchar(100) DEFAULT NULL,
  `satuan_material` varchar(10) DEFAULT NULL,
  `spesifikasi_bom` varchar(250) DEFAULT NULL,
  `jumlah_bom` decimal(20,2) DEFAULT '0.00',
  `harga_bom` decimal(20,4) DEFAULT '0.0000',
  `currency_bom` varchar(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Dumping data for table rma.master_bom_detail: ~0 rows (approximately)
/*!40000 ALTER TABLE `master_bom_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `master_bom_detail` ENABLE KEYS */;

-- Dumping structure for table rma.master_bom_header
CREATE TABLE IF NOT EXISTS `master_bom_header` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `kode_barang` varchar(200) DEFAULT NULL,
  `nama_barang` varchar(200) DEFAULT NULL,
  `spesifikasi` varchar(100) DEFAULT NULL,
  `unit` varchar(200) DEFAULT NULL,
  `currency` varchar(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Dumping data for table rma.master_bom_header: ~0 rows (approximately)
/*!40000 ALTER TABLE `master_bom_header` DISABLE KEYS */;
/*!40000 ALTER TABLE `master_bom_header` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
