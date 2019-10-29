
SET SERVEROUTPUT ON
DECLARE
   c_name customers.name%type;
   c_phone customers.phone_no%type;
   c_address customers.address%type;
   s_name supplier.name%type;
   s_phone supplier.phone_no%type;
   p_name product.name%type;
   p_price product.price%type;
   p_color product.color%type;
   
BEGIN
   FOR counter IN 1..10   
   LOOP
   
select name,phone_no,address INTO c_name,c_phone,c_address from customers where id in( 
select c_id from supply where id =counter 
);

select name,phone_no INTO s_name,s_phone from supplier where id in( 
select d_id from supply where id =counter 
);

select name,price,color INTO p_name,p_price,p_color from product where id in( 
select p_id from supply where id =counter 
);
      DBMS_OUTPUT.PUT_LINE ('Supply ID = ' || counter);
      DBMS_OUTPUT.PUT_LINE ('Customer Name = ' || c_name);
      DBMS_OUTPUT.PUT_LINE ('Customer Phone = ' || c_phone);
      DBMS_OUTPUT.PUT_LINE ('Customer Address = ' || c_address);
      DBMS_OUTPUT.PUT_LINE ('Supplier Name = ' || s_name);
      DBMS_OUTPUT.PUT_LINE ('Supplier Phone = ' || s_phone);
      DBMS_OUTPUT.PUT_LINE ('Product Name = ' || p_name);
      DBMS_OUTPUT.PUT_LINE ('Product Price = ' || p_price);
      DBMS_OUTPUT.PUT_LINE ('Product Color = ' || p_color);
      DBMS_OUTPUT.PUT_LINE ('-----------');
   END LOOP;
END;
/


