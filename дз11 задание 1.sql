/*Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, catalogs и products в таблицу logs помещается
 время и дата создания записи, название таблицы, идентификатор первичного ключа и содержимое поля name.
*/

DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
id serial,
name_table VARCHAR(255) not null,
field_id_table int(10) not null,
field_name_table VARCHAR(255) not null,
created_at DATETIME DEFAULT CURRENT_TIMESTAMP not null
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COMMENT='Таблица логов';

DELIMITER //
DROP TRIGGER IF EXISTS add_logs_users//
CREATE TRIGGER add_logs_users AFTER INSERT ON users
FOR EACH ROW
BEGIN  
	INSERT INTO logs (`name_table`, `field_id_table`, `field_name_table`) VALUES('users', NEW.`id`, NEW.`name`);
END//

DROP TRIGGER IF EXISTS add_logs_catalogs//
CREATE TRIGGER add_logs_catalogs AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN 
	INSERT INTO logs (`name_table`, `field_id_table`, `field_name_table`) VALUES('catalogs', NEW.`id`, NEW.`name`);
END//

DROP TRIGGER IF EXISTS add_logs_products//
CREATE TRIGGER add_logs_products AFTER INSERT ON products
FOR EACH ROW
BEGIN  
	INSERT INTO logs (`name_table`, `field_id_table`, `field_name_table`) VALUES('products', NEW.`id`, NEW.`name`);
END//
DELIMITER ;