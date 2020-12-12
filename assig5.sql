create database assig5 ;
use assig5 ;
Create table EMP ( EMPNO numeric(4) not null, ENAME varchar(30) not null, JOB varchar(10),
                   MGR numeric(4), HIREDATE date, SAL numeric(7,2), DEPTNO numeric(2) );
Insert into EMP  values(1000,  'Manish' , 'SALESMAN', 1003,'2020-02-18', 600,  30) ;
Insert into EMP  values(1001,  'Manoj' , 'SALESMAN', 1003,'2018-02-18', 600,  30) ;
Insert into EMP  values(1002 , 'Ashish', 'SALESMAN',1003 ,'2013-02-18',  750,  30 );
Insert into EMP  values(1004,  'Rekha', 'ANALYST', 1006 ,'2001-02-18', 3000,  10);
Insert into EMP  values(1005 , 'Sachin', 'ANALYST', 1006 , '2019-02-18', 3000, 10 );
Insert into EMP  values(1006,  'Pooja',  'MANAGER', null ,'2000-02-18' ,6000, 10 );
select * from emp;
Create table dept (dno numeric(4) not null, dname varchar(10) not null,area varchar(30));
Insert into dept values(10,'Store','Mumbai');
Insert into dept values(20,'Purchase','Mumbai');
Insert into dept values(30,'Store', 'Delhi');
Insert into dept values(40,'Marketing','Pune');
Insert into dept values(50,'Finance','Delhi');
Insert into dept values(60,'Accounts','Mumbai');
select * from dept;

/* First case */
delimiter ##
create procedure addition(IN var1 int , IN var2 int)
begin
declare var3 int default 0;
set var3=var1+var2;
SELECT * FROM emp LIMIT var3;
end ##
call addition(1,4);
drop procedure addition;

delimiter ##
create procedure substraction(IN var1 int , IN var2 int)
begin
declare var3 int default 0;
set var3=var1-var2;
SELECT * FROM emp LIMIT var3;
end ##
call substraction(4,1);

delimiter ##
create procedure multi(IN var1 int , IN var2 int)
begin
declare var3 int default 0;
set var3=var1*var2;
SELECT * FROM emp LIMIT var3;
end ##
call multi(1,4);

delimiter ##
create procedure division(IN var1 int , IN var2 int)
begin
declare var3 int default 0;
set var3=var1/var2;
SELECT * FROM emp LIMIT var3;
end ##
call division(4,2);

/*second case */
delimiter ##
create procedure stringrev(IN str varchar(20))
begin
 SELECT REVERSE(str);
end ##
call stringrev("Rajatmaske");

/*third case*/
delimiter ##
create procedure sal()
begin
SELECT (SAL) from emp ORDER BY sal DESC LIMIT 5 ;
end ##
call sal();
drop procedure highestsal;

/*4th case*/
delimiter ##
create procedure sal()
begin
SELECT (SAL) from emp ORDER BY sal DESC LIMIT 5 ;
end ##
call sal();

/*fifth case: 4.	Write a Procedure to create table emp_test with e_id integer, e_name varchar(10), e_joining_date date as columns*/
delimiter ##
create procedure create_table()
begin
create table emp_test ( e_id integer, e_name varchar(10), e_joining_date date );
end ##
call create_table();
desc emp_test;

/*sixth case */
delimiter ##
create procedure adcolumn()
begin 
insert into   dept (dno,dname,area) values (70,"CEO","California");
select * from dept ;
end ##
call adcolumn();

/*seventh case*/
delimiter ##
create procedure sqcube11(IN var int)
begin
declare  cube1 int ;
declare  sqt1 int ;
set sqt1  = var*var;
set cube1=var*var*var;
select sqt1;
select cube1;
end##
call sqcube11(4);

/* eight case */
delimiter ##
create procedure fun(IN var int)
begin
declare  cube1 int ;
declare  sqt1 int ;
set sqt1  = var*var;
set cube1=var*var*var;
select sqt1;
select cube1;
end##
call sqcube11(4);

/*nine case */
delimiter $$
create procedure out_fun(OUT var int )
begin
declare a int ;
set var =10;
set a =var;
select a;
end $$
call out_fun(@var);  /* function calling */
select @var;   -- returning values 

