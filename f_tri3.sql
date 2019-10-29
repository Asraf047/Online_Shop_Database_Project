set serveroutput on
create or replace trigger tg4
after insert or delete or update on buy
for each row
declare 
    t_avail_no integer;
begin
    select product.quantity into t_avail_no from product where product.id = :new.p_id;
   
        t_avail_no := t_avail_no + :new.quantity;
		update product set product.quantity = t_avail_no where product.id = :new.p_id;  

end;
/
show errors