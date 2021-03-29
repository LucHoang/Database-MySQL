create database QLBH;
create table Customer(
cID int primary key auto_increment,
Name varchar(25),
cAge tinyint
);

create table Oder(
oID int primary key auto_increment,
cID int,
foreign key(cid) references Customer(cid),
oDate datetime,
oTotalPrice int 
);

create table Product(
pID int primary key,
pName varchar(25),
pPrice int
);

create table OrderDetail(
oID int,
foreign key(oid) references oder(oid),
pID int,
foreign key(pid) references product(pid),
odQTY int
);

INSERT INTO customer (name, cage)
VALUES ('Minh Quan', 10);

insert into orderdetail
values (1, 1, 3);

alter table orderdetail
add primary key(oid, pid);

-- 2.	Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order, danh sách phải sắp xếp theo thứ tự ngày tháng, hóa đơn mới hơn nằm trên 
select oid, cid, odate, oTotalPrice
from oder as o
order by odate desc;

-- 3.	Hiển thị tên và giá của các sản phẩm có giá cao nhất 
select pname, pprice
from product as p
order by pprice desc
limit 1;

-- 4.	Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách đó 
select c.name, p.pname 
from customer as c, oder as o, orderdetail as od, product as p
where c.cid = o.cid
and o.oid = od.oid
and od.pid = p.pid;

-- 5.	Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào 
select c.name
from customer as c
left join oder as o on c.cid = o.cid
where o.cid is null;

-- 6.	Hiển thị chi tiết của từng hóa đơn
select o.oid, o.odate, od.odqty, p.pname, p.pprice
from oder as o, orderdetail as od, product as p
where o.oid = od.oid
and od.pid = p.pid;

-- 7.	Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
select od.oid, o.odate, sum(od.odqty * p.pprice) as Total
from oder as o, orderdetail as od, product as p
where o.oid = od.oid
and od.pid = p.pid
group by od.oid