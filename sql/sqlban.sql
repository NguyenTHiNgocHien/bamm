-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 20, 2024 lúc 02:07 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `sqlban`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `productName` varchar(100) NOT NULL,
  `productPrice` decimal(10,0) NOT NULL,
  `productImage` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `cart`
--

INSERT INTO `cart` (`id`, `userId`, `productId`, `qty`, `productName`, `productPrice`, `productImage`) VALUES
(21, 32, 27, 1, 'Bộ định tuyến Gaming Router Wifi Linksys WRT32X', 2000000, '9b39652962.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `status`) VALUES
(2, 'Tẩy Trang', 1),
(4, 'Phấn', 1),
(5, 'Son', 1),
(6, 'Chì Kẻ', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `createdDate` date NOT NULL,
  `receivedDate` date DEFAULT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `userId`, `createdDate`, `receivedDate`, `status`) VALUES
(48, 31, '2024-04-04', '2024-04-05', 'Complete'),
(49, 31, '2024-04-05', '2024-04-05', 'Complete'),
(50, 31, '2024-04-05', '2024-04-08', 'Delivering'),
(51, 31, '2024-04-05', NULL, 'Processing'),
(52, 31, '2024-04-05', NULL, 'Processing');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `productPrice` decimal(10,0) NOT NULL,
  `productName` varchar(100) NOT NULL,
  `productImage` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`id`, `orderId`, `productId`, `qty`, `productPrice`, `productName`, `productImage`) VALUES
