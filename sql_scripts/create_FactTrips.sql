DROP TABLE [dbo].[TripFacts]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TripFacts]
( 
	[trip_key] [int]  NOT NULL,
	[rider_key] [int]  NULL,
	[payment_key] [bigint]  NULL,
	[startdate_key] [int]  NULL,
	[enddate_key] [int]  NULL,
	[stationstart_key] [nvarchar](4000)  NULL,
	[stationend_key] [nvarchar](4000)  NULL,
	[rideable_type] [nvarchar](4000)  NULL,
	[trip_duration] [int]  NULL,
	[rider_dim] [int]  NULL
)
WITH
(
	DISTRIBUTION = HASH ( [trip_key] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO
ALTER TABLE [dbo].[TripFacts]
   ADD CONSTRAINT PK_tripfacts_tripkey PRIMARY KEY NONCLUSTERED (trip_key) NOT ENFORCED
GO

ALTER TABLE [dbo].[TripFacts] 
ADD CONSTRAINT FK_TripFacts_dimrider FOREIGN KEY (rider_key) REFERENCES dbo.dimrider (rider_key)

ALTER TABLE [dbo].[TripFacts] 
ADD CONSTRAINT FK_TripFacts_PaymentFacts FOREIGN KEY (payment_key) REFERENCES [dbo].[PaymentFacts] ([PaymentId])

ALTER TABLE [dbo].[TripFacts] 
ADD CONSTRAINT FK_TripFacts_startdate FOREIGN KEY (startdate_key) REFERENCES dbo.dimdate (date_key)

ALTER TABLE [dbo].[TripFacts] 
ADD CONSTRAINT FK_TripFacts_enddate FOREIGN KEY (enddate_key) REFERENCES dbo.dimdate (date_key)

ALTER TABLE [dbo].[TripFacts] 
ADD CONSTRAINT FK_TripFacts_startstation FOREIGN KEY (stationstart_key) REFERENCES dbo.dimstation (station_key)

ALTER TABLE [dbo].[TripFacts] 
ADD CONSTRAINT FK_TripFacts_endstation FOREIGN KEY (stationend_key) REFERENCES dbo.dimstation (station_key)



GO
