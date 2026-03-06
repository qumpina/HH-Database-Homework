select count(vacancy_id) as vacancies_amount, extract(MONTH from created_at) as month_number
from vacancies
group by 2
having count(vacancy_id) >= ALL (select count(vacancy_id) from vacancies group by extract(MONTH from created_at))
order by 1 desc; -- выбираем месяцы, в которых было больше всего вакансий за все годы

select count(resume_id) as vacancies_amount, extract(MONTH from created_at) as month_number
from resumes
group by 2
having count(resume_id) >= ALL (select count(resume_id) from resumes group by extract(MONTH from created_at))
order by 1 desc; -- выбираем месяцы, в которых было больше всего резюме за все годы

