Insert into customer(name, balance ) values ('Harry', 345.21);
Insert into customer(name, balance ) values ('Jordan', 864.24);
Insert into customer(name, balance ) values ('Lebron', 489.87);
Insert into customer(name, balance ) values ('Kawhi', 754.43);
Insert into customer(name, balance ) values ('Paul', 24.61);
Insert into address(street_number, street_name, unit_number, city, state, zip) values ('1898', 'South west loop', '807', 'Chicago', 'IL', '60637-0111');
Insert into address(street_number, street_name, unit_number, city, state, zip) values ('1380', 'Hyde Park Boulevard', '102', 'Chicago', 'IL', '60637-0111');
Insert into address(street_number, street_name, unit_number, city, state, zip) values ('7334', 'Wimberly oaks lane', '970', 'Dallas', 'TX', '75201-1006');
Insert into address(street_number, street_name, unit_number, city, state, zip) values ('1600', 'North lawndale avenue', '014', 'San Jose', 'CA', '95110-1002');
Insert into address(street_number, street_name, unit_number, city, state, zip) values ('3875', 'East Weschester lane', '6098', 'Detroit', 'MI', '48221-0121');
Insert into address(street_number, street_name, unit_number, city, state, zip) values ('845', 'Grinwald avenue', '1308', 'Philadelphia', 'PA', '19101-0007');
Insert into address(street_number, street_name, unit_number, city, state, zip) values ('4762', 'South federal street', '082', 'Chicago', 'IL', '60637-0111');
Insert into customer_address(customer_id, address_id, type) values (1,7, 'Delivery');
Insert into customer_address(customer_id, address_id, type) values (3,2, 'Payment');
Insert into customer_address(customer_id, address_id, type) values (2, 5, 'Payment');
Insert into customer_address(customer_id, address_id, type) values (5, 1, 'Delivery');
Insert into customer_address(customer_id, address_id, type) values (4, 6, 'Delivery');
Insert into credit_card(card_number, customer_id, address_id) values (8679082678453765, 1, 7);
Insert into credit_card(card_number, customer_id, address_id) values (7894096398125239, 3, 2);
Insert into credit_card(card_number, customer_id, address_id) values (5853957289265065, 2, 5);
Insert into credit_card(card_number, customer_id, address_id) values (6984007695168897, 5, 1);
Insert into credit_card(card_number, customer_id, address_id) values (9075864973832774, 4, 6);
Insert into product(name, type, size, description) values ('Bread', 'Food', 85754, 'This product is wheat bread');
Insert into product(name, type, size, description) values ('Vodka', 'Alcohol', 50533, 'This product is highly alcoholic vodka');
Insert into product(name, type, size, description) values ('Processed meat' 'Food', 80546, 'This product is frozen meat');
Insert into product(name, type, size, description) values ('Wine', 'Alcohol', 96032, 'This product is low alcoholic wine');
Insert into product(name, type, size, description) values ('Electronic gadget', 'Misc', 00874, 'This product is an electronic gadget possibly a phone');
Insert into price (product_id, state, amount) values (1, AZ, 8054.23);
Insert into price (product_id, state, amount) values (2, IL, 325.86);
Insert into price (product_id, state, amount) values (3, CA, 6583.27);
Insert into price (product_id, state, amount) values (4, MA, 1009.21);
Insert into price (product_id, state, amount) values (5, AZ, 1009.99);
Insert into staff_member(name, address_id, job_title, salary) values ('John', 2, 'Cleaner', 34000);
Insert into staff_member(name, address_id, job_title, salary) values ('Jake', 4, 'Driver', 30450);
Insert into staff_member(name, address_id, job_title, salary) values ('Paul', 3, 'Security Guard', 51000);
Insert into staff_member(name, address_id, job_title, salary) values ('Chris', 1, 'Electrician', 80000);
Insert into warehouse(address_id, size) values (6, 48453);
Insert into warehouse(address_id, size) values (7, 90832);
Insert into warehouse(address_id, size) values (3, 30462);
Insert into stock(warehouse_id, product_id, num) values (3,5,10);
Insert into stock(warehouse_id, product_id, num) values (2,3,8);
Insert into stock(warehouse_id, product_id, num) values (1,4,25);
Insert into supplier(name, address_id) values ('Tesco', 1);
Insert into supplier(name, address_id) values ('Good & Gather', 3);
Insert into supplier(name, address_id) values ('Jack Daniels', 5);
Insert into supplier(name, address_id) values ('Apple', 2);
Insert into supplier(name, address_id) values ('Jimmy Dean', 4);
Insert into supplier_product(supplier_id, product_id, price) values (5, 1 , 12.78);
Insert into supplier_product(supplier_id, product_id, price) values (3, 2, 24.99);
Insert into supplier_product(supplier_id, product_id, price) values (4, 5, 299.95);
Insert into supplier_product(supplier_id, product_id, price) values (1, 3 , 707.54);
Insert into supplier_product(supplier_id, product_id, price) values (2, 3 , 95.64);
Insert into order(customer_id, order_date, status, card_number, price) values (1, '2010-11-31', 'Issued', 8679082678453765, 1876.54);
Insert into order(customer_id, order_date, status, card_number, price) values (1, '2014-09-15', 'Sent', 8679082678453765, 89076.89);
Insert into order(customer_id, order_date, status, card_number, price) values (4, '2008-08-26', 'Received', 5853957289265065, 568.45);
Insert into order(customer_id, order_date, status, card_number, price) values (3, '2020-10-09', 'Received', 6984007695168897, 1359.87);
Insert into order(customer_id, order_date, status, card_number, price) values (5, '2012-02-24', 'Sent', 9075864973832774, 999.99);
Insert into order_product(order_id, product_id, num) values (1, 2, 87);
Insert into order_product(order_id, product_id, num) values (3, 1, 94);
Insert into order_product(order_id, product_id, num) values (2, 3, 694);
Insert into order_product(order_id, product_id, num) values (4, 5, 743);
Insert into order_product(order_id, product_id, num) values (5, 4, 207);






























