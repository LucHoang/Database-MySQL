# Database-MySQL
I.	Đọc hiểu Bài toán Quản lý bán hàng sau:  
Có một siêu thị điện máy chuyên bán các mặt hàng như Máy giặt, tủ lạnh, bếp điện,…
Để quản lý bán hàng trong siêu thị này người ta đã thiết kế ra một CSDL như sau
 
•	Bảng Customer lưu danh sách những khách hàng đã đến cửa hàng gồm cả những người có mua hàng và cả những người không mua hàng.
•	Mỗi khách hàng khi mua hàng thi siêu thị sẽ viết một hóa đơn mua hàng gồm các thông tin mã khách(cID), số hóa đơn(oID), ngày mua(oDate), danh sách tên các sản phẩm được mua, số lượng mỗi loại, giá tiền của sản phẩm. tất cả các thông tin trên được lưu trong 3 bảng Order, Orderdetail và Product.
•	Mỗi khách hàng có thể mua hàng nhiều lần, nên có thể có nhiều hóa đơn cho mỗi khách.
•	Mỗi hóa đơn có thể có nhiều mặt hàng
•	Mỗi mặt hàng trong hóa đơn có thể được mua với số lượng nhiều hơn 1 cái.
Chú ý dữ liệu có thể được nhập thêm tùy ý.15
II.	Hãy Tạo một CSDL đặt tên là ‘QLBH’ + <tên máy(tên Lab)>.
III.	Sử dụng SQL Query Analyzer để làm việc với CSDL trên theo các bước sau::
(Chú ý: Toàn bộ các câu lệnh phải lưu vào một file đặt tên là QLBH<LAB..>.sql. Nếu học viên không lưu đúng tên file bài thi sẽ được 0 điểm: Ví dụ QLBHLAB45.sql)
1.	Tạo 4 bảng và chèn dữ liệu như hình dưới đây: 
Customer (Lưu danh sách các khách hàng)
cID (int primary key) 	Name (VarChar (25))	cAge (tinyint)
1	Minh Quan	10
2	Ngoc Oanh	20
3	Hong Ha	50
Order (Lưu các hóa đơn)
oID (int primary key)	cID (int foregin key tham chiếu  tới cID của Customer)	oDate (Datetime)
(Ngày mua)	oTotalPrice (int)
Tổng tiền của hóa đơn
1	1	3/21/2006	Null
2	2	3/23/2006	Null
3	1	3/16/2006	Null
Product (Lưu danh sách tên và giá các sản phẩm có tại cửa hàng)
pID (int primary key)	pName (varchar(25))	pPrice (int)
1	May Giat	3
2	Tu Lanh	5
3	Dieu Hoa	7
4	Quat	1
5	Bep Dien	2
OrderDetail (Lưu chi tiết của hóa đơn, gồm tên sản phẩm và số lượng)
oID (int foreign key tham chiếu tới oID của Order)	pID (int foreign key tham chiếu tới pID của Product)	odQTY (int)
(Số lượng)
1	1	3
1	3	7
1	4	2
2	1	1
3	1	8
2	5	4
2	3	3


2.	Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order, danh sách phải sắp xếp theo thứ tự ngày tháng, hóa đơn mới hơn nằm trên như hình sau:
 
3.	Hiển thị tên và giá của các sản phẩm có giá cao nhất như sau:
 
4.	Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách đó như sau:
 
5.	Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào như sau:
 
6.	Hiển thị chi tiết của từng hóa đơnnhư sau :
 
7.	Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice) như sau:
 

