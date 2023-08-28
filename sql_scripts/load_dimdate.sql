truncate table dimdate;

CREATE TABLE #date_temp
( 
	[date_key] [int]  NOT NULL,
	[datetime] [date]  NOT NULL,
	[month] [tinyint]  NOT NULL,
	[day_of_month] [tinyint]  NOT NULL,
	[year] [int]  NOT NULL,
	[hour] [int]  NULL,
	[minute] [int]  NULL,
	[second] [int]  NULL
)

---- INSERT FROM RIDER ----
insert into dbo.#date_temp
select DISTINCT CONVERT(INT, birthday), birthday, MONTH(birthday), DAY(birthday), YEAR(birthday), NULL, NULL, NULL
FROM staging_riders

insert into #date_temp 
select DISTINCT CONVERT(INT, account_start_date), account_start_date, MONTH(account_start_date), DAY(account_start_date), YEAR(account_start_date), NULL, NULL, NULL
FROM staging_riders

insert into #date_temp
select DISTINCT CONVERT(INT, account_end_date), account_end_date, MONTH(account_end_date), DAY(account_end_date), YEAR(account_end_date), NULL, NULL, NULL
FROM staging_riders  where account_end_date IS NOT NULL

---- INSERT FROM PAYMENT -----
insert into #date_temp
select DISTINCT CONVERT(INT, CAST(PaymentDate AS datetime)), CAST(PaymentDate AS date), MONTH(CAST(PaymentDate AS date)), DAY(CAST(PaymentDate AS date)), YEAR(CAST(PaymentDate AS date)), NULL, NULL, NULL
FROM dbo.staging_payment where PaymentDate IS NOT NULL;


insert into #date_temp
select DISTINCT CONVERT(INT, CAST(start_at AS datetime)), start_at, MONTH(start_at), DAY(start_at), YEAR(start_at), DATENAME(hour, start_at), DATENAME(minute, start_at), DATENAME(second, start_at)
FROM dbo.staging_trips

insert into #date_temp
select DISTINCT CONVERT(INT, CAST(ended_at AS datetime)), ended_at, MONTH(ended_at), DAY(ended_at), YEAR(ended_at), DATENAME(hour, ended_at), DATENAME(minute, ended_at), DATENAME(SECOND, ended_at)
FROM dbo.staging_trips

INSERT INTO dbo.dimdate
SELECT DISTINCT * from #date_temp

--- select top 1000 * from dimdate;

select count(*) from dimdate;


