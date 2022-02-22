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
	values(N'Chính trị',N' Tin tức chính trị')
	insert into LoaiTinTuc(Ten_LoaiTinTuc,MoTa_LoaiTinTuc)
	values(N'Kinh tế',N'Thông tin về kinh tế')
	insert into LoaiTinTuc(Ten_LoaiTinTuc,MoTa_LoaiTinTuc)
	values(N'Xã hội',N'Thông tin về xã hội')
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
	values(N'Nguyễn Hữu Dũng','huudungpt@gmail.com',N'Quản lý','huudung.jpg','nguyenhuudung','1')
	Insert into TacGia(Ten_Tac_Gia,Email,Chucvu,Avatar,Username,Passwork)
	values(N'Hứa Văn Duy','huaduy@gmail.com',N'Tác giả','vanduy.jpg','huavanduy','1')
	Insert into TacGia(Ten_Tac_Gia,Email,Chucvu,Avatar,Username,Passwork)
	values(N'Nguyễn Văn Tuấn','tuannguyen@gmail.com',N'Tác giả','avatar2.png','nguyenvantuan','1')
	Insert into TacGia(Ten_Tac_Gia,Email,Chucvu,Avatar,Username,Passwork)
	values(N'Trương Ngọc Hoàng','ngochoang@gmail.com',N'Tác giả','avatar3.png','ngochoang','1')
	Insert into TacGia(Ten_Tac_Gia,Email,Chucvu,Avatar,Username,Passwork)
	values(N'Nguyễn Tiến Dũng','tiendung@gmail.com',N'Tác giả','avatar4.png','nguyentiendung','1')

go
create table TinTuc(
	Id_TinTuc int primary key identity,
	Id_LoaiTinTuc int not null,
	Ngay_Dang date not null,
	Tieu_De nvarchar(500),
	Noi_Dung nvarchar(MAX),
	img nvarchar(100),
	Ngay_Cap_Nhat date,
	Trang_Thai nvarchar(50),
	Id_Tac_Gia int,
	constraint fk_loaitintuc foreign key (Id_LoaiTinTuc) references LoaiTinTuc(Id_LoaiTinTuc),
	constraint fk_tacgia foreign key (Id_Tac_Gia) references TacGia(Id_Tac_Gia)
	)
