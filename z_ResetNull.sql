/*
CSV imports NULL as string.
This will set NULL strings to NULL fields.
*/
UPDATE
   tblIndividual a 
set
   a.ConfirmationDate = NULL 
where
   a.ConfirmationDate = 'NULL'