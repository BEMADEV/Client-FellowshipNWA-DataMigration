SELECT 
	GroupId as GroupId
	, 'GB_' + ColumnName as AttributeKey
	, [Value]  as AttributeValue
FROM
(
	SELECT
		GroupId
		, CAST(CoachShepard AS NVARCHAR(MAX)) as CoachShepard
		, CAST(OnlineService AS NVARCHAR(MAX)) as OnlineService
		, CAST(OnlineSeason AS NVARCHAR(MAX)) as OnlineSeason
		, CAST(OnlineRegion AS NVARCHAR(MAX)) as OnlineRegion
		, CAST(OnlinePublic AS NVARCHAR(MAX)) as OnlinePublic
		, CAST(OnlineSize AS NVARCHAR(MAX)) as OnlineSize
		, CAST(OnlineGender AS NVARCHAR(MAX)) as OnlineGender
		, CAST(CoachIndID AS NVARCHAR(MAX)) as CoachIndID
		, CAST(OnlineChildcare AS NVARCHAR(MAX)) as OnlineChildcare
		, CAST(OnlineNote AS NVARCHAR(MAX)) as OnlineNote
		, CAST(CGImage AS NVARCHAR(MAX)) as CGImage
		, CAST(MissionName AS NVARCHAR(MAX)) as MissionName
		, CAST(MissionDescDefault AS NVARCHAR(MAX)) as MissionDescDefault
		, CAST(MissionFund AS NVARCHAR(MAX)) as MissionFund
		, CAST(MissionOnline AS NVARCHAR(MAX)) as MissionOnline
		, CAST(MissionFeeID AS NVARCHAR(MAX)) as MissionFeeID
		, CAST(MissionImage AS NVARCHAR(MAX)) as MissionImage
		, CAST(MissionGoal AS NVARCHAR(MAX)) as MissionGoal
		, CAST(MissionDescShort AS NVARCHAR(MAX)) as MissionDescShort
		, CAST(CGStudy AS NVARCHAR(MAX)) as CGStudy
		, CAST(VolCOGService AS NVARCHAR(MAX)) as VolCOGService
		, CAST(VolCOGAgeGroup AS NVARCHAR(MAX)) as VolCOGAgeGroup
		, CONVERT(NVARCHAR(MAX), VolStartDate, 101) as VolStartDate
		, CONVERT(NVARCHAR(MAX), VolEndDate, 101) as VolEndDate
		, CAST(VolCoordinator AS NVARCHAR(MAX)) as VolCoordinator
		, CAST(VolAutoRemindersOff AS NVARCHAR(MAX)) as VolAutoRemindersOff
		, CAST(SendReminderNumDays AS NVARCHAR(MAX)) as SendReminderNumDays
		, CAST(EmailReminder AS NVARCHAR(MAX)) as EmailReminder
		, CAST(TextReminder AS NVARCHAR(MAX)) as TextReminder
		, CAST(VolDescription AS NVARCHAR(MAX)) as VolDescription
		, CAST(VolImage AS NVARCHAR(MAX)) as VolImage
		, CAST(VolContactName AS NVARCHAR(MAX)) as VolContactName
		, CAST(VolContactNumber AS NVARCHAR(MAX)) as VolContactNumber
		, CAST(VolContactEmail AS NVARCHAR(MAX)) as VolContactEmail
		, CAST(VolThankYouMessage AS NVARCHAR(MAX)) as VolThankYouMessage
		, CAST(VolCOGServiceID AS NVARCHAR(MAX)) as VolCOGServiceID
		, CAST(VolCOGServiceShortcode AS NVARCHAR(MAX)) as VolCOGServiceShortcode
		, CAST(VolCOGDayWeek AS NVARCHAR(MAX)) as VolCOGDayWeek
		, CONVERT(NVARCHAR(MAX), VolCOGStartTime, 100) as VolCOGStartTime
		, CONVERT(NVARCHAR(MAX), VolCOGEndTime, 100) as VolCOGEndTime
		, CAST(VolCOGAgeGroupID AS NVARCHAR(MAX)) as VolCOGAgeGroupID
		, CAST(VolFrequency AS NVARCHAR(MAX)) as VolFrequency
		, CAST(VolAutoAssignment AS NVARCHAR(MAX)) as VolAutoAssignment
		, CAST(OtherRolesBreakdown AS NVARCHAR(MAX)) as OtherRolesBreakdown
		, CAST(VolCOGWeekOfMonth AS NVARCHAR(MAX)) as VolCOGWeekOfMonth
		, CAST(VolBackgroundCheck AS NVARCHAR(MAX)) as VolBackgroundCheck
		, CAST(COGServiceName AS NVARCHAR(MAX)) as COGServiceName
		, CAST(COGGroupName AS NVARCHAR(MAX)) as COGGroupName
		, CAST(COGGradeStart AS NVARCHAR(MAX)) as COGGradeStart
		, CAST(COGGradeEnd AS NVARCHAR(MAX)) as COGGradeEnd
		, CAST(COGGender AS NVARCHAR(MAX)) as COGGender
		, CAST(COGPickupRm AS NVARCHAR(MAX)) as COGPickupRm
		, CAST(COGCheckinRm AS NVARCHAR(MAX)) as COGCheckinRm
		, CAST(COGRegion AS NVARCHAR(MAX)) as COGRegion
		, CAST(COGRegisteredOnly AS NVARCHAR(MAX)) as COGRegisteredOnly
		, CAST(COGRoomName AS NVARCHAR(MAX)) as COGRoomName
		, CONVERT(NVARCHAR(MAX), COGDOBStart, 101) as COGDOBStart
		, CONVERT(NVARCHAR(MAX), COGDOBEnd, 101) as COGDOBEnd
		, CAST(COGOverflowRoom1 AS NVARCHAR(MAX)) as COGOverflowRoom1
		, CAST(COGOverflowRoom2 AS NVARCHAR(MAX)) as COGOverflowRoom2
		, CAST(COGCapacity AS NVARCHAR(MAX)) as COGCapacity
		, CAST(COGReceiptLabel AS NVARCHAR(MAX)) as COGReceiptLabel
		, CAST(COGNameTagLabel AS NVARCHAR(MAX)) as COGNameTagLabel
		, CONVERT(NVARCHAR(MAX), COGSetupStartDate, 101) as COGSetupStartDate
		, CONVERT(NVARCHAR(MAX), COGSetupEndDate, 101) AS COGSetupEndDate
		, CAST(COGAgeGroup AS NVARCHAR(MAX)) as COGAgeGroup
		, CAST(COGCampus AS NVARCHAR(MAX)) as COGCampus
		, CAST(COGMultiService AS NVARCHAR(MAX)) as COGMultiService
		, CAST(COGDoNotPrintLabel AS NVARCHAR(MAX)) as COGDoNotPrintLabel
		, CAST(ClassType AS NVARCHAR(MAX)) as ClassType
		, CAST(TrainingClass AS NVARCHAR(MAX)) as TrainingClass
		, CAST(TrainingClassName AS NVARCHAR(MAX)) as TrainingClassName
		, CAST(ChildcareType AS NVARCHAR(MAX)) as ChildcareType
	FROM tblOrganization
) as S
UNPIVOT
(
	Value for ColumnName IN (
	CoachShepard
	, OnlineService
	, OnlineSeason
	, OnlineRegion
	, OnlinePublic
	, OnlineSize
	, OnlineGender
	, CoachIndID
	, OnlineChildcare
	, OnlineNote
	, CGImage
	, CGStudy
	, MissionName
	, MissionDescDefault
	, MissionFund
	, MissionOnline
	, MissionFeeID
	, MissionImage
	, MissionGoal
	, MissionDescShort
	,VolCOGService
	,VolCOGAgeGroup
	,VolStartDate
	,VolEndDate
	,VolCoordinator
	,VolAutoRemindersOff
	,SendReminderNumDays
	,EmailReminder
	,TextReminder
	,VolDescription
	,VolImage
	,VolContactName
	,VolContactNumber
	,VolContactEmail
	,VolThankYouMessage
	,VolCOGServiceID
	,VolCOGServiceShortcode
	,VolCOGDayWeek
	,VolCOGStartTime
	,VolCOGEndTime
	,VolCOGAgeGroupID
	,VolFrequency
	,VolAutoAssignment
	,OtherRolesBreakdown
	,VolCOGWeekOfMonth
	,VolBackgroundCheck
	,COGServiceName
	,COGGroupName
	,COGGradeStart
	,COGGradeEnd
	,COGGender
	,COGPickupRm
	,COGCheckinRm
	,COGRegion
	,COGRegisteredOnly
	,COGRoomName
	,COGDOBStart
	,COGDOBEnd
	,COGOverflowRoom1
	,COGOverflowRoom2
	,COGCapacity
	,COGReceiptLabel
	,COGNameTagLabel
	,COGSetupStartDate
	,COGSetupEndDate
	,COGAgeGroup
	,COGCampus
	,COGMultiService
	,COGDoNotPrintLabel
	,ClassType
	,TrainingClass
	,TrainingClassName
	,ChildcareType
		)
) as U
Where [Value] != ''