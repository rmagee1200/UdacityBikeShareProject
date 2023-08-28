DROP TABLE [dbo].[dimstation]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[dimstation]
( 
	[station_key] NVARCHAR(100)  NOT NULL,
	[station_name] NVARCHAR(4000) NULL,
	[longitude] [float]  NULL,
	[latitude] [float]  NULL
)
WITH
(
	DISTRIBUTION = HASH ( [station_key] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO

ALTER TABLE [dbo].[dimstation]
   ADD CONSTRAINT PK_dimstation_stationkey PRIMARY KEY NONCLUSTERED (station_key) NOT ENFORCED
GO