DECLARE @DefinedTypeId int = 112
		, @DefaultValueId int = 1167
		, @AttributeId int = 5825
		, @ForeignKey varchar(11) = 'GB'
; WITH CTE AS (
	Select
		p.Id as PersonId
		, isNull(dv.Id, @DefaultValueId) as DefinedValueId
	From 
		_Tmp_Person_region pr
	Join Person p on p.ForeignId = pr.PersonId and p.ForeignKey = @ForeignKey
	Left Join DefinedValue dv on dv.Value = pr.FRegion and definedTypeId = 112
)

Select
*
Into #tmp
From CTE

--Select
--	dv.[Guid]
--From AttributeValue av
--Join #tmp on #tmp.PersonId = av.EntityId and av.AttributeId = @AttributeId
--Join DefinedValue dv on dv.Id = #tmp.DefinedValueId

Insert Into AttributeValue( IsSystem, AttributeId, EntityId, [Value], [Guid] )
Select 
	0 as IsSystem
	, @AttributeId as AttributeId
	, #tmp.PersonId as EntityId
	, Lower(dv.[Guid]) as [Value]
	, NEWID() as [Guid]
From #tmp
Join DefinedValue dv on dv.Id = #tmp.DefinedValueId
Left Join AttributeValue v on v.EntityId = #tmp.PersonId and v.AttributeId = @AttributeId
Where v.id is null

Drop Table #tmp