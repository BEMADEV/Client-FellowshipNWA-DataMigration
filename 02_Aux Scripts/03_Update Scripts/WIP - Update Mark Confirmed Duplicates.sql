DECLARE @AttributeId int = 4735 -- Not actually the right Attribute Id.  I need to re-import to get the AttributeId

--Update PersonDuplicate
--Set IsConfirmedAsNotDuplicate = 1
--Where Id in (

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

--)