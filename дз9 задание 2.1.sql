-- пользователь со всеми правами
mysql -u root -p
CREATE USER 'shop'@'localhost' IDENTIFIED BY 'qwerty';
GRANT all ON *.* TO 'shop'@'localhost';

-- пользователь с правами для чтения
CREATE USER 'shop-read'@'localhost' IDENTIFIED BY 'qwerty';
grant select ON *.* TO 'shop-read'@'localhost';