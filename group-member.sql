SELECT -- TOP 1000
i.IndId as PersonId
, m.GroupId
, IIF(PrimaryLeader = 1, 'Leader','Member') as [Role]
From tblOrganizationMember m
Join tblOrganization o on o.GroupID = m.GroupID
Join tblIndividual i on i.IndID = m.IndID
Where i.IndId is not null and m.GroupId is not null and Archive != 1