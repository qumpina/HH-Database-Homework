insert into areas (area_name) values
('Москва'),
('Санкт-Петербург'),
('Новосибирск'),
('Екатеринбург'),
('Казань'),
('Нижний Новгород'),
('Челябинск'),
('Самара'),
('Омск'),
('Ростов-на-Дону'),
('Уфа'),
('Красноярск'),
('Пермь'),
('Воронеж'),
('Волгоград'),
('Краснодар'),
('Тюмень'),
('Томск'),
('Барнаул'),
('Иркутск'),
('Хабаровск'),
('Владивосток'),
('Сочи'),
('Калининград'),
('Ярославль'),
('Тула'),
('Рязань'),
('Саратов'),
('Ижевск'),
('Кемерово'),
('Берлин'),
('Мюнхен'),
('Франкфурт'),
('Гамбург'),
('Прага'),
('Вена'),
('Париж'),
('Лондон'),
('Амстердам'),
('Барселона');

insert into specializations (specialization_name) values
('Backend разработчик'),
('Frontend разработчик'),
('Fullstack разработчик'),
('Data Scientist'),
('Data Analyst'),
('DevOps инженер'),
('QA инженер'),
('Мобильный разработчик'),
('Системный администратор'),
('Product Manager'),
('Project Manager'),
('UX/UI дизайнер'),
('Маркетолог'),
('Интернет-маркетолог'),
('SEO специалист'),
('HR специалист'),
('Финансовый аналитик'),
('Бухгалтер'),
('Юрист'),
('Менеджер по продажам');

insert into employers (employer_name)
select 'Company_' || gs
from generate_series(1,5000) as gs;

insert into employees (employee_name)
select 'Employee_' || gs
from generate_series(1,200000) as gs;

insert into vacancies (
    title,
    description,
    employer_id,
    specialization_id,
    area_id,
    compensation_from,
    compensation_to,
    created_at
)
select
    'Vacancy ' || gs,
    'Job description ' || gs,
    (random()*4999 + 1)::int,
    (random()*19 + 1)::int,
    (random()*39 + 1)::int,

    case
        when random() < 0.25 then null
        else round(random()*120000 + 30000)
    end,

    case
        when random() < 0.25 then null
        else round(random()*200000 + 60000)
    end,

    timestamp '2010-01-01'
        + random() * (timestamp '2026-01-01' - timestamp '2010-01-01')

from generate_series(1,100000) gs;



insert into resumes (
    employee_id,
    area_id,
    specialization_id,
    compensation_from,
    compensation_to,
    phone,
    skills,
    education,
    about,
    created_at
)
select
    gs,
    (random()*39 + 1)::int,
    (random()*19 + 1)::int,

    case
        when random() < 0.3 then null
        else round(random()*100000 + 20000)
    end,

    case
        when random() < 0.3 then null
        else round(random()*160000 + 40000)
    end,

    '+79' || (100000000 + random()*899999999)::bigint,
    'SQL, Python, Git',
    'Высшее образование',
    'Опытный специалист',

    timestamp '2010-01-01'
        + random() * (timestamp '2026-01-01' - timestamp '2010-01-01')

from generate_series(1,200000) gs;


insert into responses (
    vacancy_id,
    resume_id,
    cover_letter,
    created_at
)
select
    v.vacancy_id,
    (random()*199999 + 1)::int,
    'Interested in this position',

    v.created_at + random() * interval '30 days'

from vacancies v
limit 500000
on conflict do nothing;