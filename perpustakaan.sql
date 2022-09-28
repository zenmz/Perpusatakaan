/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 100424
 Source Host           : localhost:3306
 Source Schema         : perpustakaan

 Target Server Type    : MySQL
 Target Server Version : 100424
 File Encoding         : 65001

 Date: 28/09/2022 09:32:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for anggota
-- ----------------------------
DROP TABLE IF EXISTS `anggota`;
CREATE TABLE `anggota`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `telpon` varchar(12) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `alamat` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for buku
-- ----------------------------
DROP TABLE IF EXISTS `buku`;
CREATE TABLE `buku`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `kategori_id` int UNSIGNED NOT NULL,
  `penerbit_id` int UNSIGNED NOT NULL,
  `pengarang` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tahun_terbit` int NOT NULL,
  `sinopsis` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `gambar` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `buku_kategori_id`(`kategori_id`) USING BTREE,
  INDEX `buku_penerbit_id`(`penerbit_id`) USING BTREE,
  CONSTRAINT `buku_kategori_id` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `buku_penerbit_id` FOREIGN KEY (`penerbit_id`) REFERENCES `penerbit` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for kategori
-- ----------------------------
DROP TABLE IF EXISTS `kategori`;
CREATE TABLE `kategori`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama_kategori` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for peminjaman
-- ----------------------------
DROP TABLE IF EXISTS `peminjaman`;
CREATE TABLE `peminjaman`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `tanggal_pinjam` date NOT NULL,
  `lama_pinjam` int NOT NULL,
  `status` enum('dipinjam','sudah dikembalikan') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `anggota_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `buku_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `peminjaman_anggota_id`(`anggota_id`) USING BTREE,
  INDEX `peminjaman_user_id`(`user_id`) USING BTREE,
  INDEX `peminjaman_buku`(`buku_id`) USING BTREE,
  CONSTRAINT `peminjaman_anggota_id` FOREIGN KEY (`anggota_id`) REFERENCES `anggota` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `peminjaman_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `peminjaman_buku` FOREIGN KEY (`buku_id`) REFERENCES `buku` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for penerbit
-- ----------------------------
DROP TABLE IF EXISTS `penerbit`;
CREATE TABLE `penerbit`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama_penerbit` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `password` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `level` enum('admin','petugas') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
