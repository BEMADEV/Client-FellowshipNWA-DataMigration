DECLARE @ForeignKey varchar(11) = 'GB'

Insert Into AttributeValue( IsSystem, AttributeId, EntityId, [Value], [Guid] )
Select 
	0 as IsSystem
	, a.Id as AttributeId
	, m.Id as EntityId
	, Max(tav.AttributeValue) as [Value]
	, NEWID() as [Guid]
From [_tmp_groupmember-attributevalue] tav
Join Attribute a on a.[Key] = tav.AttributeKey
Join [Group] g on g.ForeignId = tav.Groupid and g.ForeignKey = @ForeignKey and GroupTypeId != 10
join Person p on p.ForeignId = tav.PersonId and p.ForeignKey = @ForeignKey
Join GroupMember m on m.Groupid = g.id and m.personId = p.id
Left Join AttributeValue v on v.EntityId = m.id and v.AttributeId = a.Id
Where v.id is null
Group By a.Id, m.id