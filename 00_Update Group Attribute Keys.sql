WITH CTE as (
	Select
		Id
		, ROW_NUMBER() Over ( PARTITION by [Key] Order by Id ) as [Order]
		, [Key]
	From Attribute a
	Where EntityTypeId = 16
)
Update c Set
	[Key] = [Key] + '_' + Cast([Order] as nvarchar(11))
FROM CTE c
Where [Order] > 1