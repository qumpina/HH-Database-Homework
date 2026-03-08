select vacancy_id, title, count(responses.response_id)
from vacancies
         join responses using (vacancy_id)
where responses.created_at between vacancies.created_at and (vacancies.created_at + interval '7 days')
group by 1,2
having count(responses.response_id)>5
order by 1;
