
------select all from members, prices and transantions-----

select * from trading.transactions;
select * from trading.members;
select * from trading.prices;

----what is the count of members, prices, transactions and renaming it by record count----

select count(*) from trading.prices;

select count(*) 
	as 
record_count
	from trading.prices
	
---- what is the min,max and average market from the price database-----
select min(market_date) from trading.prices;

select max(market_date) from trading.prices


----- what is the min market date and max market date by ticker from the price database
---renaming the min market date as earliesr and max market date as latest---

select ticker, min(market_date) as earliest,
max(market_date) as latest 
	from trading.prices 
Group by
ticker;

----- what is the average price of bTC in year 2020--- 
select * from trading.prices 

select avg(price) as average_price
	from trading.prices 
where  
ticker='BTC' and market_date between '2019-01-01' and '2021-01-01' ;  

----- what is the average price of ETH in year 2020---
select  avg(price) as average_price
  from trading.prices
where ticker='ETH' and  market_date between '2019-01-01' and '2021-01-01';

--- what is the average price of BTC and ETH in all the years----
select avg(price) as averageBTC_price
from trading.prices
where ticker='BTC' and market_date between '2016-12-31' and '2021-08-31';
    
select avg(price) as averageETH 
from trading.prices
where ticker ='ETH' and market_date between '2017-01-01' and '2021-08-31';

---what is the average price of ETH in year 2020 in august-----

select  avg(price) as average_price
	from trading.prices
where ticker='ETH' and  market_date between '2020-08-01' and '2020-08-31';

---- what is the average price of BTC in year 2020 in August------

select avg(price) as average_price
from trading.prices
where ticker ='BTC' and market_date between '2020-08-01' and '2020-08-31'

---- select the  first five data, select from prices, members and transactions---

select * 
	from
trading.prices limit 5

---obtain the first 5 by fro members data order in ascending order by their first name----

select * from trading.members

select * 
	from 
trading.members 
	order by first_name asc
limit 5


----obtain the information of whose region are in united states---

select * from trading.members 
where  region ='United States';

---obtain the information of whose region is not Austrailia---

select member_id , first_name ,region
	from trading.members 
	where region <> 'Australia';
	
----what is the count of the transaction data---


select count(*) from trading.transactions;

----obtain the information of the transactiondata whose txt_id is greater than 22195--

select * 
	from 
trading.transactions
	where txn_id > 22915;
    
-----How many distint members are there in the transaction data--

select count(distinct member_id) from trading.transactions;

----Obtain the member_id and sum of quantity as btc_sold where ticker is BTC and txn_type is SELL 
--grouping them by the member_id and obtain the sum of quantity greater than 500 order by the sum
quantity from the highest to lowest--


select member_id, sum(quantity) as BTC_sold
from trading.transactions where ticker='BTC'
and txn_type='SELL' 
	group by member_id 
      Having sum(quantity) > 500 
order by sum(quantity) desc;
