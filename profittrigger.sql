--Trigger for  profit(	Makes sure if the stock pricce is equal to sale price we increase it by 10 percnet.)
CREATE OR ALTER TRIGGER Profitable
ON Items 
AFTER INSERT,UPDATE
AS
BEGIN
		IF EXISTS (SELECT * FROM inserted)
		BEGIN
			--Chnage the price to 10 percent higher
			IF EXISTS(SELECT* FROM inserted WHERE stock_price = shelf_price)
			BEGIN
				UPDATE Items
				SET shelf_price = inserted.stock_price*1.10
				FROM Items
				INNER JOIN inserted
					ON Items.item_id = inserted.item_id
				WHERE inserted.stock_price = inserted.shelf_price;
			END
			ELSE
			BEGIN
				PRINT 'no rows found wher shelf price is equal to stock_price'
			END
		END
END;




/*
Note
With the INNER JOIN, only rows in Items that match the inserted virtual table (item_id from inserted) are updated. 
This ensures:
No unrelated rows are touched.Doesn't have to scan and change the whole table
*/

