DECLARE @definedValueId int = (select v.Id from DefinedValue v where v.DefinedTypeId = 4 and v.Value like 'Deceased')

update p
set p.RecordStatusValueId = 4, p.RecordStatusReasonValueId = 167, p.InactiveReasonNote = 'Updated From SQL Import Job'
from Person p
where p.ConnectionStatusValueId = @definedValueId
