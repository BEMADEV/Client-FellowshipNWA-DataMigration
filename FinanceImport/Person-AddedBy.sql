DECLARE @GBAddedBy INT=
(
    SELECT b.id
    FROM azdev.rockdb2.dbo.Attribute b
    WHERE b.[key] = 'GBAddedBy'
);
INSERT INTO azdev.rockdb2.dbo.AttributeValue
([IsSystem], 
 [AttributeId], 
 [EntityId], 
 [Value], 
 [Guid], 
 [CreatedDateTime], 
 [ModifiedDateTime], 
 [CreatedByPersonAliasId], 
 [ModifiedByPersonAliasId], 
 [ForeignKey], 
 [ValueAsDateTime], 
 [ForeignGuid], 
 [ForeignId]
)
       SELECT 0, 
              @GBAddedBy, 
              t.id, 
              s.AddedBy, 
              NEWID(), 
              GETDATE(), 
              GETDATE(), 
              10, 
              10, 
              NULL, 
              NULL, 
              NULL, 
              s.IndID
       FROM tblIndividual s
            JOIN azdev.rockdb2.dbo.Person t ON s.IndID = t.ForeignID
       WHERE s.AddedBy is not null
             AND s.IndID = 54251;