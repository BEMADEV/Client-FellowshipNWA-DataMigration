Update g
	Set ParentGroupid = pg.Id
From [_tmp_group] tg
Join [Group] g on g.ForeignId = tg.Id and g.GroupTypeId not in ( 10, 11 )
Join [Group] pg on pg.ForeignId = tg.ParentGroupId and pg.GroupTypeId not in ( 10, 11 )
