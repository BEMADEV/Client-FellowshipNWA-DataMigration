DECLARE @AttributeId int = ( Select Top 1 Id From Attribute Where [Key] = 'GB_ConfirmationDate' );

Update PersonDuplicate
Set IsConfirmedAsNotDuplicate = 1
Where Id in (

Select Distinct
	pd.Id
From AttributeValue av
Join PersonDuplicate pd on pd.DuplicatePersonAliasId = dbo.ufnUtility_GetPrimaryPersonAliasId( av.EntityId )
						
Where AttributeId = @AttributeId
	and av.Value is not null 
	and av.Value != '' 
	and av.ValueAsDateTime is not null
	and pd.IsConfirmedAsNotDuplicate = 0

Union

Select Distinct
	pd.Id
From AttributeValue av
Join PersonDuplicate pd on pd.PersonAliasId = dbo.ufnUtility_GetPrimaryPersonAliasId( av.EntityId )
						
Where AttributeId = @AttributeId
	and av.Value is not null 
	and av.Value != '' 
	and av.ValueAsDateTime is not null
	and pd.IsConfirmedAsNotDuplicate = 0
)