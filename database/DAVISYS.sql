USE master
-- DROP DATABASE DAVISYS
CREATE DATABASE DAVISYS
go
USE DAVISYS
go

CREATE TABLE LOAIHANG
(
	MALH NVARCHAR(10) NOT NULL PRIMARY KEY,
	TENLH NVARCHAR(50) NOT NULL
)

CREATE TABLE HANG
(
	MAHANG NVARCHAR(10) NOT NULL PRIMARY KEY,
	TENHANG NVARCHAR(50) NOT NULL,
)

CREATE TABLE SANPHAM
(
	MASP NVARCHAR(10) NOT NULL PRIMARY KEY,
	TENSP NVARCHAR(50) NOT NULL,
	MALH NVARCHAR(10) NOT NULL,
	MAHANG NVARCHAR(10) NOT NULL,
	SOLUONG INT NOT NULL,
	GIANHAP FLOAT NOT NULL,
	GIABAN FLOAT NOT NULL,
	NGAYNHAP DATE NOT NULL,
	HINH NVARCHAR(50) NOT NULL,
	MOTA NVARCHAR(100) NOT NULL
)

CREATE TABLE KHACHHANG
(
	MAKH NVARCHAR(10) NOT NULL PRIMARY KEY,
	HOTEN NVARCHAR(50) NOT NULL,
	DIENTHOAI NVARCHAR(20) NOT NULL,
	DIACHI NVARCHAR(50) NOT NULL,
	TICHDIEM INT NOT NULL
)

CREATE TABLE HOADON
(
	MAHD NVARCHAR(10) NOT NULL PRIMARY KEY,
	TENDN NVARCHAR(50) NOT NULL,
	MAKH NVARCHAR(10) NOT NULL,
	MAGH NVARCHAR(20) NOT NULL,
	NGAYLAP DATE NOT NULL,
	TONGTIEN FLOAT NOT NULL,
	PHANTRAMGG INT NOT NULL,
	TRUTIENTICHDIEM FLOAT NOT NULL,
	THANHTIEN FLOAT NOT NULL,
	TRANGTHAI bit 
)

CREATE TABLE CHITIETHOADON
(
	MACTHD NVARCHAR(10) NOT NULL PRIMARY KEY,
	MAHD NVARCHAR(10) NOT NULL,
	MASP NVARCHAR(10) NOT NULL,
	MAHANG NVARCHAR(10) NOT NULL,
	MALH NVARCHAR(10) NOT NULL,
	NGAYLAP DATE NOT NULL,
	TENSP NVARCHAR(50) NOT NULL,
	TENHANG NVARCHAR(50) NOT NULL,
	TENLH NVARCHAR(50) NOT NULL,
	NGAYNHAP DATE NOT NULL,
	GIANHAP FLOAT NOT NULL,
	GIABAN FLOAT NOT NULL,
	SOLUONG INT NOT NULL
)

CREATE TABLE GIOHANG
(
	MAGH NVARCHAR(20) NOT NULL PRIMARY KEY,
	MAKH NVARCHAR(10) NOT NULL,
	TENDN NVARCHAR(50) NOT NULL,

)

CREATE TABLE GIOHANGTAM
(
	MAGH NVARCHAR (20) NOT NULL,
	MASP NVARCHAR(10) NOT NULL,
	SOLUONG INT,
	CONSTRAINT GIOHANGTAM_pk PRIMARY KEY (MAGH, MASP)
)

CREATE TABLE CHUCVU
(
	MACV INT NOT NULL PRIMARY KEY,
	TENCV NVARCHAR(50) NOT NULL,
	MOTA NVARCHAR(100) NOT NULL
)

CREATE TABLE TAIKHOAN
(
	TENDN NVARCHAR(50) NOT NULL PRIMARY KEY,
	MACV INT NOT NULL,
	TENNV NVARCHAR(50) NOT NULL,
	EMAIL NVARCHAR(50) NOT NULL,
	MATKHAU NVARCHAR(50) NOT NULL,
	DIACHI NVARCHAR(50) NOT NULL,
	DIENTHOAI NVARCHAR(50) NOT NULL,
	NGAYSINH DATE NOT NULL,
	GIOITINH BIT NOT NULL,
	TRANGTHAI BIT NOT NULL
)

ALTER TABLE SANPHAM ADD CONSTRAINT FK_SANPHAM_LOAIHANG FOREIGN KEY (MALH) REFERENCES LOAIHANG(MALH);
ALTER TABLE SANPHAM ADD CONSTRAINT FK_SANPHAM_HANG FOREIGN KEY (MAHANG) REFERENCES HANG(MAHANG);


