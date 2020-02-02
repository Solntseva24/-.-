-- такой вариант c between мне нравился больше , но он не работает...просидела,
-- но не выяснила почему)))


/*delimiter //
drop function if exists hello //
create function hello (now())
returns varchar(15) deterministic
begin
	declare word varchar(15)
	if (now() between time_from = 6:00:00 and time_to = 11:59:59)
		then set word = 'доброе утро';
	elseif (now() between time_from = 12:00:00 and time_to = 17:59:59)
		then set word = 'добрый день';
	elseif (now() between time_from = 18:00:00 and time_to = 23:59:59)
		then set word = 'добрый вечер';
	else set word = 'доброй ночи!';
	end if;
	return word;
end //

select hello(now());*/

-- 
delimiter //
drop function if exists hello //
create function hello (time_ time)
returns varchar(15) deterministic
begin
	declare word varchar(15);
	if (time_ >= '6:00:00' and time_ < '12:00:00')
		then set word = 'доброе утро';
	elseif (time_ >= '12:00:00' and time_ < '18:00:00')
		then set word = 'добрый день';
	elseif (time_ >= '18:00:00' and time_ <='23:59:59')
		then set word = 'добрый вечер';
	else set word = 'доброй ночи!';
	end if;
	return word;
end //

delimiter ;
select hello('12:00:00');
