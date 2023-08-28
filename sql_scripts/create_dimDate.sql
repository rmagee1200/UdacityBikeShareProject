DROP TABLE [dbo].[dimdate]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[dimdate]
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
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO

ALTER TABLE [dbo].[dimdate]
   ADD CONSTRAINT PK_dimdate_datekey PRIMARY KEY NONCLUSTERED (date_key) NOT ENFORCED
GO
