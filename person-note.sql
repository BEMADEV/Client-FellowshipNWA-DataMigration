-- Still need to add Created By
SELECT 
	ContactId as Id
	, ContactType as NoteType
	, isNull(Subject,'') as Caption
	, Notes as Text
	, 'False' as IsAlert
	, IIF(Secure = 1, 'True', 'False') as IsPrivateNote
	, ContactDate as DateTime
	, c.IndId as PersonId
	, isNull(isNull(cast(ic.IndID as nvarchar(50)), cast(im.IndId as nvarchar(50))),'') as CreatedByPersonId
 From tblContactLog c
 LEFT Join tblIndividual ic on c.AddedBy = ic.LastName + ', ' + ic.FirstName
 Left Join tblIndividual im on c.Modby = im.Lastname + ', ' + im.LastName
 Where c.IndId is not null
 and (( c.Secure = 1 and ( ic.IndID is not Null OR im.IndId is not null )) OR c.Secure = 0 )
 order by c.ContactId