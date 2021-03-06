﻿-- Add 100000000 to Signify Nur Attendance Table
-- Add 200000000 to Signify Organization Attendance Table
-- Add 300000000 to Signify NurTearch attendance table
SELECT
	   100000000 + a.[ID] as AttendanceId
	 , a.IndId as PersonId
     , isNull(Cast(a.groupId as nvarchar(11)),'') as GroupId
	 , isNull(CheckInTime, EventDate) as StartDateTime
	 , isNull(Format(CheckOutTime, 'yyyy-MM-dd HH:mm:ss'),'') as EndDateTime
	 , isNull(Notes, '') as Note
	 , '' as CampusId
	 , '' as LocationId
	 , '' as ScheduleId
	 , '' DeviceId
  FROM [tblNurAttendance] a
  Where IndId > 0
  
  UNION ALL

  SELECT
	   200000000 + a.[ID] as AttendanceId
	 , m.IndId as PersonId
     , isNull(Cast(a.groupId as nvarchar(11)),'') as GroupId
	 , AttendDate as StartDateTime
	 , '' as EndDateTime
	 , '' as Note
	 , '' as CampusId
	 , '' as LocationId
	 , '' as ScheduleId
	 , '' DeviceId
  FROM tblOrganizationAttendance a
  Join tblOrganizationMember m on a.MemberId = m.MemberId
  Where IndId > 0 and PresentYN = 1

UNION ALL

SELECT
 300000000 + a.[ID] as AttendanceId
	 , a.IndId as PersonId
     , isNull(Cast(a.GroupId as nvarchar(11)),'') as GroupId
	 , isNull(CheckInTime, EventDate) as StartDateTime
	 , isNull(Format(CheckOutTime, 'yyyy-MM-dd HH:mm:ss'),'') as EndDateTime
	 , isNull(Notes, '') as Note
	 , '' as CampusId
	 , '' as LocationId
	 , '' ScheduleId
	 , '' DeviceId
  FROM tblNurAttendanceTeacher a
  Where IndId > 0
