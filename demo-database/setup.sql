
CREATE TABLE Users( UID int NOT NULL AUTO_INCREMENT, Name nvarchar(10) NOT NULL, Tel nvarchar(10) NOT NULL, CreateDT  DATETIME DEFAULT   CURRENT_TIMESTAMP, UNIQUE (Name, Tel), PRIMARY KEY(UID));
-- adduser
    -- CALL adduser('CCC','1236548520');
delimiter //
DROP procedure if exists adduser//
CREATE PROCEDURE adduser(pName char(10), pTel char(10))
BEGIN
DECLARE data char(10); 
SET data = (SELECT Name FROM Users WHERE Name = pName);
IF (data IS NOT NULL) THEN
        SELECT 'User is already exist.' as Message;
ELSE
        INSERT INTO Users (Name, Tel) VALUES (pName,pTel);
        SELECT 'User is added' as Message;
END IF;
END//
delimiter ;


-- updateuser
    -- CALL updateuser('CCC','0000000000');
delimiter //
drop procedure if exists updateuser//
CREATE PROCEDURE updateuser(pName char(10), pTel char(10))
BEGIN
DECLARE a char(10); 
SET a = (select Name from Users where Name = pName and Tel = pTel);
IF (a IS NOT NULL) THEN

        select 'User is not updated.' as Message;
ELSE
        update Users set Tel = pTel where Name = pName;
        select 'User is updated.' as Message;
END IF;
END//
delimiter ;



-- deleteuser
    -- CALL deleteuser('CCC');
delimiter //
drop procedure if exists deleteuser//
CREATE PROCEDURE deleteuser(pName char(10))
BEGIN
DECLARE a char(10); 
SET a = (select Name from Users where Name = pName );
IF (a IS NOT NULL) THEN
        delete from Users where Name = pName ;
        select 'User is deleted.' as Message;
ELSE
        select 'User is not deleted.' as Message;
END IF;
END//
delimiter ;


CALL adduser('AAA','0977333444');
CALL adduser('BBB','0988555222');
CALL adduser('CCC','0935000111');