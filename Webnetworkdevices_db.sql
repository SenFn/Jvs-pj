--Create database WebDienTu_db
--use WebDienTu_db
-- drop database current in use---------------------------------------------
--ALTER DATABASE Webnetworkdevices_db SET MULTI_USER WITH ROLLBACK IMMEDIATE
--alter database Webnetworkdevices_db set single_user with rollback immediate
--drop database Webnetworkdevices_db
--------bangkhachang---------------------------------------------------------------
create table khach_hang(
--id INT IDENTITY(1,1) primary key,
makh INT IDENTITY(1,1) primary key,
ten_khach_hang nvarchar(50),
so_dien_thoai_Kh varchar(11),
email varchar(50),
)
--SET IDENTITY_INSERT khach_hang off
insert into khach_hang values(N'Nguyen Van Lan DB','09485711544','lennguyenprovip@gmail.com')
--------banghoadon-------------------------------------------------------------------
create table hoa_don(
 
mahd INT IDENTITY(1,1) primary key,
--ten_khach_hang nvarchar(50),
ngay_mua date,
tong_gia_tien double precision,
hinh_thuc_thanh_toan nvarchar(100),
makh int
)
insert into hoa_don values('2021-01-10',500000,'COD',1)
--------banggiaohang-------------------------------------------------------------------
create table giao_hang(
magh INT IDENTITY(1,1) primary key,
cong_ty_ship nvarchar(50),
dia_chi_giao_hang nvarchar(400),
--id INT IDENTITY(1,1),
mahd int
)
insert into giao_hang values('VnExpress',N'gigalmol thủ đức tp hcm',1)
--------bangchitiethoadon-------------------------------------------------------------------
--create table chi_tiet_hoa_don(
--mact INT IDENTITY(1,1) primary key,
--ten_san_pham nvarchar(100),
--gia_san_pham double precision,
--so_luong int,
--tong_gia_tien_sp double precision,
--id INT IDENTITY(1,1),
--mahd int,
--masp int
--PRIMARY KEY (mahd,masp),

--)
--insert into chi_tiet_hoa_don values('router Wifi xiaomi',200000,2,400000,1,1)
--insert into chi_tiet_hoa_don values('router Wifi dell',100000,1,100000,1,2)
--------bangSanPham-------------------------------------------------------------------
create table Sanpham(
masp INT IDENTITY(1,1) primary key,
ten_san_pham nvarchar(100),
img image,
loai_san_pham varchar(50),
gia_san_pham double precision,
trang_thai int,
so_luong_trong_kho int,
--id INT IDENTITY(1,1)
)
insert into sanpham values(N'Wifi 4GB LTE 150 MBPS Tenda - 4G180',(SELECT * FROM OPENROWSET(BULK N'C:\Users\hoang\Desktop\webjava\master\WebBanHang\src\img\Bộ_phát_Wifi_di_động_4GB_LTE_150_MBPS_Tenda-4G180.png', SINGLE_BLOB) as T1),'router Wifi',299999,1,50)
insert into sanpham values(N'Wifi Mesh AC1200 Tp-Link Deco E4',(SELECT * FROM OPENROWSET(BULK N'C:\Users\hoang\Desktop\webjava\master\WebBanHang\src\img\Hệ thống Wifi Mesh cho toàn ngôi nhà AC1200 Tp-Link Deco E4.png', SINGLE_BLOB) as T1),'router Wifi',499999,1,50)
insert into sanpham values(N'Router Wifi 4G TP-Link TL-MR100 300Mbps',(SELECT * FROM OPENROWSET(BULK N'C:\Users\hoang\Desktop\webjava\master\WebBanHang\src\img\Router Wifi 4G TP-Link TL-MR100 300Mbps.png', SINGLE_BLOB) as T1),'router Wifi',200000,1,50)
insert into sanpham values(N'Wifi 6 Huawei AX3 Pro 3000Mbps CPU 4 core',(SELECT * FROM OPENROWSET(BULK N'C:\Users\hoang\Desktop\webjava\master\WebBanHang\src\img\Router Wifi 6 Huawei AX3 Pro băng tần kép 3000Mbps CPU 4 nhân.png', SINGLE_BLOB) as T1),'router Wifi',1500000,1,50)
insert into sanpham values(N'Router Wifi 6 Redmi AX5',(SELECT * FROM OPENROWSET(BULK N'C:\Users\hoang\Desktop\webjava\master\WebBanHang\src\img\Router Wifi 6 Redmi AX5.png', SINGLE_BLOB) as T1),'router Wifi',2050500,1,50)
insert into sanpham values(N'Router Wifi 6 Xiaomi Aiot AX3600',(SELECT * FROM OPENROWSET(BULK N'C:\Users\hoang\Desktop\webjava\master\WebBanHang\src\img\Router Wifi 6 Xiaomi Aiot AX3600.png', SINGLE_BLOB) as T1),'router Wifi',550000,1,50)
insert into sanpham values(N'Router WIFI Mesh Xiaomi',(SELECT * FROM OPENROWSET(BULK N'C:\Users\hoang\Desktop\webjava\master\WebBanHang\src\img\Router WIFI Mesh Xiaomi.png', SINGLE_BLOB) as T1),'router Wifi',400000,1,50)
insert into sanpham values(N'Router Wifi Redmi AC2100',(SELECT * FROM OPENROWSET(BULK N'C:\Users\hoang\Desktop\webjava\master\WebBanHang\src\img\Router Wifi Redmi AC2100.png', SINGLE_BLOB) as T1),'router Wifi',1230000,1,50)
insert into sanpham values(N'Router Wifi Tenda AC5v3',(SELECT * FROM OPENROWSET(BULK N'C:\Users\hoang\Desktop\webjava\master\WebBanHang\src\img\Router Wifi Tenda AC5v3 băng tầng kép Ac1200.png', SINGLE_BLOB) as T1),'router Wifi',2400000,1,50)
insert into sanpham values(N'Router Wifi Xiaomi 4 Pro',(SELECT * FROM OPENROWSET(BULK N'C:\Users\hoang\Desktop\webjava\master\WebBanHang\src\img\Router Wifi Xiaomi 4 Pro.png', SINGLE_BLOB) as T1),'router Wifi',900000,1,50)
--------bangthongtinsanpham-------------------------------------------------------------------
create table thong_tin_san_pham(
matt INT IDENTITY(1,1) primary key,
ten_san_pham nvarchar(100),
img image,
gia_san_pham double precision,
nha_cung_cap nvarchar(50),
mo_ta nvarchar(4000),
bao_hanh nvarchar(200),
--id INT IDENTITY(1,1),
masp int
)
insert into thong_tin_san_pham values(N'Wifi 4GB LTE 150 MBPS Tenda - 4G180',(SELECT * FROM OPENROWSET(BULK N'C:\Users\hoang\Desktop\webjava\master\WebBanHang\src\img\Bộ_phát_Wifi_di_động_4GB_LTE_150_MBPS_Tenda-4G180.png', SINGLE_BLOB) as T1),299999,'Tenda',N'Những đặc điểm và tính năng bậc nhất của Netgear MR2100:

 

- Netgear Nighthawk M2 có tốc độ Download lên tới 2Gbps / Upload lên tới 150Mbps ở các khu vực được chọn. 

 

- Hỗ trợ 4GX LTE Advanced 20 với tổng hợp mạng di động lên đến 5 băng tần

 

- Giao diện màn hình cảm ứng LCD hiển thị 2,4" để theo dõi hoạt động/ dữ liệu sử dụng

 

- Cũng giống như người tiền nhiệm M1, Netgear M2 cũng có thể hỗ trợ tối đa 20 thiết bị không dây

để truy cập internet

 

- Hỗ trợ chuẩn sóng 4G sub-6GHz và 26 / 28GHz

 

- WiFi băng tần kép đầy đủ / kép đồng thời

      + WiFi 802.11 b / g / n 2.4 GHz

      + WiFi 802.11 a / n / ac 5 GHz

 

-  Sử dụng công nghệ ăng-ten MIMO 4 × 4

 

- Nighthawk M2 có một cổng Ethernet, một cổng USB-C và một cổng USB loại A cho khả năng Jump Boost và Media Server/NAS. Tính năng Jum Boost có thể sạc điện thoại thông minh và các thiết bị USB di động nhỏ

 

- Hai đầu nối TS-9 có sẵn để sử dụng với ăng ten 4G / 3G bên ngoài. Giúp tăng cường khả năng thu phát sóng 4G cho thiết bị.

 

- Sử dụng pin Li-ion có dung lượng 5040mAh, sử dụng liên tục lên đến 15 giờ.

 

- Phụ huynh có thể kiểm soát hoặc bảo vệ quyền truy cập vào nội dung trực tuyến.

 

- Trải nghiệm người dùng với ứng dụng di động NETGEAR đơn giản, trực quan để theo dõi việc sử

dụng dữ liệu, quản lý cài đặt mạng và thiết bị từ điện thoại thông minh hoặc máy tính bảng iOS hoặc Android ™

 

- Thiết lập đơn giản không có phần mềm để cài đặt, chỉ cần bật và kết nối

 

- Kích thước: 105,5 (L) x 105,5 (W) x 20,35 (H) mm

- Trọng lượng: 240 g (có pin)

 

 

Đóng gói sản phẩm bao gồm:

 

- Bộ định tuyến di động NETGEAR Nighthawk M2

- Pin Li-ion 5040mAh (Li-ion) có thể tháo rời

- Nắp lưng

- Bộ sạc QC 2.0 và cáp USB Type-C

- Hướng dẫn nhanh',N'Bảo Hành Tại Trung tâm',1)
insert into thong_tin_san_pham values(N'Wifi Mesh AC1200 Tp-Link Deco E4',(SELECT * FROM OPENROWSET(BULK N'C:\Users\hoang\Desktop\webjava\master\WebBanHang\src\img\Hệ thống Wifi Mesh cho toàn ngôi nhà AC1200 Tp-Link Deco E4.png', SINGLE_BLOB) as T1),499999,'Tp-Link',N'Những đặc điểm và tính năng bậc nhất của Netgear MR2100:

 

- Netgear Nighthawk M2 có tốc độ Download lên tới 2Gbps / Upload lên tới 150Mbps ở các khu vực được chọn. 

 

- Hỗ trợ 4GX LTE Advanced 20 với tổng hợp mạng di động lên đến 5 băng tần

 

- Giao diện màn hình cảm ứng LCD hiển thị 2,4" để theo dõi hoạt động/ dữ liệu sử dụng

 

- Cũng giống như người tiền nhiệm M1, Netgear M2 cũng có thể hỗ trợ tối đa 20 thiết bị không dây

để truy cập internet

 

- Hỗ trợ chuẩn sóng 4G sub-6GHz và 26 / 28GHz

 

- WiFi băng tần kép đầy đủ / kép đồng thời

      + WiFi 802.11 b / g / n 2.4 GHz

      + WiFi 802.11 a / n / ac 5 GHz

 

-  Sử dụng công nghệ ăng-ten MIMO 4 × 4

 

- Nighthawk M2 có một cổng Ethernet, một cổng USB-C và một cổng USB loại A cho khả năng Jump Boost và Media Server/NAS. Tính năng Jum Boost có thể sạc điện thoại thông minh và các thiết bị USB di động nhỏ

 

- Hai đầu nối TS-9 có sẵn để sử dụng với ăng ten 4G / 3G bên ngoài. Giúp tăng cường khả năng thu phát sóng 4G cho thiết bị.

 

- Sử dụng pin Li-ion có dung lượng 5040mAh, sử dụng liên tục lên đến 15 giờ.

 

- Phụ huynh có thể kiểm soát hoặc bảo vệ quyền truy cập vào nội dung trực tuyến.

 

- Trải nghiệm người dùng với ứng dụng di động NETGEAR đơn giản, trực quan để theo dõi việc sử

dụng dữ liệu, quản lý cài đặt mạng và thiết bị từ điện thoại thông minh hoặc máy tính bảng iOS hoặc Android ™

 

- Thiết lập đơn giản không có phần mềm để cài đặt, chỉ cần bật và kết nối

 

- Kích thước: 105,5 (L) x 105,5 (W) x 20,35 (H) mm

- Trọng lượng: 240 g (có pin)

 

 

Đóng gói sản phẩm bao gồm:

 

- Bộ định tuyến di động NETGEAR Nighthawk M2

- Pin Li-ion 5040mAh (Li-ion) có thể tháo rời

- Nắp lưng

- Bộ sạc QC 2.0 và cáp USB Type-C

- Hướng dẫn nhanh',N'Bảo Hành Tại Trung tâm',2)
insert into thong_tin_san_pham values(N'Router Wifi 4G TP-Link TL-MR100 300Mbps',(SELECT * FROM OPENROWSET(BULK N'C:\Users\hoang\Desktop\webjava\master\WebBanHang\src\img\Router Wifi 4G TP-Link TL-MR100 300Mbps.png', SINGLE_BLOB) as T1),200000,'Tp-link',N'Những đặc điểm và tính năng bậc nhất của Netgear MR2100:

 

- Netgear Nighthawk M2 có tốc độ Download lên tới 2Gbps / Upload lên tới 150Mbps ở các khu vực được chọn. 

 

- Hỗ trợ 4GX LTE Advanced 20 với tổng hợp mạng di động lên đến 5 băng tần

 

- Giao diện màn hình cảm ứng LCD hiển thị 2,4" để theo dõi hoạt động/ dữ liệu sử dụng

 

- Cũng giống như người tiền nhiệm M1, Netgear M2 cũng có thể hỗ trợ tối đa 20 thiết bị không dây

để truy cập internet

 

- Hỗ trợ chuẩn sóng 4G sub-6GHz và 26 / 28GHz

 

- WiFi băng tần kép đầy đủ / kép đồng thời

      + WiFi 802.11 b / g / n 2.4 GHz

      + WiFi 802.11 a / n / ac 5 GHz

 

-  Sử dụng công nghệ ăng-ten MIMO 4 × 4

 

- Nighthawk M2 có một cổng Ethernet, một cổng USB-C và một cổng USB loại A cho khả năng Jump Boost và Media Server/NAS. Tính năng Jum Boost có thể sạc điện thoại thông minh và các thiết bị USB di động nhỏ

 

- Hai đầu nối TS-9 có sẵn để sử dụng với ăng ten 4G / 3G bên ngoài. Giúp tăng cường khả năng thu phát sóng 4G cho thiết bị.

 

- Sử dụng pin Li-ion có dung lượng 5040mAh, sử dụng liên tục lên đến 15 giờ.

 

- Phụ huynh có thể kiểm soát hoặc bảo vệ quyền truy cập vào nội dung trực tuyến.

 

- Trải nghiệm người dùng với ứng dụng di động NETGEAR đơn giản, trực quan để theo dõi việc sử

dụng dữ liệu, quản lý cài đặt mạng và thiết bị từ điện thoại thông minh hoặc máy tính bảng iOS hoặc Android ™

 

- Thiết lập đơn giản không có phần mềm để cài đặt, chỉ cần bật và kết nối

 

- Kích thước: 105,5 (L) x 105,5 (W) x 20,35 (H) mm

- Trọng lượng: 240 g (có pin)

 

 

Đóng gói sản phẩm bao gồm:

 

- Bộ định tuyến di động NETGEAR Nighthawk M2

- Pin Li-ion 5040mAh (Li-ion) có thể tháo rời

- Nắp lưng

- Bộ sạc QC 2.0 và cáp USB Type-C

- Hướng dẫn nhanh',N'Bảo Hành Tại Trung tâm',3)
insert into thong_tin_san_pham values(N'Wifi 6 Huawei AX3 Pro 3000Mbps CPU 4 core',(SELECT * FROM OPENROWSET(BULK N'C:\Users\hoang\Desktop\webjava\master\WebBanHang\src\img\Router Wifi 6 Huawei AX3 Pro băng tần kép 3000Mbps CPU 4 nhân.png', SINGLE_BLOB) as T1),1500000,'Huawei',N'Những đặc điểm và tính năng bậc nhất của Netgear MR2100:

 

- Netgear Nighthawk M2 có tốc độ Download lên tới 2Gbps / Upload lên tới 150Mbps ở các khu vực được chọn. 

 

- Hỗ trợ 4GX LTE Advanced 20 với tổng hợp mạng di động lên đến 5 băng tần

 

- Giao diện màn hình cảm ứng LCD hiển thị 2,4" để theo dõi hoạt động/ dữ liệu sử dụng

 

- Cũng giống như người tiền nhiệm M1, Netgear M2 cũng có thể hỗ trợ tối đa 20 thiết bị không dây

để truy cập internet

 

- Hỗ trợ chuẩn sóng 4G sub-6GHz và 26 / 28GHz

 

- WiFi băng tần kép đầy đủ / kép đồng thời

      + WiFi 802.11 b / g / n 2.4 GHz

      + WiFi 802.11 a / n / ac 5 GHz

 

-  Sử dụng công nghệ ăng-ten MIMO 4 × 4

 

- Nighthawk M2 có một cổng Ethernet, một cổng USB-C và một cổng USB loại A cho khả năng Jump Boost và Media Server/NAS. Tính năng Jum Boost có thể sạc điện thoại thông minh và các thiết bị USB di động nhỏ

 

- Hai đầu nối TS-9 có sẵn để sử dụng với ăng ten 4G / 3G bên ngoài. Giúp tăng cường khả năng thu phát sóng 4G cho thiết bị.

 

- Sử dụng pin Li-ion có dung lượng 5040mAh, sử dụng liên tục lên đến 15 giờ.

 

- Phụ huynh có thể kiểm soát hoặc bảo vệ quyền truy cập vào nội dung trực tuyến.

 

- Trải nghiệm người dùng với ứng dụng di động NETGEAR đơn giản, trực quan để theo dõi việc sử

dụng dữ liệu, quản lý cài đặt mạng và thiết bị từ điện thoại thông minh hoặc máy tính bảng iOS hoặc Android ™

 

- Thiết lập đơn giản không có phần mềm để cài đặt, chỉ cần bật và kết nối

 

- Kích thước: 105,5 (L) x 105,5 (W) x 20,35 (H) mm

- Trọng lượng: 240 g (có pin)

 

 

Đóng gói sản phẩm bao gồm:

 

- Bộ định tuyến di động NETGEAR Nighthawk M2

- Pin Li-ion 5040mAh (Li-ion) có thể tháo rời

- Nắp lưng

- Bộ sạc QC 2.0 và cáp USB Type-C

- Hướng dẫn nhanh',N'Bảo Hành Tại Trung tâm',4)
insert into thong_tin_san_pham values(N'Router Wifi 6 Redmi AX5',(SELECT * FROM OPENROWSET(BULK N'C:\Users\hoang\Desktop\webjava\master\WebBanHang\src\img\Router Wifi 6 Redmi AX5.png', SINGLE_BLOB) as T1),2050500,'Redmi',N'Những đặc điểm và tính năng bậc nhất của Netgear MR2100:

 

- Netgear Nighthawk M2 có tốc độ Download lên tới 2Gbps / Upload lên tới 150Mbps ở các khu vực được chọn. 

 

- Hỗ trợ 4GX LTE Advanced 20 với tổng hợp mạng di động lên đến 5 băng tần

 

- Giao diện màn hình cảm ứng LCD hiển thị 2,4" để theo dõi hoạt động/ dữ liệu sử dụng

 

- Cũng giống như người tiền nhiệm M1, Netgear M2 cũng có thể hỗ trợ tối đa 20 thiết bị không dây

để truy cập internet

 

- Hỗ trợ chuẩn sóng 4G sub-6GHz và 26 / 28GHz

 

- WiFi băng tần kép đầy đủ / kép đồng thời

      + WiFi 802.11 b / g / n 2.4 GHz

      + WiFi 802.11 a / n / ac 5 GHz

 

-  Sử dụng công nghệ ăng-ten MIMO 4 × 4

 

- Nighthawk M2 có một cổng Ethernet, một cổng USB-C và một cổng USB loại A cho khả năng Jump Boost và Media Server/NAS. Tính năng Jum Boost có thể sạc điện thoại thông minh và các thiết bị USB di động nhỏ

 

- Hai đầu nối TS-9 có sẵn để sử dụng với ăng ten 4G / 3G bên ngoài. Giúp tăng cường khả năng thu phát sóng 4G cho thiết bị.

 

- Sử dụng pin Li-ion có dung lượng 5040mAh, sử dụng liên tục lên đến 15 giờ.

 

- Phụ huynh có thể kiểm soát hoặc bảo vệ quyền truy cập vào nội dung trực tuyến.

 

- Trải nghiệm người dùng với ứng dụng di động NETGEAR đơn giản, trực quan để theo dõi việc sử

dụng dữ liệu, quản lý cài đặt mạng và thiết bị từ điện thoại thông minh hoặc máy tính bảng iOS hoặc Android ™

 

- Thiết lập đơn giản không có phần mềm để cài đặt, chỉ cần bật và kết nối

 

- Kích thước: 105,5 (L) x 105,5 (W) x 20,35 (H) mm

- Trọng lượng: 240 g (có pin)

 

 

Đóng gói sản phẩm bao gồm:

 

- Bộ định tuyến di động NETGEAR Nighthawk M2

- Pin Li-ion 5040mAh (Li-ion) có thể tháo rời

- Nắp lưng

- Bộ sạc QC 2.0 và cáp USB Type-C

- Hướng dẫn nhanh',N'Bảo Hành Tại Trung tâm',5)
insert into thong_tin_san_pham values(N'Router Wifi 6 Xiaomi Aiot AX3600',(SELECT * FROM OPENROWSET(BULK N'C:\Users\hoang\Desktop\webjava\master\WebBanHang\src\img\Router Wifi 6 Xiaomi Aiot AX3600.png', SINGLE_BLOB) as T1),550000,'Xiaomi',N'Những đặc điểm và tính năng bậc nhất của Netgear MR2100:

 

- Netgear Nighthawk M2 có tốc độ Download lên tới 2Gbps / Upload lên tới 150Mbps ở các khu vực được chọn. 

 

- Hỗ trợ 4GX LTE Advanced 20 với tổng hợp mạng di động lên đến 5 băng tần

 

- Giao diện màn hình cảm ứng LCD hiển thị 2,4" để theo dõi hoạt động/ dữ liệu sử dụng

 

- Cũng giống như người tiền nhiệm M1, Netgear M2 cũng có thể hỗ trợ tối đa 20 thiết bị không dây

để truy cập internet

 

- Hỗ trợ chuẩn sóng 4G sub-6GHz và 26 / 28GHz

 

- WiFi băng tần kép đầy đủ / kép đồng thời

      + WiFi 802.11 b / g / n 2.4 GHz

      + WiFi 802.11 a / n / ac 5 GHz

 

-  Sử dụng công nghệ ăng-ten MIMO 4 × 4

 

- Nighthawk M2 có một cổng Ethernet, một cổng USB-C và một cổng USB loại A cho khả năng Jump Boost và Media Server/NAS. Tính năng Jum Boost có thể sạc điện thoại thông minh và các thiết bị USB di động nhỏ

 

- Hai đầu nối TS-9 có sẵn để sử dụng với ăng ten 4G / 3G bên ngoài. Giúp tăng cường khả năng thu phát sóng 4G cho thiết bị.

 

- Sử dụng pin Li-ion có dung lượng 5040mAh, sử dụng liên tục lên đến 15 giờ.

 

- Phụ huynh có thể kiểm soát hoặc bảo vệ quyền truy cập vào nội dung trực tuyến.

 

- Trải nghiệm người dùng với ứng dụng di động NETGEAR đơn giản, trực quan để theo dõi việc sử

dụng dữ liệu, quản lý cài đặt mạng và thiết bị từ điện thoại thông minh hoặc máy tính bảng iOS hoặc Android ™

 

- Thiết lập đơn giản không có phần mềm để cài đặt, chỉ cần bật và kết nối

 

- Kích thước: 105,5 (L) x 105,5 (W) x 20,35 (H) mm

- Trọng lượng: 240 g (có pin)

 

 

Đóng gói sản phẩm bao gồm:

 

- Bộ định tuyến di động NETGEAR Nighthawk M2

- Pin Li-ion 5040mAh (Li-ion) có thể tháo rời

- Nắp lưng

- Bộ sạc QC 2.0 và cáp USB Type-C

- Hướng dẫn nhanh',N'Bảo Hành Tại Trung tâm',6)
insert into thong_tin_san_pham values(N'Router WIFI Mesh Xiaomi',(SELECT * FROM OPENROWSET(BULK N'C:\Users\hoang\Desktop\webjava\master\WebBanHang\src\img\Router WIFI Mesh Xiaomi.png', SINGLE_BLOB) as T1),400000,'Xiaomi',N'Những đặc điểm và tính năng bậc nhất của Netgear MR2100:

 

- Netgear Nighthawk M2 có tốc độ Download lên tới 2Gbps / Upload lên tới 150Mbps ở các khu vực được chọn. 

 

- Hỗ trợ 4GX LTE Advanced 20 với tổng hợp mạng di động lên đến 5 băng tần

 

- Giao diện màn hình cảm ứng LCD hiển thị 2,4" để theo dõi hoạt động/ dữ liệu sử dụng

 

- Cũng giống như người tiền nhiệm M1, Netgear M2 cũng có thể hỗ trợ tối đa 20 thiết bị không dây

để truy cập internet

 

- Hỗ trợ chuẩn sóng 4G sub-6GHz và 26 / 28GHz

 

- WiFi băng tần kép đầy đủ / kép đồng thời

      + WiFi 802.11 b / g / n 2.4 GHz

      + WiFi 802.11 a / n / ac 5 GHz

 

-  Sử dụng công nghệ ăng-ten MIMO 4 × 4

 

- Nighthawk M2 có một cổng Ethernet, một cổng USB-C và một cổng USB loại A cho khả năng Jump Boost và Media Server/NAS. Tính năng Jum Boost có thể sạc điện thoại thông minh và các thiết bị USB di động nhỏ

 

- Hai đầu nối TS-9 có sẵn để sử dụng với ăng ten 4G / 3G bên ngoài. Giúp tăng cường khả năng thu phát sóng 4G cho thiết bị.

 

- Sử dụng pin Li-ion có dung lượng 5040mAh, sử dụng liên tục lên đến 15 giờ.

 

- Phụ huynh có thể kiểm soát hoặc bảo vệ quyền truy cập vào nội dung trực tuyến.

 

- Trải nghiệm người dùng với ứng dụng di động NETGEAR đơn giản, trực quan để theo dõi việc sử

dụng dữ liệu, quản lý cài đặt mạng và thiết bị từ điện thoại thông minh hoặc máy tính bảng iOS hoặc Android ™

 

- Thiết lập đơn giản không có phần mềm để cài đặt, chỉ cần bật và kết nối

 

- Kích thước: 105,5 (L) x 105,5 (W) x 20,35 (H) mm

- Trọng lượng: 240 g (có pin)

 

 

Đóng gói sản phẩm bao gồm:

 

- Bộ định tuyến di động NETGEAR Nighthawk M2

- Pin Li-ion 5040mAh (Li-ion) có thể tháo rời

- Nắp lưng

- Bộ sạc QC 2.0 và cáp USB Type-C

- Hướng dẫn nhanh',N'Bảo Hành Tại Trung tâm',7)
insert into thong_tin_san_pham values(N'Router Wifi Redmi AC2100',(SELECT * FROM OPENROWSET(BULK N'C:\Users\hoang\Desktop\webjava\master\WebBanHang\src\img\Router Wifi Redmi AC2100.png', SINGLE_BLOB) as T1),1230000,'Redmi',N'Những đặc điểm và tính năng bậc nhất của Netgear MR2100:

 

- Netgear Nighthawk M2 có tốc độ Download lên tới 2Gbps / Upload lên tới 150Mbps ở các khu vực được chọn. 

 

- Hỗ trợ 4GX LTE Advanced 20 với tổng hợp mạng di động lên đến 5 băng tần

 

- Giao diện màn hình cảm ứng LCD hiển thị 2,4" để theo dõi hoạt động/ dữ liệu sử dụng

 

- Cũng giống như người tiền nhiệm M1, Netgear M2 cũng có thể hỗ trợ tối đa 20 thiết bị không dây

để truy cập internet

 

- Hỗ trợ chuẩn sóng 4G sub-6GHz và 26 / 28GHz

 

- WiFi băng tần kép đầy đủ / kép đồng thời

      + WiFi 802.11 b / g / n 2.4 GHz

      + WiFi 802.11 a / n / ac 5 GHz

 

-  Sử dụng công nghệ ăng-ten MIMO 4 × 4

 

- Nighthawk M2 có một cổng Ethernet, một cổng USB-C và một cổng USB loại A cho khả năng Jump Boost và Media Server/NAS. Tính năng Jum Boost có thể sạc điện thoại thông minh và các thiết bị USB di động nhỏ

 

- Hai đầu nối TS-9 có sẵn để sử dụng với ăng ten 4G / 3G bên ngoài. Giúp tăng cường khả năng thu phát sóng 4G cho thiết bị.

 

- Sử dụng pin Li-ion có dung lượng 5040mAh, sử dụng liên tục lên đến 15 giờ.

 

- Phụ huynh có thể kiểm soát hoặc bảo vệ quyền truy cập vào nội dung trực tuyến.

 

- Trải nghiệm người dùng với ứng dụng di động NETGEAR đơn giản, trực quan để theo dõi việc sử

dụng dữ liệu, quản lý cài đặt mạng và thiết bị từ điện thoại thông minh hoặc máy tính bảng iOS hoặc Android ™

 

- Thiết lập đơn giản không có phần mềm để cài đặt, chỉ cần bật và kết nối

 

- Kích thước: 105,5 (L) x 105,5 (W) x 20,35 (H) mm

- Trọng lượng: 240 g (có pin)

 

 

Đóng gói sản phẩm bao gồm:

 

- Bộ định tuyến di động NETGEAR Nighthawk M2

- Pin Li-ion 5040mAh (Li-ion) có thể tháo rời

- Nắp lưng

- Bộ sạc QC 2.0 và cáp USB Type-C

- Hướng dẫn nhanh',N'Bảo Hành Tại Trung tâm',8)
insert into thong_tin_san_pham values(N'Router Wifi Tenda AC5v3',(SELECT * FROM OPENROWSET(BULK N'C:\Users\hoang\Desktop\webjava\master\WebBanHang\src\img\Router Wifi Tenda AC5v3 băng tầng kép Ac1200.png', SINGLE_BLOB) as T1),2400000,'Tenda',N'Những đặc điểm và tính năng bậc nhất của Netgear MR2100:

 

- Netgear Nighthawk M2 có tốc độ Download lên tới 2Gbps / Upload lên tới 150Mbps ở các khu vực được chọn. 

 

- Hỗ trợ 4GX LTE Advanced 20 với tổng hợp mạng di động lên đến 5 băng tần

 

- Giao diện màn hình cảm ứng LCD hiển thị 2,4" để theo dõi hoạt động/ dữ liệu sử dụng

 

- Cũng giống như người tiền nhiệm M1, Netgear M2 cũng có thể hỗ trợ tối đa 20 thiết bị không dây

để truy cập internet

 

- Hỗ trợ chuẩn sóng 4G sub-6GHz và 26 / 28GHz

 

- WiFi băng tần kép đầy đủ / kép đồng thời

      + WiFi 802.11 b / g / n 2.4 GHz

      + WiFi 802.11 a / n / ac 5 GHz

 

-  Sử dụng công nghệ ăng-ten MIMO 4 × 4

 

- Nighthawk M2 có một cổng Ethernet, một cổng USB-C và một cổng USB loại A cho khả năng Jump Boost và Media Server/NAS. Tính năng Jum Boost có thể sạc điện thoại thông minh và các thiết bị USB di động nhỏ

 

- Hai đầu nối TS-9 có sẵn để sử dụng với ăng ten 4G / 3G bên ngoài. Giúp tăng cường khả năng thu phát sóng 4G cho thiết bị.

 

- Sử dụng pin Li-ion có dung lượng 5040mAh, sử dụng liên tục lên đến 15 giờ.

 

- Phụ huynh có thể kiểm soát hoặc bảo vệ quyền truy cập vào nội dung trực tuyến.

 

- Trải nghiệm người dùng với ứng dụng di động NETGEAR đơn giản, trực quan để theo dõi việc sử

dụng dữ liệu, quản lý cài đặt mạng và thiết bị từ điện thoại thông minh hoặc máy tính bảng iOS hoặc Android ™

 

- Thiết lập đơn giản không có phần mềm để cài đặt, chỉ cần bật và kết nối

 

- Kích thước: 105,5 (L) x 105,5 (W) x 20,35 (H) mm

- Trọng lượng: 240 g (có pin)

 

 

Đóng gói sản phẩm bao gồm:

 

- Bộ định tuyến di động NETGEAR Nighthawk M2

- Pin Li-ion 5040mAh (Li-ion) có thể tháo rời

- Nắp lưng

- Bộ sạc QC 2.0 và cáp USB Type-C

- Hướng dẫn nhanh',N'Bảo Hành Tại Trung tâm',9)
insert into thong_tin_san_pham values(N'Router Wifi Xiaomi 4 Pro',(SELECT * FROM OPENROWSET(BULK N'C:\Users\hoang\Desktop\webjava\master\WebBanHang\src\img\Router Wifi Xiaomi 4 Pro.png', SINGLE_BLOB) as T1),900000,'Xiaomi',N'Những đặc điểm và tính năng bậc nhất của Netgear MR2100:

 

- Netgear Nighthawk M2 có tốc độ Download lên tới 2Gbps / Upload lên tới 150Mbps ở các khu vực được chọn. 

 

- Hỗ trợ 4GX LTE Advanced 20 với tổng hợp mạng di động lên đến 5 băng tần

 

- Giao diện màn hình cảm ứng LCD hiển thị 2,4" để theo dõi hoạt động/ dữ liệu sử dụng

 

- Cũng giống như người tiền nhiệm M1, Netgear M2 cũng có thể hỗ trợ tối đa 20 thiết bị không dây

để truy cập internet

 

- Hỗ trợ chuẩn sóng 4G sub-6GHz và 26 / 28GHz

 

- WiFi băng tần kép đầy đủ / kép đồng thời

      + WiFi 802.11 b / g / n 2.4 GHz

      + WiFi 802.11 a / n / ac 5 GHz

 

-  Sử dụng công nghệ ăng-ten MIMO 4 × 4

 

- Nighthawk M2 có một cổng Ethernet, một cổng USB-C và một cổng USB loại A cho khả năng Jump Boost và Media Server/NAS. Tính năng Jum Boost có thể sạc điện thoại thông minh và các thiết bị USB di động nhỏ

 

- Hai đầu nối TS-9 có sẵn để sử dụng với ăng ten 4G / 3G bên ngoài. Giúp tăng cường khả năng thu phát sóng 4G cho thiết bị.

 

- Sử dụng pin Li-ion có dung lượng 5040mAh, sử dụng liên tục lên đến 15 giờ.

 

- Phụ huynh có thể kiểm soát hoặc bảo vệ quyền truy cập vào nội dung trực tuyến.

 

- Trải nghiệm người dùng với ứng dụng di động NETGEAR đơn giản, trực quan để theo dõi việc sử

dụng dữ liệu, quản lý cài đặt mạng và thiết bị từ điện thoại thông minh hoặc máy tính bảng iOS hoặc Android ™

 

- Thiết lập đơn giản không có phần mềm để cài đặt, chỉ cần bật và kết nối

 

- Kích thước: 105,5 (L) x 105,5 (W) x 20,35 (H) mm

- Trọng lượng: 240 g (có pin)

 

 

Đóng gói sản phẩm bao gồm:

 

- Bộ định tuyến di động NETGEAR Nighthawk M2

- Pin Li-ion 5040mAh (Li-ion) có thể tháo rời

- Nắp lưng

- Bộ sạc QC 2.0 và cáp USB Type-C

- Hướng dẫn nhanh',N'Bảo Hành Tại Trung tâm',10)
--insert into thong_tin_san_pham values((SELECT * FROM OPENROWSET(BULK N'C:\Users\hoang\Desktop\webjava\master\WebBanHang\src\img\Bộ phát Wifi di động 4GB LTE 150 MBPS Tenda - 4G180.png', SINGLE_BLOB) as T1),'router Wifi xiaomi','Xiaomi',N'Bộ phát Wifi di động 4GB LTE 150 MBPS Tenda - 4G180',N'Bảo Hành Tại Trung tâm xiaomi','sp1')
--insert into thong_tin_san_pham values((SELECT * FROM OPENROWSET(BULK N'C:\Users\hoang\Desktop\webjava\master\WebBanHang\src\img\Bộ phát Wifi di động 4GB LTE 150 MBPS Tenda - 4G180.png', SINGLE_BLOB) as T1),'router Wifi dell','dell',N'Bộ phát Wifi di động 4GB LTE 150 MBPS Tenda - 4G180',N'Bảo Hành Tại Trung tâm xiaomi','sp2')
--------------bang gio hang-----------------------------
create table gio_hang(
maghh INT IDENTITY(1,1) primary key,
--tong_tien double precision,
mahd int
)
create table san_pham_trong_gio_hang(
maspgh INT IDENTITY(1,1) primary key,
ten_san_pham nvarchar(100),
img image ,
gia_san_pham double precision,
so_luong int,
maghh int,
masp int,
)
--select gh.maspgh,gh.masp,ten_san_pham,img,gia_san_pham,so_luong from san_pham_trong_gio_hang gh join gio_hang g on  gh.maghh=g.maghh join hoa_don h on h.mahd= g.mahd where h.mahd = 3
--------------FK_hoadon_khachhang-----------------------------
ALTER TABLE hoa_don
ADD CONSTRAINT FK_hoadon_khachhang FOREIGN KEY (makh)
REFERENCES khach_hang (makh)
--ON UPDATE CASCADE
--------------FK_giaohang_hoadon------------------------------------------------
ALTER TABLE giao_hang
ADD CONSTRAINT FK_giaohang_hoadon FOREIGN KEY (mahd)
REFERENCES hoa_don (mahd)
--ON UPDATE CASCADE
--------------FK_chitiethoahon_hoadon------------------------------------------------
--ALTER TABLE chi_tiet_hoa_don
--ADD CONSTRAINT FK_chitiethoahon_hoadon FOREIGN KEY (mahd)
--REFERENCES hoa_don (mahd)
--ON UPDATE CASCADE
--------------FK_chitiethoahon_sanpham------------------------------------------------
ALTER TABLE san_pham_trong_gio_hang
ADD CONSTRAINT FK_san_pham_trong_gio_hang_sanpham FOREIGN KEY (masp)
REFERENCES sanpham (masp)
--ON UPDATE CASCADE
--------------FK_thongtinsanpham_sanpham------------------------------------------------
ALTER TABLE thong_tin_san_pham
ADD CONSTRAINT FK_thongtinsanpham_sanpham FOREIGN KEY (masp)
REFERENCES sanpham (masp)
---- UPDATE CASCADE
--------------FK_gio_hang_khachhang------------------------------------------------
ALTER TABLE gio_hang
ADD CONSTRAINT FK_giohang_hoadon FOREIGN KEY (mahd)
REFERENCES hoa_don (mahd)
--------------FK_gio_hang_sanphamgiohang------------------------------------------------
ALTER TABLE san_pham_trong_gio_hang
ADD CONSTRAINT FK_gio_hang_sanphamgiohang FOREIGN KEY (maghh)
REFERENCES gio_hang (maghh)
--ON UPDATE CASCADE
--select * from khach_hang
--delete from khach_hang where makh = 2
--select * from sanpham
-- select * from khach_hang
-- select * from hoa_don
--delete from gio_hang 
--select * from thong_tin_san_pham where matt = 'tt1'
--select * from san_pham_trong_gio_hang
--delete from san_pham_trong_gio_hang
--select count(*) from san_pham_trong_gio_hang where maghh = '8'
--select * from gio_hang where 
--select Sum(so_luong * gia_san_pham) from san_pham_trong_gio_hang where maghh = 1\
--select * from san_pham_trong_gio_hang where maghh = 4
--update gio_hang set mahd = 2 where maghh = 1
--SELECT IDENT_CURRENT('san_pham_trong_gio_hang')+1


--select* from gio_hang where mahd = 4


--select gh.maspgh,gh.maghh,h.mahd,gh.ten_san_pham,gh.img,gh.gia_san_pham,gh.so_luong from san_pham_trong_gio_hang gh left join gio_hang g on  gh.maghh=g.maghh join hoa_don h on h.mahd= g.mahd where h.mahd = 2