
 Select
 IndID as PersonId
 , Case Relationship
	WHEN 'Grandson' THEN 'Grandchild'
	WHEN 'Father' THEN 'Parent'
	WHEN 'Husband' THEN 'Spouse'
	WHEN 'Sister' THEN 'Sibling'
	WHEN 'Wife' THEN 'Spouse'
	WHEN 'Nephew' THEN 'Niece / Nephew'
	WHEN 'Uncle' THEN 'Aunt / Uncle'
	WHEN 'Grandmother' THEN 'Grandparent'
	WHEN 'Cousin' THEN 'Cousin'
	WHEN 'Aunt' THEN 'Aunt / Uncle'
	WHEN 'Step Father' THEN 'Step Parent'
	WHEN 'Step Mother' THEN 'Step Parent'
	WHEN 'Step Daughter' THEN 'Step Child'
	WHEN 'Grandfather' THEN 'Grandparent'
	WHEN 'Step Son' THEN 'Step Child'
	WHEN 'Niece' THEN 'Niece / Nephew'
	WHEN 'Daughter' THEN 'Child'
	WHEN 'Mother' THEN 'Parent'
	WHEN 'Granddaughter' THEN 'Grandchild'
	WHEN 'Son' THEN 'Child'
	WHEN 'Brother' THEN 'Sibling'
 end as [Role]
 , RelatedIndID as RelatedPersonId

From tblIndividualRelationships
where Relationship != ''