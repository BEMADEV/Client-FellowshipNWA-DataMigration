Update Campus Set 
	ForeignId =
		Case Id
			When 1 Then 6
			When 2 Then 1
			When 3 Then 4
			When 4 then 9
			WHEN 5 Then 2
			When 6 Then 8
		End
	, ForeignKey = 'GB'

From Campus



Select * From Campus