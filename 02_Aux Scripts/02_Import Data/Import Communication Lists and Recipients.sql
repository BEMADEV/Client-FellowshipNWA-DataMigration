DECLARE @GroupTypeId int = 32
	, @foreignKey varchar(36) = 'GB'

Insert Into [Group] (
	IsSystem
	, GroupTypeId
	, [Name]
	, IsSecurityRole
	, IsActive
	, [Order]
	, [Guid]
	, [ForeignKey]
	, ForeignId
	, IsPublic
	, IsArchived
)
Select
	IsSystem = 0
	, GroupTypeId = @GroupTypeId
	, [Name] = cl.[Name]
	, IsSecurityRole = 0
	, IsActive = 1
	, [Order] = 0
	, [Guid] = NEWID()
	, [ForeignKey] = @foreignKey
	, ForeignId = cl.Id
	, IsPublic = 1
	, IsArchived = 0
From
_tmp_communicationList cl
Left Join [Group] g on g.ForeignKey = @foreignKey and g.ForeignId = cl.Id and g.GroupTypeId = @GroupTypeId
Where g.Id is Null

Insert Into GroupMember (
	IsSystem
	, GroupId
	, PersonId
	, GroupRoleId
	, GroupMemberStatus
	, [Guid]
	, [ForeignKey]
	, IsArchived
)
Select 
	IsSystem = 0
	, GroupId = g.Id
	, PersonId = p.Id
	, GroupRoleId = t.DefaultGroupRoleId
	, GroupMemberStatus = 1
	, [Guid] = NEWID()
	, [ForeignKey] = @ForeignKey
	, IsArchived = 0
From Person p
Join _tmp_CommunicationListRecipients clr on p.ForeignKey = @foreignKey and p.ForeignId = clr.IndID
Join [Group] g on g.ForeignKey = @foreignKey and g.GroupTypeId = @GroupTypeId and g.ForeignId = clr.EmailListID
Join GroupType t on t.Id = g.GroupTypeId
Left Join [GroupMember] m on m.GroupId = g.Id and m.PersonId = p.Id
Where m.Id is null