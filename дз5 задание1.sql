select
STR_to_date('2020-01-13 22:19:18', '%c %b %Y %k %i');
from shop.users;

/*insert into test_tbl (d_vfr,d_ifr)
                  select convert(datetime,d_vfr,111), convert(datetime,d_ifr,111)
                                from uchet_data*/