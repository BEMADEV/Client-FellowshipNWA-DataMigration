INSERT INTO Attribute(
		[key]
		, [Name]
		, IsSystem
		, FieldTypeId
		, [Order]
		, IsMultiValue
		, IsRequired
		, [Guid]
		, AllowSearch
		, IsIndexEnabled
		, IsAnalytic
		, IsAnalyticHistory
		, IsGridColumn
		, EntityTypeId
		, EntityTypeQualifierColumn
		, EntityTypeQualifierValue
		, ForeignKey )
		
Select Distinct
	a.[Key] as [Key]
	, isnull(a.[Name], a.[Key]) as [Name]
	, 0 as IsSystem
	, ft.id as FieldTypeId
	, 0 as [Order]
	, 0 as IsMultiValue
	, 0 as IsRequired
	, NEWID() as [Guid]
	, 0 as AllowSearch
	, 0 as IsIndexEnabled
	, 0 as IsAnalytic
	, 0 as IsAnalyicHistory
	, 0 as IsGridColumn
	, 90 as EntityTypeId
	, 'GroupId' as EntityTypeQualifierColumn
	, Cast(g.Id as nvarchar(9)) as EntityTypeQualifierValue
	, 'GB' as ForeignKey
From [_tmp_groupmember-attribute] a
Join FieldType ft on a.FieldType = ft.[Class]
Join [Group] g on g.ForeignId = a.GroupId and g.foreignKey = 'GB' and GroupTypeId != 10
LEFT Join Attribute ra on a.[Key] = ra.[key] and ra.foreignKey = 'GB'
Where RA.Id is null