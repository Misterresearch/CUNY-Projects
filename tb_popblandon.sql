/*
  tb.sql
*/

DROP TABLE IF EXISTS tb;
drop table if exists populations;
drop view if exists tb_pop;

CREATE TABLE tb 
(
  country varchar(100) NOT NULL,
  year int NOT NULL,
  sex varchar(6) NOT NULL,
  child int NULL,
  adult int NULL,
  elderly int NULL
);

LOAD DATA LOCAL INFILE 'C:/Users/206069621/Desktop/SQL Assignments/Spring 16 semester/tb.csv' 
INTO TABLE tb
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
(country, year, sex, @child, @adult, @elderly)
SET
child = nullif(@child,-1),
adult = nullif(@adult,-1),
elderly = nullif(@elderly,-1)
;

# use of composite keys in populations table, attempt to dedup results downstream
create table populations (
nation varchar (255),
years int not null,
size int not null,
primary key(nation, years)
);

load data local infile 'C:/Users/206069621/Desktop/SQL Assignments/Spring 16 semester/population.csv' into table populations fields terminated by ','
enclosed by '"'
lines terminated by '\n'
;

# select statement on tb performs aggregations using group by
select 
country as `country group`,
year, 
sum(child) as `child`,
sum(adult) as `adult`,
sum(elderly) as `elderly`,
(sum(child) + sum(adult) + sum(elderly)) as `tot tb`
from tb
group by year, country
order by country, year;

select * 
from populations
order by nation;

# view create tb_pop
create view tb_pop as
select 
country as `country group`,
year, 
sum(child) as `child`,
sum(adult) as `adult`,
sum(elderly) as `elderly`,
(sum(child) + sum(adult) + sum(elderly)) as `tot tb`
from tb
group by year, country
order by country, year;


# a join using a view, returns the correct math but too many duplicates.  Also duplicate columns are present for validation
select
 *
from populations
join tb_pop
on `country group` = populations.nation and tb_pop.year = populations.years
group by `country group`, nation, tb_pop.year, populations.years, size
