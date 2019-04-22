SELECT
	 'GB_' + [Column_Name] as [Key]
	 ,[COLUMN_NAME] as [Name]
	 , CASE Data_Type
		WHEN 'datetime' THEN 'Rock.Field.Types.DateTimeFieldType'
		WHEN 'smalldatetime' THEN 'Rock.Field.Types.DateTimeFieldType'
		WHEN 'bit' THEN 'Rock.Field.Types.BooleanFieldType'
		WHEN 'int' THEN 'Rock.Field.Types.IntegerFieldType'
		ELSE 'Rock.Field.Types.TextFieldType' END as FieldType
	, 'Grace Base' As Category
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'tblIndividual'
	AND [Column_Name] In (
		'IDisplayName'
		,'FamilyRole'
		,'EmailAddressAlt'
		,'DeceaseDate'
		,'DeceaseCause'
		,'DeceaseCauseNotes'
		,'SchoolName'
		,'SchoolGrade'
		,'SchoolGradeName'
		,'SchoolGradeDate'
		,'ChurchDesignation'
		,'CommunityGroupStatus'
		,'LastActivityDate'
		,'DiscoveryDate'
		,'DiscoveryNotes'
		,'DiscoveryLocation'
		,'DiscoveryTaken'
		,'PassportNumber'
		,'FullLegalName'
		,'ExcludeFromDuplicate'
		,'CheckInNotes'
		,'NumOrgs'
		,'IRegion'
		,'UniversalNotes'
		,'Staff'
		,'Age'
		,'CGLeaderStatus'
	)