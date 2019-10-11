create database se_lab;
use se_lab;

create table Members
(
    m_id integer  Auto_Increment primary key,
    name VARCHAR(20) NOT NULL,
    email VARCHAR(45),
    degree VARCHAR(10),
    site VARCHAR(50),
    interest VARCHAR(100),
    etc VARCHAR(100)
);


create table Notice
(
    title VARCHAR(100) NOT NULL,
    name VARCHAR(20) NOT NULL,
    uploadtime DATETIME default CURRENT_TIMESTAMP,
    contents VARCHAR(500)
);

create table Research
(
    subject VARCHAR(30),
    subtitle VARCHAR(500),
    img BLOB
);

create table Courses
(
    classcode VARCHAR(10),
    subject VARCHAR(30),
    course VARCHAR(300)
);

create table Publications
(
    category VARCHAR(100),
    summary VARCHAR(600),
    files BLOB
);


create table Gallery
(
    category VARCHAR(20),
    title VARCHAR(50),
    uploadtime DATETIME default CURRENT_TIMESTAMP
);

create table nav
  (
    id int,
    menu VARCHAr(20)
  );
