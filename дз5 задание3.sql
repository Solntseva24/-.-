select value_total
from shop.storehouses_products ORDER BY IF(value_total > 0,1,0) DESC, value_total ASC;
