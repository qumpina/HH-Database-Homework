select area_id,
       area_name,
       round(avg(compensation_from), 2) as avg_compensation_from,
       round(avg(compensation_to), 2)   as avg_compensation_to,
       round((avg(compensation_from) + avg(compensation_to)) / 2, 2)
from vacancies
         join areas using (area_id)
where compensation_to is not null
  and compensation_to is not null
group by area_id, area_name
order by area_name;