ALTER TABLE CHITIETHOADON ADD CONSTRAINT FK_CTHD_SANPHAM FOREIGN KEY (MASP) REFERENCES SANPHAM(MASP);
ALTER TABLE CHITIETHOADON ADD CONSTRAINT FK_HOADON_CHITIETHOADON FOREIGN KEY (MAHD) REFERENCES HOADON(MAHD);

ALTER TABLE GIOHANGTAM ADD CONSTRAINT FK_GIOHANG_GIOHANGTAM FOREIGN KEY (MAGH) REFERENCES GIOHANG(MAGH);
ALTER TABLE GIOHANG ADD CONSTRAINT FK_GIOHANG_KHACHHANG FOREIGN KEY (MAKH) REFERENCES KHACHHANG(MAKH);
ALTER TABLE GIOHANG ADD CONSTRAINT FK_GIOHANG_TAIKHOAN FOREIGN KEY (TENDN) REFERENCES TAIKHOAN(TENDN);

ALTER TABLE GIOHANGTAM ADD  CONSTRAINT FK_GIOHANG_SANPHAM FOREIGN KEY (MASP) REFERENCES SANPHAM (MASP);

ALTER TABLE HOADON ADD CONSTRAINT FK_HOADON_GIOHANG FOREIGN KEY (MAGH) REFERENCES GIOHANG(MAGH);
ALTER TABLE HOADON ADD CONSTRAINT FK_HOADON_TAIKHOAN FOREIGN KEY (TENDN) REFERENCES TAIKHOAN(TENDN);
ALTER TABLE HOADON ADD CONSTRAINT FK_HOADON_KHACHHANG FOREIGN KEY (MAKH) REFERENCES KHACHHANG(MAKH);

ALTER TABLE TAIKHOAN ADD CONSTRAINT FK_TAIKHOAN_CHUCVU FOREIGN KEY (MACV) REFERENCES CHUCVU(MACV);


INSERT INTO LOAIHANG
VALUES
	(N'TN', N'Tai nghe'),
	(N'SDP', N'Sạc dự phòng'),
	(N'BP', N'Bàn phím'),
	(N'LC', N'Lót chuột'),
	(N'GD', N'Giá đỡ laptop'),
	(N'OL', N'Ốp lưng')

INSERT INTO HANG
VALUES
	(N'SS', N'SAMSUNG'),
	(N'SN', N'SONY'),
	(N'AP', N'APPLE'),
	(N'TSB', N'TOSHIBA'),
	(N'RZ', N'RAZER')


INSERT INTO SANPHAM
VALUES
	(N'SP0001', N'Tai nghe AirPod pro', N'TN', N'AP', 20, 1000000, 1200000, CAST('10-7-2022' AS DATE), 'SP0001', ''),
	(N'SP0002', N'Sạc dự phòng Sony', N'SDP', N'SN', 20, 300000, 400000, CAST('11-7-2020' AS DATE), 'SP0002', ''),
	(N'SP0003', N'Bàn phím RAZER', N'BP', N'RZ', 20, 800000, 1000000, CAST('1-12-2020' AS DATE), 'SP0003', ''),
	(N'SP0005', N'Bàn phím cơ G15', N'BP', N'RZ', 20, 300000, 400000, CAST('11-10-2022' AS DATE), 'SP0005', ''),
	(N'SP0006', N'Bàn phím G16', N'BP', N'RZ', 20, 500000, 550000, CAST('11-10-2022' AS DATE), 'SP0006', ''),
	(N'SP0007', N'Tai nghe P5P', N'TN', N'AP', 20, 100000, 120000, CAST('11-10-2022' AS DATE), 'SP0007', ''),
	(N'SP0008', N'Giá đỡ điện thoại bằng nhôm', N'GD', N'SN', 20, 20000, 50000, CAST('11-10-2022' AS DATE), 'SP0008', ''),
	(N'SP0009', N'Giá đỡ bằng nhựa', N'GD', N'SN', 20, 100000, 120000, CAST('11-10-2022' AS DATE), 'SP0009', ''),
	(N'SP0010', N'Sạc dự phòng 10000mAh', N'SDP', N'SN', 20, 500000, 600000, CAST('11-10-2022' AS DATE), 'SP0010', ''),
	(N'SP0011', N'Tai nghe G3', N'TN', N'AP', 20, 500000, 650000, CAST('11-10-2022' AS DATE), 'SP0011', ''),
	(N'SP0012', N'Ốp lưng SamSung', N'OL', N'SS', 20, 100000, 120000, CAST('11-10-2022' AS DATE), 'SP0012', '')



