DECLARE @ForeignKey nvarchar(50)='GB-Manual-Reg'
		, @GroupId int = 80699
		, @InstanceId int = 28

--Delete From RegistrationRegistrant where foreignKey = @ForeignKey
--Delete From Registration Where ForeignKey = @ForeignKey

Select
	Id
Into #Groups
From [Group] g
Where id = @GroupId

Insert Into Registration(
	RegistrationInstanceId
	, PersonAliasId
	, FirstName
	, LastName
	, ConfirmationEmail
	, GroupId
	, [Guid]
	, ForeignKey
	, ForeignId
	, DiscountPercentage
	, DiscountAmount
	, IsTemporary
)

Select
	RegistrationInstanceId = @InstanceId
	, PersonAliasId = pa.Id
	, FirstName = p.FirstName
	, LastName = p.LastName
	, ConfirmationEmail = p.Email
	, GroupId = g.Id
	, [Guid] = NEWID()
	, ForeignKey = @ForeignKey
	, ForeignId = m.Id
	, DiscountPercentage = 0
	, DiscountAmount = 0
	, IsTemporary = 0
From GroupMember m
Join [Group] g on g.Id = m.GroupId
Join #Groups f on f.id = g.id
Join Person p on p.id = m.PersonId
Join PersonAlias pa on pa.Personid = p.id and pa.AliasPersonId = p.id
Left Join Registration r on r.ForeignKey = @ForeignKey and r.ForeignId = m.Id
Where r.id is null

Insert Into RegistrationRegistrant (
	RegistrationId
	, PersonAliasId
	, GroupmemberId
	, Cost
	, [Guid]
	, ForeignKey
	, ForeignId
	, OnWaitList
	, DiscountApplies )
Select
	RegistrationId = r.Id
	, PersonAliasId = pa.Id
	, GroupmemberId = m.Id
	, Cost = 0
	, [Guid] = NEWID()
	, ForeignKey = @ForeignKey
	, ForeignId = m.Id
	, OnWaitList = 0
	, DiscountApplies = 0
From GroupMember m
Join [Group] g on g.Id = m.GroupId
Join #Groups f on f.id = g.id
Join Person p on p.id = m.PersonId
Join PersonAlias pa on pa.Personid = p.id and pa.AliasPersonId = p.id
Join Registration r on r.ForeignKey = @ForeignKey and r.ForeignId = m.Id
Left Join RegistrationRegistrant rr on rr.ForeignKey = @ForeignKey and rr.ForeignId = m.Id
Where rr.Id is null

Drop Table #Groups

