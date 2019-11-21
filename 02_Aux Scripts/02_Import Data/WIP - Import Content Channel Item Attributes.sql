DECLARE @foreignKey nvarchar(36) = 'GB'

Insert Into AttributeValue( IsSystem, AttributeId, EntityId, [Value], [Guid] )
Select
	0 as IsSystem
	, a.Id as AttributeId
	, i.Id as EntityId
	, Max(cast(ia.[Value] as nvarchar(max))) as [Value]
	, NEWID() as [Guid]
From _tmp_content_channel_item_attribute ia
Join ContentChannelItem i on i.ForeignKey = @foreignKey 
						and cast(i.ForeignGuid as nvarchar(max)) = cast(ia.ForeignGuid as nvarchar(max))
Join Attribute a on a.[Key] = ia.Attribute
				AND a.EntityTypeQualifierColumn in ('ContentChannelId', 'ContentChannelTypeId')
				AND  a.EntityTypeQualifierValue in ('5','10')
LEFT JOIN AttributeValue av on av.EntityId = i.Id and av.AttributeId = a.Id
Where ia.Value is not null and cast(ia.Value as nvarchar(max)) != ''
and av.id is null

Group By i.Id, a.Id
