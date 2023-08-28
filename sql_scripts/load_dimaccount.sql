TRUNCATE table dbo.dimaccount;

insert into dbo.dimaccount
select rider_key, CONVERT(INT, account_start_date), CONVERT(INT, account_end_date), is_member
from dbo.staging_riders