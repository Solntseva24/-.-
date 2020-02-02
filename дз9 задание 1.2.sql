-- когда Вы объясняете, все так просто кажется, но тут опять у меня что-то пошло не так, говорит, что name не однозначно
create view homework as select name from shop.products
-- union
-- select name from shop.catalogs
join from shop.catalogs on catalogs.name = products.name
where products.id = catalogs.id;


select * from homework;