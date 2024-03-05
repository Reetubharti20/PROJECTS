/*1. Use the inbuilt functions and find the minimum, maximum and average
amount from the orders table*/

SELECT MIN(AMOUNT) 
AS [MINIMUM AMOUNT], 
MAX(AMOUNT) AS [MAXIMUM AMOUNT], 
AVG(AMOUNT) AS [AVERAGE AMOUNT] 
FROM ORDERS


--2. Create a user-defined function which will multiply the given number with 10
create function multiply_num (@num int)
returns int 
AS BEGIN 
RETURN 
     (@num * 10)
END

SELECT dbo.multiply_num(451)

/*3. Use the case statement to check if 100 is less than 200, greater than 200
or equal to 200 and print the corresponding value.*/
select
(case
when 100<200 then 'smaller'
when 100>200 then 'greater'
else 'equal'
end)
as result
/*4. Using a case statement, find the status of the amount. Set the status of the
amount as high amount, low amount or medium amount based upon the
condition. */
select * from orders
select
(case
when amount>5000 then 'high amount'
when amount<5000 then 'low amount'
else 'medium amount'
end)
from orders
as status
--5. Create a user-defined function, to fetch the amount greater than then given input

create function amount_status(@Amt INT)
returns table
 as return 
 (
 select * from orders where amount>@Amt
 )

 SELECT * FROM amount_status(1000)

 SELECT * FROM ORDERS
