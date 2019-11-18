SELECT -- TOP 1000
	GroupId as Id
	, GroupName as [Name]
	, IsNull(GroupDescription,'') as [Description]
	, 0 as [Order]
	, ISNull(GroupUpID, 0) as ParentGroupId
	, CASE
		WHEN CG = 1 THEN 1
		WHEN CellGroup = 1 THEN 2
		WHEN MissionOnline = 1 THEN 3
		WHEN IsClass = 1 THEN 4
		WHEN IsCamp = 1 Then 8
		WHEN IsChildcare = 1 Then 5
		When IsVol = 1 Then 6
		WHEN ChildrenOfGrace = 1 Then 7
		ELSE 9 -- Other Group Type, as all Groups need a type.
	  END as GroupTypeId
	/*
	, CASE MeetingDay
	    When 'SUNDAY' Then '1'
		WHEN 'MONDAY' Then '2'
		WHEN 'TUESDAY' THen '3'
		WHEN 'WEDNESDAY' THEN '4'
		WHEN 'THURSDAY' Then '5'
		WHEN 'FRIDAY' THEN '6'
		WHEN 'SATURDAY' THEN '7'
		ELSE ''
		
	  END as MeetingDay */
	 , isNull( MeetingDay, '') as MeetingDay
	, IsNull(MeetingStart, '') as MeetingTime
	, IIF(Archived = 1, 'True', 'False') as IsArchived
	, IIF(DisplayOnWeb = 1, 'True', 'False') as IsPublic
	, isNull(Cast(lkChurch.Id as nvarchar(10)), '') as CampusId
	, isNull(Cast(COGCapacity as nvarchar(max)), '') as Capacity
	, IIF(Archived  =  1, 'False', 'True') as [IsActive]
FROM
	tblOrganization
LEFT Join lkChurch on Congregation = lkChurch.Church