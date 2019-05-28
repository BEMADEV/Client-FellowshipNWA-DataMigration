/*
==============
Delete all data from tables:
	FinancialTransactionDetail
	FinancialTransaction
	FinancialAccount
	FinancialBatch
	FinancialPaymentDetail
	FinancialPersonBankAccount
	FinancialPersonSavedAccount
	FinancialPledge
	FinancialScheduledTransaction
	FinancialScheduledTransactionDetail
	FinancialTransactionImage
	FinancialTransactionRefund
==============
*/

USE rockdb2;
DELETE a
FROM dbo.FinancialTransactionDetail AS a
     INNER JOIN dbo.FinancialAccount AS b ON a.AccountId = b.id;
GO
DELETE a
FROM dbo.FinancialTransaction AS a
     INNER JOIN dbo.FinancialBatch AS b ON a.BatchId = b.id;
GO
DELETE a
FROM dbo.FinancialTransaction AS a
     INNER JOIN dbo.FinancialPaymentDetail AS b ON a.FinancialPaymentDetailId = b.id;
GO
DELETE FROM dbo.FinancialPersonBankAccount;
GO
DELETE FROM dbo.FinancialPersonSavedAccount;
GO
DELETE FROM dbo.FinancialPledge;
GO
DELETE FROM dbo.FinancialScheduledTransaction;
GO
DELETE FROM dbo.FinancialScheduledTransactionDetail;
GO
DELETE FROM dbo.FinancialTransaction;
GO
DELETE FROM dbo.FinancialTransactionDetail;
GO
DELETE FROM dbo.FinancialTransactionImage;
GO
DELETE FROM dbo.FinancialTransactionRefund;