TRUNCATE table dbo.TripFacts

insert into dbo.TripFacts
select 	st.trip_id, st.rider_id, sp.PaymentID, CONVERT(INT, CAST(start_at AS datetime)), 
		CONVERT(INT, CAST(ended_at AS datetime)), start_station_id, end_station_id, 
		rideable_type, DATEDIFF(second, start_at, ended_at), DATEDIFF(year, sr.birthday, st.ended_at)   
from dbo.staging_trips st, dbo.staging_payment sp, dbo.staging_riders sr
where st.rider_id = sp.AccountNumber
AND st.rider_id = sr.rider_key
AND CAST(st.ended_at AS DATE) = CAST(sp.PaymentDate AS DATE)