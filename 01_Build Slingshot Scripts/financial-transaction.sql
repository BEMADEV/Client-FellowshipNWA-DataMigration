/*
SELECT TOP 1000 *
FROM tblContributions
Order By ContribID# Desc
*/

SELECT
	ContribID# as Id
	, format(ContDate, 'yyyyMMdd') as BatchId
	, isNull(Cast(indId as nvarchar(max)), '') as AuthorizedPersonId
	, contDate as TransactionDate
	, CASE d.fundtype
		WHEN 'Camp/Retreat' THEN 'EventRegistration'
		WHEN 'Curriculum' THEN 'EventRegistration'
		WHEN 'Service' THEN 'EventRegistration'
		ELSE 'Contribution'
	  END as TransactionType
	, IsNull(Check#,'') as TransactionCode
	, IsNull(ContNotes,'') as Summary
	, IIF(DirectDebitId is null, 'OnsiteCollection', 'Website') as TransactionSource
	, CASE PaymentType
		WHEN 'ACH' Then 'ACH'
		WHEN 'CASH' THen 'Cash'
		WHEN 'CHECK' THEN 'Check'
		WHEN 'CK' THEN 'Check'
		WHEN 'CC' Then 'CreditCard'
		WHEN 'CC 139' THEN 'CreditCard'
		WHEN 'CC Debit' THEN 'CreditCard'
		WHEN 'CC Master Card' THEN 'CreditCard'
		WHEN 'CC MC' THEN 'CreditCard'
		WHEN 'CC VIA' THEN 'CreditCard'
		WHEN 'CC VISA' THEN 'CreditCard'
		WHEN 'CC VISA CHECK CARD' THEN 'CreditCard'
		WHEN 'CC VISA CHECKCARD' Then 'CreditCard'
		WHEN 'CC VISA DEBIT' Then 'CreditCard'
		WHEN 'CC VISA DEBIT CARD' Then 'CreditCard'
		WHEN 'CREDIT CARD' Then 'CreditCard'
		WHEN 'Money Order' Then 'Check'
		WHEN 'Stock' Then 'NonCash'
		WHEN 'Other' Then 'Other'
		ELSE 'Unknown'
	  END as CurrencyType
	, c.addedDate as CreatedDateTime
	, isnull(convert(nvarchar(max), c.ModDate, 101), '') as ModifiedDateTime
	, '' as CreatedByPersonId
	, '' as ModifiedByPersonId
FROM tblContributions c
Join lkDesignations d on c.Designation = d.Designations
Where c.amount is not null
