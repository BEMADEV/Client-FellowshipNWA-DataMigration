
Insert Into [Group] ( IsSystem, GroupTypeId, [Name], IsSecurityRole, IsActive, [Order], [Guid], IsPublic, IsArchived, ForeignId, ForeignKey )
Select Distinct
	 0 as isSystem
	, 11 as GroupTypeId
	, 'Known Relationship' as [Name]
	, 0 as IsSecuirtyRole
	, 1 as IsActive
	, 0 as [Order]
	, NEWID() as [Guid]
	, 1 as IsPublic
	, 0 as IsArchived
	, p.id as ForeignId
	, 'GB-Relationships' as ForeignKey
From _tmp_knownrelationship k
Join Person p on p.ForeignId = k.RelatedPersonId
LEFT Join [GroupMember] m on m.PersonId = p.Id and m.GroupRoleId = 5
where m.Id is null and k.RelatedPersonId != 'Null'

Insert Into GroupMember( IsSystem, GroupId, PersonId, GroupRoleId, GroupMemberStatus, [Guid] )
Select
	0 IsSystem
	, Min(g.Id) as GroupId
	, p.Id as PersonId
	, 5 as GroupRoleId
	, 1 as GroupMemberStatus
	, NEWID() as [Guid]
From _tmp_knownrelationship k
Join Person p on p.ForeignId = k.RelatedPersonId
join [Group] g on g.ForeignId = p.Id and g.ForeignKey = 'GB-Relationships' and g.GroupTypeId = 11
LEFT Join [GroupMember] m on m.PersonId = p.Id and m.GroupRoleId = 5
where m.Id is null and k.RelatedPersonId != 'Null'
Group by p.Id


Insert Into GroupMember( IsSystem, GroupId, PersonId, GroupRoleId, GroupMemberStatus, [Guid], ForeignKey )
Select Distinct
	0 IsSystem
	, m.GroupId as GroupId
	, p2.Id as PersonId
	, r.Id as GroupRoleId
	, 1 as GroupMemberStatus
	, NEWID() as [Guid]
	, 'GB' as ForeignKey
From _tmp_knownrelationship k
Join Person p on p.ForeignId = k.RelatedPersonId
Join [GroupMember] m on m.PersonId = p.Id and m.GroupRoleId = 5
Join Person p2 on p2.ForeignId = k.personId
Join GroupTypeRole r on r.[Name] = k.[Role]
Left Join [GroupMember] M2 on p2.Id = m2.PersonId and m.GroupId = m2.GroupId
Where k.PersonId != 'Null' and k.RelatedPersonId != 'Null'
and m2.Id is null