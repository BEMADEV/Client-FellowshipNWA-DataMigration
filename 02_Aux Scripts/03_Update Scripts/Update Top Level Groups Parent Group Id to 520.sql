Update g
Set ParentGroupId = 520
From [Group] g
Where ForeignId is not null and GroupTypeId not in ( 10, 11, 32)
and ParentGroupId is null
and IsActive = 1
and IsArchived = 0