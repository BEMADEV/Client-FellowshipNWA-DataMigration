Declare @OldAttributeKey nvarchar(36) = 'GB_ScreeningFormDate'
		, @NewAttributeKey nvarchar(36) = 'ScreeningFormDate'

Update av2
	Set Value = av.[Value]
From AttributeValue av
Join Attribute a1 on a1.[Key] = @OldAttributeKey and a1.Id = av.AttributeId
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
	, [Value] = av.[Value]
	, [Guid] = NEWID()
From AttributeValue av
Join Attribute a1 on a1.[Key] = @OldAttributeKey and a1.Id = av.AttributeId
Left Join Attribute a2 on a2.[Key] = @NewAttributeKey
Left Join AttributeValue av2 on av2.EntityId = av.EntityId and av2.AttributeId = a2.Id
Where av2.Id is null
and av.[Value] is not null and av.[Value] != ''
