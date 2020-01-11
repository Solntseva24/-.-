select birthday,
if(
	timestampdiff(year, birthday, created_at) >=18,
	'совершеннолетний',
	'несовершеннолетний'
) as status
from vk2.profiles
;