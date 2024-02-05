DROP DATABASE IF EXISTS hw6;
CREATE DATABASE IF NOT EXISTS hw6;
USE hw6;

#1. Создайте процедуру, которая принимает кол-во сек и формат их в кол-во дней часов. Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

DROP PROCEDURE IF EXISTS sec_to_dhms;
DELIMITER //
CREATE PROCEDURE sec_to_dhms(num INT)
	BEGIN
		DECLARE days INT;
        DECLARE hours INT;
        DECLARE mins INT;
        DECLARE secs INT;
        SET days = num/86400;
        SET hours = num % 86400 % 3600;
        SET mins = num % 86400 % 60;
        SET secs = num % 60;
        SELECT CONCAT (num, ' -> ', days, ' day(s) ', hours, ' hour(s) ', mins, ' minute(s) ', secs, ' second(s)') AS result;
	END //
DELIMITER ;

CALL sec_to_dhms(123456);

/*
123456
/60 = мин
/60 = час //3600
/24 = дни //86400
*/

#2. Создайте функцию, которая выводит только четные числа от 1 до 10. Пример: 2,4,6,8,10.

DROP FUNCTION IF EXISTS even_numbers;
DELIMITER //
CREATE FUNCTION even_numbers()
	RETURNS VARCHAR (20)
	DETERMINISTIC
		BEGIN
			DECLARE result VARCHAR(20) DEFAULT '2';
			DECLARE num INT DEFAULT 2;
			WHILE num < 10 DO
				SET num = num + 2;
				SET result = CONCAT(result, ', ', num);
			END WHILE;
		RETURN result;
		END //
DELIMITER ;

SELECT even_numbers();

