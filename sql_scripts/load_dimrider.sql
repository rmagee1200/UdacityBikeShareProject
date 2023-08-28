TRUNCATE table dbo.dimrider;

insert into dbo.dimrider
select rider_key, first, last, address, CONVERT(INT, birthday)
from dbo.staging_riders
select * from dbo.dimrider

select COUNT(r.first_name, r.last_name, d.datetime)
from dbo.dimdate d, dbo.dimrider r
where r.birthday = d.date_key
ORDER BY r.last_name ASC
GO