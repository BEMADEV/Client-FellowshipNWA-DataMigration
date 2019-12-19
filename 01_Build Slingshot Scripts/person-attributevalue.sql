SELECT Distinct
	IndId as PersonId
	, 'GB_' + ColumnName as AttributeKey
	, [Value]  as AttributeValue
FROM
(
	SELECT
		i.indId
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
		,CAST(IIF(DiscoveryTaken = 1, 'True', 'False') AS NVARCHAR(MAX)) AS DiscoveryTaken
		,CAST(PassportNumber AS NVARCHAR(MAX)) AS PassportNumber
		,CAST(FullLegalName AS NVARCHAR(MAX)) AS FullLegalName
		,CAST(IIF(ExcludeFromDuplicate = 1, N'True', N'False') AS NVARCHAR(MAX)) AS ExcludeFromDuplicate
		,CAST(CheckInNotes AS NVARCHAR(MAX)) AS CheckInNotes
		,CAST(NumOrgs AS NVARCHAR(MAX)) AS NumOrgs
		,CAST(IRegion AS NVARCHAR(MAX)) AS IRegion
		,CAST(UniversalNotes AS NVARCHAR(MAX)) AS UniversalNotes
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
		,CAST(i.AddedBy AS NVARCHAR(MAX)) as AddedBy
		,CONVERT(NVARCHAR(MAX), i.AddedDate, 101) as AddedDate
		,CAST(ModBy AS NVARCHAR(MAX)) as ModBy
		,CONVERT(NVARCHAR(MAX), ModDate, 101) as ModDate
		,Convert(nvarchar(max), fu.LastAccessDate) as LastAccessDate
		,CAST(IIF(AccountActive = 1, N'True', N'False') AS NVARCHAR(MAX)) as AccountActive
	FROM tblIndividual i
	Join tblFamilyUsername fu on fu.IndID = i.IndID
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
		,Age
		,CGLeaderStatus
		, BackgroundCheckDate
		, BGCheckHold
		, BGCheckHoldReason
		, BackgroundCheckNote
		, AddedBy
		, AddedDate
		, ModBy
		, ModDate
		, ConfirmationDate
		, LastAccessDate
		, AccountActive
	)
) as U

UNION ALL

SELECT 
	IndId as PersonId
	, 'GB_' + ColumnName as AttributeKey
	, [Value]  as AttributeValue
FROM
(
	SELECT
		tbl.indId
		,CAST(DirectLine AS NVARCHAR(MAX)) AS DirectLine
		,CAST(Intercom AS NVARCHAR(MAX)) AS Intercom
		,CAST(tbl.MinistryArea AS NVARCHAR(MAX)) AS MinistryArea
		,CAST(HoursPerDay AS NVARCHAR(MAX)) AS HoursPerDay
		,CAST(HoursPerWeek AS NVARCHAR(MAX)) AS HoursPerWeek
		,CONVERT(NVARCHAR(MAX), tbl.DateOfHire, 101) AS DateOfHire
		,CONVERT(NVARCHAR(MAX), AnniversaryDate, 101) AS AnniversaryDate
		,CAST(ExemptStatus AS NVARCHAR(MAX)) AS ExemptStatus
		,CONVERT(NVARCHAR(MAX), TermDate, 101) AS TermDate
		,CAST(TermReason AS NVARCHAR(MAX)) AS TermReason
		,CAST(TermSpcInstructions AS NVARCHAR(MAX)) AS TermSpcInstructions
		,CAST(IIF(RehireEligible = 1, 'True', 'False') AS NVARCHAR(MAX)) AS RehireEligible
		,CAST(PayrollCode AS NVARCHAR(MAX)) AS PayrollCode
		,CAST(PayrollName AS NVARCHAR(MAX)) AS PayrollName
		,CONVERT(NVARCHAR(MAX), PTOStartDate, 101) AS PTOStartDate
		,CONVERT(NVARCHAR(MAX), SabbaticalStartDate, 101) AS SabbaticalStartDate
		,CONVERT(NVARCHAR(MAX), BenefitsStartDate, 101) AS BenefitsStartDate
		,CAST(PrimaryPositionName AS NVARCHAR(MAX)) AS PrimaryPositionName
		,CAST(IDName AS NVARCHAR(MAX)) AS IDName
		,CAST(SabbaticalClass AS NVARCHAR(MAX)) AS SabbaticalClass
		,CAST(PTFTPosition AS NVARCHAR(MAX)) AS PTFTPosition
		,CONVERT(NVARCHAR(MAX), SabbaticalLastTakenDate, 101) AS SabbaticalLastTakenDate
		,CONVERT(NVARCHAR(MAX), SabbaticalNextEligibleDate, 101) AS SabbaticalNextEligibleDate
		,CAST(SabbaticalNotes AS NVARCHAR(MAX)) AS SabbaticalNotes
		,CAST(tbl.PositionType AS NVARCHAR(MAX)) AS PositionType
		,CAST(WorkWeekDesc AS NVARCHAR(MAX)) AS WorkWeekDesc
		,CAST(fu.SupervisorID AS NVARCHAR(MAX)) AS SupervisorID
		,CAST(Congregation AS NVARCHAR(MAX)) AS Congregation
		,CAST(position.Title AS NVARCHAR(MAX)) AS Title
		,CAST(position.Phone AS NVARCHAR(MAX)) AS Phone
		,CAST(IIF(position.ShowOnGlobal = 1, 'True', 'False') AS NVARCHAR(MAX)) AS ShowOnGlobal
		,CAST(IIF(position.ShowOnCongregation = 1, 'True', 'False') AS NVARCHAR(MAX)) AS ShowOnCongregation
		,CAST(IIF(fu.Staff = 1, 'True', 'False') AS NVARCHAR(MAX)) AS Staff
	FROM tblEmp tbl
		left join tblFamilyUsername fu on fu.IndID = tbl.IndID and fu.Staff = 1
	outer apply (select top(1) epp.ShowOnCongregation, ShowOnGlobal,  epp.Congregation, epp.MinistryArea, epp.Title, epp.Phone as [phone] from tblEmpPublicPosition epp 
		where epp.IndID = tbl.IndID and epp.inactive is null
		order by epp.AddedDate desc 
	) as position
	where tbl.IndID is not null
	
) as S
UNPIVOT
(
	Value for ColumnName IN (	
	DirectLine
	, Intercom
	, MinistryArea
	, HoursPerDay
	, HoursPerWeek
	, DateOfHire
	, AnniversaryDate
	, ExemptStatus
	, TermDate
	, TermReason
	, TermSpcInstructions
	, RehireEligible
	, PayrollCode
	, PayrollName
	, PTOStartDate
	, SabbaticalStartDate
	, BenefitsStartDate
	, PrimaryPositionName
	, IDName
	, SabbaticalClass
	, PTFTPosition
	, SabbaticalLastTakenDate
	, SabbaticalNextEligibleDate
	, SabbaticalNotes
	, PositionType
	, WorkWeekDesc
	, SupervisorID
	, Congregation
	, Title
	, Phone
	, ShowOnGlobal
	, ShowOnCongregation
	, Staff
	)
) as U

