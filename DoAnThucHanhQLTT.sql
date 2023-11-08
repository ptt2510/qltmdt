CREATE DATABASE DoAnQuanLyTT
GO
USE DoAnQuanLyTT
GO

CREATE TABLE THANHVIEN (
    MATV char(6) PRIMARY KEY,
    TEN nvarchar(50),
    SDT char(10),
    NGAYTG smalldatetime,
    NGSINH smalldatetime,
    GMAIL varchar(50)
);

CREATE TABLE DVVC(
    MADV char(6) PRIMARY KEY,
    TEN nvarchar(50),
    DIACHI varchar(100),
		GIA MONEY
);

CREATE TABLE NVIENVC (
	MANV CHAR(6) primary key,
	TEN NVARCHAR(50),
	GTINH VARCHAR(3),
	SDT	CHAR(10),
	MADV char(6) FOREIGN KEY REFERENCES DVVC(MADV)
);

CREATE TABLE SHOP(
	MSHOP CHAR(6) PRIMARY KEY,
	TENSHOP	NVARCHAR(30),
	SDT	VARCHAR(10),
	DIACHI VARCHAR(50),
	NGLAP SMALLDATETIME,
	CHUSHOP	CHAR(6) FOREIGN KEY REFERENCES THANHVIEN(MATV)
);

CREATE TABLE NSX( 
	MNSX CHAR(6) PRIMARY KEY,
	TEN	NVARCHAR(50),
	NUOCSX	NVARCHAR(30)
);

CREATE TABLE SANPHAM(
	MASP CHAR(6) PRIMARY KEY,
	TEN	NVARCHAR(100),
	GIA	MONEY,
	CONGDUNG NVARCHAR(100),
	NSX	CHAR(6) FOREIGN KEY REFERENCES NSX(MNSX),
	DANHMUC NVARCHAR(50)
);

CREATE TABLE CTSP(
	MASP CHAR(6) FOREIGN KEY REFERENCES SANPHAM(MASP),
	MSHOP CHAR(6) FOREIGN KEY REFERENCES SHOP(MSHOP),
	PRIMARY KEY (MASP,MSHOP)
);

CREATE TABLE VoucherVC(
	MVCVC CHAR(6) PRIMARY KEY,
	CONGDUNG NVARCHAR(50),
	GIATRI INT,
	MADV CHAR(6) FOREIGN KEY REFERENCES DVVC(MADV)
);

CREATE TABLE VoucherShop(
	MVCS CHAR(6) PRIMARY KEY,
	CONGDUNG NVARCHAR(20),
	GIATRI INT,
	MSHOP CHAR(6) FOREIGN KEY REFERENCES SHOP
);

CREATE TABLE DONHANG(
	MADH CHAR(6) PRIMARY KEY,
	NGLAP smalldatetime,
	GiaSPBD	MONEY,
	DIACHI NVARCHAR(50),
	SDT	CHAR(10),
	NGAYGIAOTC	SMALLDATETIME,
	TENKH	NVARCHAR(50),
	HTThanhToan	NVARCHAR(30),
	GIASPCC	MONEY,
	GIAVCCC	MONEY,
	TONGTIEN	MONEY,
	VOUCHERVC	CHAR(6) FOREIGN KEY REFERENCES VoucherVC(MVCVC),
	VOUCHERSHOP	CHAR(6) FOREIGN KEY REFERENCES VoucherShop(MVCS),
	NGUOIDAT	CHAR(6) FOREIGN KEY REFERENCES THANHVIEN(MATV),
	SHOP	CHAR(6) FOREIGN KEY REFERENCES SHOP(MSHOP),
	DVVC	CHAR(6) FOREIGN KEY REFERENCES DVVC(MADV)
);

CREATE TABLE CTDH(
	MADH	CHAR(6) FOREIGN KEY REFERENCES DONHANG(MADH),
	MASP	CHAR(6) FOREIGN KEY REFERENCES SANPHAM(MASP),
	SL	INT,
	PRIMARY KEY(MADH,MASP)
);

CREATE TABLE CTVANCHUYEN (
	MANV	CHAR(6) FOREIGN KEY REFERENCES NVIENVC(MANV),
	MADH	CHAR(6) FOREIGN KEY REFERENCES DONHANG(MADH),
	NGAYGIAO	SMALLDATETIME,
	PRIMARY KEY (MANV,MADH,NGAYGIAO)
);

CREATE TABLE DonKhieuNaiHoanTien(
	MADON	CHAR(6) PRIMARY KEY,
	NGAYLAP	SMALLDATETIME,
	NGUOILAP CHAR(6) FOREIGN KEY REFERENCES THANHVIEN(MATV),
	SHOP CHAR(6) FOREIGN KEY REFERENCES SHOP(MSHOP),
	DONHANG	CHAR(6) FOREIGN KEY REFERENCES DONHANG(MADH),
	LYDO nvarchar(250)
);

set dateformat dmy
INSERT INTO THANHVIEN (MATV, TEN, SDT, NGAYTG, NGSINH, GMAIL)
VALUES
('TV0001', N'Nguyễn Văn An', '0976543226', '01/01/2022', '01/01/1990', 'nguyenvana@gmail.com'),
('TV0002', N'Trần Thị Bình', '0976543221', '01/02/2022', '02/02/1991', 'tranthib@gmail.com'),
('TV0003', N'Lê Văn Chung', '0976543224', '01/03/2022', '03/03/1992', 'levanc@gmail.com'),
('TV0004', N'Phạm Thị Dung', '0976543213', '01/04/2022', '04/04/1993', 'phamthid@gmail.com'),
('TV0005', N'Hoàng Văn Em', '0976543212', '01/05/2022', '05/05/1994', 'hoangvane@gmail.com'),
('TV0006', N'Vũ Thị Phương', '0976543225', '01/06/2022', '06/06/1995', 'vuthif@gmail.com'),
('TV0007', N'Nguyễn Thị Giang', '0976543228', '01/07/2022', '07/07/1996', 'nguyenthig@gmail.com'),
('TV0008', N'Trần Văn Huy', '0976543214', '01/08/2022', '08/08/1997', 'tranvanh@gmail.com'),
('TV0009', N'Lê Thị Uyên', '0976543219', '01/09/2022', '09/09/1998', 'lethii@gmail.com'),
('TV0010', N'Phạm Văn Kiệt', '0976543223', '01/10/2022', '10/10/1999', 'phamvank@gmail.com'),
('TV0011', N'Hoàng Thùy Linh', '0976543215', '01/11/2022', '11/11/2000', 'hoangthil@gmail.com'),
('TV0012', N'Vũ Văn Minh', '0987654321', '01/12/2022', '12/12/2001', 'vuvanm@gmail.com');

