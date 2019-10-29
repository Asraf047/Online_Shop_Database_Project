
SET SERVEROUTPUT ON

create or REPLACE PROCEDURE p7(c_ids in number) IS
   c_name customers.name%type;
   c_phone customers.phone_no%type;
   c_address customers.address%type;
   s_name supplier.name%type;
   s_phone supplier.phone_no%type;
   p_name product.name%type;
   p_price product.price%type;
   p_color product.color%type;
   
BEGIN

   
select name,phone_no,address INTO c_name,c_phone,c_address from customers where id in( 
select c_id from supply where id =c_ids 
);

select name,phone_no INTO s_name,s_phone from supplier where id in( 
select d_id from supply where id =c_ids 
);

select name,price,color INTO p_name,p_price,p_color from product where id in( 
select p_id from supply where id =c_ids 
);

      DBMS_OUTPUT.PUT_LINE ('Customer Name = ' || c_name);
      DBMS_OUTPUT.PUT_LINE ('Customer Phone = ' || c_phone);
      DBMS_OUTPUT.PUT_LINE ('Customer Address = ' || c_address);
      DBMS_OUTPUT.PUT_LINE ('Supplier Name = ' || s_name);
      DBMS_OUTPUT.PUT_LINE ('Supplier Phone = ' || s_phone);
      DBMS_OUTPUT.PUT_LINE ('Product Name = ' || p_name);
      DBMS_OUTPUT.PUT_LINE ('Product Price = ' || p_price);
      DBMS_OUTPUT.PUT_LINE ('Product Color = ' || p_color);
      DBMS_OUTPUT.PUT_LINE ('-----------');

END;
/
show ERRORS PROCEDURE p7;

set serveroutput on

begin
p7(3);
end;
/
