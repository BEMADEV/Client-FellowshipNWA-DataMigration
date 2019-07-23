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

Select 
	a.[Key] as [Key]
	, a.[Name] as [Name]
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
	, 76 as EntityTypeId
	, '' as EntityTypeQualifierColumn
	, '' as EntityTypeQualifierValue
	, 'GB' as ForeignKey
From [_tmp_financialaccount-attribute] a
Join FieldType ft on a.FieldType = ft.[Class]
LEFT Join Attribute ra on a.[Key] = ra.[key] and ra.foreignKey = 'GB'
Where RA.Id is null

INSERT INTO AttributeValue( 
	IsSystem
	, AttributeId
	, EntityId
	, ForeignKey
	, [Value]
	, [Guid] )
SELECT 
	0 as IsSystem
	, a.Id as AttributeId
	, t.Id as EntityId
	, 'GB' as ForeignKey
	, tt.[AttributeValue] as [Value]
	, NEWID() as [Guid]
From 
	[_tmp_financialaccount-attributevalue] tt
Join FinancialAccount t on t.ForeignId = tt.accountId
Join Attribute a on a.[key] = tt.AttributeKey