INSERT INTO DVVC (MADV, TEN, DIACHI, GIA) VALUES
('DVVC01', N'Giao hàng nhanh', N'Số 1, Đường Trần Hưng Đạo, Quận 1, TP.HCM', 15000),
('DVVC02', N'Giao hàng tiết kiệm', N'Số 2, Đường Lê Duẩn, Quận 3, TP.HCM', 20000),
('DVVC03', N'Viettel Post', N'Số 1, Đường Giải Phóng, Thanh Xuân, Hà Nội', 25000);

INSERT INTO NVIENVC (MANV, TEN, GTINH, SDT, MADV)
VALUES 
('NV0001', N'Đàm Vĩnh Hưng', 'Nam', '0901234567', 'DVVC03'),
('NV0002', N'Đông Nhi', N'Nữ', '0901234568', 'DVVC02'),
('NV0003', N'Hoài Linh', 'Nam', '0901234569', 'DVVC01'),
('NV0004', N'Thùy Tiên', N'Nữ', '0901234570', 'DVVC01'),
('NV0005', N'Trấn Thành', 'Nam', '0901234571', 'DVVC02'),
('NV0006', N'Bảo Anh', N'Nữ', '0901234572', 'DVVC02'),
('NV0007', N'Đạt G', 'Nam', '0901234573', 'DVVC01'),
('NV0008', N'Lệ Quyên', N'Nữ', '0901234574', 'DVVC03'),
('NV0009', N'Trung Quân', 'Nam', '0901234575', 'DVVC01'),
('NV0010', N'Chi Pu', N'Nữ', '0901234576', 'DVVC03');

set dateformat dmy
INSERT INTO SHOP (MSHOP, TENSHOP, SDT, DIACHI, NGLAP, CHUSHOP)
VALUES
('SHOP01', 'Pretty Savage', '01234567', N'Hồ Chí Minh', '1/2/2015', 'TV0005'),
('SHOP02', 'Beauty Shop', '01234568', N'Cần Thơ', '10/3/2019', 'TV0001'),
('SHOP03', N'Bách hóa Tìm Rịm', '01234569', N'Vũng Tàu', '5/3/2013', 'TV0004'),
('SHOP04', N'Bếp nhà Mây', '01234570', N'Hạ Long', '6/7/2016', 'TV0003'),
('SHOP05', N'Nhà sách Mưa', '01234571', N'Gia Lai', '8/2/2020', 'TV0002'),
('SHOP06', N'Leng Keng VPP', '01234572', N'Đà Lạt', '17/2/2022', 'TV0006');

INSERT INTO NSX (MNSX, TEN, NUOCSX) 
VALUES
('NSX001', N'LOréal', N'Pháp'),
('NSX002', 'Christian Dior', N'Pháp'),
('NSX003', 'Samsung', N'Hàn Quốc'),
('NSX004', 'Vinamilk', N'Việt Nam'),
('NSX005', N'Nhà xuất bản Việt Nam', N'Việt Nam'),
('NSX006', 'Nivea', N'Đức'),
('NSX007', 'CeraVe', N'Mỹ'),
('NSX008', 'Maybelline', N'Mỹ'),
('NSX009', 'Xiaomi', N'Trung Quốc'),
('NSX010', 'Apple', N'Mỹ'),
('NSX011', 'Deli', N'Trung Quốc'),
('NSX012', 'Công ty CP Thiên Long Group', N'Việt Nam'),
('NSX013', N'Công ty TNHH Khánh Long', N'Việt Nam'),
('NSX014', 'Công ty TNHH Healthcare', N'Việt Nam');

INSERT INTO SANPHAM (MASP, GIA, TEN, CONGDUNG, NSX, DANHMUC) VALUES
('SP0001', 270000, N'Kem chống nắng LOréal Paris UV Perfect Aqua Essence SPF50', N'Chống nắng', 'NSX001', N'Mỹ phầm'),
('SP0002', 155000, N'Sữa rửa mặt LOréal Paris White Perfect Milky Foam', N'Tẩy trang', 'NSX001', N'Mỹ phầm'),
('SP0003', 219000, N'Son LOréal Paris Rouge Signature Matte Lipstick', 'Son lì', 'NSX001', N'Mỹ phầm'),
('SP0004', 365000, N'Phấn nước LOréal Paris Infallible 24H Fresh Wear Foundation', N'Phấn phủ', 'NSX001', N'Mỹ phầm'),
('SP0005', 139000, N'Dầu gội LOréal Paris Elseve Extraordinary Oil-in-Cream', N'Dưỡng tóc', 'NSX001', N'Chăm sóc tóc'),
('SP0006', 130000, N'Rouge Dior', 'Son lì', 'NSX002', N'Mỹ phầm'),
('SP0007', 120000, N'Dior Addict', N'Son bóng', 'NSX002', N'Mỹ phầm'),
('SP0008', 2500000,N'Miss Dior', N'Nước hoa', 'NSX002', N'Mỹ phầm'),
('SP0009', 2900000, N'Jadore Dior', N'Nước hoa', 'NSX002', N'Mỹ phầm'),
('SP0010', 182000, N'Dior Forever Undercover Concealer', N'Kem che khuyết điểm', 'NSX002', N'Mỹ phầm'),
('SP0011', 18500, N'Sữa tươi Vinamilk', N'Sữa', 'NSX004', N'Thực phẩm'),
('SP0012', 15000, N'Sữa đặc hộp Vinamilk', N'Sữa', 'NSX004', N'Thực phẩm'),
('SP0013', 10000, N'Sữa chua uống probi Vinamilk', N'Sữa', 'NSX004', N'Thực phẩm'),
('SP0014', 8000, N'Sữa chua cốt dừa Vinamilk', N'Sữa', 'NSX004', N'Thực phẩm'),
('SP0015', 20000, N'Sữa tươi không đường Vinamilk', N'Sữa', 'NSX004', N'Thực phẩm'),
('SP0016', 3490000, N'Điện thoại Samsung Galaxy A12', 'Smartphone', 'NSX003', N'Thiết bị điện tử'),
('SP0017', 4690000, N'Máy tính bảng Samsung Galaxy Tab A7 Lite', N'Máy tính bảng', 'NSX003', N'Thiết bị điện tử'),
('SP0018', 2490000, N'Đồng hồ thông minh Samsung Galaxy Buds Pro', N'Đồng hồ thông minh', 'NSX003', N'Thiết bị điện tử'),
('SP0019', 4690000, N'Đồng hồ thông minh Samsung Galaxy Watch Active 2', N'Đồng hồ thông minh', 'NSX003', N'Thiết bị điện tử'),
('SP0020', 22990000, N'Máy tính bảng Samsung Galaxy Tab S7+', N'Máy tính bảng', 'NSX003', N'Thiết bị điện tử'),
('SP0021', 20000, N'Vở ghi chép cao cấp Deli Note 106 A5', N'Vở ghi chép', 'NSX005', N'Văn phòng phẩm'),
('SP0022', 9000, N'Vở ghi chép Top Point 48F A5', N'Vở ghi chép', 'NSX005', N'Văn phòng phẩm'),
('SP0023', 11500, N'Vở ghi chép giấy bóng Aspire 80 trang A4', N'Vở ghi chép', 'NSX005', N'Văn phòng phẩm'),
('SP0024', 25000, N'Bút lông Thiên Long Fasler Hàn Quốc', N'Bút lông', 'NSX005', N'Văn phòng phẩm'),
('SP0025', 340000, N'Máy tính Casio FX-570VN Plus', N'Máy tính khoa học', 'NSX005', N'Văn phòng phẩm'),
('SP0026', 160000, N'Bộ bút màu nước Pelikan K12 24 màu Hàn Quốc', N'Bút màu nước', 'NSX005', N'Văn phòng phẩm'),
('SP0027', 590000, N'Đèn bàn Klong Nordic', N'Dùng để chiếu sáng trong phòng khách, phòng ngủ, phòng làm việc, ...', 'NSX005', N'Văn phòng phẩm'),
('SP0028', 980000, N'Đèn bàn Klong PUFF', N'Trang trí nội thất', 'NSX005', N'Văn phòng phẩm'),
('SP0029', 1990000, N'Bàn làm việc Klong', N'Trang trí nội thất', 'NSX005', N'Văn phòng phẩm'),
('SP0030', 10000, N'Bút bi Thiên Long cao cấp', N'Viết trơn, mực đen đậm, đầu bút 0.5mm', 'NSX005', N'Văn phòng phẩm');

