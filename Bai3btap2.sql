use bai3btap2lms;

SELECT * FROM quanlybanhanglms.customer;
SELECT * FROM quanlybanhanglms.product;
SELECT * FROM quanlybanhanglms.orderdetail;
SELECT * FROM quanlybanhanglms.oder;
/*
*/
--  Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select c.Name, p.pname as sanpham
from customer c inner join oder o on c.cid = o.cid inner join orderdetail od on od.oid = o.oid inner join product p on p.pID = od.pID;
--   Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào 
select c.Name
from customer c inner join oder o on c.cid = o.cid inner join orderdetail od on od.oid = o.oid inner join product p on p.pID = od.pID
group by o.cid  = 0;
--   Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = 
-- odQTY*pPrice) 
select o.oID, date(o.oDate) as NgayBan, sum(od.odQTY*p.pPrice) as GiaTien
from customer c inner join oder o on c.cid = o.cid inner join orderdetail od on od.oid = o.oid inner join product p on p.pID = od.pID
group by o.cid

