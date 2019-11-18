SELECT 
	ForeignGuid
	, Attribute
	, [Value]
 FROM 
( Select
	Cast(convert(uniqueidentifier, Hashbytes('MD5', Format([Date], 'yyyyMMdd') + isNull(Title,'Null') + isNull(SeriesTitle,'Null') + isNull(MinistryArea, 'Null'))) as nvarchar(max)) as ForeignGuid
	, Cast( MinistryArea as nvarchar(max)) as MinistryArea
	, Cast( SeriesTitle as nvarchar(max)) as SeriesTitle
	, Cast( Speaker as nvarchar(max)) as Speaker
	, Cast( Service as nvarchar(max)) as [Service]
From ( 
	Select 
		r.[Date]
		, ISNULL(r.MediaTitle, s.Title) as [Title]
		, SeriesTitle
		, r.MinistryArea
		, s.Speaker
		, r.Service
	From
	lkMediaResources r
	left Join tblServiceLink s on r.ServiceLinkID = s.ID
	Where [Type] in ('Teaching Slides', 'Worship Teaching Only', 'Worship Full Services', 'Connect', 'Communicator' )
) x

Group by [Date]
	, Title
	, SeriesTitle
	, MinistryArea
	, Speaker
	, Service
) b
UnPivot
(
	[Value] for Attribute IN
		( MinistryArea, SeriesTitle, Speaker, [Service] )
) as unpvt