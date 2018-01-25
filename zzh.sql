CREATE DATABASE onchic CHARSET=UTF8;
USE onchic;
CREATE TABLE oc_index_pic(
	piid INT PRIMARY KEY AUTO_INCREMENT,
	img VARCHAR(128),
	title VARCHAR(64),
	href VARCHAR(128),
	family INT
);
CREATE TABLE oc_index_font(
	fiid INT PRIMARY KEY AUTO_INCREMENT,
	font VARCHAR(64),
	family INT
);
CREATE TABLE oc_laptop_family(
	flid INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(32)
);
CREATE TABLE oc_laptop(
	lid INT PRIMARY KEY,
	family_id INT,
	title VARCHAR(128),
	price DECIMAL(10,2),
	sale DECIMAL(10,2),
	promise VARCHAR(64),
	name VARCHAR(64),
	date_oc VARCHAR(64),
	material VARCHAR(32),
	style VARCHAR(12),
	condition_oc VARCHAR(12),
	num VARCHAR(12),
	only VARCHAR(1),
	sale_type VARCHAR(32),
	fit VARCHAR(1),
	has VARCHAR(1),
	money VARCHAR(32),
	texture VARCHAR(12),
	color VARCHAR(12),
	pattern VARCHAR(32),
	inlay VARCHAR(32),
	spec_name VARCHAR(64),
	FOREIGN KEY(family_id) REFERENCES oc_laptop_family(flid)
);
CREATE TABLE oc_laptop_pic(
	plid INT PRIMARY KEY AUTO_INCREMENT,
	sm VARCHAR(128),
	md VARCHAR(128),
	laptop_id INT,
	FOREIGN KEY(laptop_id) REFERENCES oc_laptop(lid)
);
CREATE TABLE oc_user(
	uid INT PRIMARY KEY AUTO_INCREMENT,
	uname VARCHAR(32),
	upwd VARCHAR(32),
	email VARCHAR(64),
	phone VARCHAR(16),
	user_name VARCHAR(32),
	gender VARCHAR(1)
);
CREATE TABLE oc_shopping_cart(
	cid INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT,
	product_id INT,
	count INT,
	FOREIGN KEY(product_id) REFERENCES oc_laptop(lid),
	FOREIGN KEY(user_id) REFERENCES oc_user(uid)
);
CREATE TABLE oc_receiver_address(
	aid INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT,
	receiver VARCHAR(16),
	province VARCHAR(16),
	city VARCHAR(16),
	county VARCHAR(16),
	address VARCHAR(128),
	cellphone VARCHAR(16),
	postcode char(6),
	FOREIGN KEY(user_id) REFERENCES oc_user(uid)
);
CREATE TABLE oc_order(
	aid INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT,
	address_id INT,
	order_time BIGINT,
	pay_time BIGINT,
	deliver_time BIGINT,
	received_time BIGINT,
	FOREIGN KEY(user_id) REFERENCES oc_user(uid),
	FOREIGN KEY(address_id) REFERENCES oc_receiver_address(aid)
);
CREATE TABLE oc_order_detail(
	did INT PRIMARY KEY AUTO_INCREMENT,
	order_id INT,
	product_id INT,
	count INT,
	FOREIGN KEY(order_id) REFERENCES oc_order(aid),
	FOREIGN KEY(product_id) REFERENCES oc_laptop(lid)
);