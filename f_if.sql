
SET SERVEROUTPUT ON
DECLARE
	counter NUMBER(2);
    p_name product.name%type;
    f_price product.price%type;
    d_price product.price%type;
	
BEGIN
 FOR counter IN 1..10   
   LOOP
    SELECT name,price INTO p_name,f_price FROM product WHERE id=counter;

    IF f_price < 100 THEN d_price := f_price;
    ELSIF f_price >= 100 and f_price <500 THEN d_price :=  f_price - (f_price*0.10);
    ELSIF f_price >= 500 and f_price <=1000 THEN d_price :=  f_price - (f_price*0.20);
    ELSIF f_price >= 1000 and f_price <=5000 THEN d_price :=  f_price - (f_price*0.30);
    ELSE d_price :=  f_price - (f_price*0.40); 
    END IF;

    DBMS_OUTPUT.PUT_LINE ('Product Name = ' || p_name);
    DBMS_OUTPUT.PUT_LINE ('Full Price = ' || f_price);
    DBMS_OUTPUT.PUT_LINE ('Disounted Price = ' || d_price);
    DBMS_OUTPUT.PUT_LINE ('-----------');
  END LOOP;
END;
/





