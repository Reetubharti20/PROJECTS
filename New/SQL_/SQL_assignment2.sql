/*1. Create a customer table which comprises of these columns: ‘customer_id’,
‘first_name’, ‘last_name’, ‘email’, ‘address’, ‘city’,’state’,’zip’ */
use DB004_PROD_SQL
create table customer 
(cusomer_id int,
first_name varchar(50), 
last_name varchar(50), 
email varchar(100), 
address varchar(100), 
city varchar(20),
state varchar(50), 
zip int)



--2. Insert 5 new records into the table
INSERT INTO CUSTOMER VALUES 
(10, 'JEMMI', 'JORDAN', 'JEM@GMAIL.COM', '2ND FLOOR GANDHI NAGAR', 'SANJOSE', 'KARNATAKA', 676789),
(20, 'GAGANA', 'AVANTHIKA', 'GAGANA@GMAIL.COM', '3RD FLOOR GANDHI NAGAR', 'SHANTI NAGAR', 'KASHMIR', 688789),
(30, 'JESSICA', 'VANYA', 'JESSICA@GMAIL.COM', '4TH FLOOR JAYA NAGAR', 'ALLEPPY', 'TAMIL NADU', 116789),
(40, 'JERUSHA', 'JERU', 'JERUSHA@GMAIL.COM', '5TH FLOOR ', 'OOTY', 'DELHI', 276789),
(50, 'GRACE', 'ZIPPORA', 'GRACE@GMAIL.COM', '2ND BLOCK ', 'SAN JOSE', 'UTTAR PRADESH', 906789);

--3. Select only the ‘first_name’ and ‘last_name’ columns from the customer table
select first_name, last_name from customer

--4. Select those records where ‘first_name’ starts with “G” and city is ‘SanJose’. 
select * from customer where first_name like 'G%' and city = 'san jose'

--5. Select those records where Email has only ‘gmail’.
select * from customer where email like '%Gmail%'

--6. Select those records where the ‘last_name’ doesn't end with “A”
select * from customer where last_name not like '%A'