Update g
Set IsActive = 0
From [Group] g
Join [_tmp_group] tg on tg.Id = g.ForeignId and g.GroupTypeId not in (10,11) and tg.GroupTypeId = 7

