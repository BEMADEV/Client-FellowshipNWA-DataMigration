UPDATE t
SET IgnoreUntilScoreChanges = 1
FROM tblIndividual s
INNER JOIN azdev.rockdb2.dbo.Person a
  ON s.IndID = a.ForeignId
INNER JOIN azdev.rockdb2.dbo.PersonAlias b
  ON b.PersonId = a.Id
INNER JOIN azdev.rockdb2.dbo.PersonDuplicate t
  ON t.PersonAliasId = b.Id
WHERE s.ConfirmationDate IS NOT NULL
AND t.personaliasid = 77393;