INSERT INTO CHUCVU
VALUES
	(0, N'Admin', ''),
	(1, N'Quản lí', ''),
	(2, N'Nhân viên', '')

INSERT INTO TAIKHOAN
VALUES
	(N'Admin', 0, N'Trần Văn Nhuộm', 'nhuomtv@fpt.edu.vn', 'admin', N'Vĩnh Long', '0123654987', CAST('9-7-1985' AS DATE), 1, 1),
	(N'DangTH', 1, N'Trần Hữu Đang', 'dangthpc04349@fpt.edu.vn', '123', N'Vĩnh Long', '0123654987', CAST('9-7-2003' AS DATE), 1, 1),
	(N'VinhPQ', 2, N'Phùng Quốc Vinh', 'vinhpqpc04338@fpt.edu.vn', '123', N'Cần Thơ', '0123654987', CAST('11-5-2002' AS DATE), 1, 1),
	(N'DanNK', 2, N'Nguyễn Khánh Đan', 'dannkpc04351@fpt.edu.vn', '123', N'Cần Thơ', '0123654987', CAST('11-7-2003' AS DATE), 0, 1),
	(N'SyDH', 2, N'Đoàn Hiệp Sỹ', 'sydhpc04388@fpt.edu.vn', '123', N'An Giang', '0123654987', CAST('4-7-2003' AS DATE), 1, 1),
	(N'ViLB', 2, N'Lê Bích Vi', 'vilbpc04354@fpt.edu.vn', '123', N'Cà Mau', '0123654987', CAST('6-2-2003' AS DATE), 0, 1)


INSERT INTO KHACHHANG
VALUES
	(N'An', N'Nguyễn Văn An', '0123456781', N'Vĩnh Long', 0),
	(N'DinhPQ', N'Quốc Dinh', '0123456782', N'Cần Thơ', 0),
	(N'Quyen', N'Lâm Tố Quyên', '0123456783', N'Cần Thơ', 0),
	(N'Han', N'Đào Ngọc Hân', '0123456784', N'An Giang', 0),
	(N'Duyen', N'Trần Thị Mỹ Duyên', '0123456785', N'Cà Mau', 0)

INSERT INTO GIOHANG
VALUES
	(N'0123456781', N'An', N'VinhPQ'),
	(N'0123456782', N'DinhPQ', N'VinhPQ'),
	(N'0123456783', N'Quyen', N'DanNK'),
	(N'0123456784', N'Han', N'DanNK'),
	(N'0123456785', N'Duyen', N'SyDH')


INSERT INTO GIOHANGTAM
VALUES
	(N'0123456781', N'SP0002', 1),
	(N'0123456781', N'SP0001', 1),
	(N'0123456782', N'SP0002', 1),
	(N'0123456783', N'SP0001', 1),
	(N'0123456784', N'SP0005', 1),
	(N'0123456785', N'SP0001', 2)

INSERT INTO HOADON
VALUES

	(N'HD01', N'VinhPQ', N'An', N'0123456781', CAST('9-6-2021' AS DATE), 1600000, 0, 0 , 1600000,1),
	(N'HD02', N'VinhPQ', N'DinhPQ', N'0123456782', CAST('9-7-2022' AS DATE), 400000, 0, 0 , 400000,1),
	(N'HD03', N'DanNK', N'Quyen', N'0123456783', CAST('10-7-2022' AS DATE), 1200000, 0, 0 , 1200000,1),
	(N'HD04', N'DanNK', N'Han', N'0123456784', CAST('11-8-2022' AS DATE), 50000, 0, 0 , 50000,1),
	(N'HD05', N'SyDH', N'Duyen', N'0123456785', CAST('11-9-2022' AS DATE), 1200000, 0, 0 , 1200000,1)

