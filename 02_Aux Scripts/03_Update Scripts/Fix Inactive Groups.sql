Update g
Set IsActive = tg.IsActive
From _tmp_group tg
Join [Group] g on g.foreignId = tg.Id