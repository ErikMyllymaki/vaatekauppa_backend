drop database if exists verkkokauppa;

create database verkkokauppa;
use verkkokauppa;

create table kategoria (
    id int primary key auto_increment,
    nimi varchar(50) not null
);

insert into kategoria (nimi) values ('Yläosat');
insert into kategoria (nimi) values ('Alaosat');
insert into kategoria (nimi) values ('Kengät');
insert into kategoria (nimi) values ('Asusteet');