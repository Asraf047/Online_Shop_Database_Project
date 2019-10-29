set SERVEROUTPUT ON

DECLARE
f UTL_FILE.file_type;
CURSOR c is 
SELECT * FROM buy;

BEGIN
f:=UTL_FILE.FOPEN('MYDIR','output1.csv','W');
UTL_FILE.put(f,'id'||','||'p_id'||','||'s_id'||','||'b_cost'||','||'quantity');
UTL_FILE.NEW_LINE(f);
for c_record in c
    LOOP
    UTL_FILE.put(f,c_record.id||','||c_record.p_id||','||c_record.s_id||','||c_record.b_cost||','||c_record.quantity);
    UTL_FILE.NEW_LINE(f);
    end LOOP;
UTL_FILE.FCLOSE(f);
end;
/

select * from buy;