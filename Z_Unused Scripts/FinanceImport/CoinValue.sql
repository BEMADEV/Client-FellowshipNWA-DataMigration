declare @coinattributeid int = (select a.id from azdev.rockdb2.dbo.Attribute a where a.[key] = 'FTCoin')
--declare @paperattributeid int = (select b.id from azdev.rockdb2.dbo.Attribute b where b.[key] = 'FTPaper')

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
	, @coinattributeid
	, t.id
	, s.coin
	, NEWID()
	, GETDATE()
	, GETDATE()
	, 10
	, 10
	, null
	, null
	, null
	, s.ContribID#
	from tblContributions s
	join azdev.rockdb2.dbo.FinancialTransaction t on s.ContribID# = t.ForeignID
	WHERE s.coin is not null;