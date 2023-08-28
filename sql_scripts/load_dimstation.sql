TRUNCATE table dbo.dimstation;

insert into dbo.dimstation
select station_id, name, latitude, longitude
from dbo.staging_stations
