alter table product add quantty number(10);
alter table product modify quantty integer;
alter table product rename column quantty to quantity;
alter table product drop column quantty;

update supply set quantity=5,cost=2000 where c_id=3;
delete from supply where c_id=10;

select * from student;
select name,salary from teacher where id=2;
select name,salary*2 from teacher where id>2;
select name,salary*2 from teacher where id in(2,3);
select name,salary*2 from teacher order by salary desc; //reverse order

select name,color from product;
select distinct(color) from product;
select name,color from product order by color desc;
select name,color from product where id=1 or id=3;
select c_id,d_cost from supply where d_cost between 100 and 1000;
select c_id,d_cost from supply where d_cost not between 100 and 1000;
select c_id,d_cost from supply where d_cost>=100 and d_cost<=1000;
select c_id,d_cost from supply where d_cost in(100,2000);//exactly search
select c_id,d_cost from supply where d_cost in(100,2000);
select name,address from customers where name like '%rim%';













#create table:#
unique
Not null
check(salary>=20000 and salary<=90000)
default 2.00
primary key(Id)
foreign key(p_id) references product(id) on delete cascade,
insert into supplier(id,name,phone_no,address) values (1,'karim',01719,'khulna');


ALTER TABLE `notice` ADD `w_id` INT(255) NOT NULL AUTO_INCREMENT AFTER `heading`, ADD foreign key (`w_id`) references register(id) on delete cascade;


















