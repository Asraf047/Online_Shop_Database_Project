drop table supply;
drop table buy;
drop table product;
drop table customers;
drop table seller;
drop table supplier;


create table customers( 
   id number(10) not null,
   name varchar(15),
   phone_no number(12),
   address varchar(15),
   primary key (id)
);

insert into customers(id,name,phone_no,address) values (1,'karim',01719,'khulna');
insert into customers(id,name,phone_no,address) values (2,'rahim',01719,'dhaka');
insert into customers(id,name,phone_no,address) values (3,'marim',01719,'vola');
insert into customers(id,name,phone_no,address) values (4,'tarim',01719,'jossor');
insert into customers(id,name,phone_no,address) values (5,'parim',01719,'khulna');
insert into customers(id,name,phone_no,address) values (6,'karim',01719,'khulna');
insert into customers(id,name,phone_no,address) values (7,'rahim',01719,'dhaka');
insert into customers(id,name,phone_no,address) values (8,'marim',01719,'vola');
insert into customers(id,name,phone_no,address) values (9,'tarim',01719,'jossor');
insert into customers(id,name,phone_no,address) values (10,'parim',01719,'khulna');

create table seller( 
   id number(10) not null,
   name varchar(15),
   phone_no number(12),
   address varchar(15),
   primary key (id)
);

insert into seller(id,name,phone_no,address) values (1,'karim',01719,'khulna');
insert into seller(id,name,phone_no,address) values (2,'rahim',01719,'dhaka');
insert into seller(id,name,phone_no,address) values (3,'marim',01719,'vola');
insert into seller(id,name,phone_no,address) values (4,'tarim',01719,'jossor');
insert into seller(id,name,phone_no,address) values (5,'parim',01719,'khulna');
insert into seller(id,name,phone_no,address) values (6,'karim',01719,'khulna');
insert into seller(id,name,phone_no,address) values (7,'rahim',01719,'dhaka');
insert into seller(id,name,phone_no,address) values (8,'marim',01719,'vola');
insert into seller(id,name,phone_no,address) values (9,'tarim',01719,'jossor');
insert into seller(id,name,phone_no,address) values (10,'parim',01719,'khulna');

create table supplier( 
   id number(10) not null,
   name varchar(15),
   phone_no number(12),
   address varchar(15),
   primary key (id)
);

insert into supplier(id,name,phone_no,address) values (1,'karim',01719,'khulna');
insert into supplier(id,name,phone_no,address) values (2,'rahim',01719,'dhaka');
insert into supplier(id,name,phone_no,address) values (3,'marim',01719,'vola');
insert into supplier(id,name,phone_no,address) values (4,'tarim',01719,'jossor');
insert into supplier(id,name,phone_no,address) values (5,'parim',01719,'khulna');
insert into supplier(id,name,phone_no,address) values (6,'karim',01719,'khulna');
insert into supplier(id,name,phone_no,address) values (7,'rahim',01719,'dhaka');
insert into supplier(id,name,phone_no,address) values (8,'marim',01719,'vola');
insert into supplier(id,name,phone_no,address) values (9,'tarim',01719,'jossor');
insert into supplier(id,name,phone_no,address) values (10,'parim',01719,'khulna');

create table product( 
   id number(10) not null,
   s_id number(10) not null,
   name varchar(15),
   price number(12) not null,
   type varchar(10),
   weight number(12) default 0.0,
   quantity number(12),
   color varchar(15),
   primary key (id),
   foreign key(s_id) references seller(id) on delete cascade
);

insert into product(id,s_id,name,price,type,weight,quantity,color) values (1,2,'motor',100,'electric',150,30,'black');
insert into product(id,s_id,name,price,type,weight,quantity,color) values (2,3,'fan',200,'electric',550,10,'white');
insert into product(id,s_id,name,price,type,weight,quantity,color) values (3,1,'bulb',300,'electric',50,20,'white');
insert into product(id,s_id,name,price,type,quantity,color) values (4,1,'shirt',1000,'cloth',10,'black');
insert into product(id,s_id,name,price,type,quantity,color) values (5,5,'pant',2000,'cloth',10,'black');
insert into product(id,s_id,name,price,type,weight,quantity,color) values (6,2,'motor',100,'electric',150,30,'black');
insert into product(id,s_id,name,price,type,weight,quantity,color) values (7,3,'fan',200,'electric',550,10,'white');
insert into product(id,s_id,name,price,type,weight,quantity,color) values (8,1,'bulb',300,'electric',50,20,'white');
insert into product(id,s_id,name,price,type,quantity,color) values (9,1,'shirt',1000,'cloth',10,'black');
insert into product(id,s_id,name,price,type,quantity,color) values (10,5,'pant',2000,'cloth',10,'black');

create table supply( 
   id number(10) not null,
   d_id number(10) not null,
   p_id number(10) not null,
   c_id number(10) not null,
   d_cost number(12),
   quantity number(12),
   primary key (id),
   foreign key(d_id) references supplier(id) on delete cascade,
   foreign key(p_id) references product(id) on delete cascade,
   foreign key(c_id) references customers(id) on delete cascade
);

insert into supply(id,d_id,p_id,c_id,d_cost,quantity) values (1,3,2,1,100,1);
insert into supply(id,d_id,p_id,c_id,d_cost,quantity) values (2,1,1,1,200,4);
insert into supply(id,d_id,p_id,c_id,d_cost,quantity) values (3,2,4,3,1000,3);
insert into supply(id,d_id,p_id,c_id,d_cost,quantity) values (4,1,2,5,400,1);
insert into supply(id,d_id,p_id,c_id,d_cost,quantity) values (5,4,1,3,200,2);
insert into supply(id,d_id,p_id,c_id,d_cost,quantity) values (6,3,2,1,100,1);
insert into supply(id,d_id,p_id,c_id,d_cost,quantity) values (7,1,1,1,200,4);
insert into supply(id,d_id,p_id,c_id,d_cost,quantity) values (8,2,4,3,1000,3);
insert into supply(id,d_id,p_id,c_id,d_cost,quantity) values (9,1,2,5,400,1);
insert into supply(id,d_id,p_id,c_id,d_cost,quantity) values (10,4,1,3,200,2);

create table buy( 
   id number(10) not null,
   p_id number(10) not null,
   s_id number(10) not null,
   b_cost number(12) not null,
   quantity number(12) not null,
   primary key (id),
   foreign key(p_id) references product(id) on delete cascade,
   foreign key(s_id) references seller(id) on delete cascade
);

insert into buy(id,p_id,s_id,b_cost,quantity) values (1,3,2,100,50);
insert into buy(id,p_id,s_id,b_cost,quantity) values (2,1,1,10,30);
insert into buy(id,p_id,s_id,b_cost,quantity) values (3,2,2,300,10);
insert into buy(id,p_id,s_id,b_cost,quantity) values (4,7,2,30,4);
insert into buy(id,p_id,s_id,b_cost,quantity) values (5,5,2,90,7);
insert into buy(id,p_id,s_id,b_cost,quantity) values (6,8,2,45,4);
insert into buy(id,p_id,s_id,b_cost,quantity) values (7,9,2,20,9);


