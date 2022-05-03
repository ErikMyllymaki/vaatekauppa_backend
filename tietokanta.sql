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

create table sizes(
    id int primary key AUTO_INCREMENT,
    size char(5) not null
);

create table shoesizes (
    id int PRIMARY KEY auto_increment,
    size varchar(10)
);

insert into shoesizes (size) values ('38');
insert into shoesizes (size) values ('39');
insert into shoesizes (size) values ('40');
insert into shoesizes (size) values ('41');
insert into shoesizes (size) values ('42');

insert into sizes (size) values ('XS');
insert into sizes (size) values ('S');
insert into sizes (size) values ('M');
insert into sizes (size) values ('L');
insert into sizes (size) values ('XL');
insert into sizes (size) values ('XXL');

-- Kengät
insert into product (name, price, category_id, gender, image) values ('Tennarit', 39.95, 3, 'N', 'kenkanaiset_1.jpg');
insert into product (name, price, category_id, gender, image) values ('Tennarit', 69.95, 3, 'N', 'kenkanaiset_2.jpg');
insert into product (name, price, category_id, gender, image) values ('Korkokengät', 59.95, 3, 'N', 'kenkanaiset3.jpg');
insert into product (name, price, category_id, gender, image) values ('Tennarit', 84.95, 3, 'N', 'kenkanaiset4.jpg');
insert into product (name, price, category_id, gender, image) values ('Nilkkurit', 64.95, 3, 'N', 'kenkanaiset5.jpg');
insert into product (name, price, category_id, gender, image) values ('Talvinilkkurit', 69.95, 3, 'N', 'kenkanaiset6.jpg');
insert into product (name, price, category_id, gender, image) values ('Nauhalliset nilkkurit', 59.95, 3, 'N', 'kenkanaiset7.jpg');

insert into product (name, price, category_id, gender, image) values ('Tennarit', 39.95, 3, 'M', 'kenkamiehet_1.jpg');
insert into product (name, price, category_id, gender, image) values ('Tennarit', 89.95, 3, 'M', 'kenkamiehet_2.jpg');
insert into product (name, price, category_id, gender, image) values ('Tennarit', 94.95, 3, 'M', 'kenkamiehet3.jpg');
insert into product (name, price, category_id, gender, image) values ('Tennarit', 89.95, 3, 'M', 'kenkamiehet4.jpg');
insert into product (name, price, category_id, gender, image) values ('Nauhalliset nilkkurit', 74.95, 3, 'M', 'kenkamiehet5.jpg');
insert into product (name, price, category_id, gender, image) values ('Tennarit', 89.95, 3, 'M', 'kenkamiehet6.jpg');
insert into product (name, price, category_id, gender, image) values ('Tennarit', 59.95, 3, 'M', 'kenkamiehet7.jpg');
insert into product (name, price, category_id, gender, image) values ('Tennarit', 64.95, 3, 'M', 'kenkamiehet8.jpg');
insert into product (name, price, category_id, gender, image) values ('Talvinilkkurit', 87.95, 3, 'M', 'kenkamiehet9.jpg');

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
insert into product (name, price, category_id, gender, image) values ('Bleiseri', 39.95, 1, 'N', 'ylaosanaiset1.jpg');
insert into product (name, price, category_id, gender, image) values ('Untuvatakki', 79.95, 1, 'N', 'ylaosanaiset2.jpg');
insert into product (name, price, category_id, gender, image) values ('Pitkähihainen paita', 24.95, 1, 'N', 'ylaosanaiset3.jpg');
insert into product (name, price, category_id, gender, image) values ('Napapaita', 21.95, 1, 'N', 'ylaosanaiset4.jpg');
insert into product (name, price, category_id, gender, image) values ('Takki', 42.95, 1, 'N', 'ylaosanaiset5.jpg');
insert into product (name, price, category_id, gender, image) values ('T-paita', 24.95, 1, 'N', 'ylaosanaiset6.jpg');
insert into product (name, price, category_id, gender, image) values ('Bleiseri', 37.95, 1, 'N', 'ylaosanaiset7.jpg');
insert into product (name, price, category_id, gender, image) values ('Pitkähihainen paita', 24.95, 1, 'M', 'ylaosamiehet1.jpg');
insert into product (name, price, category_id, gender, image) values ('T-paita', 19.95, 1, 'M', 'ylaosamiehet2.jpg');
insert into product (name, price, category_id, gender, image) values ('Nahkatakki', 69.95, 1, 'M', 'ylaosamiehet3.jpg');
insert into product (name, price, category_id, gender, image) values ('T-paita', 21.95, 1, 'M', 'ylaosamiehet4.jpg');
insert into product (name, price, category_id, gender, image) values ('Collegepaita', 34.95, 1, 'M', 'ylaosamiehet5.jpg');
insert into product (name, price, category_id, gender, image) values ('Hihaton paita', 22.95, 1, 'M', 'ylaosamiehet6.jpg');

-- Alaosat
insert into product (name, price, category_id, gender, image) values ('Revityt farkut', 59.95, 2, 'N', 'alaosatnaiset1.jpg');
insert into product (name, price, category_id, gender, image) values ('Suorat housut', 49.95, 2, 'N', 'alaosatnaiset2.jpg');
insert into product (name, price, category_id, gender, image) values ('Hame', 29.95, 2, 'N', 'alaosatnaiset3.jpg');
insert into product (name, price, category_id, gender, image) values ('Suorat housut', 39.95, 2, 'N', 'alaosatnaiset4.jpg');
insert into product (name, price, category_id, gender, image) values ('Collegehousut', 39.95, 2, 'N', 'alaosatnaiset5.jpg');
insert into product (name, price, category_id, gender, image) values ('Leveälahkeiset farkut', 54.95, 2, 'N', 'alaosatnaiset6.jpg');
insert into product (name, price, category_id, gender, image) values ('Kuviolliset kangashousut', 34.95, 2, 'M', 'alaosatmiehet1.jpg');
insert into product (name, price, category_id, gender, image) values ('Farkut', 59.95, 2, 'M', 'alaosatmiehet2.jpg');
insert into product (name, price, category_id, gender, image) values ('Kuviolliset kangashousut', 44.95, 2, 'M', 'alaosatmiehet3.jpg');

