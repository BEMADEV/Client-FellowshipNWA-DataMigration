Select 
'GB_' + cast(f.Id as nvarchar(11)) + '_' + f.FieldName as [Key]
, f.FieldCaption as [Name]
, 'Rock.Field.Types.TextFieldType' as FieldType
, 'Grace Base' as Category
, o.GroupId
 From lkCampFields f
Join lkCamp c on c.CampId = f.CampID
Join tblOrganization o on o.GroupID = c.GroupID

