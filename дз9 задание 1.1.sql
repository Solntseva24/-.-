/*
В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных.
 Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции. */


start transaction;
insert into
	sample.users (name, birthday_at, created_at, updated_at)
select users.name, users.birthday_at, users.created_at, users.updated_at
from shop.users
where id = 1;

delete from shop.users where id = 1;

commit;