set serveroutput on

create or REPLACE function f1(p_name in varchar2, p_color in varchar2 ) return number IS
p_quantity product.quantity%type;

begin
select quantity into p_quantity from product where name=p_name and color=p_color;
return p_quantity;
end;
/
show ERRORS PROCEDURE p1;

set serveroutput on

DECLARE
   p_quantity product.quantity%type;

begin
      p_quantity:=f1('fan', 'black');
      DBMS_OUTPUT.PUT_LINE('Product quantity='||p_quantity);
end;
/