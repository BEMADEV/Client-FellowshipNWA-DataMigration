Declare @OldAttributeKey nvarchar(36) = 'GB_SchoolName'
		, @NewAttributeKey nvarchar(36) = 'School'
		, @DefinedTypeId int = ( Select Top 1 Id From DefinedType where [Name] = 'School' )

Insert Into DefinedValue ( 
	IsSystem
	, DefinedTypeId
	, [Order]
	, [Value]
	, [Guid]
	, IsActive
)	
Select
	IsSystem = 0
	, DefinedTypeId = @DefinedTypeId
	, [Order] = 0
	, [Value] = av.[Value]
	, [Guid] = NEWID()
	, IsActive = 1
From AttributeValue av
Join Attribute a on a.Id = av.AttributeId and a.[Key] = 'GB_SchoolName'
Left Join DefinedValue dv on DefinedTypeId = 34 and dv.Value = av.Value
where dv.Id is null
Group By av.[Value]

Update av2
	Set Value = Lower(dv.[guid])
From AttributeValue av
Join Attribute a1 on a1.[Key] = @OldAttributeKey and a1.Id = av.AttributeId
Join Attribute a2 on a2.[Key] = @NewAttributeKey
Join AttributeValue av2 on av2.EntityId = av.EntityId and av2.AttributeId = a2.Id
Join DefinedValue dv on dv.[Value] = av.[Value] and dv.DefinedTypeId = @DefinedTypeId
Where av2.Id is null
and av.[Value] is not null or av.[Value] != ''

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
	, [Value] = Lower(dv.[guid])
	, [Guid] = NEWID()
From AttributeValue av
Join Attribute a1 on a1.[Key] = @OldAttributeKey and a1.Id = av.AttributeId
Join DefinedValue dv on dv.[Value] = av.[Value] and dv.DefinedTypeId = @DefinedTypeId
Left Join Attribute a2 on a2.[Key] = @NewAttributeKey
Left Join AttributeValue av2 on av2.EntityId = av.EntityId and av2.AttributeId = a2.Id
Where av2.Id is null
and av.[Value] is not null or av.[Value] != ''