set serveroutput on
create or replace trigger tg2
BEFORE INSERT OR UPDATE OF d_cost ON supply 
REFERENCING OLD AS o NEW AS n
FOR EACH ROW
declare 
    p_price integer;
begin
    select product.price into p_price from product where product.id = :n.p_id;
    :n.d_cost:= p_price * :n.quantity;
end;
/
show errors