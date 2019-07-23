-- Use the Fund Type and Fund Group to Create a basic account hiaracy
SELECT
	-- ACTIVTY FUND
	990001 as Id
	, 'Activity Fund' as [Name]
	, 'FALSE' as IsTaxDeductible
	, '' As CampusId
	, '' as ParentAccountId
	, 1 as IsActive
	, 1 as IsPublic

UNION ALL

SELECT
	-- BUILDING FUND
	990002 as Id
	, 'Building Fund' as [Name]
	, 'FALSE' as IsTaxDeductible
	, '' As CampusId
	, '' as ParentAccountId
	, 1 as IsActive
	, 1 as IsPublic

UNION ALL

SELECT
	-- GENERAL FUND
	990003 as Id
	, 'General Fund' as [Name]
	, 'FALSE' as IsTaxDeductible
	, '' As CampusId
	, '' as ParentAccountId
	, 1 as IsActive
	, 1 as IsPublic

UNION ALL

SELECT
	-- Mission FUND
	990004 as Id
	, 'Mission Fund' as [Name]
	, 'FALSE' as IsTaxDeductible
	, '' As CampusId
	, '' as ParentAccountId
	, 1 as IsActive
	, 1 as IsPublic

UNION ALL

SELECT
	-- Other FUND
	990005 as Id
	, 'Other Fund' as [Name]
	, 'FALSE' as IsTaxDeductible
	, '' As CampusId
	, '' as ParentAccountId
	, 1 as IsActive
	, 1 as IsPublic

UNION ALL

SELECT
	-- NO FUND
	990006 as Id
	, 'No Fund' as [Name]
	, 'FALSE' as IsTaxDeductible
	, '' As CampusId
	, '' as ParentAccountId
	, 1 as IsActive
	, 1 as IsPublic

UNION ALL

-- Select all of the Designations
SELECT
	Id as Id
	, Designations as [Name]
	, CASE AChGroup
		WHEN 'Giving' THEN 'TRUE'
		ELSE 'FALSE'
	   END as IsTaxDeductible
	, '' as CampusId
	, CASE FundGroup
		WHEN 'Celebrate Recovery' THEN '990007'
		WHEN 'Fayetteville' THEN '990008'
		WHEN 'Mosaic' THEN '990009'
		WHEN 'Release' THEN '990010'
		WHEN 'Sunday' THEN '990011'
		WHEN 'TGI' THEN '990012'
		ELSE '990006'
		END as ParentAccountId
	, IIF( inactive = 1, 0, 1 ) as IsActive
	, IIF( DisplayOnWeb = 1, 1, 0 ) as IsPublic
FROM lkDesignations
