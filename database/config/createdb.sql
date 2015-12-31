CREATE USER 'readonly'@'%' IDENTIFIED BY 'password';
grant select on * . * to 'readonly'@'%';
flush privileges;

create database if not exists telephone_dictionary;
use telephone_dictionary;
create table if not exists dialing_code (
	country_number int(6) auto_increment primary key,
	country_name varchar(40) not null unique,
	dialing_code varchar(6) not null unique
);

insert into dialing_code(country_name, dialing_code) 
values("Australia", "+61");
insert into dialing_code(country_name, dialing_code) 
values("Brazil", "+55");
insert into dialing_code(country_name, dialing_code) 
values("Germany", "+49");
insert into dialing_code(country_name, dialing_code) 
values("India", "+91");
commit;