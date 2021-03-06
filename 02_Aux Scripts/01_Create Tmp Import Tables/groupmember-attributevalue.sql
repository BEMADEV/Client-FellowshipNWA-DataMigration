DECLARE @DynamicPivotQuery AS NVARCHAR(MAX)
DECLARE @ColumnName AS NVARCHAR(MAX)
DECLARE @ConvertColumns as NVARCHAR(MAX)

SELECT @ConvertColumns = ISNULL(@ConvertColumns + ',','') 
       + 'Cast(' + QUOTENAME(fieldData) + ' AS NVARCHAR(MAX)) AS ' + QUOTENAME(fieldData)
FROM (
SELECT DISTINCT 
	fieldData 
FROM lkCampFields f
join ( SELECT
	 [Column_Name] as [Key]
	 ,[COLUMN_NAME] as [Name]
	 , CASE Data_Type
		WHEN 'datetime' THEN 'Rock.Field.Types.DateTimeFieldType'
		WHEN 'smalldatetime' THEN 'Rock.Field.Types.DateTimeFieldType'
		WHEN 'bit' THEN 'Rock.Field.Types.BooleanFieldType'
		WHEN 'int' THEN 'Rock.Field.Types.IntegerFieldType'
		ELSE 'Rock.Field.Types.TextFieldType' END as FieldType
	, 'Grace Base' As Category
	, 7 as GroupTypeId
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'tblOrganizationMember') c on c.[Key] = f.FieldData
where fieldData != '' and fieldData is not null
) AS x

--Get distinct values of the PIVOT Column 
SELECT @ColumnName = ISNULL(@ColumnName + ',','') 
       + QUOTENAME(fieldData)
FROM (
SELECT DISTINCT 
	fieldData 
FROM lkCampFields f
join ( SELECT
	 [Column_Name] as [Key]
	 ,[COLUMN_NAME] as [Name]
	 , CASE Data_Type
		WHEN 'datetime' THEN 'Rock.Field.Types.DateTimeFieldType'
		WHEN 'smalldatetime' THEN 'Rock.Field.Types.DateTimeFieldType'
		WHEN 'bit' THEN 'Rock.Field.Types.BooleanFieldType'
		WHEN 'int' THEN 'Rock.Field.Types.IntegerFieldType'
		ELSE 'Rock.Field.Types.TextFieldType' END as FieldType
	, 'Grace Base' As Category
	, 7 as GroupTypeId
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'tblOrganizationMember') c on c.[Key] = f.FieldData
where fieldData != '' and fieldData is not null
) AS x
 
--Prepare the PIVOT query using the dynamic 
SET @DynamicPivotQuery = 
  N'
  DECLARE @tmpTable as Table(MemberId Int,  ColumnName nvarchar(max), AttributeValue nvarchar(max))
  
  Insert Into @tmpTable(MemberId, ColumnName, AttributeValue )
  SELECT 
		 MemberId
		 , ColumnName
		, [Value]  as AttributeValue
	FROM
	(
		SELECT
		MemberId, 	'
		+ @ConvertColumns 
		+ ' FROM tblOrganizationMember
	) as S
	UNPIVOT
	(
		Value for ColumnName IN ('+ @ColumnName + ')
		) as U
Where [Value] != ''''


Select m.GroupId, m.IndId as PersonId, t.AttributeValue, ''GB_'' + cast(f.Id as nvarchar(11)) + ''_'' + f.FieldName as [AttributeKey]
FROM @TmpTable t
Join tblOrganizationMember m on m.MemberId = t.MemberId
Join lkCamp c on c.GroupId = m.GroupId
Join lkCampFields f on f.CampId = c.CampId and f.FieldData = t.ColumnName
Where m.IndId is not null
'

PRINT @DynamicPivotQuery
          
--Execute the Dynamic Pivot Query
EXEC sp_executesql @DynamicPivotQuery