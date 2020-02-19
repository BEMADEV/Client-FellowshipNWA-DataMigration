Insert Into GroupTypeRole (
	IsSystem
	, GroupTypeId
	, [Name]
	, [Order]
	, IsLeader
	, CanEdit
	, CanView
	, ReceiveRequirementsNotifications
	, CanManageMembers
	, [Guid] )
Select
	isSystem = 0
	, GroupTypeId = g.GroupTypeId
	, [Name] = gm.[Role]
	, [Order] = 0
	, IsLeader = IIF( [Role] = 'Leader', 1, 0 )
	, CanEdit = 0
	, CanView = 0
	, ReceiveRequirementsNotifications = 0
	, CanManageMembers = 0
	, [Guid] = NEWID()
From _tmp_groupmember gm
Join [Group] g on g.ForeignId = gm.GroupId and g.grouptypeId != 10 and g.GroupTypeId != 11
Left Join GroupTypeRole r on r.[Name] = gm.[Role] and r.GroupTypeId = g.GroupTypeId
Where r.Id is null
Group by g.GroupTypeId
, gm.[role]

Insert Into GroupMember (
	IsSystem
	, GroupId
	, PersonId
	, GroupRoleId
	, GroupMemberStatus
	, [Guid]
	, IsNotified
	, IsArchived )
Select
	IsSystem = 0
	, GroupId = g.Id
	, PersonId = p.Id
	, GroupRoleId = r.Id
	, GroupMemberStatus = 1
	, [Guid] = NewId()
	, IsNotified = 0
	, IsArchived = 0
From _tmp_groupmember gm
Join [Group] g on g.ForeignId = gm.GroupId and g.grouptypeId != 10 and g.GroupTypeId != 11
Join Person p on p.ForeignId = gm.PersonId
Join GroupTypeRole r on r.[Name] = gm.[Role] and r.GroupTypeId = g.GroupTypeId
Left Join GroupMember m2 on m2.PersonId = p.Id and m2.GroupId = g.Id
Where m2.Id is null
