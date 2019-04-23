SELECT 
	IndId as PersonId
	, 'GB_' + ColumnName as AttributeKey
	, [Value]  as AttributeValue
FROM
(
	SELECT
		indId
		,CAST(IDisplayName AS NVARCHAR(MAX)) AS IDisplayName
		,CAST(FamilyRole AS NVARCHAR(MAX)) AS FamilyRole
		,CAST(EmailAddressAlt AS NVARCHAR(MAX)) AS EmailAddressAlt
		,CONVERT(NVARCHAR(MAX), DeceaseDate, 101) AS DeceaseDate
		,CAST(DeceaseCause AS NVARCHAR(MAX)) AS DeceaseCause
		,CAST(DeceaseCauseNotes AS NVARCHAR(MAX)) AS DeceaseCauseNotes
		,CAST(SchoolName AS NVARCHAR(MAX)) AS SchoolName
		,CAST(SchoolGrade AS NVARCHAR(MAX)) AS SchoolGrade
		,CAST(SchoolGradeName AS NVARCHAR(MAX)) AS SchoolGradeName
		,CONVERT(NVARCHAR(MAX), SchoolGradeDate, 101) AS SchoolGradeDate
		,CAST(ChurchDesignation AS NVARCHAR(MAX)) AS ChurchDesignation
		,CAST(CommunityGroupStatus AS NVARCHAR(MAX)) AS CommunityGroupStatus
		,CAST(LastActivityDate AS NVARCHAR(MAX)) AS LastActivityDate
		,CONVERT(NVARCHAR(MAX), DiscoveryDate, 101) AS DiscoveryDate
		,CAST(DiscoveryNotes AS NVARCHAR(MAX)) AS DiscoveryNotes
		,CAST(DiscoveryLocation AS NVARCHAR(MAX)) AS DiscoveryLocation
		,CAST(IIF(DiscoveryTaken = 0, 'False', 'True') AS NVARCHAR(MAX)) AS DiscoveryTaken
		,CAST(PassportNumber AS NVARCHAR(MAX)) AS PassportNumber
		,CAST(FullLegalName AS NVARCHAR(MAX)) AS FullLegalName
		,CAST(IIF(ExcludeFromDuplicate = 0, N'False', N'True') AS NVARCHAR(MAX)) AS ExcludeFromDuplicate
		,CAST(CheckInNotes AS NVARCHAR(MAX)) AS CheckInNotes
		,CAST(NumOrgs AS NVARCHAR(MAX)) AS NumOrgs
		,CAST(IRegion AS NVARCHAR(MAX)) AS IRegion
		,CAST(UniversalNotes AS NVARCHAR(MAX)) AS UniversalNotes
		,CAST(IIF(Staff = 0, N'False', N'True') AS NVARCHAR(MAX)) AS Staff
		,CAST(Age AS NVARCHAR(MAX)) AS Age
		,CAST(CGLeaderStatus AS NVARCHAR(MAX)) AS CGLeaderStatus
		,CAST(CGCurrentLeader AS NVARCHAR(MAX)) AS CGCurrentLeader
		,CAST(CGLeader AS NVARCHAR(MAX)) AS CGLeader
		,CAST(MaritalStatus AS NVARCHAR(MAX)) AS MaritalStatus
		,CAST(SeasonOfLife AS NVARCHAR(MAX)) AS SeasonOfLife
		,CONVERT(NVARCHAR(MAX), PassportExpire, 101) AS PassportExpire
		,CONVERT(NVARCHAR(MAX), PassportIssued, 101) AS PassportIssued
		,CAST(SSN AS NVARCHAR(MAX)) AS SSN
		,CAST(ScreeningForm AS NVARCHAR(MAX)) AS ScreeningForm
		,CONVERT(NVARCHAR(MAX), ScreeningFormDate, 101) AS ScreeningFormDate
		,CAST(ReferenceCheckDate AS NVARCHAR(MAX)) AS ReferenceCheckDate
		,CAST(ReferenceCheckBy AS NVARCHAR(MAX)) AS ReferenceCheckBy
		,CAST(BackgroundCheckNote AS NVARCHAR(MAX)) AS BackgroundCheckNote
		,CONVERT(NVARCHAR(MAX), BackgroundCheckDate, 101) AS BackgroundCheckDate
		,CAST(AgeRange AS NVARCHAR(MAX)) AS AgeRange
		,CONVERT(NVARCHAR(MAX), BaptismDate, 101) AS BaptismDate
		,CAST(ConfirmationNeeded AS NVARCHAR(MAX)) AS ConfirmationNeeded
		,CONVERT(NVARCHAR(MAX), ConfirmationDate, 101) AS ConfirmationDate
		,CAST(ConfirmationBy AS NVARCHAR(MAX)) AS ConfirmationBy
		,CAST(Baptized AS NVARCHAR(MAX)) AS Baptized
		,CONVERT(NVARCHAR(MAX), KeyTagIssueDate, 101) AS KeyTagIssueDate
		,CAST(EmerContactNum AS NVARCHAR(MAX)) AS EmerContactNum
		,CAST(IIF(BGCheckHold = 1, 'True', 'False') AS NVARCHAR(MAX))  AS BGCheckHold
		,CAST(BGCheckHoldReason AS NVARCHAR(MAX)) AS BGCheckHoldReason
		,CAST(DateBackgroundCheckEmailSent AS NVARCHAR(MAX)) AS DateBackgroundCheckEmailSent
		,CAST(COGRosterNote AS NVARCHAR(MAX)) AS COGRosterNote
		,CAST(CurrentSmallGroupID AS NVARCHAR(MAX)) AS CurrentSmallGroupID
		,CAST(CurrentSmallGroupName AS NVARCHAR(MAX)) AS CurrentSmallGroupName
		,CAST(ConstantContactUserID AS NVARCHAR(MAX)) AS ConstantContactUserID
		,CAST(AddedFrom AS NVARCHAR(MAX)) AS AddedFrom
		,CAST(IndividualPhoto AS NVARCHAR(MAX)) AS IndividualPhoto
		,CAST(IndPhotoApproved AS NVARCHAR(MAX)) AS IndPhotoApproved
		,CAST(IndPhotoAddedBy AS NVARCHAR(MAX)) AS IndPhotoAddedBy
		,CAST(SubscribedCCLists AS NVARCHAR(MAX)) AS SubscribedCCLists
		,CAST(Prefix AS NVARCHAR(MAX)) AS Prefix
		,CAST(CustomerProfileID AS NVARCHAR(MAX)) AS CustomerProfileID
		,CAST(MaidenName AS NVARCHAR(MAX)) AS MaidenName
	FROM tblIndividual
) as S
UNPIVOT
(
	Value for ColumnName IN (
		IDisplayName
		,FamilyRole
		,EmailAddressAlt
		,DeceaseDate
		,DeceaseCause
		,DeceaseCauseNotes
		,SchoolName
		,SchoolGrade
		,SchoolGradeName
		,SchoolGradeDate
		,ChurchDesignation
		,CommunityGroupStatus
		,LastActivityDate
		,DiscoveryDate
		,DiscoveryNotes
		,DiscoveryLocation
		,DiscoveryTaken
		,PassportNumber
		,FullLegalName
		,ExcludeFromDuplicate
		,CheckInNotes
		,NumOrgs
		,IRegion
		,UniversalNotes
		,Staff
		,Age
		,CGLeaderStatus
		, BackgroundCheckDate
		, BGCheckHold
		, BGCheckHoldReason
		, BackgroundCheckNote
	)
) as U