go
Insert into TinTuc(Id_LoaiTinTuc,Ngay_Dang,Tieu_De,Noi_Dung,img,Trang_Thai,Id_Tac_Gia)
values(1,'09/12/2021',N'Quốc hội thảo luận về tình hình kinh tế - xã hội và phòng chống COVID-19',N'<p>H&ocirc;m nay (8/11),&nbsp;<a href="https://vtv.vn/quoc-hoi.html" target="_blank" title="Quốc hội">Quốc hội</a>&nbsp;kh&oacute;a XV bắt đầu đợt 2 của kỳ họp thứ 2 theo h&igrave;nh thức họp tập trung tại nh&agrave; Quốc hội.</p>

<p>Quốc hội d&agrave;nh to&agrave;n bộ thời gian l&agrave;m việc của ng&agrave;y 8/11 để thảo luận ở hội trường về:</p>

<p>+ Kết quả thực hiện kế hoạch ph&aacute;t triển kinh tế - x&atilde; hội năm 2021; dự kiến kế hoạch ph&aacute;t triển kinh tế - x&atilde; hội năm 2022.</p>

<p>+ B&aacute;o c&aacute;o về c&ocirc;ng t&aacute;c ph&ograve;ng, chống dịch&nbsp;<a href="https://vtv.vn/covid-19.html" target="_blank" title="COVID-19">COVID-19</a>&nbsp;v&agrave; t&igrave;nh h&igrave;nh thực hiện Nghị quyết số 30/2021/QH15 về kỳ họp thứ nhất, Quốc hội kh&oacute;a XV.</p>

<p>+ T&igrave;nh h&igrave;nh thực hiện ng&acirc;n s&aacute;ch nh&agrave; nước năm 2021, dự to&aacute;n ng&acirc;n s&aacute;ch nh&agrave; nước, phương &aacute;n ph&acirc;n bổ ng&acirc;n s&aacute;ch trung ương năm 2022 v&agrave; Kế hoạch t&agrave;i ch&iacute;nh - ng&acirc;n s&aacute;ch nh&agrave; nước 03 năm 2022-2024 (trong đ&oacute; c&oacute; việc bổ sung dự to&aacute;n thu, chi vốn viện trợ nước ngo&agrave;i năm 2021 của tỉnh Quảng Nam; l&ugrave;i thời điểm cải c&aacute;ch ch&iacute;nh s&aacute;ch tiền lương).</p>

<p>Trong phi&ecirc;n thảo luận, c&aacute;c th&agrave;nh vi&ecirc;n Ch&iacute;nh phủ sẽ ph&aacute;t biểu giải tr&igrave;nh, l&agrave;m r&otilde; một số vấn đề đại biểu Quốc hội n&ecirc;u.</p>

<p><strong>Đ&agrave;i THVN sẽ&nbsp;<a href="https://vtv.vn/truyen-hinh-truc-tiep.html" rel="nofollow" target="_blank" title="truyền hình trực tiếp">truyền h&igrave;nh trực tiếp</a>&nbsp;phi&ecirc;n thảo luận của Quốc hội từ 8h00 - 11h30 v&agrave; 14h00 - 17h00 ng&agrave;y 8/11 tr&ecirc;n k&ecirc;nh VTV1.</strong></p>

<p>Trước đ&oacute;, tại phi&ecirc;n khai mạc kỳ họp thứ 2,&nbsp;<a href="https://vtv.vn/thu-tuong.html" rel="nofollow" target="_blank" title="Thủ tướng">Thủ tướng</a>&nbsp;Ch&iacute;nh phủ Phạm Minh Ch&iacute;nh đ&atilde; tr&igrave;nh b&agrave;y B&aacute;o c&aacute;o kết quả thực hiện kế hoạch ph&aacute;t triển kinh tế - x&atilde; hội năm 2021; dự kiến kế hoạch ph&aacute;t triển kinh tế - x&atilde; hội năm 2022.</p>

<p><img alt="Ngày 8/11, Quốc hội thảo luận về tình hình kinh tế - xã hội và phòng chống COVID-19 - Ảnh 1." id="img_8349ab40-3fb0-11ec-bdb9-75115fdb75d0" src="https://vtv1.mediacdn.vn/2021/11/7/photo-1-16362787857821125467549.jpg" title="Ngày 8/11, Quốc hội thảo luận về tình hình kinh tế - xã hội và phòng chống COVID-19 - Ảnh 1." /></p>

<p>Thủ tướng b&aacute;o c&aacute;o thực hiện kế hoạch ph&aacute;t triển kinh tế - x&atilde; hội năm 2021; dự kiến kế hoạch ph&aacute;t triển kinh tế - x&atilde; hội năm 2022</p>

<p>Thủ tướng nhấn mạnh, năm 2021 diễn ra nhiều sự kiện trọng đại của đất nước; l&agrave; năm đầu thực hiện Nghị quyết Đại hội lần thứ XIII của Đảng, Chiến lược ph&aacute;t triển KTXH 10 năm 2021 - 2030 v&agrave; c&aacute;c kế hoạch 5 năm 2021 - 2025 trong bối cảnh đất nước gặp những kh&oacute; khăn, th&aacute;ch thức mới gay gắt hơn. Do tiếp tục xuất hiện c&aacute;c đợt dịch&nbsp;<a href="https://vtv.vn/covid-19.html" rel="nofollow" target="_blank" title="COVID-19">COVID-19</a>&nbsp;với những biến chủng mới, kinh tế thế giới c&ograve;n nhiều bất định v&agrave; tăng trưởng kh&ocirc;ng vững chắc; c&aacute;c nước trong khu vực Đ&ocirc;ng Nam &Aacute; bị ảnh hưởng nặng nề<a href="https://vtv.vn/DefaultV2.aspx#_ftn1" name="_ftnref1" rel="nofollow" target="_blank" title="">&nbsp;</a>, lại x&acirc;m nhập s&acirc;u v&agrave;o c&aacute;c trung t&acirc;m kinh tế, đ&ocirc; thị lớn... buộc ch&uacute;ng ta phải &aacute;p dụng nhiều biện ph&aacute;p ph&ograve;ng, chống dịch chưa c&oacute; tiền lệ, mạnh mẽ, quyết liệt hơn để thực hiện mục ti&ecirc;u ưu ti&ecirc;n trước hết, tr&ecirc;n hết l&agrave; bảo vệ sức khỏe, t&iacute;nh mạng của Nh&acirc;n d&acirc;n; từ đ&oacute; ảnh hưởng nghi&ecirc;m trọng đến sản xuất kinh doanh, sinh kế v&agrave; đời sống nh&acirc;n d&acirc;n.</p>

<p>Trong bối cảnh đ&oacute;, dưới sự l&atilde;nh đạo thống nhất của Trung ương Đảng, trực tiếp, thường xuy&ecirc;n l&agrave; Bộ Ch&iacute;nh trị, Ban B&iacute; thư; sự kịp thời ban h&agrave;nh những quyết s&aacute;ch đặc th&ugrave; phục vụ ph&ograve;ng, chống dịch, ph&aacute;t triển KTXH, bảo đảm an sinh x&atilde; hội v&agrave; gi&aacute;m s&aacute;t hiệu quả của Quốc hội, Ủy ban thường vụ Quốc hội; sự chỉ đạo, điều h&agrave;nh quyết liệt của Ch&iacute;nh phủ, c&aacute;c cấp, c&aacute;c ng&agrave;nh, c&aacute;c địa phương v&agrave; sự đồng t&igrave;nh, ủng hộ, chia sẻ, tham gia t&iacute;ch cực của c&aacute;c tầng lớp nh&acirc;n d&acirc;n, cộng đồng doanh nghiệp, ch&uacute;ng ta đ&atilde; đạt được nhiều kết quả quan trọng, rất đ&aacute;ng kh&iacute;ch lệ trong to&agrave;n hệ thống v&agrave; tr&ecirc;n c&aacute;c lĩnh vực.</p>

<p>B&aacute;o c&aacute;o về KTXH v&agrave; về c&ocirc;ng t&aacute;c ph&ograve;ng, chống dịch COVID-19 của Ch&iacute;nh phủ cũng n&ecirc;u một số những tồn tại, hạn chế tr&ecirc;n c&aacute;c lĩnh vực. Theo đ&oacute;, c&ocirc;ng t&aacute;c ph&ograve;ng, chống dịch c&oacute; l&uacute;c, c&oacute; nơi c&ograve;n bị động, l&uacute;ng t&uacute;ng trong l&atilde;nh đạo, chỉ đạo v&agrave; tổ chức thực hiện, nhất l&agrave; giai đoạn đầu khi dịch b&ugrave;ng ph&aacute;t mạnh ở TP Hồ Ch&iacute; Minh v&agrave; một số tỉnh ph&iacute;a Nam do biến chủng Delta l&acirc;y lan nhanh, hết sức nguy hiểm, kh&oacute; lường; vẫn c&ograve;n thiếu nhất qu&aacute;n trong triển khai c&aacute;c biện ph&aacute;p ph&ograve;ng, chống dịch, nhất l&agrave; trong thực hiện y&ecirc;u cầu gi&atilde;n c&aacute;ch x&atilde; hội tại cơ sở; việc thực hiện c&aacute;c quy định về đi lại của người d&acirc;n, lưu th&ocirc;ng h&agrave;ng h&oacute;a thiếu thống nhất giữa c&aacute;c địa phương, g&acirc;y &aacute;ch tắc, phiền h&agrave; cục bộ cho Nh&acirc;n d&acirc;n.</p>

<p>Trong những th&aacute;ng cuối năm 2021, Ch&iacute;nh phủ x&aacute;c định tập trung nỗ lực cao nhất cho ph&ograve;ng, chống dịch COVID-19; khẩn trương x&acirc;y dựng v&agrave; tổ chức thực hiện c&aacute;c phương &aacute;n, kịch bản cụ thể, s&aacute;t hợp với t&igrave;nh h&igrave;nh thực tế; quyết liệt h&agrave;nh động, triển khai thực hiện hiệu quả, đồng bộ c&aacute;c nhiệm vụ, giải ph&aacute;p đề ra theo phương ch&acirc;m nhạy b&eacute;n, linh hoạt, s&aacute;ng tạo, b&igrave;nh tĩnh, kịp thời với mục ti&ecirc;u xuy&ecirc;n suốt l&agrave; bảo vệ sức khỏe, t&iacute;nh mạng của nh&acirc;n d&acirc;n l&agrave; tr&ecirc;n hết, trước hết; th&uacute;c đẩy viện trợ, nhập khẩu vaccine, nghi&ecirc;n cứu chuyển giao c&ocirc;ng nghệ v&agrave; sản xuất trong nước, đẩy nhanh tiến độ bao phủ ti&ecirc;m vaccine, chuẩn bị thuốc điều trị cần thiết, n&acirc;ng cao năng lực y tế, nhất l&agrave; c&ocirc;ng t&aacute;c điều trị v&agrave; ở cơ sở; c&oacute; lộ tr&igrave;nh th&iacute;ch ứng an to&agrave;n, linh hoạt, phấn đấu kiểm so&aacute;t hiệu quả dịch bệnh tr&ecirc;n phạm vi to&agrave;n quốc để tập trung khắc phục hậu quả của dịch bệnh v&agrave; kh&ocirc;i phục, ph&aacute;t triển kinh tế-x&atilde; hội.</p>

<p>Về kế hoạch ph&aacute;t triển kinh tế - x&atilde; hội năm 2022, dự kiến sẽ c&oacute; 16 chỉ ti&ecirc;u chủ yếu về c&aacute;c lĩnh vực kinh tế, x&atilde; hội, m&ocirc;i trường. Trong đ&oacute; tốc độ tăng tổng sản phẩm trong nước (GDP) đạt khoảng 6 - 6,5%; tốc độ tăng chỉ số gi&aacute; ti&ecirc;u d&ugrave;ng (CPI) b&igrave;nh qu&acirc;n khoảng 4%; bội chi ng&acirc;n s&aacute;ch Nh&agrave; nước so với GDP khoảng 4%...</p>

<p>Thảo luận tại Tổ đại biểu Quốc hội về B&aacute;o c&aacute;o n&ecirc;u tr&ecirc;n của Ch&iacute;nh phủ, &yacute; kiến của nhiều đại biểu khẳng định mặc d&ugrave; dịch bệnh diễn biến phức tạp, nhưng nhờ sự v&agrave;o cuộc quyết liệt của cả hệ thống ch&iacute;nh trị, sự nỗ lực, quyết t&acirc;m cao v&agrave; phối hợp chặt chẽ của c&aacute;c cấp, c&aacute;c ng&agrave;nh, c&aacute;c địa phương, đặc biệt l&agrave; c&aacute;c lực lượng tuyến đầu chống dịch, sự đo&agrave;n kết, đồng t&igrave;nh ủng hộ, tham gia t&iacute;ch cực của c&aacute;c tầng lớp nh&acirc;n d&acirc;n, cộng đồng doanh nghiệp... c&ocirc;ng t&aacute;c ph&ograve;ng, chống dịch ng&agrave;y c&agrave;ng chuyển biến t&iacute;ch cực, hiệu quả hơn. Đến nay nước ta đ&atilde; cơ bản kiểm so&aacute;t được dịch bệnh. Nhiều hoạt động kinh tế-x&atilde; hội bắt đầu duy tr&igrave; đ&agrave; phục hồi, cả nước đang dần bước sang trạng th&aacute;i b&igrave;nh thường mới.</p>
','Quochoi.jpg',N'Chưa duyệt',2);
Insert into TinTuc(Id_LoaiTinTuc,Ngay_Dang,Tieu_De,Noi_Dung,img,Trang_Thai,Id_Tac_Gia)
values(1,'09/12/2021',N'Nâng cao hơn nữa hiệu quả đấu tranh phòng, chống tội phạm và vi phạm pháp luật',N'<p>Theo đ&oacute;, trong năm 2022, ng&agrave;nh kiểm s&aacute;t phải n&acirc;ng cao hơn nữa hiệu quả đấu tranh ph&ograve;ng, chống tội phạm v&agrave; vi phạm ph&aacute;p luật, đặc biệt l&agrave; tội phạm về tham nhũng v&agrave; kinh tế.</p>

<p>B&ecirc;n cạnh đ&oacute;, ng&agrave;nh kiểm s&aacute;t cần tiếp tục thực h&agrave;nh tốt&nbsp;<a href="https://vtv.vn/thuc-hanh-quyen-cong-to.html" target="_blank" title="thực hành quyền công tố ">quyền c&ocirc;ng tố</a>&nbsp;v&agrave; kiểm s&aacute;t c&aacute;c hoạt động x&eacute;t xử. Kể từ năm nay, thực hiện Luật sửa đổi, bổ sung một số điều của Bộ luật Tố tụng h&igrave;nh sự, Viện kiểm s&aacute;t c&aacute;c cấp đ&atilde; trực tiếp tham gia kiểm s&aacute;t c&aacute;c kh&acirc;u của hoạt động tố tụng h&igrave;nh sự, từ tiếp nhận, giải quyết nguồn tin về tội phạm, đến khởi tố vụ &aacute;n, quyết định tạm giữ, tạm giam bị can v&agrave; tham gia trực tiếp lấy lời khai đối với người bị tạm giữ.</p>

<p><img alt="Nâng cao hơn nữa hiệu quả đấu tranh phòng, chống tội phạm và vi phạm pháp luật - Ảnh 1." id="img_94bbd070-6a2a-11ec-8b81-677a15437bbb" src="https://vtv1.mediacdn.vn/thumb_w/640/2021/12/31/vnapotalchutichnuocnguyenxuanphucduhoinghitrienkhaicongtacnganhkiemsatnhandannam20225848594-16409491637501634173334.jpg" title="Nâng cao hơn nữa hiệu quả đấu tranh phòng, chống tội phạm và vi phạm pháp luật - Ảnh 1." /></p>

<p>Chủ tịch nước Nguyễn Xu&acirc;n Ph&uacute;c ph&aacute;t biểu chỉ đạo. Ảnh: Thống Nhất &ndash; TTXVN</p>

<p>Ngo&agrave;i ra, Viện kiểm s&aacute;t nh&acirc;n d&acirc;n tối cao đ&atilde; phối hợp tốt với c&aacute;c cơ quan tố tụng đẩy nhanh giải quyết c&aacute;c vụ việc, vụ &aacute;n về tham nhũng, thu hồi được hơn 15.000 tỷ đồng v&agrave; tham dự phi&ecirc;n điều trần trực tuyến của T&ograve;a &aacute;n Singapore y&ecirc;u cầu tương trợ tư ph&aacute;p để thu hồi hơn 2,7 tỷ USD trong&nbsp;<a href="https://vtv.vn/vu-an-phan-sao-nam.html" target="_blank" title="vụ án phan sào nam">vụ &aacute;n Phan S&agrave;o Nam</a>.</p>

<p>Tuy nhi&ecirc;n,&nbsp;<a href="https://vtv.vn/chu-tich-nuoc-nguyen-xuan-phuc.html" target="_blank" title="chủ tịch nước nguyễn xuân phúc">Chủ tịch nước Nguyễn Xu&acirc;n Ph&uacute;c</a>&nbsp;đề nghị ng&agrave;nh kiểm s&aacute;t phải ki&ecirc;n quyết chấn chỉnh, sớm khắc phục những hạn chế, thiếu s&oacute;t trong thực h&agrave;nh quyền c&ocirc;ng tố v&agrave; kiểm s&aacute;t c&aacute;c hoạt động tư ph&aacute;p, c&ugrave;ng với n&acirc;ng cao chất lượng tranh tụng của kiểm s&aacute;t vi&ecirc;n tại một số phi&ecirc;n t&ograve;a.</p>

<p><img alt="Nâng cao hơn nữa hiệu quả đấu tranh phòng, chống tội phạm và vi phạm pháp luật - Ảnh 2." id="img_94ce1ff0-6a2a-11ec-9f45-dd0db7c55223" src="https://vtv1.mediacdn.vn/thumb_w/640/2021/12/31/vnapotalchutichnuocnguyenxuanphucduhoinghitrienkhaicongtacnganhkiemsatnhandannam20225848928-1640949163752677018103.jpg" title="Nâng cao hơn nữa hiệu quả đấu tranh phòng, chống tội phạm và vi phạm pháp luật - Ảnh 2." /></p>

<p>Chủ tịch nước Nguyễn Xu&acirc;n Ph&uacute;c trao tặng Hu&acirc;n chương qu&acirc;n c&ocirc;ng Hạng Nh&igrave; cho Viện Kiểm s&aacute;t qu&acirc;n sự Trung ương. Ảnh: Thống Nhất &ndash; TTXVN</p>

<p>Đặc biệt l&agrave; to&agrave;n ng&agrave;nh phải tiếp tục qu&aacute;n triệt v&agrave; thực hiện c&oacute; hiệu quả Nghị quyết của Đảng về x&acirc;y dựng nền tư ph&aacute;p chuy&ecirc;n nghiệp, hiện đại, c&ocirc;ng bằng, nghi&ecirc;m minh, li&ecirc;m ch&iacute;nh phụng sự Tổ quốc, phục vụ nh&acirc;n d&acirc;n.</p>

<p>Chủ tịch nước cũng đề nghị Viện kiểm s&aacute;t nh&acirc;n d&acirc;n tối cao khẩn trương chuẩn bị c&oacute; chất lượng v&agrave; đ&uacute;ng thời hạn c&aacute;c chuy&ecirc;n đề m&agrave; Ban chỉ đạo x&acirc;y dựng Đề &aacute;n Chiến lược x&acirc;y dựng v&agrave; ho&agrave;n thiện Nh&agrave; nước ph&aacute;p quyền x&atilde; hội chủ nghĩa Việt Nam đ&atilde; giao cho Viện Kiểm s&aacute;t nh&acirc;n d&acirc;n tối cao chủ tr&igrave;, để Ban chỉ đạo kịp tr&igrave;nh Ban Chấp h&agrave;nh Trung ương Đề &aacute;n n&agrave;y v&agrave;o cuối năm 2022.</p>

<p>Nh&acirc;n dịp n&agrave;y, Chủ tịch nước Nguyễn Xu&acirc;n Ph&uacute;c đ&atilde; trao Hu&acirc;n chương qu&acirc;n c&ocirc;ng hạng Nh&igrave; tặng Viện kiểm s&aacute;t qu&acirc;n sự Trung ương.</p>
','phongchongtoipham.jpeg',N'Chưa duyệt',1)
Insert into TinTuc(Id_LoaiTinTuc,Ngay_Dang,Tieu_De,Noi_Dung,img,Trang_Thai,Id_Tac_Gia)
values(1,'10/12/2021',N'Yêu cầu Trung Quốc rút tàu cá, tôn trọng chủ quyền của Việt Nam',N'<p>Tại cuộc họp b&aacute;o thường kỳ của Bộ Ngoại giao ng&agrave;y 4/11, trả lời c&acirc;u hỏi về phản ứng của Việt Nam trước việc nhiều t&agrave;u&nbsp;<a href="https://vtv.vn/trung-quoc.html" target="_blank" title="Trung Quốc">Trung Quốc</a>&nbsp;hoạt động tại B&atilde;i Ba Đầu,&nbsp;<a href="https://vtv.vn/quan-dao-truong-sa.html" target="_blank" title="quần đảo Trường Sa">quần đảo Trường Sa</a>&nbsp;của Việt Nam, Ph&oacute; Ph&aacute;t ng&ocirc;n Bộ Ngoại giao Phạm Thu Hằng khẳng định:</p>

<p>Như đ&atilde; nhiều lần khẳng định, Việt Nam c&oacute; đầy đủ cơ sở ph&aacute;p l&yacute; v&agrave; chứng cứ lịch sử để khẳng định chủ quyền đối với quần đảo Trường Sa ph&ugrave; hợp với luật ph&aacute;p quốc tế; được hưởng chủ quyền, quyền chủ quyền v&agrave; quyền t&agrave;i ph&aacute;n đối với c&aacute;c v&ugrave;ng biển của m&igrave;nh x&aacute;c lập ph&ugrave; hợp với C&ocirc;ng ước của Li&ecirc;n hợp quốc về Luật biển năm 1982. Việt Nam ki&ecirc;n quyết, ki&ecirc;n tr&igrave; thực hiện c&aacute;c biện ph&aacute;p ph&ugrave; hợp với luật ph&aacute;p quốc tế để bảo vệ c&aacute;c quyền hợp ph&aacute;p v&agrave; ch&iacute;nh đ&aacute;ng đ&oacute;.</p>

<p>Việc c&aacute;c t&agrave;u Trung Quốc hoạt động trong phạm vi l&atilde;nh hải của Sinh Tồn Đ&ocirc;ng thuộc quần đảo Trường Sa của Việt Nam đ&atilde; x&acirc;m phạm nghi&ecirc;m trọng chủ quyền của Việt Nam, vi phạm c&aacute;c quy định của C&ocirc;ng ước của Li&ecirc;n hợp quốc về Luật Biển năm 1982, đi ngược lại tinh thần v&agrave; nội dung của Tuy&ecirc;n bố của c&aacute;c b&ecirc;n ở Biển Đ&ocirc;ng (DOC).</p>

<p>Việt Nam y&ecirc;u cầu Trung Quốc r&uacute;t t&agrave;u c&aacute; khỏi khu vực n&oacute;i tr&ecirc;n v&agrave; t&ocirc;n trọng chủ quyền của Việt Nam; thiện ch&iacute; thực hiện C&ocirc;ng ước của Li&ecirc;n hợp quốc về Luật Biển năm 1982; nghi&ecirc;m chỉnh tu&acirc;n thủ Tuy&ecirc;n bố của c&aacute;c b&ecirc;n ở Biển Đ&ocirc;ng (DOC); tạo m&ocirc;i trường thuận lợi cho việc đạt được Bộ Quy tắc ứng xử ở Biển Đ&ocirc;ng (COC) giữa ASEAN v&agrave; Trung Quốc; đ&oacute;ng g&oacute;p v&agrave;o việc duy tr&igrave; h&ograve;a b&igrave;nh, an ninh, ổn định v&agrave; trật tự ph&aacute;p l&yacute; tr&ecirc;n biển tại khu vực.</p>
','chuquyenbiendao.jpg',N'Chưa duyệt',2)
Insert into TinTuc(Id_LoaiTinTuc,Ngay_Dang,Tieu_De,Noi_Dung,img,Trang_Thai,Id_Tac_Gia)
values(1,'11/12/2021',N'Kỳ họp thứ 2 HĐND Thành phố Hà Nội tổ chức kết hợp trực tiếp và trực tuyến trong hai ngày 22 - 23/9',N'<p><a href="https://vtv.vn/hdnd-thanh-pho-ha-noi.html" target="_blank" title="hđnd thành phố hà nội">HĐND Th&agrave;nh phố H&agrave; Nội</a>&nbsp;vừa ban h&agrave;nh Th&ocirc;ng b&aacute;o số 30/TB-HĐND về việc điều chỉnh thời gian tổ chức Kỳ họp thứ 2 HĐND Th&agrave;nh phố kh&oacute;a XVI, nhiệm kỳ 2021 - 2026.</p>

<p>Theo đ&oacute;, kỳ họp sẽ được tổ chức trong hai ng&agrave;y 22 v&agrave; 23/9, theo h&igrave;nh thức trực tiếp kết hợp trực tuyến tại trụ sở HĐND, UBND Th&agrave;nh phố v&agrave; tại c&aacute;c điểm cầu tại c&aacute;c quận, huyện, thị x&atilde; v&agrave; điểm cầu c&aacute;c sở, ban, ng&agrave;nh th&agrave;nh phố. Trong th&ocirc;ng b&aacute;o trước đ&oacute; của HĐND TP H&agrave; Nội, Kỳ họp được tổ chức trong hai ng&agrave;y 14 v&agrave; 15/9.</p>

<p>Trước đ&oacute;, Thường trực HĐND TP H&agrave; Nội đ&atilde; th&ocirc;ng b&aacute;o ho&atilde;n tổ chức kỳ họp thứ 2 HĐND TP kh&oacute;a XVI do diễn biến phức tạp của dịch COVID-19.</p>

<p>Kỳ họp thứ 2 HĐND TP H&agrave; Nội kh&oacute;a XVI, nhiệm kỳ 2021 - 2026 dự kiến sẽ xem x&eacute;t 15 b&aacute;o c&aacute;o v&agrave; 18 nghị quyết. Cụ thể: Kết quả hoạt động của HĐND Th&agrave;nh phố 8 th&aacute;ng năm 2021 v&agrave; nhiệm vụ trọng t&acirc;m c&aacute;c th&aacute;ng cuối năm 2021; tổng hợp kiến nghị cử tri trước Kỳ họp thứ hai HĐND Th&agrave;nh phố; trả lời kiến nghị cử tri trước v&agrave; sau Kỳ họp thứ 18 HĐND Th&agrave;nh phố kh&oacute;a XV; trả lời kiến nghị cử tri trước Kỳ họp thứ hai HĐND Th&agrave;nh phố kh&oacute;a XVI; kết quả thực hiện kết luận của chủ tọa tại phi&ecirc;n chất vấn v&agrave; trả lời chất vấn Kỳ họp thứ 18 HĐND Th&agrave;nh phố kh&oacute;a XV; c&ocirc;ng t&aacute;c chỉ đạo, điều h&agrave;nh 8 th&aacute;ng năm 2021 v&agrave; nhiệm vụ trọng t&acirc;m c&aacute;c th&aacute;ng cuối năm 2021 của UBND Th&agrave;nh phố; c&ocirc;ng t&aacute;c ph&ograve;ng, chống tham nhũng 8 th&aacute;ng năm 2021, nhiệm vụ, giải ph&aacute;p c&aacute;c th&aacute;ng cuối năm 2021; t&igrave;nh h&igrave;nh giải quyết đơn khiếu nại, tố c&aacute;o của c&ocirc;ng d&acirc;n 8 th&aacute;ng năm 2021, nhiệm vụ, giải ph&aacute;p c&aacute;c th&aacute;ng cuối năm 2021; t&igrave;nh h&igrave;nh&nbsp;<a href="https://vtv.vn/kinh-te-xa-hoi.html" target="_blank" title="kinh tế - xã hội">kinh tế - x&atilde; hội</a>&nbsp;8 th&aacute;ng năm 2021 v&agrave; nhiệm vụ trọng t&acirc;m c&aacute;c th&aacute;ng cuối năm 2021&hellip;</p>

<p>HĐND TP H&agrave; Nội cũng sẽ xem x&eacute;t nội dung c&aacute;c nghị quyết: T&igrave;nh h&igrave;nh thực hiện nhiệm vụ trọng t&acirc;m ph&aacute;t triển kinh tế - x&atilde; hội, an ninh - quốc ph&ograve;ng, thu - chi ng&acirc;n s&aacute;ch 8 th&aacute;ng năm 2021 v&agrave; nhiệm vụ trọng t&acirc;m c&aacute;c th&aacute;ng cuối năm 2021 của th&agrave;nh phố; chương tr&igrave;nh gi&aacute;m s&aacute;t của HĐND Th&agrave;nh phố năm 2022; kế hoạch ph&aacute;t triển kinh tế - x&atilde; hội 5 năm 2021 - 2025 Th&agrave;nh phố H&agrave; Nội; kế hoạch đầu tư c&ocirc;ng trung hạn giai đoạn 2021 - 2025 TP H&agrave; Nội; ph&ecirc; duyệt chủ trương đầu tư, điều chỉnh chủ trương đầu tư một số dự &aacute;n sử dụng vốn đầu tư c&ocirc;ng của th&agrave;nh phố; điều chỉnh, bổ sung kế hoạch đầu tư c&ocirc;ng năm 2021; điều chỉnh, bổ sung danh mục c&aacute;c c&ocirc;ng tr&igrave;nh, dự &aacute;n thu hồi đất; danh mục dự &aacute;n chuyển mục đ&iacute;ch đất trồng l&uacute;a tr&ecirc;n địa b&agrave;n th&agrave;nh phố năm 2021; đề &aacute;n cải tạo, x&acirc;y dựng lại chung cư cũ tr&ecirc;n địa b&agrave;n TP H&agrave; Nội; kiện to&agrave;n chức danh Ủy vi&ecirc;n UBND Th&agrave;nh phố.</p>

<p>Tại kỳ họp n&agrave;y, HĐND TP H&agrave; Nội sẽ xem x&eacute;t, ban h&agrave;nh c&aacute;c nghị quyết chuy&ecirc;n đề: Quy định cơ chế hỗ trợ, đ&oacute;ng g&oacute;p thực hiện Đề &aacute;n chương tr&igrave;nh Sữa học đường cải thiện tầm v&oacute;c trẻ em mẫu gi&aacute;o v&agrave; học sinh tiểu học tr&ecirc;n địa b&agrave;n th&agrave;nh phố; quy định mức thu học ph&iacute; đối với c&aacute;c cơ sở gi&aacute;o dục c&ocirc;ng lập thuộc hệ thống gi&aacute;o dục quốc d&acirc;n của TP H&agrave; Nội năm học 2021 - 2022; quy định mức trần học ph&iacute; đối với cơ sở gi&aacute;o dục c&ocirc;ng lập chất lượng cao tr&ecirc;n địa b&agrave;n Thủ đ&ocirc; từ năm học 2021 - 2022; quy định mức hỗ trợ trang bị cơ sở vật chất đối với cơ sở gi&aacute;o dục mầm non độc lập thuộc loại h&igrave;nh d&acirc;n lập, tư thục ở địa b&agrave;n c&oacute; khu c&ocirc;ng nghiệp của TPH&agrave; Nội&hellip;</p>
','thanhphohanoi.jpg',N'Chưa duyệt',1)
Insert into TinTuc(Id_LoaiTinTuc,Ngay_Dang,Tieu_De,Noi_Dung,img,Trang_Thai,Id_Tac_Gia)
values(2,'11/12/2021',N'Hiệp định thương mại lớn nhất thế giới có hiệu lực từ hôm nay',N'<p>Trong bối cảnh dịch COVID-19 b&ugrave;ng ph&aacute;t l&agrave;m gi&aacute;n đoạn chuỗi cung ứng to&agrave;n cầu v&agrave; khu vực, việc&nbsp;<a href="https://vtv.vn/hiep-dinh-doi-tac-kinh-te-toan-dien-khu-vuc.html" target="_blank" title="Hiệp định Đối tác Kinh tế Toàn diện Khu vực">Hiệp định Đối t&aacute;c Kinh tế To&agrave;n diện Khu vực</a>&nbsp;(RCEP) đi v&agrave;o thực thi từ ng&agrave;y h&ocirc;m nay 1/1/2022 gi&uacute;p thiết lập thị trường xuất khẩu ổn định l&acirc;u d&agrave;i cho Việt Nam v&agrave;&nbsp;<a href="https://vtv.vn/cac-nuoc-asean.html" target="_blank" title="các nước ASEAN.">c&aacute;c nước ASEAN.</a>&nbsp;C&ugrave;ng với đ&oacute;, Hiệp định RCEP cũng tạo n&ecirc;n một khu&ocirc;n khổ r&agrave;ng buộc ph&aacute;p l&yacute; g&oacute;p phần gi&uacute;p m&ocirc;i trường thương mại c&ocirc;ng bằng trong khu vực v&agrave; được kỳ vọng l&agrave; động lực th&uacute;c đẩy thương mại g&oacute;p phần phục hồi kinh tế trong bối cảnh hậu COVID-19.</p>

<p>L&agrave; một trong những ưu ti&ecirc;n hội nhập của ASEAN, Hiệp định RCEP khi được 15 th&agrave;nh vi&ecirc;n thực thi tạo n&ecirc;n một thị trường lớn với quy m&ocirc; 2,2 tỷ người ti&ecirc;u d&ugrave;ng, chiếm 30% d&acirc;n số thế giới với tổng sản phẩm quốc nội (GDP) xấp xỉ 26,2 ngh&igrave;n tỷ USD, chiếm khoảng 30% GDP to&agrave;n cầu v&agrave; trở th&agrave;nh khu vực thương mại tự do lớn nhất tr&ecirc;n thế giới.&nbsp;</p>

<p>Với c&aacute;c cam kết về mở cửa thị trường trong lĩnh vực h&agrave;ng h&oacute;a, dịch vụ, đầu tư v&agrave; h&agrave;i h&ograve;a h&oacute;a quy tắc xuất xứ giữa tất cả c&aacute;c b&ecirc;n tham gia cũng như tăng cường biện ph&aacute;p tạo thuận lợi thương mại. V&igrave; vậy, việc thiết lập hiệp định n&agrave;y sẽ tạo cơ hội để ph&aacute;t triển c&aacute;c chuỗi cung ứng mới trong khu vực.</p>

<p>Chia sẻ về Hiệp định RCEP, Bộ trưởng Bộ C&ocirc;ng Thương Nguyễn Hồng Di&ecirc;n cho biết, hiệp định n&agrave;y được 10 quốc gia th&agrave;nh vi&ecirc;n ASEAN v&agrave; 5 đối t&aacute;c của ASEAN l&agrave; Trung Quốc, Nhật Bản, H&agrave;n Quốc, Australia v&agrave; New Zealand k&yacute; kết v&agrave;o ng&agrave;y 15/11/2020 b&ecirc;n lề Hội nghị cấp cao ASEAN lần thứ 37 do Việt Nam l&agrave;m Chủ tịch. Việc Hiệp định RCEP c&oacute; hiệu lực từ ng&agrave;y 1/1/2022 sẽ kết nối 4 Hiệp định Thương mại tự do m&agrave; ASEAN đ&atilde; k&yacute; kết với từng đối t&aacute;c trước đ&acirc;y, tạo th&agrave;nh 1 khu vực thương mại tự do mới hơn; trong đ&oacute; &aacute;p dụng 1 quy tắc xuất xứ v&agrave; c&aacute;c quy định tạo thuận lợi cho thương mại v&agrave; đầu tư. Điều n&agrave;y gi&uacute;p ph&aacute;t triển c&aacute;c chuỗi cung ứng khu vực, mở ra thị trường xuất khẩu ổn định, l&acirc;u d&agrave;i cho Việt Nam cũng như tạo cơ hội thu h&uacute;t đầu tư nước ngo&agrave;i, g&oacute;p phần phục hồi kinh tế sau dịch COVID-19.</p>

<p><img alt="Hiệp định thương mại lớn nhất thế giới có hiệu lực từ hôm nay - Ảnh 1." id="img_9007c430-6aac-11ec-ac99-233aba72e421" src="https://vtv1.mediacdn.vn/thumb_w/640/2022/1/1/z-a-2630-1641004987027199855657.jpg" title="Hiệp định thương mại lớn nhất thế giới có hiệu lực từ hôm nay - Ảnh 1." /></p>

<p>Với Việt Nam, Hiệp định RCEP mang lại nhiều cơ hội song cũng đầy th&aacute;ch thức</p>

<p>Theo &ocirc;ng Lương Ho&agrave;ng Th&aacute;i, Vụ trưởng Vụ Ch&iacute;nh s&aacute;ch thương mại đa bi&ecirc;n (Bộ C&ocirc;ng Thương), ng&agrave;y 1/1/2022 cũng l&agrave; thời điểm đ&uacute;ng như dự t&iacute;nh của ASEAN - thời điểm kinh tế thế giới c&oacute; khả năng phục hồi.</p>

<p>V&igrave; vậy, với việc hiệp định lớn như RCEP được đưa v&agrave;o thực thi với quy m&ocirc; d&acirc;n số v&agrave; thương mại, c&aacute;c nước ASEAN; trong đ&oacute;, c&oacute; Việt Nam đều hy vọng Hiệp định RCEP l&agrave; một trong những nh&acirc;n tố g&oacute;p phần phục hồi kinh tế hậu COVID-19.</p>

<p>Theo c&aacute;c chuy&ecirc;n gia, khi Hiệp định RCEP c&oacute; hiệu lực cơ hội mang lại cũng sẽ song h&agrave;nh với những kh&oacute; khăn v&agrave; th&aacute;ch thức. Trước hết, Hiệp định RCEP c&oacute; thể mang đến sức &eacute;p cạnh tranh đối với h&agrave;ng h&oacute;a, dịch vụ của Việt Nam.</p>

<p>Đặc điểm c&aacute;c nền kinh tế trong khu vực RCEP cho thấy nhiều đối t&aacute;c c&oacute; cơ cấu sản phẩm tương tự v&agrave; năng lực cạnh tranh mạnh hơn Việt Nam, trong khi chất lượng v&agrave; h&agrave;m lượng gi&aacute; trị gia tăng của hầu hết sản phẩm của Việt Nam c&ograve;n khi&ecirc;m tốn. V&igrave; vậy, khi Hiệp định RCEP c&oacute; hiệu lực sức &eacute;p cạnh tranh sẽ gia tăng.</p>

<p>Ngo&agrave;i ra, đầu v&agrave;o sản xuất của Việt Nam vẫn c&ograve;n phụ thuộc nhất định v&agrave;o c&aacute;c nguồn nhập khẩu, đặc biệt khả năng cải thiện vị tr&iacute; trong chuỗi gi&aacute; trị khu vực cũng như mức độ tham gia cung cấp thương mại dịch vụ to&agrave;n cầu của Việt Nam c&ograve;n hạn chế.</p>

<p>Tuy nhi&ecirc;n, kinh nghiệm hội nhập kinh tế quốc tế thời gian qua cho thấy khả năng của Việt Nam tham gia v&agrave;o c&aacute;c chuỗi gi&aacute; trị mới thiết lập trong khu vực ng&agrave;y c&agrave;ng tăng l&ecirc;n c&ugrave;ng với việc đổi mới mạnh mẽ về thủ tục h&agrave;nh ch&iacute;nh tạo điều kiện cho sản xuất kinh doanh v&agrave; cải thiện m&ocirc;i trường đầu tư.</p>

<p>C&aacute;c chuy&ecirc;n gia cũng chỉ ra rằng: Việt Nam đ&atilde; tham gia với c&aacute;c nước ASEAN v&agrave; 5 nước đối t&aacute;c trong Hiệp định RCEP theo c&aacute;c hiệp định thương mại tự do (FTA) giữa nội khối ASEAN, cụ thể l&agrave; Hiệp định Thương mại h&agrave;ng h&oacute;a ASEAN (ATIGA) v&agrave; c&aacute;c FTA giữa ASEAN với từng đối t&aacute;c trong số 5 đối t&aacute;c tr&ecirc;n (gọi l&agrave; c&aacute;c hiệp định FTA ASEAN+1).</p>

<p>V&igrave; vậy, qu&aacute; tr&igrave;nh tự do ho&aacute; thuế quan với c&aacute;c nước ASEAN đ&atilde; được thực hiện trong suốt hơn 20 năm qua v&agrave; với 5 nước đối t&aacute;c tr&ecirc;n l&agrave; trong v&ograve;ng khoảng 15 năm qua. Việc thực hiện Hiệp định RCEP sau khi được th&ocirc;ng qua sẽ kh&ocirc;ng tạo ra c&uacute; sốc về giảm thuế quan đối với Việt Nam.</p>

<p>Hơn nữa, Hiệp định RCEP về cơ bản l&agrave; thỏa thuận mang t&iacute;nh kết nối c&aacute;c cam kết đ&atilde; c&oacute; của ASEAN với 5 đối t&aacute;c với ASEAN trong một Hiệp định FTA. Do đ&oacute;, về cơ bản sẽ kh&ocirc;ng tạo ra cam kết mở cửa thị trường hay &aacute;p lực cạnh tranh mới m&agrave; chủ yếu hướng đến tạo thuận lợi cho doanh nghiệp, nhất l&agrave; doanh nghiệp vừa v&agrave; nhỏ.</p>

<p>V&igrave; vậy, Việt Nam kh&ocirc;ng qu&aacute; lo ngại về khả năng tăng nhập si&ecirc;u. Kh&ocirc;ng những thế, c&aacute;c doanh nghiệp Việt Nam chủ yếu l&agrave; doanh nghiệp vừa v&agrave; nhỏ n&ecirc;n sẽ c&oacute; nhiều cơ hội tham gia c&aacute;c chuỗi cung ứng mới do Hiệp định RCEP tạo ra nếu c&oacute; thể khai th&aacute;c triệt để lợi &iacute;ch.</p>
','hiepdinhthuongmai.jpg',N'Chưa duyệt',1)
Insert into TinTuc(Id_LoaiTinTuc,Ngay_Dang,Tieu_De,Noi_Dung,img,Trang_Thai,Id_Tac_Gia)
values(2,'11/12/2021',N'Ùn tắc cửa khẩu, mít, sầu riêng... "đổ bộ" đường phố Hà Nội',N'<p>Trong nhiều ng&agrave;y qua, h&agrave;ng trăm xe chở&nbsp;<a href="https://vtv.vn/nong-san.html" target="_blank" title="nông sản">n&ocirc;ng sản</a>&nbsp;đ&atilde; bị &ugrave;n ứ tại cửa khẩu bi&ecirc;n giới tỉnh Lạng Sơn. L&atilde;nh đạo Sở C&ocirc;ng Thương Lạng Sơn cho biết, lượng tồn đến ng&agrave;y 31/12 tại 3 khu vực cửa khẩu: Hữu Nghị, T&acirc;n Thanh, Chi Ma l&agrave; 2.945 xe.</p>

<p>Nguy&ecirc;n nh&acirc;n ch&iacute;nh được x&aacute;c định l&agrave; do ph&iacute;a Trung Quốc vẫn đang thực hiện ch&iacute;nh s&aacute;ch &quot;Zero COVID&quot;, quy tr&igrave;nh giao nhận h&agrave;ng h&oacute;a được xiết rất chặt để kiểm so&aacute;t nguy cơ dịch bệnh.</p>

<p>Do thời gian chờ đời l&acirc;u, c&aacute;c mặt h&agrave;ng n&ocirc;ng sản đ&atilde; bắt đầu hư hỏng n&ecirc;n c&aacute;c doanh nghiệp, chủ h&agrave;ng lựa chọn giải ph&aacute;p quay đầu xe, chuyển ti&ecirc;u thụ nội địa nhằm gỡ lại phần n&agrave;o chi ph&iacute;.</p>

<p>Theo ghi nhận của ph&oacute;ng vi&ecirc;n, tại c&aacute;c tuyến phố như L&ecirc; Đức Thọ, Giải Ph&oacute;ng, Nguyễn Xiển... m&iacute;t Th&aacute;i, thanh long, dưa hấu được b&agrave;y b&aacute;n tr&agrave;n vỉa h&egrave; với gi&aacute; rẻ. Nhiều người d&acirc;n tại Thủ đ&ocirc; đ&atilde; đến mua ủng hộ, hỗ trợ b&agrave; con tiểu thương.</p>

<p>Tr&ecirc;n c&aacute;c trang mạng x&atilde; hội, h&igrave;nh ảnh&nbsp;<a href="https://vtv.vn/giai-cuu-mat-hang-nong-san.html" target="_blank" title="giải cứu mặt hàng nông sản">giải cứu mặt h&agrave;ng n&ocirc;ng sản</a>&nbsp;do &ugrave;n ứ tr&ecirc;n cửa khẩu Lạng Sơn cũng được chia sẻ. C&oacute; những c&aacute; nh&acirc;n đứng ra gom th&agrave;nh từng nh&oacute;m đi hỗ trợ chủ h&agrave;ng, b&agrave; con ti&ecirc;u thụ với hy vọng giảm bớt thiệt hại.</p>

<p><img alt="Ùn tắc cửa khẩu, mít, sầu riêng... đổ bộ đường phố Hà Nội - Ảnh 1." id="img_5c2596a0-6aa8-11ec-a3a9-a7be86ee3731" src="https://vtv1.mediacdn.vn/thumb_w/640/2022/1/1/vnapotalnguoidanhanoihotromuanongsangiupdocactieuthuong5848711-1641003181368396782180.jpg" title="Ùn tắc cửa khẩu, mít, sầu riêng... đổ bộ đường phố Hà Nội - Ảnh 1." /></p>

<p>H&agrave;ng n&ocirc;ng sản kh&ocirc;ng xuất được qua cửa khẩu được c&aacute;c tiểu thương trở về H&agrave; Nội ti&ecirc;u thụ (Ảnh: Tuấn Anh)</p>

<p><img alt="Ùn tắc cửa khẩu, mít, sầu riêng... đổ bộ đường phố Hà Nội - Ảnh 2." id="img_8f13c410-6aa8-11ec-96e6-755fab03923b" src="https://vtv1.mediacdn.vn/thumb_w/640/2022/1/1/vnapotalnguoidanhanoihotromuanongsangiupdocactieuthuong5848707-16410032714081740468586.jpg" title="Ùn tắc cửa khẩu, mít, sầu riêng... đổ bộ đường phố Hà Nội - Ảnh 2." /></p>

<p>Để gỡ vốn, c&aacute;c tiểu thương b&aacute;n với gi&aacute; rất rẻ (Ảnh: Tuấn Anh)</p>

<p><img alt="Ùn tắc cửa khẩu, mít, sầu riêng... đổ bộ đường phố Hà Nội - Ảnh 3." id="img_e1242d90-6aa7-11ec-9ccd-ab00c0caec60" src="https://vtv1.mediacdn.vn/thumb_w/640/2022/1/1/vnapotalnguoidanhanoihotromuanongsangiupdocactieuthuong5848715-1-1641002979461633842581.jpg" title="Ùn tắc cửa khẩu, mít, sầu riêng... đổ bộ đường phố Hà Nội - Ảnh 3." /></p>

<p>Sầu ri&ecirc;ng tr&ecirc;n đường Nguyễn Xiển (Ảnh: Tuấn Anh)</p>
','mit.jpg',N'Chưa duyệt',2)
Insert into TinTuc(Id_LoaiTinTuc,Ngay_Dang,Tieu_De,Noi_Dung,img,Trang_Thai,Id_Tac_Gia)
values(2,'12/12/2021',N'Giá gas trong nước tháng 1/2022 sẽ giảm mạnh',N'<p>Theo đ&oacute;,&nbsp;<a href="https://vtv.vn/gia-gas.html" target="_blank" title="giá gas">gi&aacute; gas</a>&nbsp;Petrolimex th&aacute;ng 1/2022 tại thị trường H&agrave; Nội l&agrave; 433.700 đồng/ b&igrave;nh d&acirc;n dụng 12kg; 1.734.800 đồng/ b&igrave;nh c&ocirc;ng nghiệp 48kg, lần lượt giảm 15.100 đồng/b&igrave;nh 12 kg v&agrave; 60.400 đồng/b&igrave;nh 48 kg</p>

<p>Gi&aacute; b&aacute;n PetroVietnam Gas giảm 667 đồng/kg (đ&atilde; bao gồm VAT), tương đương mức giảm 8.000 đồng mỗi b&igrave;nh 12kg v&agrave; 30.000 đồng mỗi b&igrave;nh 45kg so với th&aacute;ng 12-2021.</p>

<p>Gi&aacute; gas Pacific Petro giảm 8.000 đồng đối với b&igrave;nh 12kg.</p>

<p>Gi&aacute; gas SP giảm 833 đồng/kg (đ&atilde; bao gồm VAT), tương đương 10.000 đồng/b&igrave;nh 12kg, gi&aacute; b&aacute;n lẻ tối đa đến tay người ti&ecirc;u d&ugrave;ng l&agrave; 444.000 đồng/b&igrave;nh 12kg.</p>

<p>Theo c&aacute;c c&ocirc;ng ty gas, do gi&aacute; gas thế giới b&igrave;nh qu&acirc;n th&aacute;ng 1 l&agrave; 725USD/tấn, giảm 47,5USD/tấn so với th&aacute;ng 12 n&ecirc;n c&aacute;c c&ocirc;ng ty điều chỉnh giảm tương ứng.</p>

<p>&Ocirc;ng L&ecirc; Quang Tuấn, Ph&oacute; Tổng gi&aacute;m đốc C&ocirc;ng ty cổ phần Thương mại&nbsp;<a href="https://vtv.vn/dau-khi.html" target="_blank" title="dầu khí">dầu kh&iacute;</a>&nbsp;Th&aacute;i B&igrave;nh Dương cho biết, c&oacute; thời điểm gi&aacute; gas thế giới giảm hơn 100 USD/tấn tương đương gi&aacute; gas trong nước dự b&aacute;o giảm hơn 30.000 đồng/b&igrave;nh 12 kg.</p>

<p>Tuy nhi&ecirc;n, đến giờ ch&oacute;t gi&aacute; gas thế giới tăng trở lại, gi&aacute; gas dự kiến giảm 14.000 đồng/b&igrave;nh 12kg. Song song đ&oacute;, do gi&aacute; premium năm 2022 tăng 12USD - 15USD/tấn (gi&aacute; cước vận chuyển, bảo hiểm&hellip;), tỷ gi&aacute; cũng tăng n&ecirc;n mức gi&aacute; gas giảm như c&ocirc;ng bố.</p>
','gas.jpg',N'Chưa duyệt',1)
Insert into TinTuc(Id_LoaiTinTuc,Ngay_Dang,Tieu_De,Noi_Dung,img,Trang_Thai,Id_Tac_Gia)
values(3,'12/12/2021',N'Tết Nguyên đán 2022: Tạm dừng các lễ hội và bắn pháo hoa nổ',N'<p>Ph&oacute; Thủ tướng Thường trực Ch&iacute;nh phủ Phạm B&igrave;nh Minh vừa k&yacute; ban h&agrave;nh Chỉ thị số 35/CT-TTg ng&agrave;y 31/12/2021 của Thủ tướng Ch&iacute;nh phủ về việc tăng cường c&aacute;c biện ph&aacute;p bảo đảm đ&oacute;n Tết Nguy&ecirc;n đ&aacute;n Nh&acirc;m Dần 2022 vui tươi, l&agrave;nh mạnh, an to&agrave;n, tiết kiệm.</p>

<p><strong>Tập trung cao nhất c&ocirc;ng t&aacute;c ph&ograve;ng chống dịch COVID-19</strong></p>

<p>Chỉ thị n&ecirc;u r&otilde;, Bộ Y tế chủ tr&igrave;, phối hợp với c&aacute;c bộ, ng&agrave;nh, địa phương thực hiện hiệu quả Nghị quyết số 128/NQ-CP của Ch&iacute;nh phủ về ban h&agrave;nh Quy định tạm thời &quot;Th&iacute;ch ứng an to&agrave;n linh hoạt, kiểm so&aacute;t hiệu quả&nbsp;<a href="https://vtv.vn/dich-covid-19.html" target="_blank" title="dịch covid-19">dịch COVID-19</a>&quot;. Tập trung, nỗ lực cao nhất cho c&ocirc;ng t&aacute;c ph&ograve;ng, chống dịch COVID-19 v&agrave; c&aacute;c dịch bệnh c&oacute; nguy cơ b&ugrave;ng ph&aacute;t trong m&ugrave;a Đ&ocirc;ng - Xu&acirc;n.</p>

<p>Chủ động c&aacute;c phương &aacute;n đ&aacute;p ứng với c&aacute;c cấp độ dịch COVID-19 nhằm ph&aacute;t hiện sớm, khoanh v&ugrave;ng, c&aacute;ch ly v&agrave; điều trị ph&ugrave; hợp ngay khi ph&aacute;t hiện ca bệnh; thần tốc hơn nữa về tiến độ ti&ecirc;m chủng&nbsp;<a href="https://vtv.vn/vaccine-phong-covid-19.html" target="_blank" title="vaccine phòng covid-19">vaccine ph&ograve;ng COVID-19</a>, bảo đảm ti&ecirc;m an to&agrave;n, khoa học, hiệu quả; đẩy mạnh truyền th&ocirc;ng th&ocirc;ng điệp 5K v&agrave; đề cao &yacute; thức ph&ograve;ng, chống dịch của người d&acirc;n, kh&ocirc;ng lơ l&agrave; chủ quan ngay cả khi đ&atilde; ti&ecirc;m đủ 2 mũi v&agrave; mũi thứ 3 vaccine ph&ograve;ng COVID-19.</p>

<p>Ngo&agrave;i ra, Chỉ thị cũng y&ecirc;u cầu Bộ C&ocirc;ng Thương chủ tr&igrave; triển khai đồng bộ c&aacute;c giải ph&aacute;p th&uacute;c đẩy ph&aacute;t triển thị trường trong nước, k&iacute;ch cầu ti&ecirc;u d&ugrave;ng; chủ động c&oacute; phương &aacute;n chuẩn bị nguồn cung c&aacute;c mặt h&agrave;ng thiết yếu, c&aacute;c mặt h&agrave;ng c&oacute; nhu cầu ti&ecirc;u d&ugrave;ng tăng cao, bảo đảm chất lượng.</p>

<p>Bộ T&agrave;i ch&iacute;nh chủ tr&igrave; theo d&otilde;i s&aacute;t diễn biến gi&aacute; cả, thị trường nhất l&agrave; h&agrave;ng h&oacute;a, dịch vụ ti&ecirc;u d&ugrave;ng thiết yếu, mặt h&agrave;ng thuộc diện b&igrave;nh ổn gi&aacute;, kịp thời chỉ đạo v&agrave; c&oacute; biện ph&aacute;p xử l&yacute; nghi&ecirc;m c&aacute;c h&agrave;nh vi vi phạm ph&aacute;p luật về gi&aacute; theo thẩm quyền.</p>

<p>Tăng cường kiểm tra, gi&aacute;m s&aacute;t việc tổ chức c&aacute;c hoạt động văn h&oacute;a, thể thao, du lịch, lễ hội trước, trong v&agrave; sau Tết Nguy&ecirc;n đ&aacute;n, bảo đảm phục vụ nh&acirc;n d&acirc;n đ&oacute;n Tết vui tươi, l&agrave;nh mạnh, an to&agrave;n, ph&ugrave; hợp với nếp sống văn minh, phong tục, tập qu&aacute;n, truyền thống văn h&oacute;a tốt đẹp của d&acirc;n tộc v&agrave; t&igrave;nh h&igrave;nh dịch bệnh COVID-19 của từng địa phương.</p>

<p>Bộ N&ocirc;ng nghiệp v&agrave; Ph&aacute;t triển n&ocirc;ng th&ocirc;n chủ động theo d&otilde;i chặt chẽ diễn biến thời tiết; c&oacute; c&aacute;c phương &aacute;n chủ động ph&ograve;ng, chống thi&ecirc;n tai, dịch bệnh đối với c&acirc;y trồng, vật nu&ocirc;i, thủy sản, bảo đảm th&iacute;ch ứng an to&agrave;n, linh hoạt với dịch COVID-19.</p>

<p>Thủ tướng Ch&iacute;nh phủ giao Bộ Lao động - Thương binh v&agrave; X&atilde; hội r&agrave; so&aacute;t, nắm t&igrave;nh h&igrave;nh đời sống của c&aacute;c đối tượng ch&iacute;nh s&aacute;ch người c&oacute; ho&agrave;n cảnh kh&oacute; khăn, bị ảnh hưởng bởi dịch COVID-19.</p>

<p>Bộ Giao th&ocirc;ng vận tải tăng cường c&ocirc;ng t&aacute;c điều tiết, tổ chức quản l&yacute; chặt chẽ hoạt động vận tải, phục vụ nhu cầu đi lại của người d&acirc;n dịp Tết Nguy&ecirc;n đ&aacute;n, kh&ocirc;ng để xảy ra t&igrave;nh trạng người d&acirc;n kh&ocirc;ng được&nbsp;<a href="https://vtv.vn/xa-hoi/phat-dong-chuong-trinh-cong-dong-tet-chung-mot-nha-ho-tro-lao-dong-kho-khan-ve-que-an-tet-20211221121059077.htm" target="_blank" title="Phát động chương trình cộng đồng ‘Tết chung một nhà’ hỗ trợ lao động khó khăn về quê ăn Tết">về qu&ecirc; ăn Tết</a>&nbsp;do kh&ocirc;ng c&oacute; t&agrave;u, xe; bảo đảm linh hoạt, an to&agrave;n v&agrave; kiểm so&aacute;t hiệu quả dịch COVID-19</p>

<p>B&ecirc;n cạnh đ&oacute;, Ng&acirc;n h&agrave;ng Nh&agrave; nước Việt Nam điều h&agrave;nh chủ động lượng tiền cung ứng, bảo đảm thanh khoản của nền kinh tế, nhu cầu chi trả, thanh to&aacute;n dịp cuối năm v&agrave; y&ecirc;u cầu kiểm so&aacute;t lạm ph&aacute;t.</p>

<p><strong>Hướng dẫn địa phương tạm dừng tổ chức lễ hội v&agrave; bắn ph&aacute;o hoa nổ trong dịp Tết Nguy&ecirc;n đ&aacute;n</strong></p>

<p>Chỉ thị của Thủ tướng y&ecirc;u cầu Bộ Văn h&oacute;a, Thể thao v&agrave; Du lịch chủ tr&igrave;, phối hợp với c&aacute;c bộ, ng&agrave;nh, địa phương hướng dẫn c&aacute;c địa phương tạm dừng tổ chức c&aacute;c loại h&igrave;nh lễ hội v&agrave; bắn ph&aacute;o hoa nổ trong dịp Tết Nguy&ecirc;n đ&aacute;n Nh&acirc;m Dần.</p>

<p>Ủy ban nh&acirc;n d&acirc;n c&aacute;c tỉnh, th&agrave;nh phố trực thuộc Trung ương thực hiện nghi&ecirc;m t&uacute;c v&agrave; hiệu quả Nghị quyết số 128/NQ-CP của Ch&iacute;nh phủ. Tạm dừng tổ chức c&aacute;c loại h&igrave;nh lễ hội v&agrave; bắn ph&aacute;o hoa nổ trong dịp Tết Nguy&ecirc;n đ&aacute;n Nh&acirc;m Dần; dừng c&aacute;c hoạt động&nbsp;<a href="https://vtv.vn/xa-hoi/hai-duong-dung-ban-hang-tai-cho-va-cac-hoat-dong-tap-trung-dong-nguoi-trong-dip-tet-duong-lich-20211230213155346.htm" target="_blank" title="Hải Dương dừng bán hàng tại chỗ và các hoạt động tập trung đông người trong dịp Tết Dương lịch">tập trung đ&ocirc;ng người</a>&nbsp;kh&ocirc;ng cần thiết; tăng cường gi&aacute;m s&aacute;t dịch bệnh tại c&aacute;c địa b&agrave;n, khu vực c&oacute; nguy cơ cao; tổ chức lực lượng ph&ograve;ng, chống dịch bảo đảm xử l&yacute; kịp thời c&aacute;c t&igrave;nh huống xảy ra; đ&aacute;nh gi&aacute;, cập nhật cấp độ dịch tr&ecirc;n Cổng th&ocirc;ng tin điện tử của địa phương v&agrave; Bộ Y tế để c&oacute; c&aacute;c biện ph&aacute;p tăng cường đối với c&ocirc;ng t&aacute;c ph&ograve;ng, chống dịch COVID-19 tr&ecirc;n địa b&agrave;n.</p>

<p>Chỉ thị y&ecirc;u cầu c&aacute;c bộ, cơ quan, đơn vị, địa phương qu&aacute;n triệt v&agrave; tổ chức thực hiện nghi&ecirc;m Chỉ thị số 11-CT/TW ng&agrave;y 8/12/2021 của Ban B&iacute; thư v&agrave; Chỉ thị n&agrave;y; tập trung nỗ lực cao nhất c&ocirc;ng t&aacute;c ph&ograve;ng, chống dịch COVID-19, tuyệt đối kh&ocirc;ng chủ quan, lơ l&agrave;, mất cảnh gi&aacute;c; thực hiện nghi&ecirc;m Th&ocirc;ng điệp 5K; đề cao tr&aacute;ch nhiệm của người đứng đầu, sẵn s&agrave;ng ứng ph&oacute; mọi t&igrave;nh huống; chỉ đạo quyết liệt, đồng bộ, hiệu quả c&aacute;c giải ph&aacute;p bảo đảm vừa ph&ograve;ng, chống dịch COVID-19, vừa phục hồi, ph&aacute;t triển kinh tế - x&atilde; hội.</p>

<p>C&aacute;c cơ quan trong hệ thống h&agrave;nh ch&iacute;nh Nh&agrave; nước thực hiện nghi&ecirc;m việc kh&ocirc;ng tổ chức đi thăm, ch&uacute;c Tết cấp tr&ecirc;n v&agrave; l&atilde;nh đạo c&aacute;c cấp; kh&ocirc;ng tổ chức đo&agrave;n của Trung ương thăm, ch&uacute;c Tết cấp ủy, ch&iacute;nh quyền c&aacute;c tỉnh, th&agrave;nh phố; nghi&ecirc;m cấm biếu, tặng qu&agrave; Tết cho l&atilde;nh đạo c&aacute;c cấp dưới mọi h&igrave;nh thức; kh&ocirc;ng sử dụng ng&acirc;n s&aacute;ch Nh&agrave; nước, phương tiện, t&agrave;i sản c&ocirc;ng v&agrave;o c&aacute;c hoạt động tr&aacute;i quy định; kh&ocirc;ng tham gia c&aacute;c hoạt động m&ecirc; t&iacute;n, dị đoan; d&agrave;nh thời gian đi thăm hỏi c&aacute;c gia đ&igrave;nh ch&iacute;nh s&aacute;ch, c&aacute;c hộ ngh&egrave;o, c&aacute;c gia đ&igrave;nh bị ảnh hưởng do dịch bệnh, thi&ecirc;n tai, b&atilde;o, lũ. Ngay sau kỳ nghỉ Tết, c&aacute;c cơ quan, tổ chức, đơn vị khẩn trương tập trung v&agrave;o c&ocirc;ng việc, kh&ocirc;ng để chậm trễ ảnh hưởng đến hoạt động sản xuất, kinh doanh.</p>
','phaohoa.jpg',N'Chưa duyệt',2)
Insert into TinTuc(Id_LoaiTinTuc,Ngay_Dang,Tieu_De,Noi_Dung,img,Trang_Thai,Id_Tac_Gia)
values(3,'12/12/2021',N'Phạt tới 3 triệu đồng người không đeo khẩu trang, không khai báo y tế',N'<p>Theo đ&oacute;, Nghị định 124 quy định cụ thể h&agrave;nh vi kh&ocirc;ng thực hiện biện ph&aacute;p bảo vệ c&aacute; nh&acirc;n đối với người tham gia chống dịch v&agrave; người c&oacute; nguy cơ mắc bệnh dịch theo hướng dẫn của cơ quan y tế, bao gồm: đeo khẩu trang, s&aacute;t khuẩn, giữ khoảng c&aacute;ch,&nbsp;<a href="https://vtv.vn/xa-hoi/ha-noi-nguoi-dan-con-chu-quan-khong-quet-ma-qr-khai-bao-y-te-20211116184255903.htm" target="_blank" title="Hà Nội: Người dân còn chủ quan không quét mã QR khai báo y tế">khai b&aacute;o y tế</a>&nbsp;v&agrave; c&aacute;c biện ph&aacute;p kh&aacute;c.</p>

<p>Nếu vi phạm một trong c&aacute;c h&agrave;nh vi tr&ecirc;n, người thực hiện sẽ bị phạt tiền từ 1 - 3 triệu đồng.</p>

<p>Ngo&agrave;i ra, li&ecirc;n quan đến vi phạm quy định về &aacute;p dụng biện ph&aacute;p chống dịch, theo Nghị định 117/2020, người thực hiện một trong c&aacute;c h&agrave;nh vi sau sẽ bị phạt tiền từ 05 - 10 triệu đồng:</p>

<p>- Che dấu t&igrave;nh trạng bệnh của m&igrave;nh hoặc của người kh&aacute;c khi mắc bệnh truyền nhiễm đ&atilde; được c&ocirc;ng bố l&agrave; c&oacute; dịch;</p>

<p>- Kh&ocirc;ng thực hiện hoặc từ chối thực hiện biện ph&aacute;p vệ sinh, diệt tr&ugrave;ng, tẩy uế trong v&ugrave;ng c&oacute; dịch;</p>

<p>- Kh&ocirc;ng tham gia chống dịch theo quyết định huy động của Ban Chỉ đạo chống dịch;</p>

<p>- Thu tiền kh&aacute;m v&agrave; điều trị đối với trường hợp mắc bệnh truyền nhiễm thuộc nh&oacute;m A...</p>
','xahoi.jpeg',N'Đã duyệt',1);
Insert into TinTuc(Id_LoaiTinTuc,Ngay_Dang,Tieu_De,Noi_Dung,img,Trang_Thai,Id_Tac_Gia)
values(3,'12/12/2021',N'Hơn 1,35 triệu ca COVID-19 ở Việt Nam đã khỏi bệnh',N'Kể từ đầu dịch đến nay Việt Nam có 1.731.257 ca mắc COVID-19, đứng thứ 31/224 quốc gia và vùng lãnh thổ, trong khi với tỷ lệ số ca nhiễm/1 triệu dân, Việt Nam đứng thứ 138/224 quốc gia và vùng lãnh thổ (bình quân cứ 1 triệu người có 17.550 ca nhiễm).

- Đợt dịch thứ 4 (từ ngày 27/4/2021 đến nay):

+ Số ca nhiễm mới ghi nhận trong nước là 1.725.518 ca, trong đó có 1.352.469 bệnh nhân đã được công bố khỏi bệnh.

+ Có 1 tỉnh, thành phố không có ca lây nhiễm thứ phát trên địa bàn trong 14 ngày qua: Bắc Kạn.

+ Các địa phương ghi nhận số nhiễm tích lũy cao trong đợt dịch này: TP Hồ Chí Minh (503.244), Bình Dương (290.671), Đồng Nai (97.718), Tây Ninh (75.109), Hà Nội (45.838).

Tổng số ca được điều trị khỏi: 1.355.286 ca

Số bệnh nhân nặng đang điều trị là 7.291 ca, trong đó: Thở oxy qua mặt nạ: 5.195 ca; Thở oxy dòng cao HFNC: 1.145 ca; Thở máy không xâm lấn: 159 ca; Thở máy xâm lấn: 773 ca; ECMO: 19 ca

Tình hình xét nghiệm: Số lượng xét nghiệm từ 27/4/2021 đến nay đã thực hiện xét nghiệm được 30.308.498 mẫu tương đương 74.782.912 lượt người, tăng 87.124 mẫu so với ngày trước đó.

Tổng số liều vaccine phòng COVID-19 đã được tiêm là 150.935.915 liều, trong đó tiêm mũi 1 là 77.555.511 liều, tiêm mũi 2 là 68.435.813 liều, tiêm mũi 3 (tiêm bổ sung/tiêm nhắc và mũi 3 của vaccine Abdala) là 4.944.591 liều.','covid.jpeg',N'Chưa duyệt',2)

Insert into TinTuc(Id_LoaiTinTuc,Ngay_Dang,Tieu_De,Noi_Dung,img,Trang_Thai,Id_Tac_Gia)
values(1,'09/12/2021',N'Việt Nam kết thúc nhiệm kỳ Ủy viên không thường trực HĐBA 2020-2021',
N'<p>Ng&agrave;y 31/12/2021, tại Trụ sở Li&ecirc;n Hiệp Quốc ở New York đ&atilde; diễn ra lễ hạ quốc kỳ đ&aacute;nh dấu kết th&uacute;c nhiệm kỳ của 5 nước ủy vi&ecirc;n kh&ocirc;ng thường trực Hội đồng Bảo an&nbsp;<a href="https://vtv.vn/chinh-tri/viet-nam-hoan-thanh-xuat-sac-vai-tro-uy-vien-khong-thuong-truc-hdba-lien-hop-quoc-2022010109562715.htm" target="_blank" title="Việt Nam hoàn thành xuất sắc vai trò Ủy viên không thường trực HĐBA Liên Hợp Quốc">Li&ecirc;n Hợp Quốc</a>&nbsp;(HĐBA LHQ) giai đoạn 2020-2021. 5 nước n&agrave;y gồm Estonia, Niger, Saint Vincents &amp; the Grenadines, Tunisia v&agrave; Việt Nam.</p>

<p>Đ&acirc;y l&agrave; thời khắc đ&aacute;nh dấu kết th&uacute;c th&agrave;nh c&ocirc;ng nhiệm kỳ 2 năm với vai tr&ograve; ủy vi&ecirc;n kh&ocirc;ng thường trực của Việt Nam v&agrave; 4 nước. Hai năm l&agrave; qu&atilde;ng thời gian ngắn so với khối lượng 840 cuộc họp cấp đại sứ, 240 văn kiện về hơn 60 nội dung kh&aacute;c nhau. Hai năm cũng l&agrave; ngắn khi&nbsp;<a href="https://vtv.vn/covid-19.html" target="_blank" title="covid-19">COVID-19</a>&nbsp;chiếm trọn thời gian nhiệm kỳ của 5 nước.</p>

<p>&#39;&#39;Bối cảnh n&agrave;y cho ch&uacute;ng ta b&agrave;i học nếu kh&ocirc;ng c&oacute; sự hợp t&aacute;c v&agrave; đo&agrave;n kết to&agrave;n cầu, ch&uacute;ng ta kh&ocirc;ng thể tiến xa trong g&igrave;n giữ h&ograve;a b&igrave;nh, an ninh. T&ocirc;i cũng muốn gửi lời cảm ơn Việt Nam v&igrave; những hợp t&aacute;c, với vai tr&ograve; t&iacute;ch cực tại Hội đồng Bảo an v&agrave; cho c&acirc;y cầu đo&agrave;n kết m&agrave; c&aacute;c bạn đ&atilde; x&acirc;y&#39;&#39;, Đại sứ Tarek Ladeb, Trưởng Ph&aacute;i đo&agrave;n Thường trực Tunisia tại Li&ecirc;n Hợp Quốc nhấn mạnh.</p>

<p>Trong hai năm, Việt Nam đ&atilde; hai lần giữ vai tr&ograve; Chủ tịch Hội đồng Bảo an. Việt Nam đ&atilde; kiến nghị, chủ tr&igrave; đ&agrave;m ph&aacute;n, th&ocirc;ng qua 2 nghị quyết, 3 tuy&ecirc;n bố chủ tịch, 1 tuy&ecirc;n bố b&aacute;o ch&iacute; v&agrave; 6 văn kiện li&ecirc;n quan. Ngo&agrave;i ra, Việt Nam cũng đồng bảo trợ nhiều nghị quyết, ph&aacute;t biểu chung về c&aacute;c vấn đề được c&aacute;c nước đề xuất.</p>

<p>Từ ng&agrave;y 1/1/2022, c&aacute;c Tiểu vương quốc Arab Thống nhất (UAE) sẽ thay vị tr&iacute; của Việt Nam. Như vậy, UAE c&ugrave;ng với Ấn Độ sẽ l&agrave; hai đại diện của ch&acirc;u &Aacute; - Th&aacute;i B&igrave;nh Dương tại HĐBA LHQ.</p>
','ngoaigiaovietnam.jpg',N'Đã duyệt',2)
Insert into TinTuc(Id_LoaiTinTuc,Ngay_Dang,Tieu_De,Noi_Dung,img,Trang_Thai,Id_Tac_Gia)
values(1,'10/12/2021',N'Những phát ngôn ấn tượng của Tổng Bí thư trong năm 2021',
N'<p>Ph&aacute;t biểu tại Hội nghị to&agrave;n quốc c&aacute;c cơ quan nội ch&iacute;nh triển khai thực hiện Nghị quyết Đại hội lần thứ XIII của Đảng v&agrave;o ng&agrave;y 15/9/2021, Tổng B&iacute; thư Nguyễn Ph&uacute; Trọng nhắc nhở: Mỗi c&aacute;n bộ, chiến sĩ, c&ocirc;ng chức cơ quan nội ch&iacute;nh phải thường xuy&ecirc;n t&ocirc;i luyện, r&egrave;n giũa bản th&acirc;n để &quot;thanh bảo kiếm&quot; lu&ocirc;n rắn rỏi v&agrave; sắc b&eacute;n, d&aacute;m vung kiếm v&agrave; vung kiếm đ&uacute;ng l&uacute;c, ch&eacute;m đ&uacute;ng đối tượng, kh&ocirc;ng bị sứt mẻ; để &quot;l&aacute; chắn&quot; lu&ocirc;n vững v&agrave;ng, chắc chắn, kh&ocirc;ng một vi&ecirc;n đạn, mũi t&ecirc;n n&agrave;o c&oacute; thể xuy&ecirc;n thủng, nhất l&agrave; những vi&ecirc;n đạn, mũi t&ecirc;n &quot;bọc đường&quot;.</p>

<p><em>&quot;T&ocirc;i đ&atilde; nhiều lần n&oacute;i rồi, nay xin nhắc lại: Những ai c&oacute; tư tưởng n&agrave;y th&igrave; h&atilde;y dẹp sang một b&ecirc;n cho người kh&aacute;c l&agrave;m! Đời người chỉ sống c&oacute; một lần, phải sống sao cho c&oacute; &yacute; nghĩa, để kh&ocirc;ng phải x&oacute;t xa &acirc;n hận v&igrave; những việc l&agrave;m ti tiện, đớn h&egrave;n, v&ocirc; li&ecirc;m sỉ; tiền bạc lắm l&agrave;m g&igrave;, chết c&oacute; mang theo được đ&acirc;u. Danh dự mới l&agrave; điều thi&ecirc;ng li&ecirc;ng, cao qu&yacute; nhất!&quot;,&nbsp;</em>Tổng B&iacute; thư nhấn mạnh.</p>

<p><strong>KH&Ocirc;NG DỪNG, KH&Ocirc;NG NGHỈ, KH&Ocirc;NG KỂ Đ&Oacute; L&Agrave; AI, KH&Ocirc;NG C&Oacute; V&Ugrave;NG CẤM</strong></p>

<p><img alt="Những phát ngôn ấn tượng của Tổng Bí thư trong năm 2021 - Ảnh 2." id="img_58c667d0-6b31-11ec-b96a-b3089d27d468" src="https://vtv1.mediacdn.vn/thumb_w/640/2022/1/2/photo-1-1641062019520374400695.jpg" title="Những phát ngôn ấn tượng của Tổng Bí thư trong năm 2021 - Ảnh 2." /></p>

<p>Tổng B&iacute; thư Nguyễn Ph&uacute; Trọng khẳng định, cuộc chiến ph&ograve;ng chống tham nhũng l&agrave; kh&ocirc;ng ngừng, nghỉ, kh&ocirc;ng c&oacute; v&ugrave;ng cấm. Ảnh: Ph&ugrave;ng Đ&ocirc;</p>

<p>Tại buổi họp b&aacute;o sau&nbsp;<a href="https://www.baogiaothong.vn/tin-moi-nhat-dai-hoi-dang-lan-thu-xiii-channel467/" rel="nofollow" target="_blank" title="Đại hội XIII">Đại hội XIII</a>, Tổng B&iacute; thư Nguyễn Ph&uacute; Trọng nhấn mạnh tinh thần chống tham nhũng kh&ocirc;ng dừng, kh&ocirc;ng nghỉ, s&aacute;t Đại hội vẫn xử l&yacute; nhiều c&aacute;n bộ.</p>

<p><em>&quot;T&ocirc;i n&oacute;i l&agrave; kh&ocirc;ng dừng, kh&ocirc;ng nghỉ, kh&ocirc;ng kể đ&oacute; l&agrave; ai, kh&ocirc;ng c&oacute; v&ugrave;ng cấm &quot;,</em>&nbsp;Tổng B&iacute; thư n&oacute;i.</p>

<p>Nhắc lại c&acirc;u n&oacute;i của B&aacute;c Hồ &quot;cưa một c&agrave;nh c&acirc;y mọt, s&acirc;u, để cứu cả c&aacute;i c&acirc;y&quot;, Tổng B&iacute; thư cho biết, xử một v&agrave;i người để răn đe, gi&aacute;o dục, ngăn ngừa người kh&aacute;c đừng vi phạm, để cảnh tỉnh, cảnh b&aacute;o, răn đe, ngăn ngừa l&agrave; ch&iacute;nh, kh&ocirc;ng phải cốt xử cho nhiều, xử cho nặng mới l&agrave; nghi&ecirc;m.</p>

<p><strong>ĐỪNG THẤY ĐỎ TƯỞNG L&Agrave; CH&Iacute;N</strong></p>

<p><img alt="Những phát ngôn ấn tượng của Tổng Bí thư trong năm 2021 - Ảnh 3." id="img_58f259d0-6b31-11ec-9d64-d1eba08f1ba9" src="https://vtv1.mediacdn.vn/thumb_w/640/2022/1/2/photo-2-1641062019523214228211.jpg" title="Những phát ngôn ấn tượng của Tổng Bí thư trong năm 2021 - Ảnh 3." /></p>

<p>Về c&ocirc;ng t&aacute;c c&aacute;n bộ, Tổng B&iacute; thư nhấn mạnh phải lựa chọn c&oacute; đức v&agrave; t&agrave;i. Ảnh: Ph&ugrave;ng Đ&ocirc;</p>

<p>Trong phi&ecirc;n họp đầu ti&ecirc;n của Ch&iacute;nh phủ nhiệm kỳ 2021 &ndash; 2026 v&agrave;o ng&agrave;y 11/8/2021, Tổng B&iacute; thư y&ecirc;u cầu l&agrave;m tốt hơn nữa c&ocirc;ng t&aacute;c c&aacute;n bộ, nhất l&agrave; việc quản l&yacute;, nhận x&eacute;t, đ&aacute;nh gi&aacute; c&aacute;n bộ để lựa chọn, bố tr&iacute; đ&uacute;ng những người thật sự c&oacute; đức, c&oacute; t&agrave;i; thật sự &quot;cần, kiệm, li&ecirc;m, ch&iacute;nh&quot;, &quot;ch&iacute; c&ocirc;ng v&ocirc; tư&quot;; thật sự t&acirc;m huyết v&igrave; nước, v&igrave; d&acirc;n v&agrave;o c&aacute;c vị tr&iacute; l&atilde;nh đạo của bộ m&aacute;y ch&iacute;nh phủ v&agrave; ch&iacute;nh quyền c&aacute;c cấp.</p>

<p><em>&quot;Đừng &quot;nh&igrave;n g&agrave; ho&aacute; cuốc&quot;, &quot;đừng thấy đỏ tưởng l&agrave; ch&iacute;n&quot;, đừng bị c&aacute;m dỗ bởi những lợi &iacute;ch xấu xa, những việc l&agrave;m v&ocirc; li&ecirc;m sỉ. Ki&ecirc;n quyết đấu tranh loại bỏ những phần tử hư hỏng, suy tho&aacute;i về phẩm chất ch&iacute;nh trị, đạo đức, lối sống; chống mọi biểu hiện chạy chức, chạy quyền, cục bộ, ưu &aacute;i tuyển dụng người nh&agrave;, người th&acirc;n kh&ocirc;ng đủ ti&ecirc;u chuẩn&quot;,&nbsp;</em>Tổng B&iacute; thư n&oacute;i.</p>

<p><strong>SUY THO&Aacute;I TƯ TƯỞNG CH&Iacute;NH TRỊ L&Agrave; GỐC CỦA THAM NHŨNG</strong></p>

<p><img alt="Những phát ngôn ấn tượng của Tổng Bí thư trong năm 2021 - Ảnh 4." id="img_58cc0d20-6b31-11ec-a3a9-a7be86ee3731" src="https://vtv1.mediacdn.vn/thumb_w/640/2022/1/2/photo-3-16410620195251741009548.jpg" title="Những phát ngôn ấn tượng của Tổng Bí thư trong năm 2021 - Ảnh 4." /></p>

<p>Tổng B&iacute; thư Nguyễn Ph&uacute; Trọng nhấn mạnh tham nhũng v&agrave; suy tho&aacute;i về tư tưởng ch&iacute;nh trị, đạo đức, lối sống, &quot;tự diễn biến&quot;, &quot;tự chuyển h&oacute;a&quot; đều l&agrave; những biểu hiện ti&ecirc;u cực. Ảnh: Ph&ugrave;ng Đ&ocirc;</p>

<p>Ng&agrave;y 10/9/2021, ph&aacute;t biểu tại cuộc họp Bộ Ch&iacute;nh trị cho &yacute; kiến về Đề &aacute;n &quot;Sửa đổi, bổ sung chức năng, nhiệm vụ, quyền hạn của Ban Chỉ đạo Trung ương về ph&ograve;ng, chống tham nhũng&quot;, Tổng B&iacute; thư Nguyễn Ph&uacute; Trọng nhấn mạnh tham nhũng v&agrave; suy tho&aacute;i về tư tưởng ch&iacute;nh trị, đạo đức, lối sống, &quot;tự diễn biến&quot;, &quot;tự chuyển h&oacute;a&quot; đều l&agrave; những biểu hiện ti&ecirc;u cực.</p>

<p><em>&quot;Kh&ocirc;ng chỉ đấu tranh ph&ograve;ng, chống tham nhũng trong lĩnh vực kinh tế, m&agrave; quan trọng hơn phải chống ti&ecirc;u cực trong cả lĩnh vực tư tưởng ch&iacute;nh trị, đạo đức, lối sống. Hai c&aacute;i n&agrave;y n&oacute; c&oacute; li&ecirc;n quan đến nhau, sự suy tho&aacute;i về tư tưởng ch&iacute;nh trị, đạo đức, lối sống th&igrave; mới dẫn đến tham nhũng, đ&acirc;y mới l&agrave; c&aacute;i gốc, c&aacute;i cơ bản cần phải chống. C&aacute;i lợi &iacute;ch kinh tế n&oacute; thường gắn liền với quyền lợi ch&iacute;nh trị, chức quyền, với &quot;sự hư hỏng về đạo đức, lối sống&hellip;&quot;</em>, Tổng B&iacute; thư nhấn mạnh.</p>

<p><strong>MỌI ĐẢNG VI&Ecirc;N ĐỀU PHẢI TỰ &quot;GỘT RỬA&quot;, TỰ SỬA M&Igrave;NH</strong></p>

<p><img alt="Những phát ngôn ấn tượng của Tổng Bí thư trong năm 2021 - Ảnh 5." id="img_58dd9950-6b31-11ec-ad54-aba552c8676c" src="https://vtv1.mediacdn.vn/thumb_w/640/2022/1/2/photo-4-164106201952734338269.jpg" title="Những phát ngôn ấn tượng của Tổng Bí thư trong năm 2021 - Ảnh 5." /></p>

<p>Tổng B&iacute; thư nhấn mạnh c&aacute;c đảng vi&ecirc;n cần nghi&ecirc;m t&uacute;c tự ph&ecirc; b&igrave;nh, kiểm điểm, tự soi lại m&igrave;nh, đơn vị m&igrave;nh, gia đ&igrave;nh m&igrave;nh, c&aacute;i g&igrave; tốt th&igrave; ph&aacute;t huy, c&aacute;i g&igrave; khiếm khuyết th&igrave; tự điều chỉnh. Ảnh: Ph&ugrave;ng Đ&ocirc;</p>

<p>S&aacute;ng 9/12/2021, tại H&agrave; Nội, Tổng B&iacute; thư Nguyễn Ph&uacute; Trọng chủ tr&igrave; Hội nghị c&aacute;n bộ to&agrave;n quốc qu&aacute;n triệt, triển khai Kết luận v&agrave; Quy định của Ban Chấp h&agrave;nh Trung ương về c&ocirc;ng t&aacute;c x&acirc;y dựng v&agrave; chỉnh đốn Đảng.</p>

<p>Trong b&agrave;i ph&aacute;t biểu chỉ đạo, Tổng B&iacute; thư nhấn mạnh c&aacute;c đảng vi&ecirc;n cần nghi&ecirc;m t&uacute;c tự ph&ecirc; b&igrave;nh, kiểm điểm, tự soi lại m&igrave;nh, đơn vị m&igrave;nh, gia đ&igrave;nh m&igrave;nh, c&aacute;i g&igrave; tốt th&igrave; ph&aacute;t huy, c&aacute;i g&igrave; khiếm khuyết th&igrave; tự điều chỉnh, c&aacute;i g&igrave; xấu th&igrave; tự gột rửa, tự sửa m&igrave;nh, chứ kh&ocirc;ng phải chỉ đứng ngo&agrave;i m&agrave; &quot;ph&aacute;n&quot;, hoặc &quot;chờ xem&quot;, coi như m&igrave;nh v&ocirc; can.</p>

<p>Về việc kiểm điểm, tự ph&ecirc; b&igrave;nh v&agrave; ph&ecirc; b&igrave;nh, Tổng B&iacute; thư lưu &yacute; phải khắc phục t&igrave;nh trạng xu&ecirc; xoa, nể nang, thậm ch&iacute; biến cuộc họp tự ph&ecirc; b&igrave;nh v&agrave; ph&ecirc; b&igrave;nh th&agrave;nh nơi vuốt ve, ca tụng lẫn nhau; đồng thời cũng ngăn chặn, tr&aacute;nh t&igrave;nh trạng lợi dụng dịp n&agrave;y để &quot;đấu đ&aacute;&quot;, &quot;hạ bệ&quot; nhau với những động cơ kh&ocirc;ng trong s&aacute;ng.</p>
','phatrngonquantrong.jpg',N'Đã duyệt',1)
Insert into TinTuc(Id_LoaiTinTuc,Ngay_Dang,Tieu_De,Noi_Dung,img,Trang_Thai,Id_Tac_Gia)
values(2,'11/12/2021',N'Giá dầu thế giới năm 2021 tăng mạnh nhất trong 12 năm qua',
N'<p>Tuy nhi&ecirc;n, chốt phi&ecirc;n giao dịch cuối c&ugrave;ng của năm 2021,&nbsp;<a href="https://vtv.vn/kinh-te/gia-dau-co-the-tang-len-muc-100-usd-thung-20211219090148155.htm" target="_blank" title="Giá dầu có thể tăng lên mức 100 USD/thùng">gi&aacute; dầu</a>&nbsp;Brent kỳ hạn giảm 1,75 USD, hay 2,2%, xuống 77,78 USD/th&ugrave;ng. Trong khi đ&oacute;, gi&aacute; dầu ngọt nhẹ Mỹ (WTI) giao kỳ hạn giảm 1,78 USD, hay 2,31%, xuống 75,21 USD/th&ugrave;ng.</p>

<p>Gi&aacute; dầu tăng nhẹ trong phi&ecirc;n 30/12, trước những đồn đo&aacute;n rằng nhu cầu nhi&ecirc;n liệu vẫn cao d&ugrave; số ca mắc COVID-19 tăng mạnh, v&agrave; Tổ chức C&aacute;c nước Xuất khẩu Dầu mỏ (OPEC) v&agrave; c&aacute;c nước đồng minh, hay c&ograve;n gọi l&agrave; OPEC+, sẽ chỉ tăng sản lượng dần dần. Kh&eacute;p lại phi&ecirc;n n&agrave;y, gi&aacute; dầu Brent tăng 9 xu Mỹ, hay 0,11%, l&ecirc;n 79,32 USD/th&ugrave;ng. Trong khi đ&oacute;, gi&aacute; dầu WTI tăng 43 xu Mỹ, hay 0,56%, v&agrave; đ&oacute;ng phi&ecirc;n ở mức 76,9 USD/th&ugrave;ng, đ&aacute;nh dấu phi&ecirc;n thứ bảy tăng gi&aacute; li&ecirc;n tiếp.</p>

<p>Gi&aacute; dầu tăng trong phi&ecirc;n 29/12, sau khi số liệu ch&iacute;nh thức của Mỹ cho thấy lượng dầu th&ocirc; v&agrave; nhi&ecirc;n liệu dự trữ của nước n&agrave;y đ&atilde; giảm xuống trong tuần trước, lấn &aacute;t những lo ngại rằng số ca mắc COVID-19 gia tăng c&oacute; thể l&agrave;m giảm nhu cầu. Kh&eacute;p lại phi&ecirc;n n&agrave;y, gi&aacute; dầu Brent tăng 29 xu Mỹ l&ecirc;n 79,23 USD/th&ugrave;ng, trong khi gi&aacute; dầu WTI tăng 58 xu Mỹ l&ecirc;n 76,56 USD/th&ugrave;ng.</p>

<p>Gi&aacute; dầu tăng cao trong phi&ecirc;n 28/12, trong đ&oacute; gi&aacute; dầu Brent kh&eacute;p phi&ecirc;n gần mốc 80 USD/th&ugrave;ng, bất chấp sự l&acirc;y lan nhanh ch&oacute;ng của biến thể Omicon. Cuối phi&ecirc;n n&agrave;y, gi&aacute; dầu Brent tăng 34 xu Mỹ (0,4%) l&ecirc;n 78,94 USD/th&ugrave;ng, c&ograve;n gi&aacute; dầu WTI tăng 41 xu Mỹ l&ecirc;n 0,5% l&ecirc;n 75,98 USD/th&ugrave;ng.</p>

<p>Gi&aacute; dầu phi&ecirc;n 27/12 tăng hơn 2% l&ecirc;n mức cao nhất kể từ cuối th&aacute;ng 11, khi thị trường hy vọng rằng biến thể Omicron chỉ t&aacute;c động hạn chế đến nhu cầu dầu to&agrave;n cầu v&agrave;o năm 2022. Phi&ecirc;n n&agrave;y, gi&aacute; dầu Brent tăng 2,46 USD (tương đương 3,2%) l&ecirc;n 78,60 USD/th&ugrave;ng, trong khi gi&aacute; dầu WTI tiến 1,78 USD (2,4%) l&ecirc;n 75,57 USD/th&ugrave;ng.</p>

<p>Cả dầu Brent v&agrave; dầu WTI tăng tr&ecirc;n 50% trong năm 2021, nhờ sự phục hồi của kinh tế to&agrave;n cầu v&agrave; c&aacute;c nước sản xuất hạn chế sản lượng.</p>

<p>Gi&aacute; dầu to&agrave;n cầu được cho l&agrave; sẽ tiếp tục tăng trong năm tới khi nhu cầu nhi&ecirc;n liệu m&aacute;y bay gia tăng.</p>
','giadautang.jpeg',N'Đã duyệt',3)
Insert into TinTuc(Id_LoaiTinTuc,Ngay_Dang,Tieu_De,Noi_Dung,img,Trang_Thai,Id_Tac_Gia)
values(3,'09/12/2021',N'Thông tuyến kỹ thuật cao tốc Vân Đồn - Móng Cái, Quảng Ninh',
N'<p>Tuyến cao tốc n&agrave;y l&agrave; đoạn tuyến cuối c&ugrave;ng của trục cao tốc xương sống dọc tỉnh Quảng Ninh gồm Hải Ph&ograve;ng - Hạ Long - V&acirc;n Đồn - M&oacute;ng C&aacute;i d&agrave;i gần 200 km, điểm đầu kết nối trực tiếp với cao tốc H&agrave; Nội - Hải Ph&ograve;ng, điểm cuối đấu nối với đường dẫn cầu Bắc Lu&acirc;n II thuộc th&agrave;nh phố M&oacute;ng C&aacute;i.</p>

<p>&quot;Dự kiến trong th&aacute;ng 4/2022, tỉnh Quảng Ninh sẽ ho&agrave;n th&agrave;nh v&agrave; đưa v&agrave;o khai th&aacute;c to&agrave;n bộ tuyến đường cao tốc V&acirc;n Đồn - M&oacute;ng C&aacute;i&quot;, &ocirc;ng Vũ Văn Kh&aacute;nh, Gi&aacute;m đốc Ban Quản l&yacute; dự &aacute;n đầu tư x&acirc;y dựng c&aacute;c c&ocirc;ng tr&igrave;nh giao th&ocirc;ng tỉnh Quảng Ninh cho biết.</p>

<p>Cao tốc V&acirc;n Đồn - M&oacute;ng C&aacute;i c&oacute; t&ocirc;̉ng vốn đầu tư khoảng 11.195 tỷ đồng, được chia l&agrave;m 2 dự &aacute;n độc lập l&agrave; đoạn cao tốc V&acirc;n Đồn - Ti&ecirc;n Y&ecirc;n sử dụng vốn ng&acirc;n s&aacute;ch nh&agrave; nước; đoạn Ti&ecirc;n Y&ecirc;n - M&oacute;ng C&aacute;i được đầu tư theo h&igrave;nh thức đối t&aacute;c c&ocirc;ng tư, hợp đồng X&acirc;y dựng - Kinh doanh - Chuyển giao (BOT), do C&ocirc;ng ty TNHH Đầu tư v&agrave; Ph&aacute;t triển Hạ tầng V&acirc;n Đồn do Tập đo&agrave;n Sun Group l&agrave;m chủ đ&acirc;̀u tư.</p>

<p>Sau khi tuyến cao tốc ho&agrave;n th&agrave;nh, Quảng Ninh sẽ trở th&agrave;nh tỉnh sở hữu đường cao tốc xuy&ecirc;n tỉnh d&agrave;i nhất Việt Nam hiện nay, tạo th&agrave;nh tuyến cao tốc ven biển duy nhất kết nối trực tiếp, đồng bộ tới cả 3 khu kinh tế gồm khu kinh tế ven biển Quảng Y&ecirc;n, khu kinh tế V&acirc;n Đồn v&agrave; khu kinh tế Cửa khẩu M&oacute;ng C&aacute;i.</p>

<p>Tuyến cao tốc cũng kết nối với c&aacute;c tuyến cao tốc d&agrave;i nhất nước ta l&agrave; L&agrave;o Cai - H&agrave; Nội - Hải Ph&ograve;ng - M&oacute;ng C&aacute;i, g&oacute;p phần r&uacute;t ngắn thời gian di chuyển từ H&agrave; Nội tới Cửa khẩu quốc tế M&oacute;ng C&aacute;i chỉ c&ograve;n 3 giờ so với 6 giờ trước đ&acirc;y.</p>

<p>Việc ho&agrave;n th&agrave;nh đoạn tuyến cao tốc V&acirc;n Đồn - M&oacute;ng C&aacute;i được đ&aacute;nh gi&aacute; sẽ gi&uacute;p c&aacute;c khu kinh tế cửa khẩu tỉnh Quảng Ninh c&oacute; sự ph&aacute;t triển vượt bậc, tạo sức mạnh lan tỏa v&agrave; l&agrave; động lực gi&uacute;p khu vực miền Đ&ocirc;ng của Quảng Ninh tăng trưởng nhanh hơn, k&eacute;o gần khoảng c&aacute;ch về kinh tế - x&atilde; hội với c&aacute;c địa phương c&oacute; tốc độ ph&aacute;t triển cao như Hạ Long, Cẩm Phả, M&oacute;ng C&aacute;i...</p>

<p>Để đảm bảo tiến độ thi c&ocirc;ng, tỉnh Quảng Ninh đ&atilde; ph&aacute;t động nhiều chiến dịch thi đua lao động như: chiến dịch &quot;30 ng&agrave;y đ&ecirc;m&quot; ho&agrave;n th&agrave;nh giải ph&oacute;ng mặt bằng, 500 ng&agrave;y đ&ecirc;m ho&agrave;n th&agrave;nh dự &aacute;n cao tốc V&acirc;n Đồn - M&oacute;ng C&aacute;i; ph&aacute;t động đợt thi đua cao điểm &quot;100 ng&agrave;y đ&ecirc;m ho&agrave;n th&agrave;nh 3 c&ocirc;ng tr&igrave;nh động lực&quot; gồm Cao tốc V&acirc;n Đồn - M&oacute;ng C&aacute;i, Đường bao biển Hạ Long - Cẩm Phả v&agrave; Dự &aacute;n cầu Cửa Lục 1&hellip;</p>

<p>Đ&acirc;y cũng l&agrave; tuyến cao tốc đặc biệt, bởi giữ nhiều &quot;kỷ lục&quot; như: tiến độ giải ph&oacute;ng mặt bằng nhanh nhất từ trước tới nay - chỉ đ&uacute;ng 15 ng&agrave;y thần tốc đ&atilde; ho&agrave;n th&agrave;nh giải ph&oacute;ng mặt bằng to&agrave;n tuyến d&agrave;i 80 km.</p>

<p>Cao tốc V&acirc;n Đồn - M&oacute;ng C&aacute;i sở hữu nhiều c&acirc;y cầu vượt biển, vượt s&ocirc;ng suối nhất với 32 c&acirc;y cầu tr&ecirc;n to&agrave;n tuyến; trong đ&oacute;, c&oacute; cầu V&acirc;n Ti&ecirc;n - cầu d&agrave;i nhất tỉnh Quảng Ninh hiện nay, chỉ thi c&ocirc;ng xong chưa đầy 1 năm.</p>
','caotoc.jpg',N'Đã duyệt',4)
Insert into TinTuc(Id_LoaiTinTuc,Ngay_Dang,Tieu_De,Noi_Dung,img,Trang_Thai,Id_Tac_Gia)
values(2,'11/12/2021',N'Thái Lan thay đổi phong cách làm du lịch',
N'<p>Quần đảo nổi tiếng n&agrave;y đ&atilde; từng bị khai th&aacute;c&nbsp;<a href="https://vtv.vn/du-lich.html" target="_blank" title="du lịch">du lịch</a>&nbsp;kh&ocirc;ng bền vững v&agrave; đ&atilde; trở n&ecirc;n qu&aacute; tải v&agrave; &ocirc; nhiễm nghi&ecirc;m trọng. Đến khi dịch COVID-19 xuất hiện, trong khoảng thời gian tạm vắng b&oacute;ng du kh&aacute;ch, quần đảo Phi Phi mới dần lấy lại được vẻ đẹp vốn c&oacute;.</p>

<p>Gần một h&ograve;n đảo san h&ocirc; nhỏ, c&aacute;ch vịnh Maya v&agrave;i km, nh&agrave; sinh vật học biển Kullawit Limchularat lặn s&acirc;u 8m qua l&agrave;n nước trong vắt, cẩn thận thả ra những con c&aacute; mập tre nhỏ. Nhiệm vụ của anh l&agrave; kh&ocirc;i phục sự đa dạng sinh học ở khu vực n&agrave;y sau nhiều năm bị t&agrave;n ph&aacute; bởi hoạt động du lịch mất kiểm so&aacute;t.</p>

<p>&quot;Lo&agrave;i c&aacute; mập n&agrave;y sống ở đ&aacute;y biển. Ch&uacute;ng phải sống trong c&aacute;c rạn san h&ocirc;. Mục đ&iacute;ch l&agrave; khi trưởng th&agrave;nh, ch&uacute;ng sẽ ở lại đ&acirc;y, sinh sản v&agrave; gi&uacute;p phục hồi quần thể c&aacute;c lo&agrave;i&quot;, anh Kullawit Limchularat, nh&agrave; sinh vật học biển chia sẻ.</p>

<p>Trước đại dịch, Vườn quốc gia Phi Phi với những b&atilde;i c&aacute;t trắng v&agrave; rạn san h&ocirc; từng thu h&uacute;t hơn 2 triệu du kh&aacute;ch mỗi năm. Như hệ quả tất yếu, d&ograve;ng người nườm nượp k&eacute;o đến tr&ecirc;n những chiếc thuyền m&aacute;y ồn &agrave;o, &ocirc; nhiễm mất kiểm so&aacute;t&hellip; đ&atilde; t&aacute;c động rất lớn đến hệ sinh th&aacute;i của khu vực.</p>

<p>Khi đại dịch COVID-19 ập đến, số lượng du kh&aacute;ch giảm xuống gần như bằng 0. Điều n&agrave;y đưa to&agrave;n bộ quần đảo v&agrave;o t&igrave;nh trạng &quot;dưỡng bệnh&quot;.</p>

<p><img alt="Thái Lan thay đổi phong cách làm du lịch - Ảnh 1." id="img_d3bdbf20-6b7b-11ec-9de9-2358d5876809" src="https://vtv1.mediacdn.vn/2022/1/2/thai-lan-du-lich-1641094013222895190640.jpg" title="Thái Lan thay đổi phong cách làm du lịch - Ảnh 1." /></p>

<p>Du kh&aacute;ch bơi tr&ecirc;n b&atilde;i biển của quần đảo Phi Phi, Th&aacute;i Lan. (Ảnh: Getty Images)</p>

<p>Ch&iacute;nh phủ xứ Ch&ugrave;a V&agrave;ng cho biết muốn thay đổi phong c&aacute;ch l&agrave;m du lịch tại đ&acirc;y. Trọng t&acirc;m sẽ l&agrave; kh&aacute;ch du lịch cao cấp, thay v&igrave; nhắm đến số lượng lớn như trước đ&acirc;y.</p>

<p>Ngo&agrave;i ra, c&aacute;c thuyền sẽ kh&ocirc;ng c&ograve;n được ph&eacute;p neo đậu gần b&atilde;i biển, m&agrave; phải đưa kh&aacute;ch khu lịch xuống một cầu t&agrave;u c&aacute;ch xa vịnh. C&aacute;c chuyến tham quan cũng được giới hạn trong v&ograve;ng 1 giờ, tối đa 300 kh&aacute;ch/chuyến. Tại c&aacute;c địa điểm quan trọng kh&aacute;c của quần đảo, số lượng du kh&aacute;ch cũng sẽ được điều chỉnh.</p>

<p>&quot;Ch&uacute;ng t&ocirc;i muốn đảm bảo rằng mọi người đều được gi&aacute;o dục v&agrave; c&oacute; tr&aacute;ch nhiệm với m&ocirc;i trường. Đ&oacute; l&agrave; l&yacute; do tại sao ch&uacute;ng t&ocirc;i th&agrave;nh lập Trung t&acirc;m Kh&aacute;m ph&aacute; Biển, nơi ch&uacute;ng t&ocirc;i cho du kh&aacute;ch thấy thế n&agrave;o l&agrave; đa dạng sinh học, mối quan hệ giữa h&agrave;nh vi của bạn v&agrave; những t&aacute;c động đến san h&ocirc;&quot;, b&agrave; Sirithon Thamrongnawasawat, Ph&oacute; Chủ tịch phụ tr&aacute;ch bền vững v&agrave; ph&aacute;t triển của Singha Estate, cho hay.</p>
','thailand.jpg',N'Đã duyệt',3)
Insert into TinTuc(Id_LoaiTinTuc,Ngay_Dang,Tieu_De,Noi_Dung,img,Trang_Thai,Id_Tac_Gia)
values(3,'12/12/2021',N'Hà Nội sẽ tổ chức Lễ phát động ra quân Năm An toàn giao thông 2022',
N'<p>UBND Th&agrave;nh phố&nbsp;<a href="https://vtv.vn/ha-noi.html" target="_blank" title="Hà Nội">H&agrave; Nội</a>&nbsp;ban h&agrave;nh Kế hoạch phối hợp số 327/KH-UBND về tổ chức &quot;Lễ ph&aacute;t động ra qu&acirc;n Năm&nbsp;<a href="https://vtv.vn/an-toan-giao-thong.html" target="_blank" title="An toàn giao thông">An to&agrave;n giao th&ocirc;ng</a>&nbsp;2022 v&agrave; đợt cao điểm bảo đảm trật tự, an to&agrave;n giao th&ocirc;ng Tết Nguy&ecirc;n đ&aacute;n Nh&acirc;m Dần v&agrave; Lễ hội Xu&acirc;n năm 2022&quot;.</p>

<p>Theo đ&oacute;, nhằm tạo kh&iacute; thế mới cho việc thiết lập trật tự, an to&agrave;n giao th&ocirc;ng ngay từ những ng&agrave;y đầu của năm 2022, đồng thời, nhằm tạo sự chuyển biến t&iacute;ch cực về nhận thức v&agrave; h&agrave;nh động của c&aacute;c lực lượng chức năng cũng như của to&agrave;n d&acirc;n trong việc tham gia bảo đảm trật tự, an to&agrave;n giao th&ocirc;ng; triển khai đồng bộ c&aacute;c nhiệm vụ, giải ph&aacute;p giảm tai nạn giao th&ocirc;ng tr&ecirc;n cả 3 ti&ecirc;u ch&iacute;... bắt đầu từ 7h00, ng&agrave;y 06/01/2022, tại Tượng đ&agrave;i L&yacute; Th&aacute;i Tổ, phố Đinh Ti&ecirc;n Ho&agrave;ng, quận Ho&agrave;n Kiếm, UBND TP H&agrave; Nội phối hợp với Ủy ban ATGT Quốc gia sẽ tổ chức Lễ ph&aacute;t động ra qu&acirc;n.</p>

<p>Lực lượng tham gia đội h&igrave;nh Khối đứng tại buổi Lễ ra qu&acirc;n gồm: C&ocirc;ng an Th&agrave;nh phố (Lực lượng Cảnh s&aacute;t giao th&ocirc;ng, Lực lượng Cảnh s&aacute;t cơ động, Lực lượng Cảnh s&aacute;t trật tự); Sở Giao th&ocirc;ng vận tải (Lực lượng Thanh tra giao th&ocirc;ng vận tải) v&agrave; Bộ Tư lệnh Thủ đ&ocirc;.</p>

<p>Ngay sau Lễ ra qu&acirc;n, c&aacute;c Sở, ban, ng&agrave;nh Th&agrave;nh phố, UBND c&aacute;c quận, huyện, thị x&atilde; v&agrave; c&aacute;c đơn vị c&oacute; li&ecirc;n quan triển khai ngay c&aacute;c nhiệm vụ, giải ph&aacute;p nhằm bảo đảm trật tự, an to&agrave;n giao th&ocirc;ng năm 2022; trước mắt, tập trung mở đợt cao điểm c&ocirc;ng t&aacute;c bảo đảm trật tự, an to&agrave;n giao th&ocirc;ng dịp Tết Nguy&ecirc;n đ&aacute;n Nh&acirc;m Dần v&agrave; Lễ hội Xu&acirc;n năm 2022 theo chỉ đạo của Thủ tướng Ch&iacute;nh phủ tại C&ocirc;ng điện số 1725/CĐ-TTg, ng&agrave;y 13/12/2021.</p>

<p>Căn cứ nội dung Kế hoạch phối hợp, UBND Th&agrave;nh phố đề nghị Văn ph&ograve;ng Ủy ban ATGT Quốc gia; c&aacute;c Sở, ban, ng&agrave;nh v&agrave; c&aacute;c đơn vị c&oacute; li&ecirc;n quan tập trung triển khai thực hiện; bố tr&iacute; đầy đủ lực lượng, phương tiện, thiết bị v&agrave; c&oacute; mặt đ&uacute;ng giờ để buổi Lễ ra qu&acirc;n được th&agrave;nh c&ocirc;ng, đảm bảo c&aacute;c y&ecirc;u cầu về ph&ograve;ng, chống dịch Covid-19 theo quy định.</p>
','giaotongantoan.jpg',N'Đã duyệt',2)
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
values(N'Nguyễn Hữu Tuấn','tuanhpls@gmail.com',N'avatar2.png','nguyenhuudung','1')
insert into NguoiDung
values(N'Hứa Văn Đức','Duc2212@gmail.com',N'avatar3.png','huavanduc','1')
insert into NguoiDung
values(N'Ngô Văn Tuấn','tuanvql@gmail.com',N'avatar4.png','nguyentuan','1')
insert into NguoiDung
values(N'Nguyễn Văn Được','duoclsv@gmail.com',N'avatar5.png','nguyenduoc','1')
insert into NguoiDung
values(N'Hồng Hoàng Hà','hoangha@gmail.com',N'avatar2.png','hongha','1')
insert into NguoiDung
values(N'Ngô Diệc Phàm','duchua@gmail.com',N'avatar4.png','quangteo','1')
insert into NguoiDung
values(N'Hứa Văn Yên','huayen@gmail.com',N'avatar6.png','huayen','1')
insert into NguoiDung
values(N'Hoàng Hắc Nhiên','hoangnhien@gmail.com',N'avatar5.png','boyeu','1')

create table BinhLuan(
	Id_Binh_Luan int primary key identity,
	Noi_Dung_BL nvarchar(500),
	Ngay_Binh_Luan date,
	Id_TinTuc int,
	Id_NguoiDung int,
	constraint fk_tintuc foreign key (Id_TinTuc) references TinTuc(Id_TinTuc),
	constraint fk_nguoidung foreign key(Id_NguoiDung) references NguoiDung(Id_NguoiDung)
	)
