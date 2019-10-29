set serveroutput on
create or replace trigger tg1
after insert or delete or update on supply
for each row
declare 
    t_avail_no integer;
begin
    select product.quantity into t_avail_no from product where product.id = :new.p_id;
    
    if t_avail_no >= :new.quantity then
        t_avail_no := t_avail_no - :new.quantity;
		update product set product.quantity = t_avail_no where product.id = :new.p_id;
	
	else
		DBMS_OUTPUT.PUT_LINE('Not enought product found, only ' || t_avail_no || 'have in stock.');
    
    end if;    

end;
/
show errors


create assertion balance_constraint check(
	not exists(
			select * from loan where not exists ( 
				   select * from borrower, depositor, account 
				   where 
				   loan.loan_number = borrower.loan_number and 
				   borrower.customer_name = depositor.customer_name and 
				   depositor.account_number = account.account_number and 
				   account.balance >= 1000
		    )
	)
)
