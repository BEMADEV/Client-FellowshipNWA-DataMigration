-- Add Active Status to Campus
SELECT
, 0 as IsSystem
, Id as ForeignId
, Church as [Name]
, 'GB' as ForeignKey
, NEWID() as [Guid]
, IIF(inActive = 1, 0, 1) as IsActive
 From lkChurch