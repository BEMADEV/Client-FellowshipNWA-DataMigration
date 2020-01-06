Update g
	Set isPublic = iif(tg.isPublic='False',0,1)
From [Group] g
Join [_tmp_group] tg on tg.Id = g.ForeignId and g.GroupTypeId not in (10,11)