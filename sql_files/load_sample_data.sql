INSERT INTO client(full_name, passport)VALUES ('Коваль Микола Петрович','КМ2598630');
INSERT INTO client(full_name, passport)VALUES ('Калінін Олег Миколайович','НВ0006371');
INSERT INTO client(full_name, passport)VALUES ('Бойко Володимир Васильович','ОД0089576');
INSERT INTO client(full_name, passport)VALUES ('Сотніченко Петро Васильович','КА8787489');
INSERT INTO client(full_name, passport)VALUES ('Бердега Петро Іванович','СА6958647');
INSERT INTO client(full_name, passport)VALUES ('Мельник Віталій Іванович','ВВ1478523');
INSERT INTO client(full_name, passport)VALUES ('Колісник Ніна Іванівна','АТ0147829');
INSERT INTO client(full_name, passport)VALUES ('Колтун Віталій Олександрович','СА9875362');
INSERT INTO client(full_name, passport)VALUES ('Костанян Георгій Георгійович','ВН0002589');
INSERT INTO client(full_name, passport)VALUES ('Чернишева Марія Дмитрівна','АА7412580');


INSERT INTO service(name, cost)VALUES ('27 каналів',10);
INSERT INTO service(name, cost)VALUES ('128 каналів',99);
INSERT INTO service(name, cost)VALUES ('160 каналів',118);
INSERT INTO service(name, cost)VALUES ('182 канали',148);
INSERT INTO service(name, cost)VALUES ('200 каналів',115);
INSERT INTO service(name, cost)VALUES ('210 каналів',210);
INSERT INTO service(name, cost)VALUES ('115 каналів',180);
INSERT INTO service(name, cost)VALUES ('Налаштування антени', 250);
INSERT INTO service(name, cost)VALUES ('Виділення IP',849);
INSERT INTO service(name, cost)VALUES ('Базовий набір обладнання',2000);
INSERT INTO service(name, cost)VALUES ('Виїзд майстра',0);


INSERT INTO package_of_services(name, month_payment)VALUES ('UA новини',100);
INSERT INTO package_of_services(name, month_payment)VALUES ('Ефір+',150);
INSERT INTO package_of_services(name, month_payment)VALUES ('Преміум+',200);
INSERT INTO package_of_services(name, month_payment)VALUES ('VIP HD+',250);
INSERT INTO package_of_services(name, month_payment)VALUES ('Оптимальний цифра',85);
INSERT INTO package_of_services(name, month_payment)VALUES ('ALL-TV"Стартовий"',50);
INSERT INTO package_of_services(name, month_payment)VALUES ('ALL-TV"ALL Inclusive"',220);
INSERT INTO package_of_services(name, month_payment)VALUES ('Installation',100);
INSERT INTO package_of_services(name, month_payment)VALUES ('Installation max',80);
INSERT INTO package_of_services(name, month_payment)VALUES ('Installation max+',40);


INSERT INTO service_package_of_services(id_pos, id_service)VALUES (1,1);  
INSERT INTO service_package_of_services(id_pos, id_service)VALUES (1,2);  
INSERT INTO service_package_of_services(id_pos, id_service)VALUES (1,3);  
INSERT INTO service_package_of_services(id_pos, id_service)VALUES (2,4);  
INSERT INTO service_package_of_services(id_pos, id_service)VALUES (2,5);  
INSERT INTO service_package_of_services(id_pos, id_service)VALUES (3,6);  
INSERT INTO service_package_of_services(id_pos, id_service)VALUES (3,7);
INSERT INTO service_package_of_services(id_pos, id_service)VALUES (3,9); 
INSERT INTO service_package_of_services(id_pos, id_service)VALUES (3,11); 
INSERT INTO service_package_of_services(id_pos, id_service)VALUES (4,7);  
INSERT INTO service_package_of_services(id_pos, id_service)VALUES (4,8);  
INSERT INTO service_package_of_services(id_pos, id_service)VALUES (4,9);  
INSERT INTO service_package_of_services(id_pos, id_service)VALUES (5,3);  
INSERT INTO service_package_of_services(id_pos, id_service)VALUES (5,4);  
INSERT INTO service_package_of_services(id_pos, id_service)VALUES (6,5);
INSERT INTO service_package_of_services(id_pos, id_service)VALUES (6,7);
INSERT INTO service_package_of_services(id_pos, id_service)VALUES (7,8);  
INSERT INTO service_package_of_services(id_pos, id_service)VALUES (7,9);  
INSERT INTO service_package_of_services(id_pos, id_service)VALUES (7,11);  
INSERT INTO service_package_of_services(id_pos, id_service)VALUES (8,10);  
INSERT INTO service_package_of_services(id_pos, id_service)VALUES (8,11);  
INSERT INTO service_package_of_services(id_pos, id_service)VALUES (9,8);
INSERT INTO service_package_of_services(id_pos, id_service)VALUES (9,9);  
INSERT INTO service_package_of_services(id_pos, id_service)VALUES (10,7);  
INSERT INTO service_package_of_services(id_pos, id_service)VALUES (10,8);  


