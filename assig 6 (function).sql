use assig6 ;

1.	Write function that accepts a positive number from a user and displays its factorial on the screen.

delimiter ##
create function fact1(var int) returns int 
begin 
declare fact int default 1;
declare i int default 0;
while var > i Do
set fact = fact*var;
set var = var -1;
end while ;
return fact; 
end ## 
drop function fact1;

select fact1(5) ;

delimiter ##
create function fact9(var int) returns int 
begin 
declare fact int default 1;
declare i int default 1;
set fact=1;
set i=1;
while var >= i Do
set fact = fact*i;
set i = i +1;
end while ;
return fact; 
end ## 
select fact9(5) ;

2.	Write a function that accepts a positive number ‘n’ and displays whether that number is a Prime number or not.

delimiter ##
create function prime(n int) returns int
begin
if n%2=1 then
return 1 ;
else
return 0 ;
end if ;
end ##
select prime(5);
drop function prime ;

3.	Write a function to Convert an inputed number of inches into yards, feet, and inches. For example, 124 inches equals 3 yards, 1 foot, and 4 inches.

delimiter ##
create function conversion( a double) returns double 
begin
declare b double   ;          /*inches into feet*/ 
set b=a/12 ;          
return b ;
end ##
select conversion(12); 
drop function conversion ;

4.	Write a function to update salary of the employees of specified dept by 10%. Take dept no as parameter.

delimiter ##
create function increm( var double) returns double
begin
update emp set sal = sal*(1+0.1) where dept=var;
return sal ;
end ##
select increm(1002);