INSERT INTO CTSP (MASP, MSHOP)
VALUES 
('SP0003', 'SHOP01'),
('SP0004', 'SHOP01'),
('SP0005', 'SHOP01'),
('SP0006', 'SHOP01'),
('SP0007', 'SHOP01'),
('SP0008', 'SHOP01'),
('SP0009', 'SHOP01'),
('SP0010', 'SHOP01'),
('SP0001', 'SHOP02'),
('SP0002', 'SHOP02'),
('SP0003', 'SHOP02'),
('SP0004', 'SHOP02'),
('SP0005', 'SHOP02'),
('SP0024', 'SHOP02'),
('SP0025', 'SHOP02'),
('SP0026', 'SHOP02'),
('SP0014', 'SHOP03'),
('SP0016', 'SHOP03'),
('SP0017', 'SHOP03'),
('SP0018', 'SHOP03'),
('SP0019', 'SHOP03'),
('SP0020', 'SHOP03'),
('SP0027', 'SHOP03'),
('SP0029', 'SHOP03'),
('SP0005', 'SHOP04'),
('SP0006', 'SHOP04'),
('SP0011', 'SHOP04'),
('SP0012', 'SHOP04'),
('SP0013', 'SHOP04'),
('SP0014', 'SHOP04'),
('SP0015', 'SHOP04'),
('SP0001', 'SHOP05'),
('SP0002', 'SHOP05'),
('SP0003', 'SHOP05'),
('SP0021', 'SHOP05'),
('SP0022', 'SHOP05'),
('SP0023', 'SHOP05'),
('SP0024', 'SHOP05'),
('SP0016', 'SHOP06'),
('SP0017', 'SHOP06'),
('SP0025', 'SHOP06'),
('SP0026', 'SHOP06'),
('SP0027', 'SHOP06'),
('SP0028', 'SHOP06'),
('SP0029', 'SHOP06'),
('SP0030', 'SHOP06');
INSERT INTO [dbo].[VoucherVC]
VALUES
('VCVC01', N'Giảm 15.000 đồng', 15000, 'DVVC01'),
('VCVC02', N'Giảm 5.000 đồng', 5000, 'DVVC02'),
('VCVC03', N'Giảm 30% giá trị vận chuyển', 30, 'DVVC03'),
('VCVC04', N'Miễn phí vận chuyển 100%', 0, 'DVVC01'),
('VCVC05', N'Giảm 10% giá trị vận chuyển', 10, 'DVVC02');

INSERT INTO VoucherShop (MVCS, CONGDUNG, GIATRI, MSHOP)
VALUES 
('VCS001', N'Giảm 15k', 15000, 'SHOP01'),
('VCS002', N'Giảm 200k', 200000, 'SHOP03'),
('VCS003', N'Giảm 5k', 5000, 'SHOP06'),
('VCS004', N'Giảm 30%', 30, 'SHOP02'),
('VCS005', N'Giảm 10%', 10, 'SHOP05'),
('VCS006', N'Giảm 8%', 8, 'SHOP04');