insert into contract(number,adress,client_id,start_date,end_date,id_pos,sum)
VALUES(0000001,'Київ, пр. Шевченка 12',1,CURRENT_DATE,'12.11.2021',1,1000);
insert into contract(number,adress,client_id,start_date,end_date,id_pos,sum)
VALUES(0000002,'Київ, пр. Л.Українки 12А кв. 1',2,CURRENT_DATE,'12.11.2021',2,90);
insert into contract(number,adress,client_id,start_date,end_date,id_pos,sum)
VALUES(1000003,'Черкаси, вул. Кудрі 12',3,CURRENT_DATE,'12.11.2021',3,80);
insert into contract(number,adress,client_id,start_date,end_date,id_pos,sum)
VALUES(2000004,'Львів, бул. Перова 12/2 вул.5',4,CURRENT_DATE,'12.11.2021',4,70);
insert into contract(number,adress,client_id,start_date,end_date,id_pos,sum)
VALUES(3000005,'Одеса, пров. Франка 89',5,CURRENT_DATE,'12.11.2021',5,140);
insert into contract(number,adress,client_id,start_date,end_date,id_pos,sum)
VALUES(4000006,'Харків, пр. Перемоги 46',6,CURRENT_DATE,'12.11.2021',6,145);
insert into contract(number,adress,client_id,start_date,end_date,id_pos,sum)
VALUES(4000007,'Харків, вул. Броварська 25',7,CURRENT_DATE,'12.11.2021',7,65);
insert into contract(number,adress,client_id,start_date,end_date,id_pos,sum)
VALUES(5000008,'Дніпро, пр. Київський 3',8,CURRENT_DATE,'12.11.2021',8,150);
insert into contract(number,adress,client_id,start_date,end_date,id_pos,sum)
VALUES(6000009,'Запоріжжя, пр. Одеський 101/1',9,CURRENT_DATE,'12.11.2021',9,180);
insert into contract(number,adress,client_id,start_date,end_date,id_pos,sum)
VALUES(7000010,'Тернопіль, пр. Шевченка 5',10,CURRENT_DATE,'12.11.2021',10,125);
insert into contract(number,adress,client_id,start_date,end_date,id_pos,sum)
VALUES(8000001,'Київ, пр. Шевченка 12',1,CURRENT_DATE,'12.11.2021',1,50);
insert into contract(number,adress,client_id,start_date,end_date,id_pos,sum)
VALUES(9000002,'Київ, пр. Л.Українки 12А кв. 1',1,'12.11.2020','12.11.2021',2,250);
insert into contract(number,adress,client_id,start_date,end_date,id_pos,sum)
VALUES(1100003,'Черкаси, вул. Кудрі 12',1,CURRENT_DATE,'12.11.2021',3,500);
insert into contract(number,adress,client_id,start_date,end_date,id_pos,sum)
VALUES(2200004,'Львів, бул. Перова 12/2 вул.5',1,CURRENT_DATE,'12.11.2021',4,95);
insert into contract(number,adress,client_id,start_date,end_date,id_pos,sum)
VALUES(3300005,'Одеса, пров. Франка 89',1,'12.12.2021','12.12.2021',5,600);
insert into contract(number,adress,client_id,start_date,end_date,id_pos,sum)
VALUES(4400006,'Харків, пр. Перемоги 46',1,CURRENT_DATE,'12.11.2021',6,80);
insert into contract(number,adress,client_id,start_date,end_date,id_pos,sum)
VALUES(4400007,'Харків, вул. Броварська 25',1,CURRENT_DATE,'12.11.2021',7,75);
insert into contract(number,adress,client_id,start_date,end_date,id_pos,sum)
VALUES(5500008,'Дніпро, пр. Київський 3',1,CURRENT_DATE,'12.11.2021',8,50);
insert into contract(number,adress,client_id,start_date,end_date,id_pos,sum)
VALUES(6600009,'Запоріжжя, пр. Одеський 101/1',1,CURRENT_DATE,'12.11.2021',9,250);
insert into contract(number,adress,client_id,start_date,end_date,id_pos,sum)
VALUES(7700010,'Тернопіль, пр. Шевченка 5',1,CURRENT_DATE,'12.11.2021',10,150);
insert into contract(number,adress,client_id,start_date,end_date,id_pos,sum)
VALUES(0000001,'Київ, пр. Шевченка 12',1,CURRENT_DATE,'12.11.2021',2,50);
insert into contract(number,adress,client_id,start_date,end_date,id_pos,sum)
VALUES(0000001,'Київ, пр. Шевченка 12',1,CURRENT_DATE,'12.11.2021',3,50);
insert into contract(number,adress,client_id,start_date,end_date,id_pos,sum)
VALUES(0000001,'Київ, пр. Шевченка 12',1,CURRENT_DATE,'12.11.2021',4,50);
insert into contract(number,adress,client_id,start_date,end_date,id_pos,sum)
VALUES(0000001,'Київ, пр. Шевченка 12',1,CURRENT_DATE,'12.11.2021',5,50);
insert into contract(number,adress,client_id,start_date,end_date,id_pos,sum)
VALUES(0000001,'Київ, пр. Шевченка 12',1,CURRENT_DATE,'12.11.2021',6,50);
insert into contract(number,adress,client_id,start_date,end_date,id_pos,sum)
VALUES(0000001,'Київ, пр. Шевченка 12',1,CURRENT_DATE,'12.11.2021',7,50);
insert into contract(number,adress,client_id,start_date,end_date,id_pos,sum)
VALUES(0000001,'Київ, пр. Шевченка 12',1,CURRENT_DATE,'12.11.2021',8,50);
insert into contract(number,adress,client_id,start_date,end_date,id_pos,sum)
VALUES(0000001,'Київ, пр. Шевченка 12',1,CURRENT_DATE,'12.11.2021',9,50);
insert into contract(number,adress,client_id,start_date,end_date,id_pos,sum)
VALUES(0000001,'Київ, пр. Шевченка 12',1,CURRENT_DATE,'12.11.2021',10,50);

