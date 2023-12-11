-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 11, 2023 lúc 06:41 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `kinhdoanh`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account`
--

CREATE TABLE `account` (
  `Username` varchar(30) NOT NULL,
  `Password` varchar(30) NOT NULL,
  `Name` text NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `account`
--

INSERT INTO `account` (`Username`, `Password`, `Name`, `Email`, `Role`) VALUES
('admin', 'admin', 'admin', 'admin@VC.com', 1),
('new', 'new', 'Người dùng 1', 'new@new.com', 0),
('nguyen', 'nguyen', 'Nguyễn Nguyên Lê', 'nguyen@gmail.com', 0),
('qq', 'qq', 'Nguyễn', 'ee@gmail.com', 0),
('test', 'test', 'Test đang được sửa', 'tester@test.com', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `ID` int(11) NOT NULL,
  `Username` varchar(30) NOT NULL,
  `ID_Product` varchar(10) NOT NULL,
  `Number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `ID` varchar(10) NOT NULL,
  `Name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`ID`, `Name`) VALUES
('LH01', 'Giày'),
('LH02', 'Ví Da Bò Nam'),
('LH03', 'Dép'),
('LH04', 'Ví Da'),
('LH05', 'Giày thể thao');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `history`
--

CREATE TABLE `history` (
  `ID` int(11) NOT NULL,
  `Username` varchar(30) NOT NULL,
  `Date` date NOT NULL,
  `Bill` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `history`
--

INSERT INTO `history` (`ID`, `Username`, `Date`, `Bill`) VALUES
(1, 'admin', '2023-12-09', 11510000),
(2, 'qq', '2023-12-09', 9040000),
(3, 'admin', '2023-12-10', 32970000),
(4, 'test', '2023-12-11', 10920000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `historydetail`
--

CREATE TABLE `historydetail` (
  `ID` int(11) NOT NULL,
  `ID_History` int(11) NOT NULL,
  `ID_Product` varchar(10) NOT NULL,
  `Price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `historydetail`
--

INSERT INTO `historydetail` (`ID`, `ID_History`, `ID_Product`, `Price`) VALUES
(1, 1, 'MH309780', 590000),
(3, 1, 'MH681756', 380000),
(4, 1, 'MH907891', 940000),
(5, 1, 'MH934934', 4000000),
(7, 2, 'MH681756', 380000),
(8, 2, 'MH907891', 1880000),
(9, 2, 'MH309780', 1180000),
(11, 3, 'MH681756', 3040000),
(12, 3, 'MH309780', 5310000),
(13, 3, 'MH907891', 4620000),
(14, 3, 'MH934934', 6000000),
(15, 4, 'MH907891', 6160000),
(16, 4, 'MH681756', 760000),
(17, 4, 'MH934934', 4000000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `ID` varchar(10) NOT NULL,
  `ID_Category` varchar(10) NOT NULL,
  `Name` text NOT NULL,
  `Price` int(11) NOT NULL,
  `Promotion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`ID`, `ID_Category`, `Name`, `Price`, `Promotion`) VALUES
('MH309780', 'LH04', 'Ví sen 4', 590000, 0),
('MH681756', 'LH03', 'Bitis MH002', 400000, -20000),
('MH717706', 'LH02', 'Ví da Prada', 10000000, -500000),
('MH907891', 'LH05', 'Bitis Hunter Mùa Đông 2023', 1990000, -450000),
('MH934934', 'LH01', 'Adidas Airforce one', 3000000, -1000000);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`Username`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Username` (`Username`),
  ADD KEY `IDProduct` (`ID_Product`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `historydetail`
--
ALTER TABLE `historydetail`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDHistory` (`ID_History`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDCategory` (`ID_Category`);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `IDProduct` FOREIGN KEY (`ID_Product`) REFERENCES `product` (`ID`),
  ADD CONSTRAINT `Username` FOREIGN KEY (`Username`) REFERENCES `account` (`Username`);

--
-- Các ràng buộc cho bảng `historydetail`
--
ALTER TABLE `historydetail`
  ADD CONSTRAINT `IDHistory` FOREIGN KEY (`ID_History`) REFERENCES `history` (`ID`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `IDCategory` FOREIGN KEY (`ID_Category`) REFERENCES `category` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