--XOA GIASPBD, GIAVCBD, 
INSERT INTO DONHANG (MADH, NGUOIDAT, SHOP, GiaSPBD, TENKH, DIACHI, SDT, NGLAP, NGAYGIAOTC, HTThanhToan, GIASPCC, GIAVCCC, TONGTIEN, VOUCHERVC, DVVC, VOUCHERSHOP)
VALUES
  ('DH0001', 'TV0007', 'SHOP02', 0, N'Nguyễn Thị Giang', N'Nghệ An', '0976543228', '15/01/2022', '17/01/2022', N'Ví momo', 0, 0, 0, 'VCVC01', 'DVVC01', 'VCS004'),
  ('DH0002', 'TV0012', 'SHOP05', 0, N'Vũ Văn Minh', N'Tây Ninh', '0987654321', '23/03/2023', '28/03/2023', N'Chuyển khoản ngân hàng', 0, 0, 0, NULL, 'DVVC01', NULL),
  ('DH0003', 'TV0009', 'SHOP01',  0, N'Lê Thị Uyên', N'Sóc Trăng', '0976543219', '03/02/2023', '07/02/2023', N'Thanh toán khi nhận hàng', 0, 0, 0, 'VCVC01', 'DVVC01', NULL),
  ('DH0004', 'TV0007', 'SHOP06',   0, N'Nguyễn Thị Giang', N'Nghệ An', '0976543228', '14/04/2022', '19/04/2022', N'Thanh toán khi nhận hàng', 0, 0, 0, 'VCVC02', 'DVVC02', NULL),
  ('DH0005', 'TV0009', 'SHOP02',   0, N'Lê Thị Uyên', N'Sóc Trăng', '0976543219', '05/03/2023', '10/03/2023', N'Chuyển khoản ngân hàng', 0, 0, 0, 'VCVC02', 'DVVC02', 'VCS004'),
  ('DH0006', 'TV0010', 'SHOP02',   0, N'Phạm Văn Kiệt', N'Tiền Giang', '0976543223', '26/01/2022', '31/01/2022', N'Chuyển khoản ngân hàng', 0, 0, 0, 'VCVC03', 'DVVC03', NULL),
   ('DH0007', 'TV0011', 'SHOP06',   0, N'Hoàng Thùy Linh', N'Đồng Nai', '0976543215', '10/05/2022', '14/05/2022', N'Chuyển khoản ngân hàng', 0, 0, 0, 'VCVC03', 'DVVC03', 'VCS003'),
  ('DH0008', 'TV0009', 'SHOP01',   0, N'Đặng Minh Trí', N'Sóc Trăng', '0382559048', '01/04/2023', '05/04/2023', N'Ví momo', 0, 0, 0, 'VCVC04', 'DVVC01', NULL),
  ('DH0009', 'TV0012', 'SHOP06',   0, N'Vũ Văn Minh', N'Tây Ninh', '0987654321', '18/02/2023', '23/02/2023', N'Chuyển khoản ngân hàng', 0, 0, 0, 'VCVC04', 'DVVC01', 'VCS003'),
  ('DH0010', 'TV0009', 'SHOP01',   0, N'Phạm Văn Thiên', N'Bình Dương', '0377111222', '05/01/2023', '09/01/2023', N'Chuyển khoản ngân hàng', 0, 0, 0, 'VCVC05', 'DVVC02', 'VCS001'),
  ('DH0011', 'TV0008', 'SHOP06',   0, N'Trần Văn Huy', N'Hồ Chí Minh', '0976543214', '07/03/2023', '12/03/2023', N'Ví momo', 0, 0, 0, 'VCVC01', 'DVVC01', 'VCS003'),
  ('DH0012', 'TV0012', 'SHOP05',   0, N'Nguyễn Thị Tuyết Mai', N'Tây Ninh', '0918273465', '17/02/2022', '22/02/2022', N'Ví momo', 0, 0, 0, 'VCVC02', 'DVVC02', 'VCS005'),
  ('DH0013', 'TV0010', 'SHOP01',   0, N'Phạm Văn Kiệt', N'Tiền Giang', '0976543223', '28/04/2022', '02/05/2022', N'Ví momo', 0, 0, 0, 'VCVC05', 'DVVC02', NULL),
  ('DH0014', 'TV0010', 'SHOP04',   0, N'Phạm Văn Kiệt', N'Tiền Giang', '0976543223', '11/02/2023', '16/02/2023', N'Thanh toán khi nhận hàng', 0, 0, 0, 'VCVC03', 'DVVC03', NULL),
  ('DH0015', 'TV0007', 'SHOP04',   0, N'Nguyễn Thị Giang', N'Nghệ An', '0976543228', '15/04/2023', '20/04/2023', N'Ví momo', 0, 0, 0, NULL, 'DVVC02', NULL),
  ('DH0016', 'TV0007', 'SHOP05',   0, N'Hoàng Thị Thuý', N'Nghệ An', '0918145982', '22/03/2022', '27/03/2022', N'Chuyển khoản ngân hàng', 0, 0, 0, NULL, 'DVVC03', NULL),
  ('DH0017', 'TV0009', 'SHOP05',   0, N'Trần Văn Thắng', N'Bình Dương', '0918587092', '04/01/2023', '08/01/2023', N'Thanh toán khi nhận hàng', 0, 0, 0, 'VCVC04', 'DVVC01', NULL),
  ('DH0018', 'TV0010', 'SHOP06',   0, N'Trần Thị Thu Hà', N'Tiền Giang', '0125579023', '01/05/2023', '06/05/2023', N'Ví momo', 0, 0, 0, 'VCVC03', 'DVVC03', 'VCS003'),
  ('DH0019', 'TV0011', 'SHOP03',   0, N'Nguyễn Thị Trang', N'Đồng Nai', '0377478324', '20/02/2023', '25/02/2023', N'Thanh toán khi nhận hàng', 0, 0, 0, 'VCVC04', 'DVVC01', 'VCS002'),
  ('DH0020', 'TV0011', 'SHOP01',   0, N'Lê Thị Thanh Huyền', N'Hồ Chí Minh', '0918789234', '27/02/2022', '04/03/2022', N'Chuyển khoản ngân hàng', 0, 0, 0, 'VCVC05', 'DVVC02', NULL),
  ('DH0021', 'TV0008', 'SHOP02',   0, N'Trần Văn Huy', N'Hồ Chí Minh', '0976543214', '08/01/2023', '13/01/2023', N'Chuyển khoản ngân hàng', 0, 0, 0, 'VCVC01', 'DVVC01', NULL),
  ('DH0022', 'TV0008', 'SHOP04',   0, N'Trần Văn Huy', N' Hồ Chí Minh', '0976543214', '26/03/2023', '30/03/2023', N'Thanh toán khi nhận hàng', 0, 0, 0, NULL, 'DVVC03', NULL),
  ('DH0023', 'TV0007', 'SHOP01',   0, N'Nguyễn Minh Tuấn', N'Nghệ An', '0462337192', '13/02/2022', '18/02/2022', N'Thanh toán khi nhận hàng', 0, 0, 0, 'VCVC05', 'DVVC02', 'VCS001'),
  ('DH0024', 'TV0007', 'SHOP03',   0, N'Phan Thị Lan Anh', N'Nghệ An', '0983845671', '26/04/2023', '01/05/2023', N'Thanh toán khi nhận hàng', 0, 0, 0, 'VCVC05', 'DVVC02', 'VCS002');

