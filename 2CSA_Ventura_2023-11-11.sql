drop table products;
create table products(
prod_id			INTEGER primary key not null,
prod_name 		varchar(30)  not null,
prod_src 		varchar(50),
prod_sales 		bigint  not null);
insert into products(prod_name,prod_src,prod_sales) values ('Canned Tuna','Puregold',275);
insert into Products(prod_name,prod_src,prod_sales) values ('Rice','Puregold','300');
insert into Products(prod_name,prod_src,prod_sales) values ('Diaper','Puregold','400');
insert into Products(prod_name,prod_src,prod_sales) values ('Diaper','Puregold','280');
insert into Products(prod_name,prod_src,prod_sales) values ('Mayonnaise','Puregold','50');
insert into Products(prod_name,prod_src,prod_sales) values ('Suspicious-Looking Cat','Puregold',9999);
insert into Products(prod_name,prod_src,prod_sales) values ('Cigars','Mercury Drug Store',0);
UPDATE products set prod_sales=800 where prod_id='7';
drop table inventory;
create table inventory(
prod_id		int primary key not null,
prod_qty	bigint not null,
prod_bad 	bigint not null
);
insert into inventory(prod_id,prod_qty,prod_bad) values(1,125,10);
insert into inventory(prod_id,prod_qty,prod_bad) values(2,300,25);
insert into inventory(prod_id,prod_qty,prod_bad) values(3,225,8);
insert into inventory(prod_id,prod_qty,prod_bad) values(4,32,15);
insert into inventory(prod_id,prod_qty,prod_bad) values(5,57,7);
insert into inventory(prod_id,prod_qty,prod_bad) values(6,1,0);
insert into inventory(prod_id,prod_qty,prod_bad) values(7,450,2);
drop table delivery;
create table delivery(
_ID integer primary key not null, 
delivery_ID varchar(10) not null,
delivery_Date date not null,
delivery_Prod int not null,
delivery_Qty bigint not null
);
insert into delivery(delivery_ID,delivery_Date,delivery_Prod,delivery_Qty) values ('01',2023/11/11,'1','135');
insert into delivery(delivery_ID,delivery_Date,delivery_Prod,delivery_Qty) values ('02',2023/11/11,2,325);
insert into delivery(delivery_ID,delivery_Date,delivery_Prod,delivery_Qty) values ('03',2023/11/11,3,233);
insert into delivery(delivery_ID,delivery_Date,delivery_Prod,delivery_Qty) values ('04',2023/11/11,4,47);
insert into delivery(delivery_ID,delivery_Date,delivery_Prod,delivery_Qty) values ('05',2023/11/11,5,64);
insert into delivery(delivery_ID,delivery_Date,delivery_Prod,delivery_Qty) values ('06',2023/11/11,6,1);
insert into delivery(delivery_ID,delivery_Date,delivery_Prod,delivery_Qty) values ('07',2023/11/11,7,70);

Select * from deliveries;
insert into products(prod_name,prod_src,prod_sales) values ('Test','Test',1000);
insert into inventory(prod_id,prod_qty,prod_bad) values (50,1000,1000);
delete from products where prod_name="Test";

SELECT 
	p.prod_id as prod_id,
	p.prod_name as prod_name,
	p.prod_sales+i.prod_qty as projected
from products p
left join inventory i on p.prod_id = i.prod_id;

Select * from inventory i ;

Select 
	CASE
		when prod_name in ('Diaper') then 'Essentials'
		when prod_name in ('Rice','Bread','Mayonnaise
','Canned Tuna') then 'Food'
		when prod_name in ('Cigars') then 'Recreational'
		when prod_name in ('Suspicious-Looking Cat') then 'Others'
END as category,
sum(prod_sales) as total_sales
from products p
group by category;

Select 
	p.prod_name,
	p.prod_src,
	delivery_qty,
	prod_bad,
	CASE 
	   when prod_bad >= delivery_qty *0.05 then 'NOT IDEAL'
	   else 'IDEAL'
	END as Ideality
	from Products p
	left join inventory i on p.prod_id  = i.prod_id
	left join delivery d on p.prod_id  = d._ID
	where strftime('%m',delivery_date)='11';