/*<TOAD_FILE_CHUNK>*/
set serveroutput on
declare
s_name customers.name%type;
s_cgpa customers.phone_no%type;
begin
select name,phone_no into s_name,s_cgpa from customers where id=2;
DBMS_OUTPUT.PUT_LINE('STUDENT NAME='||s_name||' STUDENT CGPA='||s_cgpa);
end;
/

/*<TOAD_FILE_CHUNK>*/
SET SERVEROUTPUT ON
DECLARE
   counter NUMBER(2);
   t_id product.id%type;
   t_name product.name%type;
   t_salary product.price%type;
BEGIN
   FOR counter IN 1..10   
   LOOP
      SELECT id,name,price INTO t_id,t_name,t_salary FROM product WHERE id=counter;
      DBMS_OUTPUT.PUT_LINE ('Name= ' || t_name);
      DBMS_OUTPUT.PUT_LINE ('Salary= ' || t_salary);
      DBMS_OUTPUT.PUT_LINE ('-----------');
   END LOOP;
END;
/

/*<TOAD_FILE_CHUNK>*/
set serveroutput on
declare
counter1 NUMBER(2);
counter2 NUMBER(2);
begin
select count(gender) into counter1 from student where gender='male';
select count(gender) into counter2 from student where gender='female';
IF counter1>counter2 THEN
DBMS_OUTPUT.PUT_LINE('MAJORITY male='||counter1);
ELSE
DBMS_OUTPUT.PUT_LINE('MAJORITY female='||counter2);
END IF;
end;
/

/*<TOAD_FILE_CHUNK>*/
set serveroutput on
DECLARE
   s_marks NUMBER(2);
   s_grade char(1):='G';
BEGIN
SELECT mark INTO s_marks FROM student where roll=1001;
IF s_marks>=80 THEN  s_grade:='A';
ELSIF s_marks>=70 AND s_marks<80 THEN s_grade:='B';
ELSIF s_marks>=60 AND s_marks<70 THEN s_grade :='C';
ELSIF s_marks>=50 AND s_marks<60 THEN s_grade :='D'; 
ELSIF s_marks>=40 AND s_marks<50 THEN s_grade :='E';
ELSIF s_marks<40 THEN s_grade :='F';
END IF;
DBMS_OUTPUT.PUT_LINE('The grade is : ' || s_grade);
END;
/

/*<TOAD_FILE_CHUNK>*/
SET SERVEROUTPUT ON
DECLARE
   type namearray IS VARRAY(5) of TEACHER.name%type;
   a_name namearray:=namearray();
   counter NUMBER(2);
BEGIN
   counter:=1;
   while counter<=5
   LOOP
      a_name.extend();
      SELECT name INTO a_name(counter) FROM teacher WHERE id=counter;
      DBMS_OUTPUT.PUT_LINE (a_name(counter));
      counter:=counter+1;
      DBMS_OUTPUT.PUT_LINE ('-----------');
   END LOOP;
END;
/

/*<TOAD_FILE_CHUNK>*/
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

/*<TOAD_FILE_CHUNK>*/
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

