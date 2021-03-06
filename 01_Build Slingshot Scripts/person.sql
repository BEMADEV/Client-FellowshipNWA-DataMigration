/* 
	Create Person.csv
	
	This script represents Indiviuals from Grace Base in the proper Slingshot Format for the 'person.csv' file.

	Created by Bema Services 2019
*/
Select Distinct * From
(
(
SELECT
	i.[IndID] as Id
    ,i.[FamilyID] as FamilyId
	, f.FamilyName
	-- Make Family Role boil down to Child and Adult.  
	-- I'll create an attribute called legacy Family role so that we can manipulate data post slingshot migration
	, CASE i.FamilyRole
		When 'Adult' Then 'Adult'
		When 'Dependent' Then 'Child'
		When 'Board' Then 'Adult'
		When 'BUSINESS' Then 'Adult'
		When 'Church' Then 'Adult'
		When 'Civic Organization' Then 'Adult'
		When 'Corporate' Then 'Adult'
		When 'DEPENDENT' Then 'Child'
		When 'FOSTER CHILD' Then 'Child'
		When 'Foundation' Then 'Adult'
		When 'GRANDCHILD' Then 'Child'
		When 'HEAD' Then 'Adult'
		When 'HEAD - JUVENILE' Then 'Child'
		When 'SINGLE ADULT' Then 'Adult'
		When 'SINGLE PARENT' Then 'Adult'
		When 'SPOUSE' Then 'Adult'
		When 'TRUST' Then 'Adult'
		When 'UNKNOWN' Then 'Adult'
		ELSE 'Adult'
	  END as FamilyRole
    , isNull(i.[FirstName],'') as FirstName
	, isNull(i.AlsoKnownAs,'') as NickName
	, isNull(i.[LastName],'') as LastName
    , isNull(i.[MiddleName],'') as MiddleName
	, isNull(dbo.ufn_ProperCase(i.Title),'') as Salutation
	, isNull((i.Suffix),'') as Suffix
	, isNull(i.EmailAddress,'') as Email
	, isNull(IIF(dbo.ufn_ProperCase(i.Sex)='','Unknown',dbo.ufn_ProperCase(i.Sex)),'Unknown') as Gender
	
	, CASE i.FamilyRole
		When 'HEAD' Then 'Married'
		When 'SINGLE ADULT' Then 'Single'
		When 'SINGLE PARENT' Then 'Single'
		When 'SPOUSE' Then 'Married'
		ELSE  
			CASE dbo.ufn_ProperCase(i.MaritalStatus)
				WHEN '' THEN 'Unknown'
				WHEN 'Separated' THEN 'Single'
				WHEN 'Widowed' THEN 'Single'
				ELSE ISNULL(dbo.ufn_ProperCase(i.MaritalStatus), 'Unknown')
			END
	  END as MaritalStatus
	
	, isNull(CONVERT(varchar(50), i.BirthDate, 101), '') as Birthdate
	, isNull(CONVERT(varchar(50), i.AnniversaryDate, 101),'') as AnniversaryDate
	, IIF(f.Archive = 0, 'Active','InActive' ) as RecordStatus
	, isNull(f.ArchiveReason,'') as InactiveReason
	, dbo.ufn_ProperCase(i.MembershipStatus) as ConnectionStatus
	, IIF(ISNULL(f.IncludeInMailings,1) = 1, 'EmailAllowed','DoNotEmail') as EmailPreference
	, isNull(i.AddedDate,GetDate()) as CreatedDateTime
	, isNull(i.ModDate, isNull(i.AddedDate,GetDate())) as ModifiedDateTime
	, isNull(c.ID,0) as CampusId
	, isNull(dbo.ufn_ProperCase(c.Church),'') as CampusName
	, isNull(dbo.ufn_ProperCase(IIF(i.SchoolGradeName='UNKNOWN',null,i.SchoolGradeName)),'') as Grade
	, 'True' as GiveIndivifually
	, IIF(i.DeceaseDate is null, 'False','True') as IsDeceased
	, IIF(isNull(e.Photo,'') = '',
		isNull(Case IIF(i.IndividualPhoto='undefined','',i.IndividualPhoto) When '' Then '' Else 'https://www.fellowshipnwa.org/GraceBaseOnline/Files/IndividualPhotos/GraceBaseID/1/' + IndividualPhoto end, '')
		, 'https://www.fellowshipnwa.org/GraceBaseOnline/Files/EmployeePhotos/GraceBaseID/1/' + e.Photo ) as PersonPhotoUrl
  FROM [tblIndividual] i
  Join [tblFamily] f on i.FamilyID = f.FamilyID
  LEFT Join lkChurch c on f.FChurchDesignation = c.Church
  Left Join tblFamilyUsername fu on fu.IndID = i.IndID
  Left Join tblEmp e on e.IndID = i.indId AND ( fu.Staff = 1 or fu.Volunteer = 1 )
  WHERE isNull(f.[NonIndividual],0) != 1
  )

UNION ALL
( 
SELECT
	i.[IndID] as Id
    ,i.[FamilyID] as FamilyId
	, f.FamilyName
	-- Make Family Role boil down to Child and Adult.  
	-- I'll create an attribute called legacy Family role so that we can manipulate data post slingshot migration
	, 'Adult' as FamilyRole
    , 'Business' as FirstName
	, isNull(i.AlsoKnownAs,'') as NickName
	, isNull(f.[FamilyName],isNull(i.Firstname,'')) as LastName
    , isNull(i.[MiddleName],'') as MiddleName
	, isNull(dbo.ufn_ProperCase(i.Title),'') as Salutation
	, isNull((i.Suffix),'') as Suffix
	, isNull(i.EmailAddress,'') as Email
	, isNull(IIF(dbo.ufn_ProperCase(i.Sex)='','Unknown',dbo.ufn_ProperCase(i.Sex)),'Unknown') as Gender
	
	, CASE i.FamilyRole
		When 'HEAD' Then 'Married'
		When 'SINGLE ADULT' Then 'Single'
		When 'SINGLE PARENT' Then 'Single'
		When 'SPOUSE' Then 'Married'
		ELSE  
			CASE dbo.ufn_ProperCase(i.MaritalStatus)
				WHEN '' THEN 'Unknown'
				WHEN 'Separated' THEN 'Single'
				WHEN 'Widowed' THEN 'Single'
				ELSE ISNULL(dbo.ufn_ProperCase(i.MaritalStatus), 'Unknown')
			END
	  END as MaritalStatus
	
	, isNull(CONVERT(varchar(50), i.BirthDate, 121), '') as Birthdate
	, isNull(CONVERT(varchar(50), i.AnniversaryDate, 121),'') as AnniversaryDate
	, IIF(f.Archive = 0, 'Active','InActive' ) as RecordStatus
	, isNull(f.ArchiveReason,'') as InactiveReason
	, dbo.ufn_ProperCase(i.MembershipStatus) as ConnectionStatus
	, IIF(ISNULL(f.IncludeInMailings,1) = 1, 'EmailAllowed','DoNotEmail') as EmailPreference
	, isNull(i.AddedDate,GetDate()) as CreatedDateTime
	, isNull(i.ModDate, isNull(i.AddedDate,GetDate())) as ModifiedDateTime
	, isNull(c.ID,0) as CampusId
	, isNull(dbo.ufn_ProperCase(c.Church),'') as CampusName
	, isNull(dbo.ufn_ProperCase(IIF(i.SchoolGradeName='UNKNOWN',null,i.SchoolGradeName)),'') as Grade
	, 'True' as GiveIndivifually
	, IIF(i.DeceaseDate is null, 'False','True') as IsDeceased
	, IIF(isNull(e.Photo,'') = '',
		isNull(Case i.IndividualPhoto When '' Then '' Else 'https://www.fellowshipnwa.org/GraceBaseOnline/Files/IndividualPhotos/GraceBaseID/1/' + IndividualPhoto end, '')
		, 'https://www.fellowshipnwa.org/GraceBaseOnline/Files/EmployeePhotos/GraceBaseID/1/e' + e.Photo ) as PersonPhotoUrl
FROM [tblIndividual] i
  Join [tblFamily] f on i.FamilyID = f.FamilyID
  LEFT Join lkChurch c on f.FChurchDesignation = c.Church
  Left Join tblFamilyUsername fu on fu.IndID = i.IndID
  Left Join tblEmp e on e.IndID = i.indId AND ( fu.Staff = 1 or fu.Volunteer = 1 )
WHERE f.[NonIndividual] = 1)
) x
 --Where PersonPhotoUrl != ''