SELECT
	ContribID# as Id
	, ContribID# as TransactionId
	,  d.ID as AccountId
	, Amount
	, isNull(PaymentType, '') as Summary
	, c.addedDate as CreatedDateTime
	, isnull(convert(nvarchar(max), c.ModDate, 101), '') as ModifiedDateTime
	, '' as CreatedByPersonId
	, '' as ModifiedByPersonId
FROM tblContributions c
Join lkDesignations d on c.Designation = d.Designations
Where c.Amount is not null