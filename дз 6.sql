
-- мои корявые попытки
-- вебинар проработала за Вами

-- в моем понимании логично, но в mysql логика по-видимому другая
select *
(select max(to_user_id) from messages where from_user_id = 1) as max_messages
from vk.users
where id = 1;

-- по отдельности работают, (вложение и основной код), вместе чего-то нехватает...
select
count(user_id)
(select user_id from vk.profiles
where (birthday + INTERVAL 10 YEAR) < now() as total_likes
from vk.likes
;
