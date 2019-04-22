-- Add 1000000 to Building Id to Join with Rooms Table
-- Add 2000000 to Campus Id to Join with Building Table

 Select 
	2000000 + Id as Id
	, 0 as ParentLocationId
	, CampusName as [Name]
	, 'True' as IsActive
	, 'Meeting Location' as LocationType
	, CampusAddress as Street1
	, '' as Street2
	, CampusCity as City
	, CampusState as [State]
	, 'USA' as Country
	, CampusZip as PostalCode
	, '' as County
From lkCampus

UNION ALL

Select 
	1000000 + BuildingID as Id
	, IsNull(Cast(2000000 + c.ID as nvarchar(9)),0) as ParentLocationId
	, BuildingName as [Name]
	, IIF(Archive = 1, 'False', 'True') as IsActive
	, 'Meeting Location' as LocationType
	, '' as Street1
	, '' as Street2
	, '' as City
	, '' as [State]
	, '' as Country
	, '' as PostalCode
	, '' as County
 From lkBuilding b
 Left Join lkCampus c on b.CampusName = c.CampusName

UNION ALL
	
Select 
	r.lkRoomID as Id
	, IsNull(Cast(1000000 + BuildingID as nvarchar(9)),0) as ParentLocationId
	, RoomName as [Name]
	, IIF(Archive = 1, 'False', 'True') as IsActive
	, 'Meeting Location' as LocationType
	, '' as Street1
	, '' as Street2
	, '' as City
	, '' as [State]
	, '' as Country
	, '' as PostalCode
	, '' as County
From lkRooms r