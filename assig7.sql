create database assig7 ;
use assig7 ;
create table Ord_master(Ord_no int , Cust_cd varchar(2) , Status char(1));
insert into Ord_master values(1,"C1",'P');
select * from Ord_master ;
create table Ord_dtl(Ord_no int ,Prod_cd varchar(2),Qty int(3));
insert into Ord_dtl values(1,"P1",100);
insert into Ord_dtl values(1,"P2",200);
select * from Or_dtl;
drop table Ord_dtl;
create table Prod_master(Prod_cd varchar(2), Prod_name varchar(15),Qty_in_stock int(10),
Booked_qty int(6));
insert into Prod_master values("P1","Floppies",10000,1000);
insert into Prod_master values("P2","Printers",5000,600);
insert into Prod_master values("P3","Modems",3000,200);
select * from Prod_master;


1. Write a Before Insert trigger on Ord_dtl. Anytime a row is inserted in Ord_dtl, the
Booked_qty in Prod_master should be increased accordingly.

delimiter ##
create trigger abc before insert on ord_dtl 
for each row
begin
update PROD_MASTER set booked_qty=booked_qty+new.qty where Prod_cd=new.prod_cd;
end;
end ##
insert into ord_dtl values(1,'p3',300);
select * from P
drop trigger abc 
select * from ord_dtl;
/*delimiter $$
create trigger xyz1 before insert on Ord_dtl
for each row
begin
UPDATE Prod_master
SET Booked_qty=new.Qty+Booked_qty
WHERE Prod_cd=new.Prod_cd; 
end;
end $$
*/
2. Write a Before Delete trigger on Ord_dtl. Anytime a row is deleted from Ord_dtl, the
Booked_qty in Prod_master should be decreased accordingly.

delimiter $$
create trigger xyz before delete on Ord_dtl for each row 
begin 
 UPDATE Prod_master
SET Booked_qty=old.Qty-Booked_qty
WHERE Prod_cd=old.Prod_cd;
end ;
end $$ 
select * from ord_dtl ;
drop trigger xyz;

delimiter $$
create trigger xyz2 before delete on Ord_dtl
for each row
BEGIN
UPDATE Prod_master
SET Booked_qty=old.Qty-Booked_qty
WHERE Prod_cd=old.Prod_cd;
 end;
end$$

3. write A trigger to update the total salary of a department in dept_sal  table  when an employee
 is added or removed from  emp table .
Create table dept_sal (dept_no, tota_salary) – this table contains the total of salaries of employees
 working into that particular department.
 
 Create table dept_sal (dept_no int, tota_salary int);
 insert into dept_sal values(101,1000);
  insert into dept_sal values(102,2000);
   insert into dept_sal values(103,3000);
   
    create table employee (dept_no int,sal int);
    insert into employee values(101,500);
       insert into employee values(102,200);
       select * from dept_sal;
              select * from employee;

       delete from employee where dept_no=101 ;
            delimiter %%
            create trigger s1 before  insert on employee
            for each row 
            begin
            update dept_sal set tota_salary=new.sal+tota_salary where dept_no=new.dept_no ;
            end ;
            end %%
            
                 delimiter %%
            create trigger s2 before  delete on employee
            for each row 
            begin
            update dept_sal set tota_salary=tota_salary-old.sal where dept_no=old.dept_no ;
            end ;
            end %%
            drop trigger s2;
            