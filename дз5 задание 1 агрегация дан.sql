select 
date_format((date_add(birthday_at, interval(timstampdiff(year, birthday_at, now())) year), '%W') as 'weekday',
count('total birthdays in weekday')
from shop.users group by weekday;
