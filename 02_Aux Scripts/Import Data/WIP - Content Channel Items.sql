/*
Select
	r.[Date]
	, Max( isNull(Service,'') ) as Service
	, Max( isNull(ServiceLinkID,0) ) as ServiceLinkId
	, seriesTitle
	, MinistryArea
	, MediaTitle
From lkMediaResources r
Group by [Date]
		, SeriesTitle
		, MinistryArea
		, MediaTitle
Order by [Date] desc
*/
Select
	abs(convert(bigint, Hashbytes('MD5', Format([Date], 'yyyyMMdd') + isNull(mediaTitle,'Null') + isNull(SeriesTitle,'Null') + isNull(MinistryArea, 'Null')))) as ForeignId, 
	[Date]
	, MediaTitle
From lkMediaResources
Where [Type] in ('Teaching Slides', 'Worship Teaching Only', 'Worship Full Services', 'Connect', 'Communicator' )
Group by [Date]
	, MediaTitle
	, SeriesTitle
	, MinistryArea
Order by [Date] desc