INSERT INTO CHITIETHOADON
VALUES
	(N'CTHD01', N'HD01', N'SP0002', 'SN', 'SDP', CAST('9-6-2021' AS DATE), N'Sạc dự phòng Sony', 'SONY', N'Sạc dự phòng', CAST('11-7-2022' AS DATE), 300000, 400000, 1),
	(N'CTHD02', N'HD01', N'SP0001', 'AP', 'TN', CAST('9-6-2021' AS DATE), N'Tai nghe AirPod pro', 'APPLE', N'Tai nghe', CAST('10-7-2022' AS DATE), 1000000, 1200000, 1),
	(N'CTHD03', N'HD02', N'SP0002', 'SN', 'SDP', CAST('9-7-2022' AS DATE), N'Sạc dự phòng Sony', 'SONY', N'Sạc dự phòng', CAST('11-7-2022' AS DATE), 300000, 400000, 1),
	(N'CTHD04', N'HD03', N'SP0001', 'AP', 'TN', CAST('10-7-2022' AS DATE), N'Tai nghe AirPod pro', 'APPLE', N'Tai nghe', CAST('10-7-2022' AS DATE), 1000000, 1200000, 1),
	(N'CTHD05', N'HD04', N'SP0005', 'LC', 'TSB', CAST('11-8-2022' AS DATE), N'Lót chuột in hình tùy chọn', 'TOSHIBA', N'Lót chuột', CAST('10-7-2022' AS DATE), 30000, 50000, 1),
	(N'CTHD06', N'HD05', N'SP0001', 'AP', 'TN', CAST('11-9-2022' AS DATE), N'Tai nghe AirPod pro', 'APPLE', N'Tai nghe', CAST('10-7-2022' AS DATE), 1000000, 1200000, 2)



-- Thống kê nhân viên xuất sắc
GO
CREATE PROC sp_NHANVIENXX
AS
BEGIN
	SELECT
		TK.TENNV,
		COUNT(HD.MAHD) SL
	FROM HOADON HD
		JOIN TAIKHOAN TK ON TK.TENDN = HD.TENDN
		WHERE TK.MACV = '2'
	GROUP BY TK.TENNV
	ORDER BY SL DESC
END
GO


--Thống kê doanh thu theo ngày, tháng, năm
CREATE PROC sp_ThongKeDoanhThu_DMY
	(@Day INT,
	@Month INT,
	@Year INT)
AS
BEGIN
	SELECT
		HD.NGAYLAP,
		SUM(HD.THANHTIEN) TONGTIENHOMNAY
	FROM HOADON HD
	WHERE DAY(NGAYLAP) = @Day AND MONTH(NGAYLAP) = @Month AND YEAR(NGAYLAP) = @Year
	GROUP BY HD.NGAYLAP
END
GO


--Thống kê doanh thu theo tháng, năm
CREATE PROC sp_ThongKeDoanhThu_MY
	(@Month INT,
	@Year INT)
AS
BEGIN
	SELECT
		MONTH(NGAYLAP) THANG,
		SUM(HD.THANHTIEN) TONGTIEN
	FROM HOADON HD
	WHERE MONTH(NGAYLAP) = @Month AND YEAR(NGAYLAP) = @Year
	GROUP BY MONTH(NGAYLAP)
END
GO

--Thống kê doanh thu theo năm
CREATE PROC sp_ThongKeDoanhThu_Y
	(@Year INT)
AS
BEGIN
	SELECT
		YEAR(NGAYLAP) NAM,
		SUM(HD.THANHTIEN) TONGTIEN
	FROM HOADON HD
	WHERE YEAR(NGAYLAP) = @Year
	GROUP BY YEAR(NGAYLAP)
END
GO

--Thống kê doanh thu theo tháng cho biểu đồ cột
CREATE PROC sp_ThongKeDoanhThu_M_BarChart
	(@Year INT)
AS
BEGIN
	SELECT
		MONTH(NGAYLAP) THANG,
		SUM(HD.THANHTIEN) TONGTIEN
	FROM HOADON HD
	WHERE YEAR(NGAYLAP) = @Year
	GROUP BY MONTH(NGAYLAP)
END
GO

--Thống kê doanh thu theo năm cho biểu đồ cột
CREATE PROC sp_ThongKeDoanhThu_Y_BarChart

AS
BEGIN
	SELECT
		YEAR(NGAYLAP) NAM,
		SUM(HD.THANHTIEN) TONGTIEN
	FROM HOADON HD
	GROUP BY YEAR(NGAYLAP)
END
GO


--Thống kê sản phẩm bán chạy theo ngày, tháng, năm
CREATE PROC sp_ThongKeDoanhThu_SP_DMY
	(@Day int,
	@Month int,
	@Year int)
AS
BEGIN
	SELECT
		SP.MASP,
		SP.TENSP,
		COUNT(HD.MAHD) LUOTBAN
	FROM HOADON HD
		JOIN CHITIETHOADON CTHD ON HD.MAHD = CTHD.MAHD
		JOIN SANPHAM SP ON SP.MASP = CTHD.MASP
	WHERE DAY(HD.NGAYLAP) = @Day AND MONTH(HD.NGAYLAP) = @Month AND YEAR(HD.NGAYLAP) = @Year
	GROUP BY SP.MASP, SP.TENSP
	ORDER BY LUOTBAN DESC
