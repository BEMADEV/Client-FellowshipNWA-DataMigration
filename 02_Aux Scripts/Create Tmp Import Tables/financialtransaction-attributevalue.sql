Select
	ContribID# as TransactionId
	, 'GB_DirectDebitID' as AttributeKey
	, DirectDebitID as [Value]
From
	tblContributions
Where DirectDebitID is not null