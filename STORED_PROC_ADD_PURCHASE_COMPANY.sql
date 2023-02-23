USE ExpenseTracker;
GO

DROP PROCEDURE [dbo].[AddPurchaseCompany];
GO

CREATE PROCEDURE [dbo].[AddPurchaseCompany] (
		@Username nvarchar(150), 
		@PurchaseCompanyName nvarchar(150)
	)
AS
BEGIN
	DECLARE @fk_user_id INT;
	SET @fk_user_id = (SELECT user_id FROM [dbo].[User] WHERE user_name = @Username);

	MERGE [PurchaseCompany] AS TARGET
	USING (
		SELECT @fk_user_id as [fk_user_id]
				, @PurchaseCompanyName as [purchase_company_name]
	)
	AS SOURCE 
	ON (TARGET.fk_user_id = SOURCE.fk_user_id
		AND TARGET.purchase_company_name = SOURCE.purchase_company_name
	)
	WHEN MATCHED THEN 
		UPDATE SET [purchase_company_name] = @PurchaseCompanyName
	WHEN NOT MATCHED THEN
		INSERT ([fk_user_id], [purchase_company_name])
		VALUES (@fk_user_id, @PurchaseCompanyName)
	;
END;
GO