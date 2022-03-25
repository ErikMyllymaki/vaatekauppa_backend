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


create table tuote (
    id int primary key auto_increment,
    nimi varchar(100) not null,
    hinta double (10,2) not null,
    kuva varchar(50),
    kategoria_id int not null,
    index kategoria_id(kategoria_id),
    foreign key (kategoria_id) references kategoria(id)
    on delete restrict
);

insert into tuote (nimi, hinta, kategoria_id) values ('Testikenkä 1', 10, 1);
insert into tuote (nimi, hinta, kategoria_id) values ('Testikenkä 2', 20, 1);
