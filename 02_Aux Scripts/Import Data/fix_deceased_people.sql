DECLARE @deceasedDefinedValueId int = (select v.Id from DefinedValue v where v.DefinedTypeId = 4 and v.Value like 'Deceased')
DECLARE @UnknownDefinedValueId int = (select v.Id from DefinedValue v where v.DefinedTypeId = 4 and v.Value like 'Unknown')
DECLARE @MovedDefinedValuedId Int = (Select v.Id From DefinedValue v where v.DefinedTypeId = 4 and v.Value like 'Moved' )
DECLARE @InactiveDefinedValuedId Int = (Select v.Id From DefinedValue v where v.DefinedTypeId = 4 and v.Value like 'Inactive' )
 
 

update p
set p.RecordStatusValueId = 4
	, p.RecordStatusReasonValueId = 167
	, p.IsDeceased = 1
	, p.ConnectionStatusValueId = @UnknownDefinedValueId
from Person p
where p.ConnectionStatusValueId = @deceasedDefinedValueId

update p
set p.RecordStatusValueId = 4
	, p.RecordStatusReasonValueId = 166
	, p.ConnectionStatusValueId = @UnknownDefinedValueId
from Person p
where p.ConnectionStatusValueId = @MovedDefinedValuedId

update p
set p.RecordStatusValueId = 4
	, p.ConnectionStatusValueId = @UnknownDefinedValueId
from Person p
where p.ConnectionStatusValueId = @InactiveDefinedValuedId


