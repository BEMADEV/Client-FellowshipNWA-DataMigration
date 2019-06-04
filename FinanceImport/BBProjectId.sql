declare @BBProjectId int = (select b.id from azdev.rockdb2.dbo.Attribute b where b.[key] = 'BBProjectId')

INSERT INTO azdev.rockdb2.dbo.AttributeValue
           ([IsSystem]
           ,[AttributeId]
           ,[EntityId]
           ,[Value]
           ,[Guid]
           ,[CreatedDateTime]
           ,[ModifiedDateTime]
           ,[CreatedByPersonAliasId]
           ,[ModifiedByPersonAliasId]
           ,[ForeignKey]
           ,[ValueAsDateTime]
           ,[ForeignGuid]
           ,[ForeignId])
	SELECT 
	0
	, @BBProjectId
	, t.id
	, s.SubAcctNum
	, NEWID()
	, GETDATE()
	, GETDATE()
	, 10
	, 10
	, null
	, null
	, null
	, s.ID
	from lkDesignations s
	join azdev.rockdb2.dbo.FinancialAccount t on s.ID = t.ForeignID
	WHERE s.SubAcctNum is not null