INSERT INTO dbo.CTDH
VALUES
('DH0004', 'SP0026', 1)
INSERT INTO CTDH 
VALUES
('DH0004', 'SP0030', 3)
INSERT INTO CTDH 
VALUES
('DH0001', 'SP0002', 2)
INSERT INTO CTDH 
VALUES
('DH0001', 'SP0003', 2)
INSERT INTO CTDH 
VALUES
('DH0001', 'SP0004', 1)
INSERT INTO CTDH 
VALUES
('DH0023', 'SP0006', 2)
INSERT INTO CTDH 
VALUES
('DH0024', 'SP0016', 1)
INSERT INTO CTDH 
VALUES
('DH0024', 'SP0018', 1)
INSERT INTO CTDH 
VALUES
('DH0015', 'SP0013', 3)
INSERT INTO CTDH 
VALUES
('DH0015', 'SP0012', 4)
INSERT INTO CTDH 
VALUES
('DH0016', 'SP0022', 3)
INSERT INTO CTDH 
VALUES
('DH0016', 'SP0023', 1)
INSERT INTO CTDH 
VALUES
('DH0016', 'SP0024', 2)
INSERT INTO CTDH 
VALUES
('DH0021', 'SP0002', 1)
INSERT INTO CTDH 
VALUES
('DH0022', 'SP0011', 4)
INSERT INTO CTDH 
VALUES
('DH0022', 'SP0013', 2)
INSERT INTO CTDH 
VALUES
('DH0011', 'SP0025', 1)
INSERT INTO CTDH 
VALUES
('DH0011', 'SP0026', 2)
INSERT INTO CTDH 
VALUES
('DH0003', 'SP0010', 1)
INSERT INTO CTDH 
VALUES
('DH0008', 'SP0007', 1)
INSERT INTO CTDH 
VALUES
('DH0010', 'SP0008', 1)
INSERT INTO CTDH 
VALUES
('DH0010', 'SP0009', 1)
INSERT INTO CTDH 
VALUES
('DH0017', 'SP0021', 2)
INSERT INTO CTDH 
VALUES
('DH0017', 'SP0022', 1)
INSERT INTO CTDH 
VALUES
('DH0017', 'SP0023', 1)
INSERT INTO CTDH 
VALUES
('DH0017', 'SP0024', 2)
INSERT INTO CTDH 
VALUES
('DH0005', 'SP0004', 1)
INSERT INTO CTDH 
VALUES
('DH0005', 'SP0001', 2)
INSERT INTO CTDH 
VALUES
('DH0018', 'SP0028', 1)
INSERT INTO CTDH 
VALUES
('DH0018', 'SP0029', 1)
INSERT INTO CTDH 
VALUES
('DH0013', 'SP0007', 1)
INSERT INTO CTDH 
VALUES
('DH0006', 'SP0005', 1)
INSERT INTO CTDH 
VALUES
('DH0014', 'SP0013', 10)
INSERT INTO CTDH 
VALUES
('DH0014', 'SP0014', 2)
INSERT INTO CTDH 
VALUES
('DH0014', 'SP0015', 2)
INSERT INTO CTDH 
VALUES
('DH0007', 'SP0027', 1)
INSERT INTO CTDH 
VALUES
('DH0020', 'SP0010', 1)
INSERT INTO CTDH 
VALUES
('DH0019', 'SP0016', 1)
INSERT INTO CTDH 
VALUES
('DH0009', 'SP0025', 1)
INSERT INTO CTDH 
VALUES
('DH0009', 'SP0026', 2)
INSERT INTO CTDH 
VALUES
('DH0012', 'SP0020', 1)
INSERT INTO CTDH 
VALUES
('DH0002', 'SP0021', 2)
INSERT INTO CTDH 
VALUES
('DH0002', 'SP0024', 2)

set dateformat dmy
INSERT INTO CTVANCHUYEN (MANV, MADH, NGAYGIAO)
VALUES
('NV0003', 'DH0001', '16/01/2023'),
('NV0004', 'DH0002', '26/03/2023'),
('NV0007', 'DH0003', '7/2/2023'),
('NV0009', 'DH0008', '4/4/2023'),
('NV0003', 'DH0009', '22/02/2023'),
('NV0004', 'DH0011', '11/3/2023'),
('NV0007', 'DH0017', '8/1/2023'),
('NV0009', 'DH0019', '23/02/2023'),
('NV0009', 'DH0021', '8/1/2023'),
('NV0002', 'DH0004', '18/04/2023'),
('NV0005', 'DH0005', '9/3/2023'),
('NV0006', 'DH0010', '9/1/2023'),
('NV0002', 'DH0012', '20/02/2023'),
('NV0005', 'DH0013', '2/5/2023'),
('NV0006', 'DH0015', '10/4/2023'),
('NV0002', 'DH0020', '4/3/2023'),
('NV0005', 'DH0023', '12/2/2023'),
('NV0006', 'DH0024', '1/5/2023'),
('NV0001', 'DH0006', '30/01/2023'),
('NV0008', 'DH0007', '13/05/2023'),
('NV0010', 'DH0014', '14/02/2023'),
('NV0001', 'DH0016', '25/03/2023'),
('NV0008', 'DH0018', '4/5/2023'),
('NV0010', 'DH0022', '28/03/2023');

set dateformat dmy
INSERT INTO [dbo].[DonKhieuNaiHoanTien]
VALUES
('KN01', '19/04/2022', 'TV0007', 'SHOP06', 'DH0004', N'Giao thiếu hàng'),
('KN02', '11/3/2023', 'TV0009', 'SHOP02', 'DH0005', N'Hàng bị hỏng'),
('KN03', '9/1/2023', 'TV0009', 'SHOP01', 'DH0010', N'Hàng bị vỡ'),
('KN04', '12/3/2023', 'TV0008', 'SHOP06', 'DH0011', N'Sản phầm không giống mô tả'),
('KN05', '27/03/2022', 'TV0007', 'SHOP05', 'DH0016', N'Hàng giao không chính hãng'),
('KN06', '26/02/2023', 'TV0011', 'SHOP03', 'DH0019', N'Giao thiếu hàng'),
('KN07', '4/3/2022', 'TV0011', 'SHOP01', 'DH0020', N'Hàng bị hỏng'),
('KN08', '7/2/2023', 'TV0009', 'SHOP01', 'DH0003', N'Hàng bị vỡ'),
('KN09', '3/5/2022', 'TV0010', 'SHOP01', 'DH0013', N'Sản phầm không giống mô tả'),
('KN10', '17/01/2022', 'TV0007', 'SHOP02', 'DH0001', N'Hàng giao không chính hãng');

-- Năm tham gia của một thành viên phải lớn hơn năm sinh của thành viên đó :
ALTER TABLE THANHVIEN ADD CONSTRAINT Check_YEAR CHECK ( YEAR([NGAYTG]) > YEAR([NGSINH]))

-- Kiểm tra cấu trúc của một gmail :
ALTER TABLE THANHVIEN ADD CONSTRAINT Check_GMAIL CHECK (GMAIL LIKE '%_@%.%')

-- SDT phải đúng 10 số và có số 0 đứng đầu :
ALTER TABLE THANHVIEN ADD CONSTRAINT Check_SDT_TV CHECK (LEN(SDT)=10AND (SDT LIKE '0%' ))

