-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 10, 2021 at 01:39 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nhom9_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `id_bill` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `bill_detail` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'STT,name,price,so luong,thanhtien,===tong tien',
  `ghichu` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cate_id` int(11) NOT NULL,
  `cate_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cate_id`, `cate_name`) VALUES
(1, 'Điện Thoại'),
(2, 'LapTop'),
(3, 'Máy Tính Bảng'),
(4, 'Đồng Hồ'),
(5, 'Phụ Kiện');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `id_products` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `id_products`, `name`, `comment`, `created_at`) VALUES
(79, 1, 'Phạm Văn Hiệu', 'hay', '2019-12-16 11:39:20'),
(80, 1, 'Phạm Văn Hiệu', 'hay', '2019-12-16 11:39:24');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `fullname`, `phone`, `email`, `address`) VALUES
(64, 'Phạm Văn Hiệu', '0359003130', 'vanhieutdc6@gmail.com', '143/12 đường 11, phường Trường Thọ,quận Thủ Đức,tp.Hồ Chí Minh');

-- --------------------------------------------------------

--
-- Table structure for table `manufactures`
--

CREATE TABLE `manufactures` (
  `manu_id` int(11) NOT NULL,
  `manu_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `manufactures`
--

INSERT INTO `manufactures` (`manu_id`, `manu_name`) VALUES
(1, 'oppo'),
(2, 'samsung'),
(3, 'apple'),
(4, 'acer'),
(5, 'asus'),
(6, 'vivo\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `manu_id` int(255) NOT NULL,
  `cate_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `hot` tinyint(4) NOT NULL,
  `sale` int(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `manu_id`, `cate_id`, `price`, `image`, `description`, `hot`, `sale`) VALUES
(53, 'Laptop Acer Aspire 5 A514 54 33WY i3 1115G4/4GB/256GB/Win10 (NX.A23SV.00J)\r\n\r\n\r\n', 1, 1, 13590000, 'acer-aspire-5-a514-54-33wy-i3-nxa23sv00j-021220-101200-600x600.jpg', 'Thông số kỹ thuật\r\nCPU:	Intel Core i3 Tiger Lake, 1115G4, 3.00 GHz\r\nRAM:	4 GB, DDR4 (On board +1 khe), 2666 MHz\r\nỔ cứng:	SSD 256GB NVMe PCIe, Hỗ trợ khe cắm HDD SATA\r\nMàn hình:	14 inch, Full HD (1920 x 1080)\r\nCard màn hình:	Card đồ họa tích hợp, Intel UHD Graphics\r\nCổng kết nối:	3 x USB 3.2, HDMI, LAN (RJ45), USB Type-C\r\nHệ điều hành:	Windows 10 Home SL\r\nThiết kế:	Vỏ nhựa - nắp lưng bằng kim loại, PIN liền\r\nKích thước:	Dày 17.95 mm, 1.46 kg\r\nThời điểm ra mắt:	2020', 1, 0),
(54, 'Laptop Acer Swift 3 SF315 51 54H0 i5 8250U/4GB/1TB/Win10 (NX.GSKSV.004)\r\n\r\n\r\n', 1, 1, 11890000, 'acer-sf315-51-54h0-i5-8250u-4gb-1tb-win107-201769-600x600.jpg', 'Thông số kỹ thuật\r\nCPU:	Intel Core i5 Coffee Lake, 8250U, 1.60 GHz\r\nRAM:	4 GB, DDR4 (On board), 2400 MHz\r\nỔ cứng:	HDD: 1 TB SATA3, Hỗ trợ khe cắm SSD M.2 PCIe\r\nMàn hình:	15.6 inch, Full HD (1920 x 1080)\r\nCard màn hình:	Card đồ họa tích hợp, Intel® UHD Graphics 620\r\nCổng kết nối:	2 x USB 3.0, HDMI, USB 2.0, USB Type-C\r\nHệ điều hành:	Windows 10 Home SL\r\nThiết kế:	Vỏ kim loại, PIN liền\r\nKích thước:	Dày 18.9 mm, 1.7 kg\r\nThời điểm ra mắt:	2019', 1, 0),
(55, 'Laptop Acer Swift 3 SF314 57 52GB i5 1035G1/8GB/512GB/Win10 (NX.HJFSV.001)\r\n\r\n\r\n', 1, 1, 18490000, 'acer-swift-3-sf314-nx-hjfsv-0018-217351-600x600.jpg', 'Thông số kỹ thuật\r\nCPU:	Intel Core i5 Ice Lake, 1035G1, 1.00 GHz\r\nRAM:	8 GB, LPDDR4 (On board), 2666 MHz\r\nỔ cứng:	SSD 512 GB M.2 PCIe\r\nMàn hình:	14 inch, Full HD (1920 x 1080)\r\nCard màn hình:	Card đồ họa tích hợp, Intel UHD Graphics\r\nCổng kết nối:	USB 3.1, HDMI, USB 2.0, USB Type-C\r\nHệ điều hành:	Windows 10 Home SL\r\nThiết kế:	Nhôm - Magie, PIN liền\r\nKích thước:	Dày 15.95 mm, 1.19 kg\r\nThời điểm ra mắt:	2019', 1, 0),
(56, 'Laptop Acer Swift 3S SF314 57G 53T1 i5 1035G1/8GB/512GB/2GB MX250/Win10 (NX.HJESV.001)\r\n\r\n\r\n', 1, 1, 19490000, 'acer-swift-3s-sf314-57g-53t1-i5-1035g1-8gb-512gb-2-9-213849-600x600.jpg', 'Thông số kỹ thuật\r\nCPU:	Intel Core i5 Ice Lake, 1035G1, 1.00 GHz\r\nRAM:	8 GB, LPDDR4 (On board), 2666 MHz\r\nỔ cứng:	SSD 512 GB M.2 PCIe, Không hỗ trợ khe cắm HDD\r\nMàn hình:	14 inch, Full HD (1920 x 1080)\r\nCard màn hình:	Card đồ họa rời, NVIDIA GeForce MX250 2GB\r\nCổng kết nối:	Thunderbolt 3, USB 3.1, HDMI, USB 2.0\r\nHệ điều hành:	Windows 10 Home SL\r\nThiết kế:	Nhôm - Magie, PIN liền\r\nKích thước:	Dày 15.95 mm, 1.19kg\r\nThời điểm ra mắt:	2019', 1, 0),
(57, 'Laptop Acer Aspire A315 54 558R i5 8265U/4GB/1TB/Win10 (NX.HEFSV.005)\r\n\r\n', 1, 1, 11490000, 'acer-aspire-a315-54-558r-i5-8265u-4gb-1tb-win10-n3-209143-600x600.jpg', 'Thông số kỹ thuật\r\nCPU:	Intel Core i5 Coffee Lake, 8265U, 1.60 GHz\r\nRAM:	4 GB, DDR4 (1 khe), 2400 MHz\r\nỔ cứng:	HDD: 1 TB SATA3, Hỗ trợ khe cắm SSD M.2 PCIe\r\nMàn hình:	15.6 inch, Full HD (1920 x 1080)\r\nCard màn hình:	Card đồ họa tích hợp, Intel® HD Graphics 620\r\nCổng kết nối:	2 x USB 2.0, USB 3.1, HDMI, LAN (RJ45)\r\nHệ điều hành:	Windows 10 Home SL\r\nThiết kế:	Vỏ nhựa, PIN liền\r\nKích thước:	Dày 17.95 mm, 1.7 Kg\r\nThời điểm ra mắt:	2019', 1, 0),
(58, 'Laptop Acer Swift 3 SF314 56 38UE i3 8145U/4GB/256GB/Win10 (NX.H4CSV.005)\r\n\r\n', 1, 1, 14190000, 'acer-swift-sf314-56-38ue-i3-8145u-4gb-256gb-win10-202267-202267-600x600.jpg', 'Thông số kỹ thuật\r\nCPU:	Intel Core i3 Coffee Lake, 8145U, 2.10 GHz\r\nRAM:	4 GB, DDR4 (On board +1 khe), 2400 MHz\r\nỔ cứng:	SSD 256GB NVMe PCIe, Hỗ trợ khe cắm HDD SATA\r\nMàn hình:	14 inch, Full HD (1920 x 1080)\r\nCard màn hình:	Card đồ họa tích hợp, Intel® UHD Graphics 620\r\nCổng kết nối:	2 x USB 3.0, HDMI, USB 2.0, USB Type-C\r\nHệ điều hành:	Windows 10 Home SL\r\nThiết kế:	Vỏ kim loại, PIN liền\r\nKích thước:	Dày 17.95 mm, 1.45 kg\r\nThời điểm ra mắt:	2018', 1, 0),
(59, 'Laptop Acer Aspire A514 53 5921 i5 1035G1/8GB/512GB/Win10 (NX.HUPSV.001)\r\n\r\n', 1, 1, 16490000, 'acer-aspire-a514-53-5921-i5-nxhupsv001-223657-1-600x600.jpg', 'Thông số kỹ thuật\r\nCPU:	Intel Core i5 Ice Lake, 1035G1, 1.00 GHz\r\nRAM:	8 GB, DDR4 (On board 4GB +1 khe 4GB), 2666 MHz\r\nỔ cứng:	SSD 512 GB M.2 PCIe, Hỗ trợ khe cắm HDD SATA\r\nMàn hình:	14 inch, Full HD (1920 x 1080)\r\nCard màn hình:	Card đồ họa tích hợp, Intel UHD Graphics\r\nCổng kết nối:	2 x USB 3.1, HDMI, LAN (RJ45), USB 2.0, USB Type-C\r\nHệ điều hành:	Windows 10 Home SL\r\nThiết kế:	Vỏ nhựa - nắp lưng bằng kim loại, PIN liền\r\nKích thước:	Dày 17.95 mm, 1.5kg\r\nThời điểm ra mắt:	2020', 1, 0),
(60, 'Laptop Acer Swift 5 SF514 53T 51EX i5 8265U/8GB/256GB/Touch/Win10 (NX.H7KSV.001)\r\n', 1, 1, 23490000, 'acer-swift-sf5-i5-8265u-8gb-256gb-win10-13-201236-600x600.jpg', 'Thông số kỹ thuật\r\nCPU:	Intel Core i5 Coffee Lake, 8265U, 1.60 GHz\r\nRAM:	8 GB, DDR4 (On board), 2400 MHz\r\nỔ cứng:	SSD 256GB NVMe PCIe\r\nMàn hình:	14 inch, Full HD (1920 x 1080)\r\nCard màn hình:	Card đồ họa tích hợp, Intel® UHD Graphics 620\r\nCổng kết nối:	2 x USB 3.0, HDMI, USB Type-C\r\nHệ điều hành:	Windows 10 Home SL\r\nThiết kế:	Nhôm - Magie, PIN liền\r\nKích thước:	Dày 14.9 mm,', 1, 0),
(61, 'Laptop Asus VivoBook X409JA i5 1035G1/8GB/512GB/Win10 (EK052T)', 1, 1, 15490000, 'asus-vivobook-x409ja-i5-ek052t-220976-600x600.jpg', 'Thông số kỹ thuật\r\nCPU:	Intel Core i5 Ice Lake, 1035G1, 1.00 GHz\r\nRAM:	8 GB, DDR4 (On board 4GB +1 khe 4GB), 2666 MHz\r\nỔ cứng:	SSD 512 GB M.2 PCIe, Không hỗ trợ khe cắm HDD\r\nMàn hình:	14 inch, Full HD (1920 x 1080)\r\nCard màn hình:	Card đồ họa tích hợp, Intel UHD Graphics\r\nCổng kết nối:	2 x USB 2.0, USB 3.1, HDMI, USB Type-C\r\nHệ điều hành:	Windows 10 Home SL\r\nThiết kế:	Vỏ nhựa, PIN liền\r\nKích thước:	Dày 22.9 mm, 1.47 kg\r\nThời điểm ra mắt:	2019', 1, 0),
(62, 'Laptop Asus VivoBook X509JA i3 1005G1/4GB/256GB/Win10 (EJ480T)\r\n', 1, 1, 10890000, 'asus-vivobook-x509ja-i3-ej480t-225608-600x600.jpg', 'Thông số kỹ thuật\r\nCPU:	Intel Core i3 Ice Lake, 1005G1, 1.20 GHz\r\nRAM:	4 GB, DDR4 (On board +1 khe), 2666 MHz\r\nỔ cứng:	SSD 256GB NVMe PCIe, Hỗ trợ khe cắm HDD SATA\r\nMàn hình:	15.6 inch, Full HD (1920 x 1080)\r\nCard màn hình:	Card đồ họa tích hợp, Intel UHD Graphics\r\nCổng kết nối:	2 x USB 2.0, USB 3.1, HDMI, USB Type-C\r\nHệ điều hành:	Windows 10 Home SL\r\nThiết kế:	Vỏ nhựa, PIN liền\r\nKích thước:	Dày 22.9 mm, 1.73 kg\r\nThời điểm ra mắt:	2020', 1, 0),
(63, 'Laptop Asus VivoBook A515EA i3 1115G4/8GB/512GB/Win10 (BQ497T)\r\n', 2, 1, 14690000, 'asus-vivobook-a515ea-i3-bq497t-062220-092221-600x600.jpg', 'Thông số kỹ thuật\r\nCPU:	Intel Core i3 Tiger Lake, 1115G4, 3.00 GHz\r\nRAM:	8 GB, DDR4 (On board +1 khe), 3200 MHz\r\nỔ cứng:	SSD 512 GB M.2 PCIe, Hỗ trợ khe cắm HDD SATA\r\nMàn hình:	15.6 inch, Full HD (1920 x 1080)\r\nCard màn hình:	Card đồ họa tích hợp, Intel UHD Graphics\r\nCổng kết nối:	1 x USB 3.2, 2 x USB 2.0, HDMI, USB Type-C\r\nHệ điều hành:	Windows 10 Home SL\r\nThiết kế:	Vỏ kim loại, PIN liền\r\nKích thước:	Dày 17.9 mm, 1.8 kg\r\nThời điểm ra mắt:	2020', 1, 0),
(64, 'Laptop Asus VivoBook X409JA i3 1005G1/4GB/512GB/Win10 (EK015T)', 2, 1, 11590000, 'asus-x409ja-i3-ek015t.jpg', 'Thông số kỹ thuật\r\nCPU:	Intel Core i3 Tiger Lake, 1115G4, 3.00 GHz\r\nRAM:	8 GB, DDR4 (On board +1 khe), 3200 MHz\r\nỔ cứng:	SSD 512 GB M.2 PCIe, Hỗ trợ khe cắm HDD SATA\r\nMàn hình:	15.6 inch, Full HD (1920 x 1080)\r\nCard màn hình:	Card đồ họa tích hợp, Intel UHD Graphics\r\nCổng kết nối:	1 x USB 3.2, 2 x USB 2.0, HDMI, USB Type-C\r\nHệ điều hành:	Windows 10 Home SL\r\nThiết kế:	Vỏ kim loại, PIN liền\r\nKích thước:	Dày 17.9 mm, 1.8 kg\r\nThời điểm ra mắt:	2020', 1, 0),
(65, 'Laptop Asus VivoBook A415EA i3 1115G4/4GB/512GB/Win10 (EB317T)\r\n', 2, 1, 13690000, 'asus-vivobook-a415ea-i3-eb317t-062420-092402-600x600.jpg', 'Thông số kỹ thuật\r\nCPU:	Intel Core i3 Tiger Lake, 1115G4, 3.00 GHz\r\nRAM:	4 GB, DDR4 (On board), 3200 MHz\r\nỔ cứng:	SSD 512 GB M.2 PCIe, Hỗ trợ khe cắm SSD M.2 PCIe\r\nMàn hình:	14 inch, Full HD (1920 x 1080)\r\nCard màn hình:	Card đồ họa tích hợp, Intel UHD Graphics\r\nCổng kết nối:	2 x USB 2.0, USB 3.1, HDMI, USB Type-C\r\nHệ điều hành:	Windows 10 Home SL\r\nThiết kế:	Vỏ nhựa - nắp lưng bằng kim loại, PIN liền\r\nKích thước:	Dày 17.9 mm, 1.4 kg\r\nThời điểm ra mắt:	2020', 1, 0),
(66, 'Laptop Asus VivoBook X509MA N5030/4GB/512GB/Win10 (EJ256T)\r\n', 2, 1, 8890000, 'asus-vivobook-x509ma-n5030-ej256t-171120-051158-600x600.jpg', 'Thông số kỹ thuật\r\nCPU:	Intel Pentium, N5030, 1.10 GHz\r\nRAM:	4 GB, DDR4 (1 khe), 2666 MHz\r\nỔ cứng:	SSD 512 GB M.2 PCIe, Hỗ trợ khe cắm HDD SATA\r\nMàn hình:	15.6 inch, Full HD (1920 x 1080)\r\nCard màn hình:	Card đồ họa tích hợp, Intel® UHD Graphics 605\r\nCổng kết nối:	2 x USB 2.0, HDMI, USB 3.0, USB Type-C\r\nHệ điều hành:	Windows 10 Home SL\r\nThiết kế:	Vỏ nhựa, PIN liền\r\nKích thước:	Dày 22.9 mm, 1.9 kg\r\nThời điểm ra mắt:	2020', 1, 0),
(67, 'Laptop Asus VivoBook A415EA i3 1115G4/4GB/32GB+512GB/Win10 (EB353T)\r\n\r\n', 1, 1, 14190000, 'asus-vivobook-a415ea-i3-eb353t-062320-092323-600x600.jpg', 'Thông số kỹ thuật\r\nCPU:	Intel Core i3 Tiger Lake, 1115G4, 3.00 GHz\r\nRAM:	4 GB, DDR4 (On board), 3200 MHz\r\nỔ cứng:	Intel Optane 32GB (H10), SSD 512 GB M.2 PCIe, Hỗ trợ khe cắm SSD M.2 PCIe\r\nMàn hình:	14 inch, Full HD (1920 x 1080)\r\nCard màn hình:	Card đồ họa tích hợp, Intel UHD Graphics\r\nCổng kết nối:	2 x USB 2.0, USB 3.1, HDMI, USB Type-C\r\nHệ điều hành:	Windows 10 Home SL\r\nThiết kế:	Vỏ kim loại, PIN liền\r\nKích thước:	Dày 17.9 mm, 1.4 kg\r\nThời điểm ra mắt:	2020', 1, 0),
(68, 'Laptop Asus VivoBook X509JP i5 1035G1/8GB/512GB/2GB MX330/Win10 (EJ023T)', 1, 1, 17190000, 'asus-vivobook-x509jp-i5-ej023t-2gb-221617-600x600.jpg', 'Thông số kỹ thuật\r\nCPU:	Intel Core i5 Ice Lake, 1035G1, 1.00 GHz\r\nRAM:	8 GB, DDR4 (On board 4GB +1 khe 4GB), 2666 MHz\r\nỔ cứng:	SSD 512 GB M.2 PCIe, Hỗ trợ khe cắm HDD SATA\r\nMàn hình:	15.6 inch, Full HD (1920 x 1080)\r\nCard màn hình:	Card đồ họa rời, NVIDIA GeForce MX330, 2GB\r\nCổng kết nối:	2 x USB 2.0, USB 3.1, HDMI, USB Type-C\r\nHệ điều hành:	Windows 10 Home SL\r\nThiết kế:	Vỏ nhựa, PIN liền\r\nKích thước:	Dày 22.9 mm, 1.73 kg\r\nThời điểm ra mắt:	2019', 1, 0),
(69, 'Laptop Asus VivoBook X509JP i5 1035G1/8GB/512GB/2GB MX330/Win10 (EJ023T)\r\n', 1, 1, 17190000, 'asus-vivobook-x509jp-i5-ej023t-2gb-221617-600x600 (1).jpg', 'Thông số kỹ thuật\r\nCPU:	Intel Core i5 Ice Lake, 1035G1, 1.00 GHz\r\nRAM:	8 GB, DDR4 (On board 4GB +1 khe 4GB), 2666 MHz\r\nỔ cứng:	SSD 512 GB M.2 PCIe, Hỗ trợ khe cắm HDD SATA\r\nMàn hình:	15.6 inch, Full HD (1920 x 1080)\r\nCard màn hình:	Card đồ họa rời, NVIDIA GeForce MX330, 2GB\r\nCổng kết nối:	2 x USB 2.0, USB 3.1, HDMI, USB Type-C\r\nHệ điều hành:	Windows 10 Home SL\r\nThiết kế:	Vỏ nhựa, PIN liền\r\nKích thước:	Dày 22.9 mm, 1.73 kg\r\nThời điểm ra mắt:	2019', 1, 0),
(70, 'Laptop Asus VivoBook A415EA i5 1135G7/8GB/32GB+512GB/Win10 (EB355T)\r\n', 1, 1, 17590000, 'asus-vivobook-a415ea-i5-eb355t-600x600.jpg', 'Thông số kỹ thuật\r\nCPU:	Intel Core i5 Tiger Lake, 1135G7, 2.40 GHz\r\nRAM:	8 GB, DDR4 (On board), 3200 MHz\r\nỔ cứng:	Intel Optane 32GB (H10), SSD 512 GB M.2 PCIe, Hỗ trợ khe cắm SSD M.2 PCIe\r\nMàn hình:	14 inch, Full HD (1920 x 1080)\r\nCard màn hình:	Card đồ họa tích hợp, Intel® Iris® Xe Graphics\r\nCổng kết nối:	2 x USB 2.0, USB 3.1, HDMI, USB Type-C\r\nHệ điều hành:	Windows 10 Home SL\r\nThiết kế:	Vỏ nhựa - nắp lưng bằng kim loại, PIN liền\r\nKích thước:	Dày 17.9 mm, 1.4 kg\r\nThời điểm ra mắt:	2020', 1, 0),
(71, 'Laptop Asus VivoBook X515MA N5030/4GB/512GB/Win10 (EJ120T)\r\n', 1, 1, 8890000, 'asus-vivobook-x515ma-n5030-ej120t-600x600.jpg', 'Thông số kỹ thuật\r\nCPU:	Intel Pentium, N5030, 1.10 GHz\r\nRAM:	4 GB, DDR4 (1 khe), 2666 MHz\r\nỔ cứng:	SSD 512 GB M.2 PCIe\r\nMàn hình:	15.6 inch, Full HD (1920 x 1080)\r\nCard màn hình:	Card đồ họa tích hợp, Intel® UHD Graphics 605\r\nCổng kết nối:	1 x USB 3.2, 2 x USB 2.0, HDMI, USB Type-C\r\nHệ điều hành:	Windows 10 Home SL\r\nThiết kế:	Vỏ nhựa, PIN liền\r\nKích thước:	Dày 19.9 mm, 1.8 kg\r\nThời điểm ra mắt:	2020', 1, 0),
(72, 'Laptop Asus VivoBook A412F i5 10210U/8GB/32GB+512GB/Win10 (EK739T)', 1, 1, 16490000, 'asus-vivobook-a412f-i510210u-8gb-32gb-512gb-win10-kg-218865-600x600.jpg', 'Thông số kỹ thuật\r\nCPU:	Intel Core i5 Comet Lake, 10210U, 1.60 GHz\r\nRAM:	8 GB, DDR4 (On board 4GB +1 khe 4GB), 2666 MHz\r\nỔ cứng:	Intel Optane 32GB (H10), SSD 512 GB M.2 PCIe, Hỗ trợ khe cắm HDD SATA\r\nMàn hình:	14 inch, Full HD (1920 x 1080)\r\nCard màn hình:	Card đồ họa tích hợp, Intel UHD Graphics\r\nCổng kết nối:	USB 3.1, HDMI, USB 2.0, USB Type-C\r\nHệ điều hành:	Windows 10 Home SL\r\nThiết kế:	Vỏ nhựa, PIN liền\r\nKích thước:	Dày 19.5 mm, 1.406 kg\r\nThời điểm ra mắt:	2019', 1, 0),
(73, 'Laptop Asus VivoBook X509JA i7 1065G7/8GB/512GB/Office H&S2019/Win10 (EJ232TS)\r\n', 1, 1, 19490000, 'asus-vivobook-x509ja-i7-ej232ts-vântay-220576-600x600.jpg', 'Thông số kỹ thuật\r\nCPU:	Intel Core i7 Ice Lake, 1065G7, 1.30 GHz\r\nRAM:	8 GB, DDR4 (On board 4GB +1 khe 4GB), 2666 MHz\r\nỔ cứng:	SSD 512 GB M.2 PCIe, Hỗ trợ khe cắm HDD SATA\r\nMàn hình:	15.6 inch, Full HD (1920 x 1080)\r\nCard màn hình:	Card đồ họa tích hợp, Intel Iris Plus Graphics\r\nCổng kết nối:	2 x USB 2.0, HDMI, USB Type-C, USB 3.0', 1, 0),
(74, 'Laptop Asus VivoBook A415EA i5 1135G7/8GB/512GB/Win10 (EB354T)\r\n', 1, 1, 17290000, 'asus-vivobook-a415ea-i5-eb354t-600x600.jpg', 'Thông số kỹ thuật\r\nCPU:	Intel Core i5 Tiger Lake, 1135G7, 2.40 GHz\r\nRAM:	8 GB, DDR4 (On board), 3200 MHz\r\nỔ cứng:	SSD 512 GB M.2 PCIe, Hỗ trợ khe cắm SSD M.2 PCIe\r\nMàn hình:	14 inch, Full HD (1920 x 1080)\r\nCard màn hình:	Card đồ họa tích hợp, Intel® Iris® Xe Graphics\r\nCổng kết nối:	2 x USB 2.0, USB 3.1, HDMI, USB Type-C\r\nHệ điều hành:	Windows 10 Home SL\r\nThiết kế:	Vỏ nhựa - nắp lưng bằng kim loại, PIN liền\r\nKích thước:	Dày 17.9 mm, 1.4 kg\r\nThời điểm ra mắt:	2020', 1, 0),
(76, 'Laptop Asus VivoBook S530FN i5 8265U/4GB/1TB/2GB MX150/Win10 (BQ128T)', 1, 1, 14290000, 'asus-vivobook-a415ea-i5-eb354t-600x600.jpg', 'Thông số kỹ thuật\r\nCPU:	Intel Core i5 Coffee Lake, 8265U, 1.60 GHz\r\nRAM:	4 GB, DDR4 (2 khe), 2400 MHz\r\nỔ cứng:	HDD: 1 TB SATA3, Hỗ trợ khe cắm SSD M.2 PCIe\r\nMàn hình:	15.6 inch, Full HD (1920 x 1080)\r\nCard màn hình:	Card đồ họa rời, NVIDIA Geforce MX150, 2GB\r\nCổng kết nối:	2 x USB 2.0, USB 3.1, HDMI, USB Type-C\r\nHệ điều hành:	Windows 10 Home SL\r\nThiết kế:	Vỏ nhựa - nắp lưng bằng kim loại, PIN liền\r\nKích thước:	Dày 18 mm, 1.76 kg\r\nThời điểm ra mắt:	2018', 1, 0),
(77, 'Điện thoại Vivo Y12s (3GB/32GB)\r\n', 1, 1, 3290000, 'vivo-y12s-xanh-600x600.jpg', 'Thông số kỹ thuật\r\nMàn hình:	IPS LCD, 6.51\", HD+\r\nHệ điều hành:	Android 10\r\nCamera sau:	Chính 13 MP & Phụ 2 MP\r\nCamera trước:	8 MP', 1, 0),
(78, 'Điện thoại Vivo X50 Pro', 0, 1, 17990000, 'vivo-x50-pro-14-600x600.jpg', '\r\nThông số kỹ thuật\r\nMàn hình:	AMOLED, 6.56\", Full HD+\r\nHệ điều hành:	Android 10\r\nCamera sau:	Chính 48 MP & Phụ 13 MP, 8 MP, 8 MP\r\nCamera trước:	32 MP\r\nCPU:	Snapdragon 765G 8 nhân\r\nRAM:	8 GB\r\nBộ nhớ trong:	256 GB\r\nThẻ SIM:\r\n2 Nano SIM, Hỗ trợ 5G', 1, 0),
(79, 'Điện thoại Vivo V19', 1, 1, 7490000, 'vivo-v19-xanh-new-600x600-600x600.jpg', 'Thông số kỹ thuật\r\nMàn hình:	Super AMOLED, 6.44\", Full HD+\r\nHệ điều hành:	Android 10\r\nCamera sau:	Chính 48 MP & Phụ 8 MP, 2 MP, 2 MP\r\nCamera trước:	Chính 32 MP & Phụ 8 MP\r\nCPU:	Snapdragon 712 8 nhân\r\nRAM:	8 GB\r\nBộ nhớ trong:	128 GB\r\nThẻ nhớ:	MicroSD, hỗ trợ tối đa 256 GB\r\nThẻ SIM:\r\n2 Nano SIM, Hỗ trợ 4G', 1, 0),
(80, 'Điện thoại Vivo V20', 1, 1, 7990000, 'vivo-v20-(4).jpg', 'Thông số kỹ thuật\r\nMàn hình:	AMOLED, 6.44\", Full HD+\r\nHệ điều hành:	Android 11\r\nCamera sau:	Chính 64 MP & Phụ 8 MP, 2 MP\r\nCamera trước:	44 MP\r\nCPU:	Snapdragon 720G 8 nhân\r\nRAM:	8 GB\r\nBộ nhớ trong:	128 GB\r\nThẻ nhớ:	MicroSD, hỗ trợ tối đa 256 GB\r\nThẻ SIM:\r\n2 Nano SIM, Hỗ trợ 4G', 1, 0),
(81, 'Điện thoại Vivo V19 Neo', 1, 1, 6990000, 'vivo-v19-neo-den-600x600.jpg', 'Thông số kỹ thuật\r\nMàn hình:	Super AMOLED, 6.44\", Full HD+\r\nHệ điều hành:	Android 10\r\nCamera sau:	Chính 48 MP & Phụ 8 MP, 2 MP, 2 MP\r\nCamera trước:	32 MP\r\nCPU:	Snapdragon 675 8 nhân\r\nRAM:	8 GB\r\nBộ nhớ trong:	128 GB\r\nThẻ nhớ:	MicroSD, hỗ trợ tối đa 256 GB\r\nThẻ SIM:\r\n2 Nano SIM, Hỗ trợ 4G', 1, 0),
(82, 'Điện thoại Vivo V20 SE\r\n', 1, 1, 6790000, 'vivo-v20-se-600x600-600x600.jpg', 'Thông số kỹ thuật\r\nMàn hình:	AMOLED, 6.44\", Full HD+\r\nHệ điều hành:	Android 10\r\nCamera sau:	Chính 48 MP & Phụ 8 MP, 2 MP\r\nCamera trước:	32 MP\r\nCPU:	Snapdragon 665 8 nhân\r\nRAM:	8 GB\r\nBộ nhớ trong:	128 GB\r\nThẻ nhớ:	MicroSD, hỗ trợ tối đa 1 TB\r\nThẻ SIM:\r\n2 Nano SIM, Hỗ trợ 4G', 1, 0),
(83, 'Điện thoại Vivo Y50', 1, 1, 5590000, 'vivo-y50-xanh-600x600-600x600.jpg', 'Thông số kỹ thuật\r\nMàn hình:	IPS LCD, 6.53\", Full HD+\r\nHệ điều hành:	Android 10\r\nCamera sau:	Chính 13 MP & Phụ 8 MP, 2 MP, 2 MP\r\nCamera trước:	16 MP\r\nCPU:	Snapdragon 665 8 nhân\r\nRAM:	8 GB\r\nBộ nhớ trong:	128 GB\r\nThẻ nhớ:	MicroSD, hỗ trợ tối đa 256 GB\r\nThẻ SIM:\r\n2 Nano SIM, Hỗ trợ 4G', 1, 0),
(84, 'Điện thoại Vivo S1 Pro', 1, 1, 5490000, 'vivo-s1-pro-white-1-600x600.jpg', 'Thông số kỹ thuật\r\nMàn hình:	Super AMOLED, 6.38\", Full HD+\r\nHệ điều hành:	Android 9 (Pie)\r\nCamera sau:	Chính 48 MP & Phụ 8 MP, 2 MP, 2 MP\r\nCamera trước:	32 MP\r\nCPU:	Snapdragon 665 8 nhân\r\nRAM:	8 GB\r\nBộ nhớ trong:	128 GB\r\nThẻ nhớ:	MicroSD, hỗ trợ tối đa 256 GB\r\nThẻ SIM:\r\n2 Nano SIM, Hỗ trợ 4G', 1, 0),
(85, 'Điện thoại Vivo Y19', 1, 1, 4590000, 'vivo-y19-white-1-600x600.jpg', 'Thông số kỹ thuật\r\nMàn hình:	IPS LCD, 6.53\", Full HD+\r\nHệ điều hành:	Android 9 (Pie)\r\nCamera sau:	Chính 16 MP & Phụ 8 MP, 2 MP\r\nCamera trước:	16 MP\r\nCPU:	MediaTek MT6768 8 nhân (Helio P65)\r\nRAM:	6 GB\r\nBộ nhớ trong:	128 GB\r\nThẻ nhớ:	MicroSD, hỗ trợ tối đa 256 GB\r\nThẻ SIM:\r\n2 Nano SIM, Hỗ trợ 4G', 1, 0),
(86, 'Điện thoại Vivo Y20s', 1, 1, 4990000, 'vivo-y20s-xanh-1-600x600.jpg', 'Thông số kỹ thuật\r\nMàn hình:	IPS LCD, 6.51\", HD+\r\nHệ điều hành:	Android 10\r\nCamera sau:	Chính 13 MP & Phụ 2 MP, 2 MP\r\nCamera trước:	8 MP\r\nCPU:	Snapdragon 460 8 nhân\r\nRAM:	6 GB\r\nBộ nhớ trong:	128 GB\r\nThẻ nhớ:	MicroSD, hỗ trợ tối đa 256 GB\r\nThẻ SIM:\r\n2 Nano SIM, Hỗ trợ 4G', 1, 0),
(87, 'Điện thoại Vivo Y30', 1, 1, 4090000, 'vivo-y30-xanh-new-600x600-600x600.jpg', 'Thông số kỹ thuật\r\nMàn hình:	IPS LCD, 6.47\", HD+\r\nHệ điều hành:	Android 10\r\nCamera sau:	Chính 13 MP & Phụ 8 MP, 2 MP, 2 MP\r\nCamera trước:	8 MP\r\nCPU:	MediaTek Helio P35 8 nhân\r\nRAM:	4 GB\r\nBộ nhớ trong:	128 GB\r\nThẻ nhớ:	MicroSD, hỗ trợ tối đa 256 GB\r\nThẻ SIM:\r\n2 Nano SIM, Hỗ trợ 4G', 1, 0),
(88, 'Điện thoại Vivo Y12s (4GB/128GB)\r\n', 1, 1, 4290000, 'vivo-y12s-den-new-600x600-600x600.jpg', 'Thông số kỹ thuật\r\nMàn hình:	IPS LCD, 6.51\", HD+\r\nHệ điều hành:	Android 10\r\nCamera sau:	Chính 13 MP & Phụ 2 MP\r\nCamera trước:	8 MP\r\nCPU:	MediaTek Helio P35 8 nhân\r\nRAM:	4 GB\r\nBộ nhớ trong:	128 GB\r\nThẻ nhớ:	MicroSD, hỗ trợ tối đa 256 GB\r\nThẻ SIM:\r\n2 Nano SIM, Hỗ trợ 4G', 1, 0),
(89, 'Điện thoại Vivo Y20', 1, 1, 3990000, 'vivo-y20-white-600x600.jpg', 'Thông số kỹ thuật\r\nMàn hình:	IPS LCD, 6.51\", HD+\r\nHệ điều hành:	Android 10\r\nCamera sau:	Chính 13 MP & Phụ 2 MP, 2 MP\r\nCamera trước:	8 MP\r\nCPU:	Snapdragon 460 8 nhân\r\nRAM:	4 GB\r\nBộ nhớ trong:	64 GB\r\nThẻ nhớ:	MicroSD, hỗ trợ tối đa 256 GB\r\nThẻ SIM:\r\n2 Nano SIM, Hỗ trợ 4G', 1, 0),
(90, 'Điện thoại Vivo U10', 1, 1, 3590000, 'vivo-u10-xanh-600x600.jpg', 'Thông số kỹ thuật\r\nMàn hình:	IPS LCD, 6.35\", HD+\r\nHệ điều hành:	Android 9 (Pie)\r\nCamera sau:	Chính 13 MP & Phụ 8 MP, 2 MP\r\nCamera trước:	8 MP\r\nCPU:	Snapdragon 665 AIE 8 nhân\r\nRAM:	4 GB\r\nBộ nhớ trong:	64 GB\r\nThẻ nhớ:	MicroSD, hỗ trợ tối đa 256 GB\r\nThẻ SIM:\r\n2 Nano SIM, Hỗ trợ ', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `protypes`
--

CREATE TABLE `protypes` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `protypes`
--

INSERT INTO `protypes` (`type_id`, `type_name`) VALUES
(1, 'Điện thoại'),
(2, 'Laptop'),
(3, 'Đồng Hồ Thông Minh'),
(4, 'Máy Tính Bảng'),
(5, 'Tai Nghe');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `manufactures`
--
ALTER TABLE `manufactures`
  ADD PRIMARY KEY (`manu_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `protypes`
--
ALTER TABLE `protypes`
  ADD PRIMARY KEY (`type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `manufactures`
--
ALTER TABLE `manufactures`
  MODIFY `manu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `protypes`
--
ALTER TABLE `protypes`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
