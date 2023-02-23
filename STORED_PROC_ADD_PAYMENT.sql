USE ExpenseTracker;
GO

DROP PROCEDURE [dbo].[AddPayment];
GO

CREATE PROCEDURE [dbo].[AddPayment] (
		@Username nvarchar(150), 
		@PaymentDescription nvarchar(150),
		@PaymentAmount DECIMAL(12,2),
		@PaymentDate DATE
	)
AS
BEGIN
	DECLARE @fk_user_id INT;
	SET @fk_user_id = (SELECT user_id FROM [dbo].[User] WHERE user_name = @Username);

	INSERT INTO [Payment]
				([fk_user_id]
				, [payment_description]
				, [payment_date]
				, [payment_amount]
				)
	VALUES (@fk_user_id
			, @PaymentDescription
			, @PaymentDate
			, @PaymentAmount
	);
END;
GO