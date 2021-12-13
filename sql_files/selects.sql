-- Indexes
CREATE INDEX idx1 ON service_package_of_services(id_service);
CREATE INDEX idx2 ON payment(sum);
CREATE INDEX idx3 ON contract(end_date);
CREATE INDEX idx4 ON payment(date_of_payment);

-- Grants
create role db_admin 
password 'a5';
create role db_user 
password 'u6';
GRANT ALL PRIVILEGES ON client TO db_admin; 
GRANT ALL PRIVILEGES ON contract TO db_admin; 
GRANT ALL PRIVILEGES ON package_of_services TO db_admin; 
GRANT ALL PRIVILEGES ON payment TO db_admin; 
GRANT ALL PRIVILEGES ON service TO db_admin; 
GRANT ALL PRIVILEGES ON service_package_of_services TO db_admin; 
GRANT select ON client TO db_user; 
GRANT select ON contract TO db_user; 
GRANT select ON package_of_services TO db_user; 
GRANT select ON payment TO db_user; 
GRANT select ON service TO db_user; 
GRANT select ON service_package_of_services TO db_user;

-- Select 1
--Вивести пакети, за які сплачено найбільше коштів за минулий рік (останні 12 місяців);
SELECT package_of_services.name, sum(contract.sum) as sm FROM package_of_services
join contract on contract.id_pos=package_of_services.id
where contract.start_date> date_trunc('month', CURRENT_DATE) - INTERVAL '1 year'
GROUP by package_of_services.id
order by sm DESC
LIMIT 3

--Select 2
--вивести договори, у яких закінчується термін дії у наступному місяці
select * from contract 
where (EXTRACT(MONTH from (contract.end_date)))=(EXTRACT(MONTH from (CURRENT_DATE))+1)

--Select 3
--для кожного клієнта визначити рік, коли було сплачено за послуги найбільшу суму, та рік, коли було сплачено найменшу суму
select nm, yr, sm
FROM
(SELECT payment.year as yr, client.full_name as nm, sum(payment.sum) as sm from client
join contract on contract.client_id=client.id
join payment on payment.id_contract=contract.id
group by (client.id, payment.year)) tmp
ORDER BY nm, yr


--Select 4
--для вказаної послуги визначити пакети, куди вона входить;
SELECT distinct on (package_of_services.id) * from package_of_services
join service_package_of_services on package_of_services.id=service_package_of_services.id_pos
WHERE (select id from service where service.name='27 каналів') = service_package_of_services.id_pos

--Select 5
--визначити клієнтів, які користуються усіма пакетами послуг;
select DISTINCT on (client.id) client.full_name as "ПІП", Count(*)+5 as "Кількість контрактів" from contract 
join package_of_services on package_of_services.id=contract.id_pos 
join client on client.id=contract.client_id 
join service_package_of_services on service_package_of_services.id_pos=package_of_services.id 
GROUP by (client.id, service_package_of_services.id_pos) 
having Count(*)>=(select COUNT(*) from service)-5


--Select 6
--визначити суму сплачених коштів по кожній послузі за кожен рік
SELECT EXTRACT(year from contract.start_date) AS "date", package_of_services.name, sum(contract.sum) as sum FROM package_of_services
join contract on contract.id_pos=package_of_services.id
GROUP by (package_of_services.id, EXTRACT(year from contract.start_date))
ORDER by "date"

--Report 1
SELECT package_of_services.name, COUNT(*)
from package_of_services
JOIN contract on contract.id_pos=package_of_services.id
GROUP BY package_of_services.name

--Report 2
select contract.id, contract.sum from contract 
LEFT join payment on payment.id_contract=contract.id 
GROUP BY contract.id
having (contract.sum>0 AND sum(payment.sum) is NULL) OR sum(payment.sum)<(contract.sum*EXTRACT(MONTH FROM (CURRENT_DATE-contract.start_date)))
