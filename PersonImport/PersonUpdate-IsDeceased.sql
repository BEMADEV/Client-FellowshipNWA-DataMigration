/*
	On the Persons table, if person is Deceased:
		- Set Record Status to Inactive
		- Set Reason to Deceased
		- Inactive Reason Note to "Migration Update"
*/

UPDATE Person 
SET    RecordStatusValueId = '4', 
       RecordStatusReasonValueId = '167', 
       InactiveReasonNote = 'Migration Update' 
WHERE  IsDeceased = 1 