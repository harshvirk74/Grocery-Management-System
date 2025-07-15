USE EE;

--Trigger(Whenever a item is updated , inserted or deleted in the items table it creates a log for that item in the Stocklog_table)
CREATE OR ALTER TRIGGER MakeLogs
ON Items  
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    -- Handle INSERT operation (new items added to the Items table)
    IF EXISTS(SELECT * FROM inserted) AND NOT EXISTS(SELECT * FROM deleted)
    BEGIN
        -- Log the new item into the Stocklog table
        INSERT INTO Stocklog(item_id, change_time, new_qauntity, comment)
        SELECT i.item_id, CURRENT_TIMESTAMP, i.quantity, 'Inserted'
        FROM inserted i;
    END

    -- Handle DELETE operation (items removed from the Items table)
    IF EXISTS(SELECT * FROM deleted) AND NOT EXISTS(SELECT * FROM inserted)
    BEGIN
        -- Log the deleted item into the Stocklog table
        INSERT INTO Stocklog(item_id, change_time, new_qauntity, comment)
        SELECT d.item_id, CURRENT_TIMESTAMP, d.quantity, 'Deleted'
        FROM deleted d;
    END

    -- Handle UPDATE operation (existing items updated in the Items table)
    IF EXISTS(SELECT * FROM inserted) AND EXISTS(SELECT * FROM deleted)
    BEGIN
        -- Log the updated item into the Stocklog table
        INSERT INTO Stocklog(item_id, change_time, new_qauntity, comment)
        SELECT i.item_id, CURRENT_TIMESTAMP, i.quantity, 'Updated'
        FROM inserted i
        JOIN deleted d ON i.item_id = d.item_id
        WHERE i.quantity <> d.quantity;  -- Only log if quantity changed
    END
END;