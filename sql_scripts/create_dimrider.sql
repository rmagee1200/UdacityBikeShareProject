DROP TABLE [dbo].[dimrider]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[dimrider]
( 
	[rider_key] [bigint]  NOT NULL,
	[first_name] [nvarchar](4000)  NULL,
	[last_name] [nvarchar](4000)  NULL,
	[address] [nvarchar](4000)  NULL,
	[birthday] [BIGINT]  NULL
)
WITH
(
	DISTRIBUTION = HASH ( [rider_key] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO

ALTER TABLE [dbo].[dimrider]
   ADD CONSTRAINT PK_dimrider_riderkey PRIMARY KEY NONCLUSTERED (rider_key) NOT ENFORCED
GO
