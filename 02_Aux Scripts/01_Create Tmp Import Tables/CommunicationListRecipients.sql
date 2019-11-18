SELECT i.IndID, el.EmailListID
  FROM tblIndividualEmailLists iel,
   lkEmailLists el,
   tblIndividual i,
   tblFamily f
   where el.GraceBaseID = 1
	 and el.EmailListID = iel.EmailListID
	 and iel.Subscribed = 'true'
	 and iel.IndID = i.IndID
	 and i.FamilyID = f.FamilyID
	 and f.Archive = 'false'
	 and el.EmailListId IN(14,13,55,25,59,11)