INSERT INTO payment(id_contract, month,year,sum,date_of_payment)
VALUES(1,11,2021,50,'2021.10.21');
INSERT INTO payment(id_contract, month,year,sum,date_of_payment)
VALUES(1,10,2021,150,CURRENT_DATE);
INSERT INTO payment(id_contract, month,year,sum,date_of_payment)
VALUES(2,08,2021,75,'2021.11.23');
INSERT INTO payment(id_contract, month,year,sum,date_of_payment)
VALUES(3,11,2021,180,CURRENT_DATE);
INSERT INTO payment(id_contract, month,year,sum,date_of_payment)
VALUES(4,10,2021,140,'2021.11.19');
INSERT INTO payment(id_contract, month,year,sum,date_of_payment)
VALUES(5,08,2021,250,CURRENT_DATE);
INSERT INTO payment(id_contract, month,year,sum,date_of_payment)
VALUES(6,01,2022,20,'2021.09.17');
INSERT INTO payment(id_contract, month,year,sum,date_of_payment)
VALUES(7,11,2022,50,CURRENT_DATE);
INSERT INTO payment(id_contract, month,year,sum,date_of_payment)
VALUES(8,05,2022,75,'2021.08.15');
INSERT INTO payment(id_contract, month,year,sum,date_of_payment)
VALUES(9,04,2022,85,CURRENT_DATE);
INSERT INTO payment(id_contract, month,year,sum,date_of_payment)
VALUES(10,03,2022,95,'2021.07.20');
INSERT INTO payment(id_contract, month,year,sum,date_of_payment)
VALUES(1,02,2022,45,CURRENT_DATE);
INSERT INTO payment(id_contract, month,year,sum,date_of_payment)
VALUES(2,01,2022,650,'2021.06.11');
INSERT INTO payment(id_contract, month,year,sum,date_of_payment)
VALUES(3,11,2021,110,CURRENT_DATE);
INSERT INTO payment(id_contract, month,year,sum,date_of_payment)
VALUES(4,11,2021,100,'2021.05.12');
INSERT INTO payment(id_contract, month,year,sum,date_of_payment)
VALUES(5,11,2021,100,CURRENT_DATE);
INSERT INTO payment(id_contract, month,year,sum,date_of_payment)
VALUES(6,11,2021,750,'2021.04.30');
INSERT INTO payment(id_contract, month,year,sum,date_of_payment)
VALUES(6,11,2021,1500,CURRENT_DATE);
INSERT INTO payment(id_contract, month,year,sum,date_of_payment)
VALUES(7,11,2021,1220,'2021.05.19');
INSERT INTO payment(id_contract, month,year,sum,date_of_payment)
VALUES(7,11,2021,500,CURRENT_DATE);
INSERT INTO payment(id_contract, month,year,sum,date_of_payment)
VALUES(8,11,2021,250,'2021.03.10');
INSERT INTO payment(id_contract, month,year,sum,date_of_payment)
VALUES(9,11,2021,50,CURRENT_DATE);
INSERT INTO payment(id_contract, month,year,sum,date_of_payment)
VALUES(10,11,2021,25,'2021.01.13');
INSERT INTO payment(id_contract, month,year,sum,date_of_payment)
VALUES(1,11,2021,20,CURRENT_DATE);