DROP TABLE [dbo].[dimaccount]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[dimaccount]
( 
	[account_number] [int]  NOT NULL,
	[acctstart_date] [bigint]  NULL,
	[acctend_date] [bigint]  NULL,
	[is_member] [bit]  NULL
)
WITH
(
	DISTRIBUTION = HASH ( [account_number] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO
ALTER TABLE [dbo].[dimaccount]
   ADD CONSTRAINT PK_dimaccount_accountnumber PRIMARY KEY NONCLUSTERED (account_number) NOT ENFORCED
GO

