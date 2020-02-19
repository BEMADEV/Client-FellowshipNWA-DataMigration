DECLARE @ForeignKey varchar(11) = 'GB'

Insert Into AttributeValue( IsSystem, AttributeId, EntityId, [Value], [Guid] )
Select 
	0 as IsSystem
	, a.Id as AttributeId
	, g.Id as EntityId
	, Max(tav.AttributeValue) as [Value]
	, NEWID() as [Guid]
From [_tmp_person-attributevalue] tav
Join Attribute a on a.[Key] = tav.AttributeKey
Join person g on g.ForeignId = tav.personId and g.ForeignKey = @ForeignKey
Left Join AttributeValue v on v.EntityId = g.id and v.AttributeId = a.Id
Where v.id is null and tav.AttributeValue is not null
Group By g.Id, a.Id