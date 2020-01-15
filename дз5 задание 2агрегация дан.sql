    

/*select
date_add(birthday_at, interval(timstampdiff(year, birthday_at, now())) year)
from shop.users;*/


/*select 
date_format((date_add(birthday_at, interval(timstampdiff(year, birthday_at, now())) year), '%W') as weekday,
count('total birthdays in weekday')
from shop.users group by weekday;*/


-- SELECT dayname(concat((DATE_FORMAT(birthday_at,'%m%d), '2020' ) as week
-- from shop.users;
     
/*select 
dayname(date_add(birthday_at, interval(timstampdiff(year, birthday_at, now())), year)) as weekday
from shop.users;*/

select
date_format((date_add(birthday_at, interval(timstampdiff(year, birthday_at, now())) year), '%W') as weekday
from shop.users;

/*тут помучилась, и видимо без результата, если верить интернету - это лучший способ, но видимо я в синтаксисе ошиблась, раз 100 проверила, может укажете на мою ошибку?))