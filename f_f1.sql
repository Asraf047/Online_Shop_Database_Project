set SERVEROUTPUT ON

DECLARE
f UTL_FILE.file_type;
line varchar(10000);
id buy.id%type;
p_id buy.p_id%type;
s_id buy.s_id%type;
b_cost buy.b_cost%type;
quantity buy.quantity%type;

BEGIN
f:=UTL_FILE.FOPEN('MYDIR','insert1.csv','R');
IF UTL_FILE.IS_OPEN(f) then
UTL_FILE.GET_LINE(f,line,1000);
LOOP BEGIN
    UTL_FILE.GET_LINE(f,line,1000);
    if line is NULL THEN EXIT;
    end if;
    id:=regexp_substr(line,'[^,]+',1,1);
    p_id:=regexp_substr(line,'[^,]+',1,2);
    s_id:=regexp_substr(line,'[^,]+',1,3);
    b_cost:=regexp_substr(line,'[^,]+',1,4);
    quantity:=regexp_substr(line,'[^,]+',1,5);
    INSERT INTO buy VALUES(id,p_id,s_id,b_cost,quantity);
    COMMIT;
    exception
    when no_data_found then exit;
    end;
end loop;
end if;
UTL_FILE.FCLOSE(f);
end;
/
select * from buy;