create table if not exists users
(
    id serial primary key,
    first_name varchar(55),
    last_name varchar(55),
    email varchar(255) unique,
    password varchar(128),
    date_create timestamp,
    date_change timestamp
);

comment on table users is 'Пользователи интернет магазина';
comment on column users.id is 'Идентификатор пользователя';
comment on column users.first_name is 'Имя пользователя';
comment on column users.last_name is 'Фамилия пользователя';
comment on column users.email is 'Почта пользователя';
comment on column users.password is 'Пароль пользователя';
comment on column users.date_create is 'Дата создания пользователя';
comment on column users.date_change is 'Дата изменения пользователя';


create table if not exists categories
(
    id serial primary key,
    title varchar(128),
    description text
);

comment on table categories is 'Категории товаров интернет магазина';
comment on column categories.id is 'Идентификатор категории';
comment on column categories.title is 'Имя категории';
comment on column categories.description is 'Описание категории';


create table if not exists products
(
    id serial primary key,
    title varchar(128),
    description text,
    price real,
    count integer,
    category_id integer references categories(id)
);

comment on table products is 'Товары интернет магазина';
comment on column categories.title is 'Имя товара';
comment on column categories.description is 'Описание товара';
comment on column categories.price is 'Цена товара';
comment on column categories.count is 'Количество товара в наличии';
comment on column categories.category_id is 'Внешний ключ к категориям (1:n)';


create type order_status as enum('Ожидает', 'Выполнен', 'Отменен');

create table if not exists orders
(
    id serial primary key,
    id_user integer references users(id),
    date timestamp,
    status order_status
);

comment on table orders is 'Заказы интернет магазина';
comment on column categoordersies.id_user is 'Внешний ключ к пользователям (1:n)';
comment on column categoordersies.date is 'Дата заказа';
comment on column categoordersies.status is 'Статус заказа';


create table if not exists order_items
(
    id serial primary key,
    order_id integer references orders(id),
    product_id integer references products(id),
    count integer,
    price real
);

comment on table order_items is 'Содержимое заказа интернет магазина';
comment on column order_items.order_id is 'Внешний ключ к заказам (1:n)';
comment on column order_items.product_id is 'Внешний ключ к товарам (1:n)';
comment on column order_items.count is 'Количество товаров в заказе';
comment on column order_items.count is 'Цена во время заказа';