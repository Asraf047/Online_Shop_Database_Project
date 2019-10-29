set serveroutput on

declare
p_name product.name%Type;
p_id product.id%Type;

cursor cur_product is
select id,name into p_id,p_name from product where quantity<20;

begin 

if not cur_product%isopen then
	open cur_product;
end if;

loop
	fetch cur_product into p_id,p_name;
	exit when cur_product%notfound;
	DBMS_OUTPUT.PUT_LINE(cur_product%rowcount||'.'||'Product id = ' || p_id ||'  Product Name = ' || p_name);
end loop;

close cur_product;
end;
/