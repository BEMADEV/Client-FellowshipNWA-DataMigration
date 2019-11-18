/*
Notes:
	1. Linked server requires 4-part identifer.
	2. Linked server does not support intellisense.
	3. Target alias cannot be used in SET clause. Use in UPDATE clause.
*/

UPDATE t
  SET 
      IsActive = s.Inactive, 
      IsPublic = s.DisplayOnWeb
FROM gbrestore2.dbo.lkDesignations s
     INNER JOIN azdev.rockdb2.dbo.FinancialAccount t ON s.ID = t.foreignid
WHERE s.ID = t.foreignid;