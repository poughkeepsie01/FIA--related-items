select * --name, description, term_id
from ra_terms
where end_date_active is null
order by name