-- SDT phải đúng 10 số và có số 0 đứng đầu :
ALTER TABLE NVIENVC
ADD CONSTRAINT Check_SDT_NVVC CHECK (LEN(SDT)=10AND (SDT LIKE '0%' ))


-- Giá của sản phẩm phải lớn hơn 0 :
ALTER TABLE SANPHAM
ADD CONSTRAINT Check_GIA CHECK ( GIA > 0)


-- Giá trị của một voucher phải lớn hơn 0 :
ALTER TABLE VoucherSHOP
ADD CONSTRAINT Check_GIATRI CHECK (GIATRI>0)


-- SDT phải đúng 10 số và có số 0 đứng đầu :
ALTER TABLE DONHANG
ADD CONSTRAINT Check_SDT_DH CHECK (LEN(SDT)=10 AND (SDT LIKE '0%' ))

-- Trong HTTHANHTOAN chỉ có những hình thức sau 'Ví momo','Chuyển khoản ngân hàng','Thanh toán khi nhận hàng' :
ALTER TABLE DONHANG
ADD CONSTRAINT Check_HTThanhtoan1 CHECK ( [HTThanhToan] IN (N'Ví momo',N'Chuyển khoản ngân hàng',N'Thanh toán khi nhận hàng'))

-- Ngày lập ra đơn hàng phải sau ngày giao thành công :
ALTER TABLE DONHANG
d CONSTRAINT Check_NGAY CHECK ( NGLAP < NGAYGIAOTC)

-- Giá SPBD phải có giá trị dương :
ALTER TABLE DONHANG
ADD CONSTRAINT Check_GiaSPBD CHECK ( GiaSPBD >= 0 ) 

-- Số lượng sản phẩm trong một đơn hàng lớn hơn 0 :
ALTER TABLE CTDH
ADD CONSTRAINT Check_SL CHECK ( SL>0)

--Tổng tiền = SL * Gia từng sản phẩm:
CREATE TRIGGER trg_ctdhins ON CTDH
FOR INSERT
AS
BEGIN
DECLARE @MSP char(6), @SL int, @MDH char(6),
@TTIEN money
SELECT @MSP = MASP, @SL = SL, @MDH = MADH from inserted
SELECT @TTIEN = SUM(@SL * GIA) FROM inserted,
sanpham AS SP
WHERE SP.MASP = inserted.MASP GROUP BY MADH
UPDATE dbo.DONHANG SET GIASPBD = GIASPBD + @TTIEN
WHERE MADH = @MDH
END
GO

CREATE TRIGGER trg_ctdhdel ON CTDH
FOR DELETE
AS
BEGIN
DECLARE @MSP char(6), @SL int, @MDH char(6),
@TTIEN money
SELECT @MSP = MASP, @SL = SL, @MDH = MADH from deleted
SELECT @TTIEN = SUM(@SL * GIA) FROM deleted,
sanpham AS SP
WHERE SP.MASP = deleted.MASP GROUP BY MADH
UPDATE dbo.DONHANG SET GIASPBD = GIASPBD - @TTIEN
WHERE MADH = @MDH
END
GO

CREATE TRIGGER trg_ctdhupd ON CTDH
FOR UPDATE
AS
BEGIN
DECLARE @MSP char(6), @SL int, @MDH char(6),
@TTIEN money
SELECT @MSP = MASP, @SL = SL, @MDH = MADH from inserted
SELECT @TTIEN = SUM(@SL * GIA) FROM inserted,
sanpham AS SP
WHERE SP.MASP = inserted.MASP GROUP BY MADH
UPDATE dbo.DONHANG SET GIASPBD = GIASPBD + @TTIEN
WHERE MADH = @MDH
END
GO


--Trigger ràng buộc các điều kiện sau:
-- + Hóa đơn dưới 100k không được áp dụng voucher
--+ Hóa đơn từ 100k - 200k chỉ được áp dụng voucher vận chuyển
--+ Hóa đơn trên 300k áp dụng được cả voucher của shop & vận chuyển

CREATE TRIGGER VCINS_DH ON DONHANG
FOR INSERT
AS
BEGIN
DECLARE @MDH CHAR(6), @VCVC CHAR(6), @VCS CHAR(6), @TIEN MONEY
SELECT @MDH = MADH, @VCVC = VOUCHERVC, @VCS = VOUCHERSHOP, @TIEN = GIASPBD FROM inserted
IF (@TIEN < 100000 AND (@VCVC IS NOT NULL OR @VCS IS NOT NULL))
BEGIN
PRINT N'ĐƠN HÀNG DƯỚI 100K KHÔNG ĐƯỢC ÁP DỤNG VOUCHER'
ROLLBACK TRAN
END
ELSE IF ((@TIEN BETWEEN 100000 AND 200000) AND
@VCS IS NOT NULL)
BEGIN
PRINT N'ĐƠN HÀNG TỪ 100K - 200K KHÔNG ĐƯỢC ÁP DỤNG VOUCHERSHOP'
ROLLBACK TRAN
END
ELSE
PRINT N'THÊM 1 ĐƠN HÀNG THÀNH CÔNG'
END
GO


CREATE TRIGGER VCUPD_DH ON dbo.DONHANG
FOR UPDATE
AS
BEGIN
DECLARE @MDH CHAR(6), @VCVC CHAR(6), @VCS CHAR(6), @TIEN MONEY
SELECT @MDH = MADH, @VCVC = VOUCHERVC, @VCS = VOUCHERSHOP, @TIEN = GIASPBD FROM inserted
IF (@TIEN < 100000 AND (@VCVC IS NOT NULL OR @VCS IS NOT NULL))
BEGIN
PRINT N'ĐƠN HÀNG DƯỚI 100K KHÔNG ĐƯỢC ÁP DỤNG VOUCHER'
ROLLBACK TRAN
END
ELSE IF ((@TIEN BETWEEN 100000 AND 200000) AND @VCS IS NOT NULL)
BEGIN
PRINT N'ĐƠN HÀNG TỪ 100K - 200K KHÔNG ĐƯỢC ÁP DỤNG VOUCHERSHOP'
ROLLBACK TRAN
END
ELSE
PRINT N'UPDATE 1 ĐƠN HÀNG THÀNH CÔNG'
END
GO

-- Trigger chỉ được khiếu nại đơn hàng dưới 7 ngày tính từ ngày nhận:

