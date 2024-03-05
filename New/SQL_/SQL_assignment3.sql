use DB004_PROD_SQL
/*1. Create an ‘Orders’ table which comprises of these columns: ‘order_id’,
‘order_date’, ‘amount’, ‘customer_id’.*/
CREATE TABLE ORDERS (
ORDER_ID INT,
ORDER_DATE DATE,
AMOUNT INT,
CUSTOMER_ID INT 
)

-- 2. Insert 5 new records

INSERT INTO ORDERS VALUES
(100,'2020-10-01',900,20),
(110,'2020-10-02',8000,2),
(111,'2020-10-03',7000,3),
(112,'2020-10-04',6000,4),
(113,'2020-10-05',5000,10)

--3. Make an inner join on ‘Customer’ and ‘Orders’ tables on the ‘customer_id’ column. 

SELECT * FROM CUSTOMER INNER JOIN ORDERS ON 
CUSTOMER.CUSOMER_ID = ORDERS.CUSTOMER_ID

--4. Make left and right joins on ‘Customer’ and ‘Orders’ tables on the 'customer_id’ column.
SELECT * FROM CUSTOMER left join ORDERS ON 
CUSTOMER.CUSOMER_ID = ORDERS.CUSTOMER_ID

SELECT * FROM CUSTOMER right join ORDERS ON 
CUSTOMER.CUSOMER_ID = ORDERS.CUSTOMER_ID

--5. Make a full outer join on ‘Customer’ and ‘Orders’ table on the ‘customer_id’ column.
SELECT * FROM CUSTOMER full join ORDERS ON 
CUSTOMER.CUSOMER_ID = ORDERS.CUSTOMER_ID

--6. Update the ‘Orders’ table and set the amount to be 100 where‘customer_id’ is 3
update orders
set 
amount = 100
where CUSTOMER_ID = 3

select * from ORDERS
