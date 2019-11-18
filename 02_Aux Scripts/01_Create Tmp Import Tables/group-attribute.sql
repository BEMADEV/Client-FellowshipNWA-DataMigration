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
	, 1 as GroupTypeId
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'tblOrganization'
	AND [Column_Name] In (
	'CoachShepard'
	, 'OnlineService'
	, 'OnlineSeason'
	, 'OnlineRegion'
	, 'OnlinePublic'
	, 'OnlineSize'
	, 'OnlineGender'
	, 'CoachIndID'
	, 'OnlineChildcare'
	, 'OnlineNote'
	, 'CGImage'
	, 'CGStudy'
	)


UNION ALL

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
	, 3 as GroupTypeId
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'tblOrganization'
	AND [Column_Name] In (
		  'MissionName'
		, 'MissionDescDefault'
		, 'MissionFund'
		, 'MissionOnline'
		, 'MissionFeeID'
		, 'MissionImage'
		, 'MissionGoal'
		, 'MissionDescShort'
	)

UNION ALL

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
	, 6 as GroupTypeId
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'tblOrganization'
	AND [Column_Name] In (
		'VolCOGService'
		,'VolCOGAgeGroup'
		,'VolStartDate'
		,'VolEndDate'
		,'VolCoordinator'
		,'VolAutoRemindersOff'
		,'SendReminderNumDays'
		,'EmailReminder'
		,'TextReminder'
		,'VolDescription'
		,'VolImage'
		,'VolContactName'
		,'VolContactNumber'
		,'VolContactEmail'
		,'VolThankYouMessage'
		,'VolCOGServiceID'
		,'VolCOGServiceShortcode'
		,'VolCOGDayWeek'
		,'VolCOGStartTime'
		,'VolCOGEndTime'
		,'VolCOGAgeGroupID'
		,'VolFrequency'
		,'VolAutoAssignment'
		,'OtherRolesBreakdown'
		,'VolCOGWeekOfMonth'
		,'VolBackgroundCheck'
	)

UNION ALL

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
	, 7 as GroupTypeId
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'tblOrganization'
	AND [Column_Name] In (
	 'COGServiceName'
	,'COGGroupName'
	,'COGGradeStart'
	,'COGGradeEnd'
	,'COGGender'
	,'COGPickupRm'
	,'COGCheckinRm'
	,'COGRegion'
	,'COGRegisteredOnly'
	,'COGRoomName'
	,'COGDOBStart'
	,'COGDOBEnd'
	,'COGOverflowRoom1'
	,'COGOverflowRoom2'
	,'COGCapacity'
	,'COGReceiptLabel'
	,'COGNameTagLabel'
	,'COGSetupStartDate'
	,'COGSetupEndDate'
	,'COGAgeGroup'
	,'COGCampus'
	,'COGMultiService'
	,'COGDoNotPrintLabel'
	)

	UNION ALL

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
	, 4 as GroupTypeId
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'tblOrganization'
	AND [Column_Name] In (
		'ClassType'
		,'TrainingClass'
		,'TrainingClassName'
	)

	UNION ALL

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
	, 5 as GroupTypeId
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'tblOrganization'
	AND [Column_Name] In (
		'ChildcareType'
	)