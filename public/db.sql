create database se_lab;
use se_lab;

create table Members
(
    name VARCHAR(20) NOT NULL,
    email VARCHAR(45),
    degree VARCHAR(10),
    site VARCHAR(50),
    interest VARCHAR(100),
    etc VARCHAR(100)
)
;

create table Notice
(
    title VARCHAR(100) NOT NULL,
    name VARCHAR(20) NOT NULL,
    contents VARCHAR(500)
);

create table Research
(
    subject VARCHAR(30),
    subtitle VARCHAR(30),
    img BLOB
);

create table Courses
(
    classcode VARCHAR(10),
    subject VARCHAR(30),
    course VARCHAR(20)
);

create table Publications
(
    category VARCHAR(20),
    summary VARCHAR(100),
    files BLOB
);

create table Gallery
(
    category VARCHAR(20),
    title VARCHAR(50),
    uploadtime DATETIME default CURRENT_TIMESTAMP
);
