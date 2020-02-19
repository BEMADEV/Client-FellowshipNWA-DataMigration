Declare @OldAttributeKey nvarchar(36) = 'GB_ReferenceCheckBy'
		, @NewAttributeKey nvarchar(36) = 'ReferenceCheckedBy'

Update av2
	Set Value = LOWER(Cast(pa.[Guid] as nvarchar(36)))
From AttributeValue av
Join Attribute a1 on a1.[Key] = @OldAttributeKey and a1.Id = av.AttributeId
Join Person p on p.FirstName + ' ' + p.LastName = av.[Value]
Join PersonAlias pa on pa.PersonId =p.Id and pa.AliasPersonId = p.Id
Join Attribute a2 on a2.[Key] = @NewAttributeKey
Join AttributeValue av2 on av2.EntityId = av.EntityId and av2.AttributeId = a2.Id
Where av2.Id is null
and av.[Value] is not null and av.[Value] != ''

Insert Into AttributeValue (
	IsSystem
	, AttributeId
	, EntityId
	, [Value]
	, [Guid] )
Select
	IsSystem = 0
	, AttributeId = a2.Id
	, EntityId = av.EntityId
	, [Value] = Max(LOWER(Cast(pa.[Guid] as nvarchar(36))))
	, [Guid] = NEWID()
From AttributeValue av
Join Attribute a1 on a1.[Key] = @OldAttributeKey and a1.Id = av.AttributeId
Join Person p on p.FirstName + ' ' + p.LastName = av.[Value]
Join PersonAlias pa on pa.PersonId =p.Id and pa.AliasPersonId = p.Id
Left Join Attribute a2 on a2.[Key] = @NewAttributeKey
Left Join AttributeValue av2 on av2.EntityId = av.EntityId and av2.AttributeId = a2.Id
Where av2.Id is null
and av.[Value] is not null and av.[Value] != ''
Group By a2.Id, av.EntityId