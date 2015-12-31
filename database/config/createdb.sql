CREATE USER 'readonly'@'%' IDENTIFIED BY 'password';
GRANT SELECT ON * . * TO 'readonly'@'%';
FLUSH PRIVILEGES;

CREATE DATABASE IF NOT EXISTS telephone_dictionary;
USE telephone_dictionary;
CREATE TABLE IF NOT EXISTS dialing_code (
	country_number int(6) auto_increment primary key,
	country_name varchar(40) not null unique,
	dialing_code varchar(6) not null unique
);

INSERT INTO dialing_code(country_name, dialing_code) 
VALUES("Australia", "+61");
INSERT INTO dialing_code(country_name, dialing_code) 
VALUES("Brazil", "+55");
INSERT INTO dialing_code(country_name, dialing_code) 
VALUES("Germany", "+49");
INSERT INTO dialing_code(country_name, dialing_code) 
VALUES("India", "+91");
COMMIT;