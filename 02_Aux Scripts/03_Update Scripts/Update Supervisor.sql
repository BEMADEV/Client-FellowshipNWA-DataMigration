Declare  @AttributeId int
	, @CategoryId int
	, @SupIdAttributeId int;

Set @CategoryId = ( Select top 1 Id From Category Where [Name] = 'Human Resources' and EntityTypeId = 49 )
Set @AttributeId =  ( Select top 1 Id From Attribute Where [Key] = 'Supervisor' and entityTypeId = 15 )
Set @SupIdAttributeId = ( Select top 1 Id From Attribute Where [Key] = 'GB_SupervisorId' and EntityTypeId = 15 )

IF @CategoryId is null
BEGIN
	Insert Into Category( isSystem, EntityTypeId, EntityTypeQualifierColumn, EntityTypeQualifierValue, [Name], [Guid], [order] )
	Values ( 0, 49, 'EntityTypeId', '15', 'Human Resources', NewId(), 0 )

	Set @CategoryId = SCOPE_IDENTITY();

END

IF @AttributeId is null
BEGIN
		Insert Into Attribute (
			IsSystem
			, FieldTypeId
			, EntityTypeId
			, [Key]
			, [Name]
			, IsGridColumn
			, IsMultiValue
			, IsRequired
			, [Guid]
			, IsActive
		)
		Values( 
			0
			, 18
			, 16
			, 'Supervisor'
			, 'Supervisor'
			, 0
			, 0
			, 0
			, NewID()
			, 1
		)

Set @AttributeId = SCOPE_IDENTITY();

Insert Into AttributeCategory( AttributeId, CategoryId )
Values ( @AttributeId, @CategoryId )

End

IF @SupIdAttributeId is not null
BEGIN
	
	Insert Into AttributeValue( IsSystem, AttributeId, EntityId, [Value], [Guid] )
	Select 
		0 as IsSystem
		, @AttributeId as AttributeId
		, av.EntityId as EntityId
		, pa.[Guid] as [Value]
		, NEWID() as [Guid]
	From AttributeValue av
	Join _tmp_supervisor_indId k on k.SupervisorId = av.Value
	Join Person p on p.ForeignId = k.IndId and p.ForeignKey = 'GB'
	Join PersonAlias pa on pa.PersonId = p.Id and pa.AliasPersonId = p.Id
	Left Join AttributeValue av2 on av2.EntityId = av.EntityId and av2.AttributeId = @AttributeId
	Where av.Attributeid = @SupIdAttributeId and av.Value is not null and av.Value != ''
	AND av2.Id is null

END