(52, 48, 27, 2, 2000000, 'Bộ định tuyến Gaming Router Wifi Linksys WRT32X', '9b39652962.jpg'),
(53, 49, 27, 3, 2000000, 'Bộ định tuyến Gaming Router Wifi Linksys WRT32X', '9b39652962.jpg'),
(54, 49, 22, 1, 200000, 'CÁP CHUYỂN USB TYPE C ', '924db67cc4.jpg'),
(55, 50, 24, 1, 400000, 'PIN SẠC DỰ PHÒNG PISEN', '0d3ef2120f.jpg'),
(56, 51, 27, 1, 2000000, 'Bộ định tuyến Gaming Router Wifi Linksys WRT32X', '9b39652962.jpg'),
(57, 52, 20, 1, 1250000, 'Bộ phát WiFi Linksys EA6700', '82fe2995e4.jpg'),
(58, 52, 27, 1, 2000000, 'Bộ định tuyến Gaming Router Wifi Linksys WRT32X', '9b39652962.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `originalPrice` decimal(10,0) NOT NULL,
  `promotionPrice` decimal(10,0) NOT NULL,
  `image` varchar(50) NOT NULL,
  `createdBy` int(11) NOT NULL,
  `createdDate` date NOT NULL,
  `cateId` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `des` varchar(1000) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `soldCount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `originalPrice`, `promotionPrice`, `image`, `createdBy`, `createdDate`, `cateId`, `qty`, `des`, `status`, `soldCount`) VALUES
(19, 'Chì Kẻ Mày Hai Đầu COLORKEY', 0, 1890000, 'd5c4ddc718.jpg', 32, '2023-05-06', 6, 20, '\r\n\r\nƯU ĐIỂM SẢN PHẨM:\r\n\r\n- Chì kẻ mày là bút kẻ lông mày đa dụng với 2 đầu kẻ và chuốt lông mày \r\n\r\n- Siêu mịn, không thấm nước, không trôi, màu bền. \r\n\r\n- Màu sắc tự nhiên, tinh tế, đa dạng \r\n\r\n- Đầu chuốt giúp lông mày đậm, nét và cùng màu với cả khuôn mày \r\n\r\n- Nguyên liệu được chiết xuất từ các thành phần tự nhiên rất an toàn. \r\n\r\n- Chì kẻ với thành phần an toàn cho da, giúp tạo dáng và gia tăng độ đậm cho lông mày. ', 1, 25),
(20, 'Chì kẻ chân mày innisfree', 1500000, 1250000, '29da2dbd8a.jpg', 32, '2023-05-06', 6, 19, '1. Dễ dàng tạo khuôn chân mày sắc nét\r\n\r\nĐầu kẻ được thiết kế dáng oval dẹt, bảng rộng. Chì kẻ linh hoạt với đường nét lớn, rõ ràng khi đặt nằm ngang và đường viền nhỏ, tinh tế khi đặt nằm dọc.\r\n\r\n\r\n\r\n2. Kết cấu mềm mại, dễ chịu\r\n\r\nChì kẻ mày tạo cảm giác lướt êm, mềm mại và không gây khó chịu cho vùng da xung quanh chân mày.\r\n\r\n\r\n\r\n3. Tone màu tự nhiên, hài hòa với màu tóc\r\n\r\nĐa dạng 07 tone màu hài hòa với màu tóc, giúp lông mày được chỉn chu và trông vẫn tự nhiên.', 1, 3),
(22, 'FOCALLURE Chì kẻ mày tự nhiên ', 0, 200000, 'dfaf37fd78.jpg', 32, '2023-05-09', 6, 39, '❤3 màu：\r\n01 Xám đậm \r\nThích hợp cho màu da: sáng, tự nhiên \r\nThích hợp cho màu tóc: màu tóc tự nhiên, màu tóc sáng \r\n\r\n02 Nâu \r\nThích hợp cho màu da: sáng, tự nhiên \r\nThích hợp cho màu tóc: vàng, nâu sẫm, đỏ tía, v.v. \r\n\r\n03 Đen \r\nThích hợp cho màu da: tông màu da tự nhiên, khỏe mạnh \r\nThích hợp cho màu tóc: đen tự nhiên, tóc màu tối \r\n', 1, 4),
(23, 'Son môi mengjieshangpin DAIMANPU ', 200000, 120000, '56ce51071d.jpg', 32, '2023-05-09', 5, 22, 'Trông tự nhiên\r\n\r\nDễ sử dụng\r\n\r\nTự nhiên và mịn màng\r\n\r\nDaimanpu®\r\n\r\n100% chính hãng\r\n\r\nThời hạn sử dụng: 3 năm\r\n\r\nThành phần chính: Dầu Gansan, dầu khoáng, dầu mỏ, sáp vi tinh thể, hương liệu, chất tạo màu magiê hóa học tổng hợp, v.v.\r\n\r\nGói hàng bao gồm: 1 chiếc/ hộp', 1, 1),
(24, 'Son bóng dưỡng ẩm lâu trôi ', 0, 400000, 'dce81a28dd.jpg', 32, '2023-05-09', 5, 29, 'Thương hiệu : HERORANGE\r\n\r\nTên sản phẩm : Gương tráng men bóng nước đá sông băng\r\n\r\nNội dung tịnh : 3g\r\n\r\nTổng trọng lượng : 40g\r\n\r\nThời hạn sử dụng :3 năm\r\n\r\nTính năng\r\n\r\n-Sản Phẩm trông tinh tế , nhỏ gọn và dễ mang theo .\r\n\r\n-Dễ Sử dụng và dễ dàng tạo lớp trang điểm đẹp', 1, 6),
(25, 'Ineyoo® Son Môi Màu Lì Mịn Màng Chống Nước', 0, 5500000, '48be10e1de.jpg', 32, '2023-05-09', 5, 40, 'Thương hiệu: Ineyoo®\r\n\r\nLoại da áp dụng: Mọi làn da\r\n\r\nNgày sản xuất: 10 tháng bảy, 2022\r\n\r\nLoại: Bùn môi\r\n\r\nXuất xứ - Trung Quốc đại lục\r\n\r\nSố lượng × 1 PC\r\n\r\nKhối lượng tịnh: 3 g\r\n\r\nThời hạn sử dụng - ba năm\r\n\r\nHướng dẫn bảo quản: Bảo quản trong điều kiện bình thường\r\n\r\nThành phần: Dimethicone, Sorbitan Isostearate, Mica, Tinh bột ngô biến tính, v.v.', 1, 0),
(26, 'Router Wifi Linksys EA9500s', 0, 1500000, '324e6af88f.jpg', 32, '2023-05-09', 5, 20, '\r\n\r\nThương Hiệu: HERORANGE\r\n\r\nMô tả sản phẩm: thông thường\r\n\r\nMàu sắc: 6 nhóm màu để lựa chọn\r\n\r\nKhối lượng tịnh: 2g\r\n\r\nThời hạn sử dụng: 3 năm\r\n\r\nGói hàng bao gồm: 1 * Son môi\r\n\r\n\r\n\r\nMàu HERORANGE:\r\n\r\n01# Rose Black Tea\r\n\r\n02# Fried Field Red (hình thức đẹp)\r\n\r\n03# Coolsa Red Brown\r\n\r\n04# Warm Sweet Salt\r\n\r\n05# Smoked Bean Paste\r\n\r\n06# Tipsy Milk Peach\r\n\r\n\r\n\r\nMàu SUSU SKY:\r\n\r\n01 # nascent apricot\r\n\r\n02 # cardamom echo\r\n\r\n03 # Spring Search and Provincial Leap\r\n\r\n04 # free tea brown\r\n\r\n05 # tarred peach\r\n\r\n06 # dry rose stream', 1, 0),
(27, 'XixiBảng Phấn Mắt Herorange Nine Bead Color', 250000, 2000000, '5013d3beac.jpg', 32, '2023-05-09', 4, 23, '\r\nMàu sắc:\r\n\r\n U01#Tiancai Cô gái\r\n\r\n U02#Peninsula Thư tình\r\n\r\n U03#Haili Sông băng\r\n\r\n \r\n\r\n Tính năng:\r\n\r\n -Sản Phẩm có hình thức đẹp, cấu tạo nhỏ gọn dễ dàng mang theo.\r\n\r\n - Dễ sử dụng, tạo lớp trang điểm đẹp dễ dàng', 1, 8),
(28, 'Bảng phấn mắt KAKASHOW A521 9 tông màu đất cho người mới bắt đầu', 0, 1500000, 'dddbac0c31.jpg', 32, '2023-05-09', 4, 20, 'Sản phẩm sử dụng màu trái cây đơn giản với thiết kế màu trơn, đơn giản, tươi mát.\r\n\r\nDễ dàng mang theo và dễ sử dụng. Màu sắc khác nhau, ngoại hình khác nhau\r\n\r\nDễ lên màu, Kết cấu mờ, Nhiều màu sắc, Hiệu ứng lót\r\n\r\nBột mịn, dễ thoa\r\n\r\nĐộ bám chắc, giữ màu lâu cho lớp trang điểm tuyệt vời, có thể tạo hiệu ứng trang điểm sương mù\r\n\r\nBảng màu này có tất cả các màu cần thiết để tạo lại vẻ ngoài tinh tế hoặc tiên phong, cả ngày lẫn đêm\r\n\r\nCác thành phần chất lượng cao có độ bóng mượt có thể kéo dài cả ngày\r\n\r\nNgoài việc được sử dụng đánh mắt, Sản phẩm còn có thể được sử dụng như phấn má hồng và phấn highlight.', 1, 0),
(29, 'Derf Phấn phủ dạng bột kiềm dầu che phủ toàn diện lâu trôi kháng nước kiềm dầu', 1000000, 850000, 'b5a3c6e398.jpg', 32, '2023-05-09', 4, 50, 'Kiểm soát dầu tối đa - Có thể kiểm soát dầu ở mức độ lớn nhất và giảm nếp nhăn và lỗ chân lông, giúp điều chỉnh màu da không đồng đều.\r\n\r\n Super Hydrated - Thành phần dưỡng ẩm độc đáo mang đến cho bạn làn da rạng rỡ và khỏe mạnh.\r\n\r\n Nhẹ - Cảm giác nhẹ và bông như lông vũ để thở cả ngày.\r\n\r\n · Kiểm soát dầu tối đa\r\n\r\n ・ Màu sắc tự nhiên\r\n\r\n · Che nếp nhăn và lỗ chân lông\r\n\r\n · Lâu dài', 1, 0),
(30, 'Dầu Tẩy Trang Dưỡng Ẩm Advanced Nourish Hyaluronic Acid Cleansing Oil Hada Labo', 1690000, 1390000, 'af97eb7cb1.jpg', 32, '2024-04-04', 2, 10, 'Dầu tẩy trang Hada Labo với dầu Ô liu tinh khiết kết hợp với Ha và SHa nhẹ nhàng làm sạch hiệu quả lớp trang điểm, giữ da luôn ẩm mượt và sáng mịn', 1, 0),
(31, 'Nước tẩy trang Simple Micellar làm sạch trang điểm vượt trội và cấp ẩm tức thì cho da', 550000, 529000, 'a159a339ea.jpg', 32, '2024-04-04', 2, 10, 'Nước tẩy trang Simple có chưa Vitamin B3, Vitamin C và nước cất 3 lần tinh khiết giúp nhẹ nhàng lấy sạch lớp tẩy trang, kem trống nắng và bụi bẩn trên mặt hiệu quả', 1, 0),
(32, 'Nước làm sạch và tẩy trang cho mọi loại da Garnier Micellar Water', 800000, 750000, 'de55006b3f.jpg', 32, '2024-04-04', 2, 22, 'Nước làm sạch và tẩy trang dành cho mọi loại da, bạn có thể chọn loại phù hợp với bạn \r\n+Màu hồng: dành cho da dầu và mụn\r\n+Màu vàng: giúp làm sáng da, hỗ trợ loại bỏ nám\r\n+Màu trắng: dành cho mọi loại da, đặc biệt là da khô và trang điểm\r\n+Màu xanh dương: Dành cho da dầu và mụn', 1, 0),
(33, 'Tẩy Trang Cho Da Dầu', 1500000, 1200000, '382560789f.jpg', 32, '2024-04-04', 2, 40, 'Nước Tẩy trang dành cho da dầu, da hôn hợp, da khô.\r\nCó tác dụng 3 in 1 giúp làm sạch, giữ ẩm và dưỡng mềm da đồng thời loại bỏ cặn trang điểm\r\nLàm sạch \r\n', 1, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'Admin'),
(2, 'Normal');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `address` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `email`, `fullname`, `dob`, `password`, `role_id`, `status`, `address`) VALUES
(1, 'hien@gmail.com', 'Tran Ha', '2021-11-01', '3b712de48137572f3849aabd5666a4e3', 1, 1, 'Số 23 Đường Cát Bi , Thành Tô , Hải An Hải Phòng'),
(31, 'thuctap@gmail.com', 'Nguyen Ha', '2021-12-06', '3b712de48137572f3849aabd5666a4e3', 2, 1, 'Ngõ 34,Quận 5,Thành Phố Hồ Chí Minh'),
(32, 'admin@gmail.com', 'Hien', '2023-05-10', '3b712de48137572f3849aabd5666a4e3', 1, 1, 'Số 23 Đường Cát Bi , Thành Tô , Hải An Hải Phòng');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`userId`),
  ADD KEY `product_id` (`productId`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`userId`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`orderId`),
  ADD KEY `product_id` (`productId`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cate_id` (`cateId`);

--
-- Chỉ mục cho bảng `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT cho bảng `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`cateId`) REFERENCES `categories` (`id`);

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
