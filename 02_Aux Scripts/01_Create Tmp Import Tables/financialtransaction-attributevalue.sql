SELECT 
	TransactionId
	, 'GB_' + ColumnName as AttributeKey
	, [Value]  as AttributeValue
FROM
(
	SELECT
		ContribID# as TransactionId
		, CAST(DirectDebitId AS NVARCHAR(MAX)) as DirectDebitId
		, CAST(Coin AS NVARCHAR(MAX)) as Coin
		, CAST(Paper AS NVARCHAR(MAX)) as Paper
	FROM tblContributions
) as S
UNPIVOT
(
	Value for ColumnName IN (
	DirectDebitId
	, Coin
	, Paper
		)
) as U
Where [Value] != ''