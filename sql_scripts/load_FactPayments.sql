TRUNCATE table dbo.PaymentFacts;

insert into dbo.PaymentFacts
select PaymentId, AccountNumber, CONVERT(INT, CAST(PaymentDate AS datetime)), Amount
from dbo.staging_payment