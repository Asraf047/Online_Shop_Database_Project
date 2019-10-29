select count(id) from product;
select sum(quantity) as totalAmount from product;
update supply set d_cost=2000,quantity=5 where c_id=3;
delete from supply where c_id=10;
select name,color from product;
select distinct(color) from product;
select name,color from product order by color desc;
select name,color from product where id=1 or id=3;
select c_id,d_cost from supply where d_cost between 100 and 1000;
select c_id,d_cost from supply where d_cost not between 100 and 1000;
select c_id,d_cost from supply where d_cost>=100 and d_cost<=1000;
select c_id,d_cost from supply where d_cost in(100,2000);
select c_id,d_cost from supply where d_cost in(100,2000);
select name,address from customers where name like '%rim%';
select p_id,sum(quantity) from supply group by p_id;

select product.name as product_name,product.price,product.color,supplier.name as supplier_name 
from product join supplier on supplier.id=product.id;