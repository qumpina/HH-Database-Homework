select area_id,
       area_name,
       round(avg(compensation_from), 2)                                       as avg_compensation_from,
       round(avg(compensation_to), 2)                                         as avg_compensation_to,
       round((avg(coalesce(compensation_from, compensation_to, 0)) +
              avg(coalesce(compensation_to, compensation_from, 0))) / 2.0, 2) as avg_compensation_mid
from vacancies
         join areas using (area_id)
group by area_id, area_name
order by area_name;
