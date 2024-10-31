CREATE TABLE if NOT EXISTS users
(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(55),
    last_name VARCHAR(55),
    email VARCHAR(255) UNIQUE,
    password VARCHAR(128),
    date_create TIMESTAMP,
    date_change TIMESTAMP
    );

COMMENT ON TABLE users IS 'Пользователи интернет магазина';
COMMENT ON COLUMN users.id IS 'Идентификатор пользователя';
COMMENT ON COLUMN users.first_name IS 'Имя пользователя';
COMMENT ON COLUMN users.last_name IS 'Фамилия пользователя';
COMMENT ON COLUMN users.email IS 'Почта пользователя';
COMMENT ON COLUMN users.password IS 'Пароль пользователя';
COMMENT ON COLUMN users.date_create IS 'Дата создания пользователя';
COMMENT ON COLUMN users.date_change IS 'Дата изменения пользователя';


CREATE TABLE if NOT EXISTS categories
(
    id SERIAL PRIMARY KEY,
    title VARCHAR(128),
    description TEXT
    );

COMMENT ON TABLE categories IS 'Категории товаров интернет магазина';
COMMENT ON COLUMN categories.id IS 'Идентификатор категории';
COMMENT ON COLUMN categories.title IS 'Имя категории';
COMMENT ON COLUMN categories.description IS 'Описание категории';


CREATE TABLE if NOT EXISTS products
(
    id SERIAL PRIMARY KEY,
    title VARCHAR(128),
    description TEXT,
    price REAL,
    count INTEGER,
    category_id INTEGER REFERENCES categories(id)
    );

COMMENT ON TABLE products IS 'Товары интернет магазина';
COMMENT ON COLUMN products.title IS 'Имя товара';
COMMENT ON COLUMN products.description IS 'Описание товара';
COMMENT ON COLUMN products.price IS 'Цена товара';
COMMENT ON COLUMN products.count IS 'Количество товара в наличии';
COMMENT ON COLUMN products.category_id IS 'Внешний ключ к категориям (1:n)';


CREATE TYPE order_status AS ENUM('Ожидает', 'Выполнен', 'Отменен');

CREATE TABLE if NOT EXISTS orders
(
    id SERIAL PRIMARY KEY,
    id_user INTEGER REFERENCES users(id),
    date TIMESTAMP,
    status order_status
    );

COMMENT ON TABLE orders IS 'Заказы интернет магазина';
COMMENT ON COLUMN orders.id_user IS 'Внешний ключ к пользователям (1:n)';
COMMENT ON COLUMN orders.date IS 'Дата заказа';
COMMENT ON COLUMN orders.status IS 'Статус заказа';


CREATE TABLE if NOT EXISTS order_items
(
    id SERIAL PRIMARY KEY,
    order_id INTEGER REFERENCES orders(id),
    product_id INTEGER REFERENCES products(id),
    count INTEGER,
    price REAL
    );

COMMENT ON TABLE order_items IS 'Содержимое заказа интернет магазина';
COMMENT ON COLUMN order_items.order_id IS 'Внешний ключ к заказам (1:n)';
COMMENT ON COLUMN order_items.product_id IS 'Внешний ключ к товарам (1:n)';
COMMENT ON COLUMN order_items.count IS 'Количество товаров в заказе';
COMMENT ON COLUMN order_items.count IS 'Цена во время заказа';