create database practise ;
use practise ;
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

/*Simple example */
delimiter ##
create procedure abc()
begin
declare name varchar(30);
declare finished int default 0;
declare simple cursor for select ename from emp where hiredate ='2001-02-18';
declare continue handler for not found set finished =1;
open simple;
get2 : loop
fetch simple into name ;
if finished=1 then
leave get2 ;
end if;
select ename from emp where hiredate ='2001-02-18';
iterate get2 ;
end loop ;
close simple ;
end ## 
call abc() ;
--------------------------------------------------------
1.	Write a Procedure that displays names and salaries of all Analysts recorded in the “emp” table by making use of a cursor.

delimiter ##
create procedure abc()
begin
declare name varchar(30);
declare salary int (9);
declare finished int;
declare sam cursor for select  ENAME ,sal from emp where job='ANALYST' limit 1;
declare continue handler for not found set finished=1;
open sam ;
get1:loop 
fetch sam into name,salary;
if finished=1
then leave get1 ;
end if;
 select  ENAME ,sal from emp where job='ANALYST' ;
 iterate get1 ;
end loop;
close sam ;
end ##

call abc();
drop procedure abc ;


2.	Write a Procedure to display top 5 employees based on highest salary and display employee number, employee name and salary using Cursor.

delimiter ##
create procedure ads()
begin
declare number int(10) ;
declare name varchar(30);
declare  salary int(10);
declare finished int default 0;
declare sing cursor for select EMPNO , ename ,sal from emp order by desc limit 1;
declare continue handler for not found set finished=1;
open sing;
get1:loop
fetch sing into number ,name,salary;
if finished =1 
then 
leave get1 ;
end if ;
select empno,ename,sal from emp order by desc ;
iterate get1 ;
end loop;
close sing ;
end ##
call ads();
drop procedure ads;

3.	Write  a procedure to display the concatenated first_name and last_name from “emp” table using cursors handle the  errors with Exit handler

delimiter ##
create procedure assig()
begin 
declare name varchar(30);
declare finished int default 0 ; 
declare cur cursor for select concat(ename ,job) from emp limit 1;
declare continue handler for not found set finished =1;
open cur ;
get1 :loop 
fetch cur into name ;
if finished =1 
then 
leave get1 ;
end if ;
select concat(ename,job) from emp ;
end loop ;
close cur ;
end ## 

call assig() ;
drop procedure assig;


4.	Write a procedure which select all the data from employee table and display the data of employee where employee name is ‘Manish’ using 
    cursors.
    
   delimiter ##
   create procedure  que()
   begin
   declare number int(10) ;
   declare name varchar(20) ;
   declare occ varchar(20);
   declare mgr varchar(20);
   declare hire date ;
   declare  salary int(9) ;
   declare  deno int(9) ; 
   declare finished int default 0;
   declare abc cursor for select EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,DEPTNO  from emp where ename ='manish' ;
   declare continue handler for  not found set finished =1;
   open abc ;
   get1: loop 
   fetch abc into number ,name ,occ ,mgr ,hire ,salary ,deno;
   if finished =1 
   then leave get1 ;
   end if ;
   select * from emp where ename ='manish';
   end loop;
   close abc ;
   end ## 
   call que() ;
   
   5.	Write a procedure which select delete the data from employee table if emp sal is less than 
   10000  using cursor and handle the  Sqlexception with continue handler.
   
   delimiter ##
   
   
   delimiter ##
create procedure abcd()
begin 
declare id int(30);
declare finished int default 0 ; 
declare curr cursor for select EMPNO from emp where sal < 1000 limit 1;
declare continue handler for not found set finished =1;
open curr ;
get1 :loop 
fetch curr into id ;
if finished =1 
then 
leave get1 ;
end if ;
select empno from emp where sal < 1000;
end loop ;
close curr ;
end ## 

call abcd() ;
drop procedure abcd ;