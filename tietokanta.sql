drop database if exists webshop;

create database webshop;
use webshop;

create table category (
    id int primary key auto_increment,
    name varchar(50) not null
);

insert into category (name) values ('Yläosat');
insert into category (name) values ('Alaosat');
insert into category (name) values ('Kengät');
insert into category (name) values ('Asusteet');



drop table if exists product;

create table product (
    id int primary key auto_increment,
    name varchar(100) not null,
    price double (10,2) not null,
    gender CHAR(1),
    image varchar(50),
    category_id int not null,
    index category_id(category_id),
    foreign key (category_id) references category(id)
    on delete restrict
);

create table message (
    id int primary key AUTO_INCREMENT,
    name varchar(100) not null,
    email varchar(100) not null,
    message varchar(500) not null
);


insert into product (name, price, category_id, gender, image) values ('Testituote 1', 10, 3, 'M', 'kuva.png');
insert into product (name, price, category_id, gender, image) values ('Testituote 2', 20, 3, 'N', 'kuva.png');

insert into product (name, price, category_id, gender, image) values ('Testikenkä 1', 10, 2, 'M', 'kuva.png');
insert into product (name, price, category_id, gender, image) values ('Testikenkä 2', 20, 2, 'M', 'kuva.png');

insert into product (name, price, category_id, gender, image) values ('Testikenkä 1', 10, 1, 'M', 'kuva.png');
insert into product (name, price, category_id, gender, image) values ('Testikenkä 2', 20, 1,'N', 'kuva.png');

insert into product (name, price, category_id, gender, image) values ('Testikenkä 1', 10, 4,'N', 'kuva.png');
insert into product (name, price, category_id, gender, image) values ('Testikenkä 2', 20, 4,'N', 'kuva.png');
