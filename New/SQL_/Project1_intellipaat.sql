--Get all the details from the person table including email ID, phone number and phone number type
select [person].[Person].FirstName, [person].[EmailAddress].EmailAddress, [person].[PersonPhone].PhoneNumber,
[person].[PersonPhone].PhoneNumberTypeID from [Person].[Person]
join
[person].[EmailAddress]
on 
[person].[person].BusinessEntityID = [person].[emailaddress].BusinessEntityID
join 
[person].[PersonPhone]
on
[person].[person].BusinessEntityID = [person].[PersonPhone].BusinessEntityID

-- Get the details of the sales header order made in May 2011
select * from [Sales].[SalesOrderHeader]
where OrderDate between '2011-05-01' and '2011-05-31'

-- Get the details of the sales details order made in the month of May 2011
select * from [Sales].[SalesOrderDetail]
join
[Sales].[SalesOrderHeader]
on
[Sales].[SalesOrderDetail].SalesOrderID = [Sales].[SalesOrderHeader].SalesOrderID

where [Sales].[SalesOrderHeader].OrderDate between '2011-05-01' and '2011-05-31'

-- Get the total sales made in May 2011
select sum([Sales].[SalesOrderDetail].OrderQty) Total_Qty from [Sales].[SalesOrderDetail]

join
[Sales].[SalesOrderHeader]
on [Sales].[SalesOrderHeader].SalesOrderID  = [Sales].[SalesOrderDetail].salesorderid
where [Sales].[SalesOrderHeader].OrderDate between '2011-05-01' and '2011-05-31' 

--Get the total sales made in the year 2011 by month order by increasing sales
select * from [Sales].[SalesOrderDetail]

join
[Sales].[SalesOrderHeader]
on [Sales].[SalesOrderHeader].SalesOrderID  = [Sales].[SalesOrderDetail].salesorderid
where [Sales].[SalesOrderHeader].OrderDate between '2011-01-01' and '2011-12-31' 
order by [Sales].[SalesOrderDetail].OrderQty

--Get the total sales made to the customer with FirstName='Gustavo' and LastName = Achong
select [person].[person].FirstName,[person].[person].LastName, * from [Sales].[SalesOrderDetail]

join
[person].[Person]
on [Sales].[SalesOrderDetail].ModifiedDate  = [person].[Person].ModifiedDate
where FirstName='Gustavo' and LastName = 'Achong'










