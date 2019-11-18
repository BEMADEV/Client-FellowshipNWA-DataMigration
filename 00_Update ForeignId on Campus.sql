Update Campus Set 
	ForeignId =
		Case ShortCode
			When 'Rogers' Then 6
			When 'Fayettevill' Then 1
			When 'Mosaisc' Then 4
			When 'Bentonville' then 9
			WHEN 'CR Rogers' Then 2
			When 'CR Fayeteville' Then 8
		End
	, ForeignKey = 'GB'

From Campus