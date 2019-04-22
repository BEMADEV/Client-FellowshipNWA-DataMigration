DECLARE @ForeignKey varchar(11) = 'GB'

Insert Into AttributeValue( IsSystem, AttributeId, EntityId, [Value], [Guid] )
Select 
	0 as IsSystem
	, a.Id as AttributeId
	, g.Id as EntityId
	, tav.AttributeValue as [Value]
	, NEWID() as [Guid]
From [_tmp_group-attributevalue] tav
Join Attribute a on a.[Key] = tav.AttributeKey
Join [Group] g on g.ForeignId = tav.Groupid and g.ForeignKey = @ForeignKey
Left Join AttributeValue v on v.EntityId = g.id and v.AttributeId = a.Id
Where v.id is null