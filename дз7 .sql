-- по первому заданию
select  name, id
from shop.users
where id in (select user_id from shop.orders);

-- по второму заданию
select 
	p.name,
	p.price,
	c.name
from shop.products as p
join shop.catalogs as c
where c.id = p.catalog_id;

-- с третьим незнаю с какой лучше стороны подойти, пробовала и внешние ключи и соединить через join пыталась...буду ждать разбора :)
/*alter table flights
add foreign key (from_flights_id)
references cities(id_lable)
on delete no action
on update no action;

alter table flights
add foreign key (to_flights_id)
references cities(id_lable)
on delete no action
on update no action;*/