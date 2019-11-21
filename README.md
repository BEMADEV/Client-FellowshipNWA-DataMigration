# Client-FellowshipNWA-DataMigration
Used for storing all the SQL scripts needed for Data migration.

## 1.1 Preperation
Because some work has already been done in production, with manually adding campuses, prior to slingshot running, production records need to updated with Foreign Keys and Ids so that the import properly matches records.  Currently, there is only script that needs to be run

1. Run 00_Update ForeignId on Campus.sql

## 1.2 Slingshot
Follow the below steps to complete the primary data migration.  To see what data is supported under Slingshot, you can view the following Documentation under the Rock Repository.

1. Run all scripts in 01_Build Slingshot Scripts against the appropriate Gacebase Database.
2. Save the results of all queries as CSV Files using the slingshot naming conventions
3. Place all CSV files into an .zip file, and modify the extension to .slingshot
4. Run the Bulk Import tool in Rock using the Slingshot file.  Once to import data, and second time to import photos

## 1.3 Auxiliary data
Once the Slingshot import has completed.  Auxiliary scripts need to be run to either import additional information not supported by slingshot, or to clean up data from the import.  Additional Data needs to export from Gracebase into temporary staging tables in Rock.  Then it can be imported and manipulated as needed.
( Note scripts appended with WIP are not be run.  These scripts are “Works In Progress” and have not been completed yet. )

1. Run all scripts in 02_Aux Scripts > 01 _Create tmp import Tables using the import data wizard.  The Gracebase DB should be used as the source, and the Rock DB used as the Destination.  SSIS Packages can be created and used to streamline future imports.  ( Just make sure to update the source and destination Databases.  I started creating these and saving them under SSIS Packages.  If I can save all of these in the next mock import, I’ll use strictly SSIS packages instead of the manually running the scripts.  It’s the same result, just makes future imports faster. ).
2. Run all scripts under 02_Aux Scripts > 02_Import Data.  
3. Run all scripts under 02_Aux Scripts > 03_Update Scripts.
4. Run the Bulk Import tool in Rock using the Slingshot file.  Once to import data, and second time to import photos
