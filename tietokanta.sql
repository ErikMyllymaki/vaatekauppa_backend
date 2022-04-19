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

create table customer (
    id int primary key AUTO_INCREMENT,
    firstname VARCHAR(50) not null,
    lastname VARCHAR(50) not NULL,
    address VARCHAR(50) not null,
    zip VARCHAR(10) not NULL,
    city VARCHAR(30) not null
);

create table `order` (
    id int primary key AUTO_INCREMENT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    customer_id int not null,
    index customer_id(customer_id),
    foreign key (customer_id) references customer(id)
    on delete restrict
);

create table order_row(
    order_id int not null,
    index order_id(order_id),
    foreign key (order_id) references `order`(id)
    on delete RESTRICT,
    product_id int not null,
    index product_id(product_id),
    FOREIGN key (product_id) REFERENCES product(id)
    on delete restrict
);


insert into product (name, price, category_id, gender, image) values ('Sandaalit', 24.95, 3, 'N', 'kenkanaiset1.jpg');
insert into product (name, price, category_id, gender, image) values ('Tennarit', 109.95, 3, 'N', 'kenkanaiset2.jpg');

insert into product (name, price, category_id, gender, image) values ('Tennarit', 54.95, 3, 'M', 'kenkamiehet1.jpg');
insert into product (name, price, category_id, gender, image) values ('Nauhakengät', 39.95, 3, 'M', 'kenkamiehet2.jpg');

insert into product (name, price, category_id, gender, image) values ('Testikenkä 1', 10, 1, 'M', 'kuva.png');
insert into product (name, price, category_id, gender, image) values ('Testikenkä 2', 20, 1,'N', 'kuva.png');

insert into product (name, price, category_id, gender, image) values ('Testikenkä 1', 10, 4,'N', 'kuva.png');
insert into product (name, price, category_id, gender, image) values ('Testikenkä 2', 20, 4,'N', 'kuva.png');
