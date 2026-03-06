create index vacancies_area_id_index on vacancies (area_id); --ускоряет третье задание, необходим для join'a на vacancies, group by и order by

create index vacancies_created_at_index on vacancies (created_at);--ускоряет group by по месяцам для нахождения лучшего месяца

create index resumes_created_at_index on resumes (created_at); --ускоряет group by по месяцам для нахождения лучшего месяца

create index response_vacancy_created_at on responses(created_at); --для ускорения определения даты в задании 6