Update g
Set IsActive = IIF(tg.IsActive = 'True', 1, 0)
From _tmp_group tg
Join [Group] g on g.foreignId = tg.Id