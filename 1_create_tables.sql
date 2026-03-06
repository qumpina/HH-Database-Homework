create database homework_hh_database;


create table employers
(
    employer_id   serial primary key,
    employer_name varchar(200) not null
);

create table areas
(
    area_id   serial primary key,
    area_name varchar(150) not null
);

create table specializations
(
    specialization_id   serial primary key,
    specialization_name varchar(150) not null
);

create table employees
(
    employee_id   serial primary key,
    employee_name varchar(150) not null
);

create table vacancies
(
    vacancy_id        serial primary key,
    title             varchar(150) not null,
    description       text,
    employer_id       int          not null references employers (employer_id),
    specialization_id integer      not null references specializations (specialization_id),
    area_id           integer references areas (area_id),
    compensation_from integer,
    compensation_to   integer,
    created_at        timestamp default current_timestamp
);

create table resumes
(
    resume_id         serial primary key,
    employee_id       integer not null references employees (employee_id),
    area_id           integer references areas (area_id),
    specialization_id integer not null references specializations (specialization_id),
    compensation_from integer,
    compensation_to   integer,
    phone             varchar(20),
    skills            text,
    education         varchar(100),
    about             text,
    certificates      text,
    created_at        timestamp default current_timestamp
);

create table responses
(
    response_id  serial primary key,
    vacancy_id   integer not null references vacancies (vacancy_id),
    resume_id    integer not null references resumes (resume_id),
    cover_letter text,
    created_at   timestamp default current_timestamp,
    unique (vacancy_id, resume_id)
);