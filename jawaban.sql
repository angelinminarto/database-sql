--2.
CREATE PROCEDURE deleteBike @bike_id char(5)
as if (exists(select * from bike where bike_id = @bike_id))
begin
delete bike where bike_id = @bike_id
print 'bike ' + @bike_id + ' has been deleted'
end
else
print 'bike ' + @bike_id + ' doesn''t exist'

EXEC deleteBike 'BI001'
SELECT * FROM bike WHERE bike_id ='BI001'

EXEC deleteBike 'BI011'

--3.
go
Create procedure salesReport @transaction_id char(5)
as
declare @transaction_date date, @customer_name varchar (30),
@bike_name varchar (30), @bike_price int, @quantity int,
@total_Price int, @total_sales int, @total_bike_variant int

select @transaction_date = transaction_date, 
@customer_name = customer_name
from transaction_header th
join customer c on th.customer_id = c.customer_id
where transaction_id = @transaction_id
print 'jowes sales report'
print '----------------------------------------------------------------'
print 'transaction date :' + convert (varchar, @transaction_date, 120)
print 'ordered by		:' + @customer_name
print '----------------------------------------------------------------'
declare cur cursor
for
select bike_name, bike_price, quantity
from bike b
join transaction_detail td
on b.bike_id = td.bike_id
where transaction_id = @transaction_id

open cur
set @total_sales = 0
set @total_bike_variant = 0

fetch next from cur into @bike_name, @bike_price,
@quantity
while @@FETCH_STATUS = 0
begin
print 'bike name : ' + @bike_name
print 'bike price : ' + CAST (@bike_price AS varchar)
print 'quantity : ' + CAST (@quantity AS varchar)
print ''
set @total_Price = @bike_price * @quantity
print 'total price : ' + cast(@total_price as varchar)
print '----------------------------------------------------------------'
set @total_sales += @total_Price
set @total_bike_variant += 1
fetch next from cur into @bike_name, @bike_price,
@quantity
end
print 'total sales			: ' + cast (@total_sales as varchar)
print 'total bike variant	: ' + cast (@total_bike_variant as varchar)
close cur
deallocate cur

exec salesReport 'TR002'

drop procedure salesReport