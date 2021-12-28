use master
go
if DB_ID('QLTinTuc') is not null
	drop database QLTinTuc

go
create database QLTinTuc
go
use QLTinTuc
go

Create table LoaiTinTuc(
	Id_LoaiTinTuc int primary key identity,
	Ten_LoaiTinTuc nvarchar(50) not null,
	MoTa_LoaiTinTuc nvarchar(100)
	)
	go
	insert into LoaiTinTuc(Ten_LoaiTinTuc,MoTa_LoaiTinTuc)
	values(N'Thời sự',N' Tin tức thời sự ngày nay')
	insert into LoaiTinTuc(Ten_LoaiTinTuc,MoTa_LoaiTinTuc)
	values(N'Giáo dục',N'Thông tin về giáo dục, học tập')
	insert into LoaiTinTuc(Ten_LoaiTinTuc,MoTa_LoaiTinTuc)
	values(N'Đời sống',N'Cuộc sống- mẹo vặt- Hướng dẫn')
	go
create table TacGia(
	Id_Tac_Gia int primary key identity,
	Ten_Tac_Gia nvarchar(50),
	Email nvarchar(30),
	Chucvu nvarchar(50),
	Avatar nvarchar(100),
	Username nvarchar(30),
	Passwork nvarchar(30)
	)
	Insert into TacGia(Ten_Tac_Gia,Email,Chucvu,Avatar,Username,Passwork)
	values(N'Nguyễn Hữu Dũng','huudungpt@gmail.com',N'Quản lý','avatar.png','nguyenhuudung','1')
	Insert into TacGia(Ten_Tac_Gia,Email,Chucvu,Avatar,Username,Passwork)
	values(N'Hứa Văn Duy','huaduy@gmail.com',N'Tác giả','avatar1.png','huavanduy','1')

go
create table TinTuc(
	Id_TinTuc int primary key identity,
	Id_LoaiTinTuc int not null,
	Ngay_Dang date not null,
	Tieu_De nvarchar(500),
	Noi_Dung nvarchar(2000),
	img nvarchar(100),
	Ngay_Cap_Nhat date,
	Trang_Thai nvarchar(50),
	Id_Tac_Gia int,
	constraint fk_loaitintuc foreign key (Id_LoaiTinTuc) references LoaiTinTuc(Id_LoaiTinTuc),
	constraint fk_tacgia foreign key (Id_Tac_Gia) references TacGia(Id_Tac_Gia)
	)
go
Insert into TinTuc(Id_LoaiTinTuc,Ngay_Dang,Tieu_De,Noi_Dung,img,Trang_Thai,Id_Tac_Gia)
values(1,'12/12/2021',N'Biển Đông sắp đón bão, có thể đổ bộ miền Trung vào cuối năm',N'Dự báo cuối tuần tới áp thấp nhiệt đới sẽ mạnh lên thành bão ảnh hưởng trực tiếp đến đất liền các tỉnh Trung Trung Bộ và Nam Trung Bộ nước ta.

Ông Mai Văn Khiêm, Giám đốc Trung tâm Dự báo Khí tượng thủy văn quốc gia trưa nay cho biết, ngày 12/12, trên vùng biển Tây Bắc Thái Bình Dương xuất hiện một cơn áp thấp nhiệt đới. Hồi 10 giờ, vị trí tâm áp thấp nhiệt đới ở khoảng 5,0 độ Vĩ Bắc, 145,0 độ Kinh Đông, cách bờ biển phía Nam Philippines khoảng 2000km về phía Đông.

Trung tâm Dự báo khí tượng thủy văn quốc gia dự báo, trong 1-2 ngày tới, áp dụng thấp nhiệt đới có khả năng mạnh lên thành bão. Khoảng ngày 16-17/12, bão có cường độ mạnh, đi vào vùng biển phía Nam Biển Đông và trở thành bão số 9 trong năm 2021, ảnh hưởng đến khu vực giữa và Nam Biển Đông (bao gồm vùng biển quần đảo Trường Sa).

Khoảng ngày 19-20/12, bão có khả năng ảnh hưởng trực tiếp đến đất liền các tỉnh Trung Trung Bộ và Nam Trung Bộ.','bao.jpg',N'Đã duyệt',1),(2,'12/12/2021',N'Cụ ông gọi nồi lẩu rồi ngồi đợi 3 tiếng không đụng đũa, phía sau là chuyện xúc động',N'Chị Trần chủ cửa hàng ăn (Hồ Bắc, Trung Quốc) cho biết, vào ngày 4/12 vừa qua, có một cụ ông khoảng 70 tuổi vào quán gọi một nồi lẩu. Cụ ông đã đến quán nhiều lần nhưng chỉ gọi cơm. Hôm đó là đặc biệt.

Thấy ông ăn mặc giản dị, có vẻ không có nhiều tiền nên chị Trần  chuẩn bị cho ông một suất lẩu 20 tệ (hơn 70 nghìn đồng). Tuy nhiên, ông yêu cầu chị làm một nồi lẩu thịnh soạn, nhiều món hơn và đắt hơn. Ông còn mua thêm một bình rượu và nói với chị việc mình muốn mời khách.','chuyenla.jpg',N'Đã duyệt',2)
go
create table NguoiDung(
	Id_NguoiDung int primary key identity,
	Ten_NguoiDung nvarchar(100),
	Email nvarchar(30),
	Avatar nvarchar(100),
	Username nvarchar(30),
	Passwork nvarchar(30)
	)
insert into NguoiDung		  
values('Nguyễn Hữu Tuấn','tuan@gmail.com',N'avatar2.png','nguyenhuudung','1')
insert into NguoiDung
values('Hứa Văn Đức','Duc@gmail.com',N'avatar3.png','huavanduy','1')

create table BinhLuan(
	Id_Binh_Luan int primary key identity,
	Noi_Dung_BL nvarchar(500),
	Ngay_Binh_Luan date,
	Id_TinTuc int,
	Id_NguoiDung int,
	constraint fk_tintuc foreign key (Id_TinTuc) references TinTuc(Id_TinTuc),
	constraint fk_nguoidung foreign key(Id_NguoiDung) references NguoiDung(Id_NguoiDung)
	)
