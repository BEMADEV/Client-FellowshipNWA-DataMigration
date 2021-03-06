SELECT
[IndID] as PersonId
,[Phone1] as PhoneNumber
,dbo.ufn_ProperCase([Phone1Type]) as PhoneType
,IIF(dbo.ufn_ProperCase([Phone1Type]) = 'Cell','True','False') as IsMessagingEnabled
, 'False' as IsUnlisted
FROM [tblIndividual]
Where 
[Phone1] is not null 
and [Phone1] != '' AND [Phone1] not like '(   )%'
and [Phone1Type] is not null
and [Phone1Type] != ''

UNION 

SELECT
[IndID] as PersonId
,[Phone2] as PhoneNumber
,dbo.ufn_ProperCase([Phone2Type]) as PhoneType
,IIF(dbo.ufn_ProperCase([Phone2Type]) = 'Cell','True','False') as IsMessagingEnabled
, 'False' as IsUnlisted
FROM [tblIndividual]
Where 
[Phone2] is not null 
and [Phone2] != '' AND [Phone2] not like '(   )%'
and [Phone2Type] is not null
and [Phone2Type] != ''

UNION 

SELECT
[IndID] as PersonId
,[Phone3] as PhoneNumber
,dbo.ufn_ProperCase([Phone3Type]) as PhoneType
,IIF(dbo.ufn_ProperCase([Phone3Type]) = 'Cell','True','False') as IsMessagingEnabled
, 'False' as IsUnlisted
FROM [tblIndividual]
Where 
[Phone3] is not null 
and [Phone3] != '' AND [Phone3] not like '(   )%'
and [Phone3Type] is not null
and [Phone3Type] != ''

-- UNION 

/*
SELECT 
[IndID] as PersonId
,[Phone4] as PhoneNumber
,dbo.ufn_ProperCase([Phone4Type]) as PhoneType
,IIF(dbo.ufn_ProperCase([Phone4Type]) = 'Cell','True','False') as IsMessagingEnabled
, 'False' as IsUnlisted
FROM [tblIndividual]
Where 
[Phone4] is not null 
and [Phone4] != '' AND [Phone4] not like '(   )%'
and [Phone4Type] is not null
and [Phone4Type] != ''
  
UNION 
*/
/*
SELECT
[IndID] as PersonId
,[HomePhone] as PhoneNumber
,'Home' as PhoneType
,'False' as IsMessagingEnabled
, 'False' as IsUnlisted
FROM [tblIndividual]
Where 
[HomePhone] is not null
and [HomePhone] != ''
AND [HomePhone] not like '(   )%'

UNION 

SELECT
[IndID] as PersonId
,WorkPhone as PhoneNumber
,'Work' as PhoneType
,'False' as IsMessagingEnabled
, 'False' as IsUnlisted
FROM [tblIndividual]
Where 
WorkPhone is not null 
and WorkPhone != '' 
 AND WorkPhone not like '(   )%'

UNION 

SELECT
[IndID] as PersonId
,CellPhone as PhoneNumber
,'Cell' as PhoneType
,'True' as IsMessagingEnabled
, 'False' as IsUnlisted
FROM [tblIndividual]
Where 
CellPhone is not null 
and CellPhone != ''
 AND CellPhone not like '(   )%'

UNION 
*/
/*
SELECT
[IndID] as PersonId
,FaxPhone as PhoneNumber
,'Fax' as PhoneType
,'False' as IsMessagingEnabled
, 'False' as IsUnlisted
FROM [tblIndividual]
Where 
FaxPhone is not null 
and FaxPhone != ''
AND FaxPhone not like '(   )%'

UNION 
*/
/*
SELECT
[IndID] as PersonId
,OtherPhone as PhoneNumber
,dbo.ufn_ProperCase([OtherPhoneType]) as PhoneType
,IIF(dbo.ufn_ProperCase([OtherPhoneType]) = 'Cell','True','False') as IsMessagingEnabled
, 'False' as IsUnlisted
FROM [tblIndividual]
Where 
OtherPhone is not null 
and OtherPhone != '' 
AND OtherPhone not like '(   )%'
and [OtherPhoneType] is not null
and [OtherPhoneType] != ''
*/
