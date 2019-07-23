SELECT
	-- Benevolence Fund
	990001 as Id
	, 'Benevolence' as [Name]
	, 'FALSE' as IsTaxDeductible
	, '' As CampusId
	, '' as ParentAccountId

UNION ALL

SELECT
	-- Building Fund
	990002 as Id
	, 'Building' as [Name]
	, 'FALSE' as IsTaxDeductible
	, '' As CampusId
	, '' as ParentAccountId

UNION ALL

SELECT
	-- Camp/Retreat Fund
	990003 as Id
	, 'Camp/Retreat' as [Name]
	, 'FALSE' as IsTaxDeductible
	, '' As CampusId
	, '' as ParentAccountId

UNION ALL

SELECT
	-- Childcare Fund
	990004 as Id
	, 'Childcare' as [Name]
	, 'FALSE' as IsTaxDeductible
	, '' As CampusId
	, '' as ParentAccountId

UNION ALL

SELECT
	-- Curriculum Fund
	990005 as Id
	, 'Curriculum' as [Name]
	, 'FALSE' as IsTaxDeductible
	, '' As CampusId
	, '' as ParentAccountId

UNION ALL

SELECT
	-- Elder Designated Fund
	990006 as Id
	, 'Elder Designated' as [Name]
	, 'FALSE' as IsTaxDeductible
	, '' As CampusId
	, '' as ParentAccountId

UNION ALL

SELECT
	-- General Fund Fund
	990007 as Id
	, 'General Fund' as [Name]
	, 'FALSE' as IsTaxDeductible
	, '' As CampusId
	, '' as ParentAccountId

UNION ALL

SELECT
	-- Mission Fund
	990008 as Id
	, 'Mission' as [Name]
	, 'FALSE' as IsTaxDeductible
	, '' As CampusId
	, '' as ParentAccountId

UNION ALL

SELECT
	-- Other Fund
	990009 as Id
	, 'Other' as [Name]
	, 'FALSE' as IsTaxDeductible
	, '' As CampusId
	, '' as ParentAccountId

UNION ALL

SELECT
	-- Passthrough Fund
	990010 as Id
	, 'Passthrough' as [Name]
	, 'FALSE' as IsTaxDeductible
	, '' As CampusId
	, '' as ParentAccountId

UNION ALL

SELECT
	-- Service Fund
	990011 as Id
	, 'Service' as [Name]
	, 'FALSE' as IsTaxDeductible
	, '' As CampusId
	, '' as ParentAccountId

UNION ALL

SELECT
	-- Other Fund
	990012 as Id
	, 'Other' as [Name]
	, 'FALSE' as IsTaxDeductible
	, '' As CampusId
	, '' as ParentAccountId

UNION ALL


-- Select all of the Designations
SELECT
	Id as Id
	, Designations as [Name]
	, CASE DoNotReport
		WHEN '1' THEN 'FALSE'
		ELSE 'TRUE'
	   END as IsTaxDeductible
	, '' as CampusId
	, CASE FundType
		WHEN 'Benevolence' THEN '990001'
		WHEN 'Building' THEN '990002'
		WHEN 'Camp/Retreat' THEN '990003'
		WHEN 'Childcare' THEN '990004'
		WHEN 'Curriculum' THEN '990005'
		WHEN 'Elder Designated' THEN '990006'
		WHEN 'General Fund' THEN '990007'
		WHEN 'Mission' THEN '990008'
		WHEN 'Other' THEN '990009'
		WHEN 'Passthrough' THEN '990010'
		WHEN 'Service' THEN '990011'
		ELSE '990012'
		END as ParentAccountId
FROM lkDesignations
