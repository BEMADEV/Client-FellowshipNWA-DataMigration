SELECT
	Format(ContDate, 'yyyyMMdd') as Id
	, Format(ContDate, 'dddd, MMM dd, yyyy') as [Name]
	, '' as CampusId
	, Format(ContDate, 'yyyy-MM-dd') as StartDate
	, '' as EndDate
	, 'Closed' as Status
	, '' as CreatedByPersonId
	, min(addedDate) as CreatedDateTime
	, isnull(convert(nvarchar(max), max(ModDate), 101), '') as ModifiedDateTime
	, '' as ModifiedByPersonId
From tblContributions 
Group By ContDate