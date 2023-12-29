--GL Period Checking 
select a.set_of_books_id, a.period_name, a.show_status, a.start_date, a.end_date, a.last_update_date, b.description updated_by 
from APPS. GL_PERIOD_STATUSES_V a, APPS. fnd_user b
where a.period_name = 'MAR-2023' --> change date 
and a.set_of_books_id in ('2021','2041')
and a.last_updated_by = b.user_id
and a.application_id = '101'