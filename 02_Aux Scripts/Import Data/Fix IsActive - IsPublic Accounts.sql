Update a
	set isPublic = ta.IsPublic
	, isActive = ta.IsActive
FROM
	FinancialAccount a
Join [_tmp_Financial-Account] ta on ta.Id = a.ForeignId