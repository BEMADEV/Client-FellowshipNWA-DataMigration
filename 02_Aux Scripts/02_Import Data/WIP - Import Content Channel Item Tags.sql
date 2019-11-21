DECLARE @foreignKey nvarchar(36) = 'GB'
	, @AttributeId int = ( Select Id From Attribute where [key] = 'MediaTags' )

Insert Into AttributeValue( IsSystem, AttributeId, EntityId, [Value], [Guid] )
Select
	0 as IsSystem
	, @AttributeId as AttributeId
	, i.Id as EntityId
	, t.Tags as [Value]
	, NEWID() as [Guid]
From
( 
	Select
		ForeignGuid
		, String_Agg(Tag, '|' ) as Tags
	From 
	(
		Select Distinct
			cit.ForeignGuid
			, Trim(t.[Value]) as [Tag]
		 From 
			_tmp_content_Channel_item_tags cit
		Cross Apply String_Split( cit.MediaTags, ',' ) t
		Where t.value != ''
	) tags
	Group By ForeignGuid
) t
Join ContentChannelItem i on i.ForeignKey = @foreignKey 
						and cast(i.ForeignGuid as nvarchar(max)) = cast(t.ForeignGuid as nvarchar(max))

LEFT JOIN AttributeValue av on av.EntityId = i.Id and av.AttributeId = @AttributeId
Where av.id is null
