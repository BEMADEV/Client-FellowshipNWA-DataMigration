Select
	Cast(convert(uniqueidentifier, Hashbytes('MD5', Format([Date], 'yyyyMMdd') + isNull(Title,'Null') + isNull(SeriesTitle,'Null') + isNull(MinistryArea, 'Null'))) as nvarchar(max)) as ForeignGuid
	, MediaTags
From ( 
	Select 
		r.[Date]
		, ISNULL(r.MediaTitle, s.Title) as [Title]
		, SeriesTitle
		, r.MinistryArea
		, r.MediaTags
	From
	lkMediaResources r
	left Join tblServiceLink s on r.ServiceLinkID = s.ID
	Where [Type] in ('Teaching Slides', 'Worship Teaching Only', 'Worship Full Services', 'Connect', 'Communicator' )
) x




