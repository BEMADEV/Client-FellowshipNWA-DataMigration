# Client-FellowshipNWA-DataMigration
Used for storing all the SQL scripts needed for Data migration.

## 1.1 Preperation
Because some work has already been done in production, with manually adding campuses, prior to slingshot running, production records need to updated with Foreign Keys and Ids so that the import properly matches records.  Currently, there is only script that needs to be run

1. Run 00_Update ForeignId on Campus.sql

## 1.2 Slingshot
Follow the below steps to complete the primary data migration.  To see what data is supported under Slingshot, you can view the following Documentation under the Rock Repository.

1. Run all scripts in 01_Build Slingshot Scripts against the appropriate Gacebase Database.
   - attendance.sql
   - finanical-account.sql
   - financial-batch.sql
   - financial-transcation.sql
   - financial-transactiondetail.sql
   - group-member.sql
   - group.sql
   - grouptype.sql
   - location.sql
   - person-address.sql
   - person-attribute.sql
   - person-attributevalue.sql
   - person-notesql
   - person-phone.sql
   - person.sql
   - schedule.sql
2. Save the results of all queries as CSV Files using the slingshot naming conventions
3. Place all CSV files into an .zip file, and modify the extension to .slingshot
4. Run the Bulk Import tool in Rock using the Slingshot file.  Once to import data, and second time to import photos

## 1.3 Auxiliary data
Once the Slingshot import has completed.  Auxiliary scripts need to be run to either import additional information not supported by slingshot, or to clean up data from the import.  Additional Data needs to export from Gracebase into temporary staging tables in Rock.  Then it can be imported and manipulated as needed.
( Note scripts appended with WIP are not be run.  These scripts are “Works In Progress” and have not been completed yet. )

1. Run all scripts in 02_Aux Scripts > 01 _Create tmp import Tables using the import data wizard.  The Gracebase DB should be used as the source, and the Rock DB used as the Destination.  SSIS Packages can be created and used to streamline future imports.  ( Just make sure to update the source and destination Databases.  I started creating these and saving them under SSIS Packages.  If I can save all of these in the next mock import, I’ll use strictly SSIS packages instead of the manually running the scripts.  It’s the same result, just makes future imports faster. ).
   - CommunicationListRecipients.sql:  This script gets all the recipients tied to the communication lists so that they can be added as group members in Rock.
   - EmailLists.sql:  This script grabs all the communication lists to be created as groups with the group type of communication list in Rock.
   - financialaccount-attribute.sql
   - finanicalaccount-attributevalue.sql:  These two scripts add the SubAccNum, ChildCareStatement, OneTimeGift, and SolomonAcctNum columns from GB and add them as attributes to Rocks Finanical Accounts.
   - financialtransaction-attribute.sql
   - financialtransaction-attributevalue.sql:  These two scripts add the DerectDebitId, Coin, and Paper columns from Contributions to Rock's Finanical Transactions.
   - group-attribute.sql
   - group-attributevalue.sql:  These two scripst add Attributes to Rocks Groups based on GroupType from the tblOrganization table.  This includes: CoachShepard, OnlineService, OnlineSeason, OnlineRegion, OnlinePublic, OnlineSize, OnlineGender, CoachIndId, OnlineChildcare, OnlineNote, CGImage, CGStudy, MissionName, MisionDescDefault,MissionFund, MissionOnline,MissionFeeId, MissionImage,MissionGoal, MissionDescShort, etc
   - groupmember-attribute.sql
   - groupmember-attributevalue.sql:  These two scripts add Attributes to Rock Group Members based on custom fields from the lkCampFields table.
   - knownrelationship.sql:  This script creates Rock Known Relationships from the tblIndividualRelationships table.
   - supervisor_indId.sql:  This script gets the indiviuals Supervior's Id from the tblUserName table.  It returns the superviors IndId and the persons IndId which is used to set the attribute in Rock
2. Run all scripts under 02_Aux Scripts > 02_Import Data.
   - Import_Communication Lists and Recipeints.sql
   - Import_Financialaccount-attributes.sql
   - Import_finanicaltrasaction-attributes.sql
   - Import_Group-attribute.sql
   - Import_group-attributevale.sql
   - import_knownrelations.sql
   - import_locations.sql
3. Attach Select Slingshot Exports to the Rock DB.  This is because there are some bugs in the slingshot import, and scripts can be run to fix those bugs
   - group.csv > _tmp_group
   - financial-account.scv > _tmp_Financial-Account
4. Run all scripts under 02_Aux Scripts > 03_Update Scripts.
   - Fix Inactive Groups.sql:  This script properly marks groups as inactive.  This is a fix to a bug in Slingshot import tool.
   - Fix IsActive - IsPublic Accounts.sql:  This script will properly mark groups as IsPublic and IsAcive.  This is a fix to a bug in the Slingshot import tool.
   - Update business Record Types.sql:  This script will find all the Business that were imported and properly mark their record type as business.  In Rock, Business records are the same as person records.  At the time of writing the slingshot scripts, Business records weren't supported.  So, all Businesses were exported as people.  This script simply adjusts the record type.
   - Update Supervisor.sql:  This script updates to the Supervisor attribute with the Proper person.  Slingshot doesn't support people field types, so this had to be set after import using the IndId to find the proper person records.
   - Update Mark Confirmed Duplicates.sql:  The Find Duplicate Job must be run prior to running this script.  This script will use the imported attribute "ConfirmationDate" to mark any duplicate rock finds as "Confirmed Not Duplicate", thus removing those duplicates from the report.
   - Fixed_deceased_people.sql: This script updates connection status, and properly flags indiviuals as deceased in Rock.  It also updates Inactive Reasons and connection status of Moved, and Inactive.  This way, those connection status can be removed from Rock.
