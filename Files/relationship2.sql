USE store;
CREATE TABLE products (
	product_id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50) NOT NULL,
    product_price DECIMAL(6, 2) NOT NULL,
    product_quentity SMALLINT(3) NOT NULL,
    product_created DATE NOT NULL
);

SHOW TABLES;

CREATE TABLE products_orders (
	order_id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    customer_id INT UNSIGNED NOT NULL,
    order_timestamp DATETIME NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES users (user_id)
);

DESCRIBE products_orders;

CREATE TABLE products_orders_list (
	item_id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    order_id INT UNSIGNED NOT NULL,
    product_id INT UNSIGNED NOT NULL,
    quantity TINYINT(2) NOT NULL
);

ALTER TABLE products_orders_list 
ADD CONSTRAINT fk_order_id 
FOREIGN KEY (order_id)
REFERENCES products_orders (order_id);

ALTER TABLE products_orders_list
ADD CONSTRAINT fk_product_id
FOREIGN KEY (product_id)
REFERENCES products (product_id);

CREATE TABLE customers_products (
	customer_id INT UNSIGNED NOT NULL,
    product_id INT UNSIGNED NOT NULL,
	CONSTRAINT fk_customer_id2
		FOREIGN KEY (customer_id) 
        REFERENCES users (user_id),
	CONSTRAINT fk_product_id2 
		FOREIGN KEY (product_id)
        REFERENCES products (product_id)
);

DESCRIBE customers_products;

