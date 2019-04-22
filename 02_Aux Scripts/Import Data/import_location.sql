Insert into [Location]( [Name], LocationTypeValueId, IsActive, Street1, Street2, City, [State], Country, PostalCode, County, ForeignId, ForeignKey, [Guid] )
Select
	tl.[Name]
	, dv.Id as LocationTypeId
	, tl.isActive
	, Street1
	, Street2
	, City
	, [State]
	, [Country]
	, [PostalCode]
	, [County]
	, tl.Id as ForiegnId
	, 'GB' as ForeignKey
	, NEWID()
From _tmp_location tl
Join DefinedValue dv on dv.Value = 'Meeting Location' and dv.DefinedTypeId = 15


Update l
Set ParentLocationId = pl.Id
from [Location] l
Join [_tmp_location] tl on l.ForeignId = tl.Id
Join [Location] pl on pl.ForeignId = tl.ParentLocationId
where tl.ParentLocationId is not null