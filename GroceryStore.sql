CREATE DATABASE grocery_store;

CREATE TABLE customer
  (customer_id serial PRIMARY KEY,
    name varchar (30) NOT NULL,
    balance numeric (5,2)
    );

CREATE TABLE address
  (address_id serial PRIMARY KEY,
    street_number varchar (8) NOT NULL,
    street_name varchar (30) NOT NULL,
    unit_number varchar (8),
    city varchar (30) NOT NULL,
    state char (2) NOT NULL,
    zip char (10) NOT NULL
    );

CREATE TABLE customer_address
  (customer_id int,
    address_id int,
    type varchar (7), check (type in ('Delivery', 'Payment')), 
    PRIMARY KEY (customer_id, address_id),
    UNIQUE (address_id),
    FOREIGN KEY (customer_id) references customer,
    FOREIGN KEY (address_id) references address
    );

CREATE TABLE credit_card
  (card_number numeric (16,0) PRIMARY KEY,
    customer_id int,
    address_id, int,
    FOREIGN KEY customer_id references customer,
    FOREIGN KEY address_id references address
    );

CREATE TABLE product
  (product_id serial PRIMARY KEY,
    name varchar (20) NOT NULL,
    type varchar (10), check (type in ('Food', 'Alcohol', 'Misc')),
    size numeric (5,0),
    image blob(10MB),
    description varchar (100) 
    );

CREATE TABLE price
  (product_id int,
    state char (2),
    amount numeric (6,2),
    PRIMARY KEY (product_id, state),
    FOREIGN KEY (product_id) references product
    );

CREATE TABLE staff_member
  (staff_id serial PRIMARY KEY,
    name varchar (30) NOT NULL,
    address_id int,
    salary numeric (8,2), check (salary > 20000),
    job_title varchar (10) NOT NULL,
    FOREIGN KEY address_id references address
    );

CREATE TABLE warehouse
  (warehouse_id serial PRIMARY KEY,
    address_id int,
    size numeric (5,0) NOT NULL,
    FOREIGN KEY address_id references address
    );

CREATE TABLE stock
  (warehouse_id int,
    product_id int,
    num int,
    PRIMARY KEY (warehouse_id, product_id),
    FOREIGN KEY warehouse_id references warehouse,
    FOREIGN KEY product_id references product
    );

CREATE TABLE supplier
  (supplier_id serial PRIMARY KEY,
    name varchar (30) NOT NULL,
    address_id int,
    FOREIGN KEY address_id references address
    );

CREATE TABLE supplier_product
  (supplier_id int,
    product_id int,
    price numeric (5,2),
    PRIMARY KEY (supplier_id, product_id),
    FOREIGN KEY supplier_id references supplier,
    FOREIGN KEY product_id references product
    );

CREATE TABLE order
  (order_id serial PRIMARY KEY,
    customer_id int,
    order_date date NOT NULL,
    status varchar (5), check (status in ('Issued', 'Sent', 'Received')),
    card_number numeric (16,0),
    price numeric (8,2),
    FOREIGN KEY customer_id references customer,
    FOREIGN KEY card_number references credit_card
    );

CREATE TABLE order_product
  (order_id int,
    product_id int,
    num int,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY order_id references order,
    FOREIGN KEY product_id references product
    );



