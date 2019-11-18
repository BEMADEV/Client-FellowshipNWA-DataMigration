SELECT 
	AccountId
	, 'GB_' + ColumnName as AttributeKey
	, [Value]  as AttributeValue
FROM
(
	SELECT
		ID as AccountId
		, CAST(SubAcctNum AS NVARCHAR(MAX)) as SubAcctNum
		, CAST(SolomonAcctNum AS NVARCHAR(MAX)) as SolomonAcctNum
		, CAST(IIF(ChildCareStatement = 1, N'True', N'False') AS NVARCHAR(MAX)) as ChildCareStatement
		, CAST(IIF(OneTimeGift = 1, N'True', N'False') AS NVARCHAR(MAX)) as OneTimeGift
	FROM lkDesignations
) as S
UNPIVOT
(
	Value for ColumnName IN (
	SubAcctNum
	, ChildCareStatement
	, OneTimeGift
	, SolomonAcctNum
		)
) as U
Where [Value] != ''