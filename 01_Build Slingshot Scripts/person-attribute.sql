SELECT Distinct
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
		,'Age'
		,'CGLeaderStatus'
		, 'BackgroundCheckDate'
		, 'BGCheckHold'
		, 'BGCheckHoldReason'
		, 'BackgroundCheckNote'
		, 'AddedBy'
		, 'AddedDate'
		, 'ModBy'
		, 'ModDate'
		, 'ConfirmationDate'
	)

UNION

SELECT Distinct
	 'GB_' + [Column_Name] as [Key]
	 ,[COLUMN_NAME] as [Name]
	 , CASE Data_Type
		WHEN 'datetime' THEN 'Rock.Field.Types.DateTimeFieldType'
		WHEN 'smalldatetime' THEN 'Rock.Field.Types.DateTimeFieldType'
		WHEN 'bit' THEN 'Rock.Field.Types.BooleanFieldType'
		WHEN 'int' THEN 'Rock.Field.Types.IntegerFieldType'
		ELSE 'Rock.Field.Types.TextFieldType' END as FieldType
	, 'Grace Base HR' As Category
FROM INFORMATION_SCHEMA.COLUMNS
WHERE (TABLE_NAME = 'tblEmp'
or TABLE_NAME = 'tblFamilyUsername'
or TABLE_NAME = 'tblEmpPublicPosition'
)
	AND [Column_Name] In (
	'SupervisorID'
	, 'DirectLine'
	, 'Intercom'
	, 'MinistryArea'
	, 'HoursPerDay'
	, 'HoursPerWeek'
	, 'DateOfHire'
	, 'AnniversaryDate'
	, 'ExemptStatus'
	, 'TermDate'
	, 'TermReason'
	, 'TermSpcInstructions'
	, 'RehireEligible'
	, 'PayrollCode'
	, 'PayrollName'
	, 'PTOStartDate'
	, 'SabbaticalStartDate'
	, 'BenefitsStartDate'
	, 'PrimaryPositionName'
	, 'IDName'
	, 'SabbaticalClass'
	, 'PTFTPosition'
	, 'SabbaticalLastTakenDate'
	, 'SabbaticalNextEligibleDate'
	, 'SabbaticalNotes'
	, 'PositionType'
	, 'WorkWeekDesc'
	, 'MinistryArea'
	, 'Title'
	, 'Workphone'
	, 'ShowOnGlobal'
	, 'ShowOnCongregation'
	, 'Staff'
	, 'Phone'
	, 'Congregation'
	)

UNION 

SELECT Distinct
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
WHERE TABLE_NAME = 'tblFamilyUsername'
	AND [Column_Name] In (
		'LastAccessDate'
		, 'AccountActive'
	)

Order By [Key]
