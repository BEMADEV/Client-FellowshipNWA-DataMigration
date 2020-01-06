Declare @CGStudayAttributeId int = ( Select Top 1 Id From Attribute a Where [Key] = 'GB_CGStudy' )
		, @TopicAttributeId int = 1409

Select
	*
Into #GroupMap
From ( Values
	  ( 1, 25 )
	, ( 2, 26 )
	, ( 3, 26 )
	, ( 4, 143 )
	, ( 5, 26 )
	, ( 6, 23 )
	, ( 7, 26 )
	, ( 8, 26 )
	, ( 9, 26 )
) x (OldId, Id)

Insert Into GroupTypeRole (
	IsSystem
	, GroupTypeId
	, [Name]
	, [Order]
	, [Guid]
	, CanView
	, CanEdit
	, ReceiveRequirementsNotifications
	, CanManageMembers
	, IsLeader )
Select
	isSystem = 0
	, GroupTypeId = nt.Id
	, [Name] = r.[Name]
	, [Order] = 0
	, [Guid] = NEWID()
	, CanView = 0
	, CanEdit = 0
	, ReceiveRequirementsNotifications = 0
	, CanManageMembers = 0
	, isLeader = 0
From [GroupMember] m
Join [Group] g on g.Id = m.GroupId
Join [GroupType] t on t.Id = g.GroupTypeId
Join #GroupMap gm on gm.OldId = t.ForeignId
Join GroupType nt on nt.Id = gm.Id
Join GroupTypeRole r on r.Id = m.GroupRoleId
Left Join GroupTypeRole nr on nr.GrouptypeId = nt.id and nr.[Name] = r.[Name]
Where nr.Id is null
Group By r.[Name], nt.Id	

Update m
Set GroupRoleId = isNull(nr.Id, nt.DefaultGroupRoleId)
From [GroupMember] m
Join [Group] g on g.Id = m.GroupId
Join [GroupType] t on t.Id = g.GroupTypeId
Join #GroupMap gm on gm.OldId = t.ForeignId
Join GroupType nt on nt.Id = gm.Id
Join GroupTypeRole r on r.Id = m.GroupRoleId
Left Join GroupTypeRole nr on nr.GrouptypeId = nt.id and nr.[Name] = r.[Name]

Update g
	Set GroupTypeId = gm.Id
From [GroupType] t
Join #GroupMap gm on gm.OldId = t.ForeignId
Join [Group] g on g.GroupTypeId = t.Id

Update Attribute
	Set FieldTypeId = 1
where Id = @TopicAttributeId

Update av
	Set AttributeId = @TopicAttributeId
From AttributeValue av
Where AttributeId = @CGStudayAttributeId

Drop Table #GroupMap