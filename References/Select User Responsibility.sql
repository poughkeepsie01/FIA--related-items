--all users
select fu.user_name,
       per.full_name,
       per.attribute27,
       fu.start_date user_creation_date,
       fu.end_date user_end_date,
       frt.responsibility_name,
       furg.start_date responsibility_start_date ,furg.end_date responsibility_end_date  
from   fnd_user                         fu
      ,fnd_user_resp_groups_direct      furg
      ,fnd_responsibility               fr
      ,fnd_responsibility_tl            frt
      ,per_all_people_f                 per
where  fu.user_id = furg.user_id
and    furg.responsibility_id = fr.responsibility_id
and    fr.responsibility_id = frt.responsibility_id
and    per.person_id = fu.employee_id
and    sysdate between per.effective_start_date and per.effective_end_date
AND    fu.end_date is null
and    furg.end_date is null        
and    frt.responsibility_name = 'TIP Auto DN/CN System' 
order by  fu.user_name asc;