CREATE TRIGGER KNUPD_DH ON DONHANG
FOR UPDATE
AS
BEGIN
DECLARE @MDH CHAR(6), @NGNHAN SMALLDATETIME, @NGLAP SMALLDATETIME
SELECT @MDH = MADH, @NGNHAN = NGAYGIAOTC FROM inserted
SELECT @NGLAP = NGAYLAP FROM DonKhieuNaiHoanTien
WHERE DONHANG = @MDH
IF (DATEDIFF(DAY, @NGNHAN, @NGLAP) > 7)
BEGIN
PRINT N'NGÀY LẬP ĐƠN KHIẾU NẠI KHÔNG ĐƯỢC QUÁ 7 NGÀY SO VỚI NGÀY NHẬN'
ROLLBACK TRAN
END
ELSE
PRINT N'UPDATE 1 ĐƠN HÀNG THÀNH CÔNG'
END


CREATE TRIGGER KNINS_KN ON DonKhieuNaiHoanTien
FOR INSERT
AS
BEGIN
DECLARE @MDH CHAR(6), @NGNHAN SMALLDATETIME, @NGLAP SMALLDATETIME
SELECT @MDH = DONHANG, @NGLAP = NGAYLAP FROM inserted
SELECT @NGNHAN = NGAYGIAOTC FROM DONHANG WHERE MADH = @MDH
IF (DATEDIFF(DAY, @NGNHAN, @NGLAP) > 7)
BEGIN
PRINT N'NGÀY LẬP ĐƠN KHIẾU NẠI KHÔNG ĐƯỢC QUÁ 7 NGÀY SO VỚI NGÀY NHẬN'
ROLLBACK TRAN
END
ELSE
PRINT N'THÊM ĐƠN KHIẾU NẠI THÀNH CÔNG'
END


CREATE TRIGGER KNUPD_KN ON DonKhieuNaiHoanTien
FOR UPDATE
AS
BEGIN
DECLARE @MDH CHAR(6), @NGNHAN SMALLDATETIME, @NGLAP SMALLDATETIME
SELECT @MDH = DONHANG, @NGLAP = NGAYLAP FROM deleted
SELECT @NGNHAN = NGAYGIAOTC FROM DONHANG WHERE MADH = @MDH
IF (DATEDIFF(DAY, @NGNHAN, @NGLAP) > 7)
BEGIN
PRINT N'NGÀY LẬP ĐƠN KHIẾU NẠI KHÔNG ĐƯỢC QUÁ 7 NGÀY SO VỚI NGÀY NHẬN'
ROLLBACK TRAN
END
ELSE
PRINT N'UPDATE ĐƠN KHIẾU NẠI THÀNH CÔNG'
END


--Nhập vào mã sản phẩm xuất ra thông tin voucher có thể áp dụng, nếu không có return 0 dưới 100k ko áp dụng, từ 100 tới 200 voucher vận chuyển, trên 200k áp dụng được.
CREATE PROCEDURE PROC_SP_VC
    @masp CHAR(6)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @giaban float;
    SELECT @giaban = GIA FROM SANPHAM WHERE MASP = @masp;

    IF @giaban < 100000
        RETURN 0;
    ELSE
    BEGIN
        IF @giaban >= 100000 AND @giaban <= 200000
            SELECT * FROM VoucherVC

		IF @giaban > 200000
            SELECT  VC.MVCVC , VC.CONGDUNG, VC.GIATRI FROM VoucherVC AS VC
			UNION
			SELECT VS.MVCS, VS.CONGDUNG, VS.GIATRI FROM VoucherShop AS VS, CTSP, SHOP
			WHERE  @masp = CTSP.MASP AND CTSP.MSHOP = SHOP.MSHOP AND SHOP.MSHOP = VS.MSHOP;
    END
END
GO
--thực thi
DECLARE @masp CHAR(6)
SET @masp = 'SP0001'
EXEC PROC_SP_VC @masp
--xóa
DROP PROC PROC_SP_VC
GO


-- Nhập vào giá tiền mà mong muốn, xuất ra danh sách sản phẩm nằm trong khoảng tiền đó, nếu không tồn tại trả về 0

CREATE PROCEDURE PROC_SP_PRICES
    @MinPrice MONEY,
    @MaxPrice MONEY
AS
BEGIN
	IF NOT EXISTS (SELECT GIA FROM SANPHAM WHERE GIA BETWEEN @MinPrice AND @MaxPrice)
		RETURN 0
	ELSE
	BEGIN
		SELECT * FROM SANPHAM
		WHERE GIA BETWEEN @MinPrice AND @MaxPrice
	END
END
GO
---- 2.1. THỰC THI VÀ KIỂM TRA
DECLARE @MinPrice MONEY, @MaxPrice MONEY
SET @MinPrice = 100000
SET @MaxPrice = 200000
EXEC PROC_SP_PRICES @MinPrice, @MaxPrice 

---- 2.2. XÓA
DROP PROC PROC_SP_PRICES
GO 


--Sau khi có giá sản phẩm ban đầu, cập nhật giá sản phẩm sau khi áp dụng voucher shop, giá vận chuyển sau khi áp dụng voucher vận chuyển, tổng tiền hóa đơn cuối cùng.

CREATE PROC update_donhang AS
BEGIN
DECLARE @cur CURSOR
SET @cur = CURSOR FOR SELECT MADH FROM dbo.DONHANG
DECLARE @mdh CHAR(6),@giaspbd MONEY,@vcs CHAR(6),@congdung NVARCHAR(20),@gvc INT,@tien FLOAT,@vcvc CHAR(6),@dvvc CHAR(6),@gt INT
OPEN @cur
FETCH NEXT FROM @cur INTO @mdh
WHILE @@FETCH_STATUS=0
BEGIN
SET @tien=0
SELECT @giaspbd=GiaSPBD,@vcs=VOUCHERSHOP,@vcvc=VOUCHERVC,@dvvc=DVVC FROM dbo.DONHANG WHERE MADH=@mdh
SELECT @gvc=GIA FROM dbo.DVVC WHERE @dvvc=MADV
SELECT @gt=GIATRI FROM dbo.VoucherShop WHERE @vcs=MVCS
DECLARE @tvc FLOAT,@tsp FLOAT
IF @vcs IN (SELECT MVCS FROM dbo.VoucherShop WHERE CONGDUNG LIKE '%k') AND @vcs IS NOT NULL
BEGIN
IF @giaspbd-@gt <0
SET @tsp=0
ELSE SET @tsp=@giaspbd-@gt
END
IF @vcs IN (SELECT MVCS FROM dbo.VoucherShop WHERE CONGDUNG NOT LIKE '%k') AND @vcvc IS NOT NULL
SET @tsp= @giaspbd*(100-@gt)/100
IF @vcs IS NULL SET @tsp=@giaspbd
SET @tien=@tien +@tsp
DECLARE @gti INT
SELECT @gti=GIATRI FROM dbo.VoucherVC WHERE @vcvc=MVCVC
IF @vcvc IN (SELECT MVCVC FROM dbo.VoucherVC WHERE CONGDUNG LIKE N'%đồng') AND @vcvc IS NOT NULL
BEGIN
IF @gvc-@gti < 0
SET @tvc=0
ELSE SET @tvc=@gvc-@gti
END
IF @vcvc  IN (SELECT MVCVC FROM dbo.VoucherVC WHERE CONGDUNG NOT LIKE N'%đồng')AND @vcvc IS NOT NULL
SET @tvc= (@gvc*(100-@gti))/100
IF @vcvc IS NULL SET @tvc=@gvc
SET @tien=@tien+@tvc
UPDATE dbo.DONHANG SET TONGTIEN=@tien WHERE MADH=@mdh
UPDATE dbo.DONHANG SET GIAVCCC=@tvc WHERE MADH=@mdh
UPDATE dbo.DONHANG SET GIASPCC=@tsp WHERE MADH=@mdh
FETCH NEXT FROM @cur INTO @mdh
END
CLOSE @cur
DEALLOCATE @cur
END
GO
-- THỰC THI VÀ KIỂM TRA:
EXEC dbo.update_donhang
SELECT * FROM dbo.DONHANG
-- Xóa:
DROP PROC dbo.update_donhang