END
GO

--Thống kê sản phẩm bán chạy theo tháng, năm
CREATE PROC sp_ThongKeDoanhThu_SP_MY
	(@Month int,
	@Year int)
AS
BEGIN
	SELECT
		SP.MASP,
		SP.TENSP,
		COUNT(HD.MAHD) LUOTBAN
	FROM HOADON HD
		JOIN CHITIETHOADON CTHD ON HD.MAHD = CTHD.MAHD
		JOIN SANPHAM SP ON SP.MASP = CTHD.MASP
	WHERE MONTH(HD.NGAYLAP) = @Month AND YEAR(HD.NGAYLAP) = @Year
	GROUP BY SP.MASP, SP.TENSP
	ORDER BY LUOTBAN DESC
END
GO


--Thống kê sản phẩm bán chạy theo năm
CREATE PROC sp_ThongKeDoanhThu_SP_Y
	(@Year int)
AS
BEGIN
	SELECT
		SP.MASP,
		SP.TENSP,
		COUNT(HD.MAHD) LUOTBAN
	FROM HOADON HD
		JOIN CHITIETHOADON CTHD ON HD.MAHD = CTHD.MAHD
		JOIN SANPHAM SP ON SP.MASP = CTHD.MASP
	WHERE YEAR(HD.NGAYLAP) = @Year
	GROUP BY SP.MASP, SP.TENSP
	ORDER BY LUOTBAN DESC
END
GO

--Thống kê sản phẩm bán chạy theo ngày, tháng, năm giảm dần
CREATE PROC sp_ThongKeDoanhThu_SP_DMY_GD
	(@Day int,
	@Month int,
	@Year int)
AS
BEGIN
	SELECT
		SP.MASP,
		SP.TENSP,
		COUNT(HD.MAHD) LUOTBAN
	FROM HOADON HD
		JOIN CHITIETHOADON CTHD ON HD.MAHD = CTHD.MAHD
		JOIN SANPHAM SP ON SP.MASP = CTHD.MASP
	WHERE DAY(HD.NGAYLAP) = @Day AND MONTH(HD.NGAYLAP) = @Month AND YEAR(HD.NGAYLAP) = @Year
	GROUP BY SP.MASP, SP.TENSP
	ORDER BY LUOTBAN ASC
END
GO

--Thống kê sản phẩm bán chạy theo tháng, năm giảm dần
CREATE PROC sp_ThongKeDoanhThu_SP_MY_GD
	(@Month int,
	@Year int)
AS
BEGIN
	SELECT
		SP.MASP,
		SP.TENSP,
		COUNT(HD.MAHD) LUOTBAN
	FROM HOADON HD
		JOIN CHITIETHOADON CTHD ON HD.MAHD = CTHD.MAHD
		JOIN SANPHAM SP ON SP.MASP = CTHD.MASP
	WHERE MONTH(HD.NGAYLAP) = @Month AND YEAR(HD.NGAYLAP) = @Year
	GROUP BY SP.MASP, SP.TENSP
	ORDER BY LUOTBAN ASC
END
GO

--Thống kê sản phẩm bán chạy theo năm giảm dần
CREATE PROC sp_ThongKeDoanhThu_SP_Y_GD
	(@Year int)
AS
BEGIN
	SELECT
		SP.MASP,
		SP.TENSP,
		COUNT(HD.MAHD) LUOTBAN
	FROM HOADON HD
		JOIN CHITIETHOADON CTHD ON HD.MAHD = CTHD.MAHD
		JOIN SANPHAM SP ON SP.MASP = CTHD.MASP
	WHERE YEAR(HD.NGAYLAP) = @Year
	GROUP BY SP.MASP, SP.TENSP
	ORDER BY LUOTBAN ASC
END
GO

--Thống kê sản phẩm theo loại
CREATE PROC sp_ThongKeDoanhThu_SPLOAI_Y
	(@Year int)
AS
BEGIN
	SELECT
		LH.TENLH,
		COUNT(HD.MAHD) LUOTBAN
	FROM HOADON HD
		JOIN CHITIETHOADON CTHD ON HD.MAHD = CTHD.MAHD
		JOIN SANPHAM SP ON SP.MASP = CTHD.MASP
		JOIN LOAIHANG LH ON LH.MALH = SP.MALH
	WHERE YEAR(HD.NGAYLAP) = @Year
	GROUP BY LH.TENLH
	ORDER BY LUOTBAN DESC
END
GO


