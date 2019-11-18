Select 
	EmailListId as [Id]
	, Case EmailListId
		When 14 Then 'Women''s Devotional Email List '
		When 13 THEN 'Rogers Connect Email List'
		When 55 THEN 'Fayetteville Connect Email'
		WHEN 25 THEN 'Mosaic Connect Email List'
		WHEN 59 THEN 'Fayetteville myFeed Email List'
		WHEN 11 THEN 'Prayer Email List'
		Else EmailListName End as [Name]
 From lkEmailLists where
	EmailListId IN(14,13,55,25,59,11)