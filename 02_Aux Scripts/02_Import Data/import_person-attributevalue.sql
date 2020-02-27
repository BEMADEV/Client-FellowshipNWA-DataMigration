DECLARE @ForeignKey varchar(11) = 'GB'

Insert Into AttributeValue( IsSystem, AttributeId, EntityId, [Value], [Guid] )
Select 
	0 as IsSystem
	, a.Id as AttributeId
	, p.Id as EntityId
	, Min(tav.AttributeValue) as [Value]
	, NEWID() as [Guid]
From [_tmp_person-attributevalue] tav
Join Attribute a on a.[Key] = tav.AttributeKey
Join [Person] p on p.ForeignId = tav.PersonId and p.ForeignKey = @ForeignKey
Left Join AttributeValue v on v.EntityId = p.id and v.AttributeId = a.Id
Where v.id is null
Group by a.Id, p.Id