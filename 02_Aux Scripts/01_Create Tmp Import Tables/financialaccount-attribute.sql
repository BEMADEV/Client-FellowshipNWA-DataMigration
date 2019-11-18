SELECT
	 'GB_' + [Column_Name] as [Key]
	 ,[COLUMN_NAME] as [Name]
	 , CASE Data_Type
		WHEN 'datetime' THEN 'Rock.Field.Types.DateTimeFieldType'
		WHEN 'smalldatetime' THEN 'Rock.Field.Types.DateTimeFieldType'
		WHEN 'bit' THEN 'Rock.Field.Types.BooleanFieldType'
		WHEN 'int' THEN 'Rock.Field.Types.IntegerFieldType'
		ELSE 'Rock.Field.Types.TextFieldType' END as FieldType
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'lkDesignations'
	AND [Column_Name] In (
	'SubAcctNum'
	, 'ChildCareStatement'
	, 'OneTimeGift'
	, 'SolomonAcctNum'
	)