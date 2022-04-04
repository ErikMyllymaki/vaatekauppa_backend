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

insert into product (name, price, category_id, gender) values ('Testikenkä 1', 10, 3, 'M');
insert into product (name, price, category_id, gender) values ('Testikenkä 2', 20, 3, 'N');

insert into product (name, price, category_id) values ('Testikenkä 3', 20, 3,);

