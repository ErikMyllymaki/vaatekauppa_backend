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

-- Kengät
insert into product (name, price, category_id, gender, image) values ('Sandaalit', 24.95, 3, 'N', 'kenkanaiset1.jpg');
insert into product (name, price, category_id, gender, image) values ('Tennarit', 109.95, 3, 'N', 'kenkanaiset2.jpg');

insert into product (name, price, category_id, gender, image) values ('Tennarit', 54.95, 3, 'M', 'kenkamiehet1.jpg');
insert into product (name, price, category_id, gender, image) values ('Nauhakengät', 39.95, 3, 'M', 'kenkamiehet2.jpg');

-- Asusteet
insert into product (name, price, category_id, gender, image) values ('Lierihattu', 19.95, 4, 'N', 'asustenaiset1.jpg');
insert into product (name, price, category_id, gender, image) values ('Aurinkolasit', 14.95, 4, 'N', 'asustenaiset2.jpg');
insert into product (name, price, category_id, gender, image) values ('Kaulakorusetti', 19.95, 4, 'N', 'asustenaiset3.jpg');
insert into product (name, price, category_id, gender, image) values ('Korvakorut', 16.95, 4, 'N', 'asustenaiset4.jpg');
insert into product (name, price, category_id, gender, image) values ('Käsikoru', 14.95, 4, 'N', 'asustenaiset5.jpg');
insert into product (name, price, category_id, gender, image) values ('Käsilaukku', 49.95, 4, 'N', 'asustenaiset6.jpg');
insert into product (name, price, category_id, gender, image) values ('Lippalakki', 19.95, 4, 'M', 'asustemiehet1.jpg');
insert into product (name, price, category_id, gender, image) values ('Aurinkolasit', 17.95, 4, 'M', 'asustemiehet2.jpg');
insert into product (name, price, category_id, gender, image) values ('Käsikoru', 15.95, 4, 'M', 'asustemiehet3.jpg');
insert into product (name, price, category_id, gender, image) values ('Pipo', 18.95, 4, 'M', 'asustemiehet4.jpg');
insert into product (name, price, category_id, gender, image) values ('Kaulakoru', 14.95, 4, 'M', 'asustemiehet5.jpg');

-- Yläosat
insert into product (name, price, category_id, gender, image) values ('Napapaita', 21.95, 1, 'N', 'ylaosanaiset1.jpg');
insert into product (name, price, category_id, gender, image) values ('Untuvatakki', 79.95, 1, 'N', 'ylaosanaiset2.jpg');
insert into product (name, price, category_id, gender, image) values ('Pitkähihainen paita', 24.95, 1, 'N', 'ylaosanaiset3.jpg');
insert into product (name, price, category_id, gender, image) values ('Bleiseri', 39.95, 1, 'N', 'ylaosanaiset4.jpg');
insert into product (name, price, category_id, gender, image) values ('T-paita', 24.95, 1, 'N', 'ylaosanaiset5.jpg');
insert into product (name, price, category_id, gender, image) values ('Takki', 42.95, 1, 'N', 'ylaosanaiset6.jpg');
insert into product (name, price, category_id, gender, image) values ('Bleiseri', 37.95, 1, 'N', 'ylaosanaiset7.jpg');
insert into product (name, price, category_id, gender, image) values ('Pitkähihainen paita', 24.95, 1, 'M', 'ylaosamiehet1.jpg');
insert into product (name, price, category_id, gender, image) values ('T-paita', 19.95, 1, 'M', 'ylaosamiehet2.jpg');
insert into product (name, price, category_id, gender, image) values ('Nahkatakki', 69.95, 1, 'M', 'ylaosamiehet3.jpg');
insert into product (name, price, category_id, gender, image) values ('T-paita', 21.95, 1, 'M', 'ylaosamiehet4.jpg');
insert into product (name, price, category_id, gender, image) values ('Collegepaita', 34.95, 1, 'M', 'ylaosamiehet5.jpg');
insert into product (name, price, category_id, gender, image) values ('Hihaton paita', 22.95, 1, 'M', 'ylaosamiehet6.jpg');