-- TẠO USER 
CREATE LOGIN MN WITH PASSWORD = '1234'
CREATE LOGIN SH WITH PASSWORD = '1234'
CREATE LOGIN VC WITH PASSWORD = '1234'
CREATE LOGIN SP WITH PASSWORD = '1234'
CREATE LOGIN KH WITH PASSWORD = '1234'
CREATE LOGIN PL WITH PASSWORD = '1234'
GO
CREATE USER XECO FOR LOGIN VC
CREATE USER SHIP FOR LOGIN SP
CREATE USER KHACH FOR LOGIN KH
CREATE USER QUANLY FOR LOGIN MN
CREATE USER KHACHLA FOR LOGIN PL
CREATE USER CUAHANG FOR LOGIN SH

--ROLE MANAGER
-- MANAGER: dành cho người quản lý với các quyền như:  tạo, sửa và truy vấn dữ liệu trên tất cả các bảng; thêm, xóa và cập nhật dữ liệu cho các bảng SHOP và THANHVIEN
CREATE ROLE MANAGER
GRANT CREATE TABLE, ALTER, SELECT TO MANAGER
GRANT INSERT, DELETE, UPDATE ON SHOP TO MANAGER
GRANT INSERT, DELETE, UPDATE ON THANHVIEN TO MANAGER

--  ROLE SHOP
-- SHOP: dành cho chủ shop với các quyền như: truy vấn dữ liệu trên tất cả các bảng; thêm, xóa và cập nhật dữ liệu cho các bảng VOUCHERSHOP, CTSP, SANPHAM, DVVC, NSX
CREATE ROLE SHOP
GRANT SELECT TO SHOP
GRANT INSERT, DELETE, UPDATE ON NSX TO SHOP
GRANT INSERT, DELETE, UPDATE ON CTSP TO SHOP
GRANT INSERT, DELETE, UPDATE ON SANPHAM TO SHOP
GRANT INSERT, DELETE, UPDATE ON DVVC TO SHOP
GRANT INSERT, DELETE, UPDATE ON VOUCHERSHOP TO SHOP


--ROLE ĐƠN VỊ VẬN CHUYỂN
-- CTYSHIP: dành cho công ty vận chuyển với các quyền như: truy vấn dữ liệu trên tất cả các bảng; thêm, xóa và cập nhật dữ liệu cho các bảng CTVANCHUYEN, NVIENVC, VOUCHERVC
CREATE ROLE CTYSHIP
GRANT SELECT TO CTYSHIP
GRANT INSERT, DELETE, UPDATE ON CTVANCHUYEN TO CTYSHIP
GRANT INSERT, DELETE, UPDATE ON NVIENVC TO CTYSHIP
GRANT INSERT, DELETE, UPDATE ON VOUCHERVC TO CTYSHIP

-- ROLE KHÁCH HÀNG
-- CUSTOMER: dành cho các khách hàng quen thuộc với các quyền như: truy vấn dữ liệu trên tất cả các bảng; thêm, xóa và cập nhật dữ liệu cho các bảng CTDH và DONHANG
CREATE ROLE CUSTOMER
GRANT SELECT TO CUSTOMER
GRANT INSERT, DELETE, UPDATE ON CTDH TO CUSTOMER
GRANT INSERT, DELETE, UPDATE ON DONHANG TO CUSTOMER

--ROLE NHÂN VIÊN VẬN CHUYỂN
--SHIPPER: dành cho nhân viên giao hàng với quyền truy vấn dữ liệu trên tất cả các bảng
CREATE ROLE SHIPPER
GRANT SELECT TO SHIPPER

--QUYỀN CỦA KHÁCH LẠ
-- User KHACHLA bị từ chối tất cả các quyền trên bảng thành viên; chỉ có quyền truy vấn dữ liệu trên các bảng NSX, SHOP và SANPHAM
GRANT SELECT ON NSX TO KHACHLA
GRANT SELECT ON SHOP TO KHACHLA
GRANT SELECT ON SANPHAM TO KHACHLA

--GÁN ROLE CHO USER
 --Gán các role cho user: 
--CUAHANG có role SHOP
--XECO có role CTYSHIP
--SHIP có role SHIPPER
--KHACH có role CUSTOMER
--QUANLY có role MANAGER

EXEC sp_addrolemember 'SHOP', 'CUAHANG'
EXEC sp_addrolemember 'CTYSHIP', 'XECO'
EXEC sp_addrolemember 'SHIPPER', 'SHIP'
EXEC sp_addrolemember 'CUSTOMER', 'KHACH'
EXEC sp_addrolemember 'MANAGER', 'QUANLY'

--Backup: sao lưu thông tin database vào địa chỉ theo đường dẫn “D:\DoAnQuanLyTT.bak” bằng câu lệnh sau :
Backup database DoAnQuanLyTT to disk = 'D:\DoAnQuanLyTT.bak'
--Restore: khôi phục dữ liệu của database từ bản sao lưu đã có trước đó bằng câu lệnh :
Restore database DoAnQuanLyTT from disk = 'D:\DoAnQuanLyTT.bak' with replace

