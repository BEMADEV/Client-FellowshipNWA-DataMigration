declare @staffattribute int = (select a.id from azdev.rockdb2.dbo.Attribute a where a.[key] = 'GB_Staff')

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
	, @staffattribute
	, b.id
	, u.Staff
	, NEWID()
	, GETDATE()
	, GETDATE()
	, 10
	, 10
	, null
	, null
	, null
	, b.ForeignID
	from tblIndividual s
	join tblFamilyUsername u on u.IndID = s.IndID
	inner join azdev.rockdb2.dbo.Person b on s.IndID = b.ForeignID
	where u.staff is not null and u.staff = 1