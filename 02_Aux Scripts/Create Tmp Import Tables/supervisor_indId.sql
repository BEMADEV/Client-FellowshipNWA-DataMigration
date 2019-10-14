Select Distinct 
	f.SupervisorID
	, s.IndID 
From tblFamilyUsername f
Join tblFamilyUsername s on s.Id = f.SupervisorID
Order by f.SupervisorID
