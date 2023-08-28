DROP TABLE [dbo].[PaymentFacts]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PaymentFacts]
( 
	[PaymentId] [bigint]  NOT NULL,
	[rider_key] [int]  NOT NULL,
	[date_key] [int]  NOT NULL,
	[amount] [money]  NULL
)
WITH
(
	DISTRIBUTION = HASH ( [PaymentId] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO

ALTER TABLE [dbo].[PaymentFacts]
   ADD CONSTRAINT PK_paymentfacts_paymentid PRIMARY KEY NONCLUSTERED (PaymentId) NOT ENFORCED
GO

ALTER TABLE [dbo].[PaymentFacts]
ADD CONSTRAINT FK_PaymentFacts_dimrider FOREIGN KEY (rider_key) REFERENCES dbo.dimrider (rider_key)

ALTER TABLE [dbo].[PaymentFacts] 
ADD CONSTRAINT FK_PaymentFacts_dimdate FOREIGN KEY (date_key) REFERENCES dbo.dimdate (date_key)
