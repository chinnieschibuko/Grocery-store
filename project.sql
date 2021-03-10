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
    zip char (9) NOT NULL
    );

CREATE TABLE customer_address
  (customer_id int,
    address_id int,
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
    type varchar (10), check (type in ('Food', 'Alcohol', 'Misc')),
    size numeric (5,0),
    image blob(10MB) 
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
Insert into customer(customer_name, balance ) values ('Harry', 345.21);
Insert into customer(customer_name, balance ) values ('Jordan', 864.24);
Insert into customer(customer_name, balance ) values ('Lebron', 489.87);
Insert into customer(customer_name, balance ) values ('Kawhi', 754.43);
Insert into customer(customer_name, balance ) values ('Paul', 24.61);
Insert into address(street_number, street_name, unit_number, city, state, zip) values ('1898', 'South west loop', '807', 'Chicago', 'IL', '60637-0111');
Insert into address(street_number, street_name, unit_number, city, state, zip) values ('1380', 'Hyde Park Boulevard', '102', 'Chicago', 'IL', '60637-0111');
Insert into address(street_number, street_name, unit_number, city, state, zip) values ('7334', 'Wimberly oaks lane', '970', 'Dallas', 'TX', '75201-1006');
Insert into address(street_number, street_name, unit_number, city, state, zip) values ('1600', 'North lawndale avenue', '014', 'San Jose', 'CA', '95110-1002');
Insert into address(street_number, street_name, unit_number, city, state, zip) values ('3875', 'East Weschester lane', '6098', 'Detroit', 'MI', '48221-0121');
Insert into address(street_number, street_name, unit_number, city, state, zip) values ('845', 'Grinwald avenue', '1308', 'Philadelphia', 'PA', '19101-0007');
Insert into address(street_number, street_name, unit_number, city, state, zip) values ('4762', 'South federal street', '082', 'Chicago', 'IL', '60637-0111');
Insert into customer_address(customer_id, address_id) values (1,7 );
Insert into customer_address(customer_id, address_id) values (3,2);
Insert into customer_address(customer_id, address_id) values (2, 5);
Insert into customer_address(customer_id, address_id) values (5, 1);
Insert into customer_address(customer_id, address_id) values (4, 6);
Insert into credit_card(card_number, customer_id, address_id) values (8679082678453765, 1, 7);
Insert into credit_card(card_number, customer_id, address_id) values (7894096398125239, 3, 2);
Insert into credit_card(card_number, customer_id, address_id) values (5853957289265065, 2, 5);
Insert into credit_card(card_number, customer_id, address_id) values (6984007695168897, 5, 1);
Insert into credit_card(card_number, customer_id, address_id) values (9075864973832774, 4, 6);
Insert into product(type, size) values ('Food', 85754);
Insert into product(type, size) values ('Alcohol', 50533);
Insert into product(type, size) values ('Food', 80546);
Insert into product(type, size) values ('Alcohol', 96032);
Insert into product(type, size) values ('Misc', 00874);
Insert into price (product_id, state, amount) values (1, AZ, 8054.23);
Insert into price (product_id, state, amount) values (2, IL, 325.86);
Insert into price (product_id, state, amount) values (3, CA, 6583.27);
Insert into price (product_id, state, amount) values (4, MA, 1009.21);
Insert into price (product_id, state, amount) values (5, AZ, 1009.99);
Insert into staff_member(name, address_id, job_title, salary) values ('John', 2, 'Cleaner', 34000);
Insert into staff_member(name, address_id, job_title, salary) values ('Jake', 4, 'Driver', 30450);
Insert into staff_member(name, address_id, job_title, salary) values ('Paul', 3, 'Security Guard', 51000);
Insert into staff_member(name, address_id, job_title, salary) values ('Chris', 1, 'Electrician', 80000);























