/*
	Address Type Work Will have to be updated after migration
*/

SELECT
	i.IndID as PersonId
	, f.MailAddress as Street1
	, isNull(f.MailAddressLine2,'') as Street2
	, f.MailCity as City
	, f.MailState as [State]
	, f.MailZip as PostalCode
	, isNull(f.MailCountry,'') as Country
	, 'True' as IsMailing
	, IIF( f.MailAddress = f.Faddress
		AND f.FZip = f.MailZip,'Home','Work' ) as AddressType
	, isnull(f.Latitude,'') as Latitude
	, isnull(f.Longitude, '') as Longitude
FROM [tblFamily] f
JOIN tblIndividual i on i.FamilyID = f.FamilyID
Where mailAddress is not null and mailAddress != ''
	And MailState is not null and mailState != ''
	and Mailzip != '00000'

UNION

SELECT
	i.IndID
	, f.FAddress as Street1
	, isNull(f.FAddressLine2,'') as Street2
	, f.FCity as City
	, f.FState as [State]
	, f.FZip as PostalCode
	, f.FCountry as Country
	, 'False' as IsMailing
	, 'Home'as AddressType
	, '' as Latitude
	, '' as Longitude
FROM [tblFamily] f
JOIN tblIndividual i on i.FamilyID = f.FamilyID
Where mailAddress is not null and mailAddress != ''
	And MailState is not null and mailState != ''
	and Mailzip != '00000'
	AND f.MailAddress != f.Faddress AND f.FZip != f.MailZip