declare @BBAccountNumber int = (select b.id from azdev.rockdb2.dbo.Attribute b where b.[key] = 'BBAccountNumber')

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
	, @BBAccountNumber
	, t.id
	, s.SolomonAcctNum
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
	WHERE s.SolomonAcctNum is not null
	and s.ID = 449