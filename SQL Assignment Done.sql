use cohort138;
create table factory (
   factory_id INT PRIMARY KEY,
   factory_name VARCHAR(100),
   location VARCHAR(50),
   manager_name VARCHAR(50)
);
INSERT INTO factory VALUES
(1, 'Alpha Manufacturing', 'Pune', 'Rajesh Kumar'),
(2, 'Beta Industries', 'Chennai', 'Suresh Iyer'),
(3, 'Gamma Works', 'Bangalore', 'Anita Sharma'),
(4, 'Delta Corp', 'Hyderabad', 'Ravi Verma'),
(5, 'Omega Manufacturing', 'Ahmedabad', 'Neha Patel');
select * from factory;
select * from production;
CREATE TABLE production (
   production_id INT PRIMARY KEY,
   factory_id INT,
   product_name VARCHAR(50),
   quantity_produced INT,
   production_cost DECIMAL(10,2),
   production_date DATE,
   shift VARCHAR(10),
   FOREIGN KEY (factory_id) REFERENCES factory(factory_id)
);
INSERT INTO production VALUES
(1, 1, 'Gear Box', 120, 45000, '2025-01-01', 'Day'),
(2, 1, 'Engine Part', 90, 72000, '2025-01-02', 'Night'),
(3, 2, 'Brake Pad', 200, 30000, '2025-01-03', 'Day'),
(4, 2, 'Clutch Plate', 150, 55000, '2025-01-04', 'Night'),
(5, 3, 'Axle Rod', 80, 40000, '2025-01-05', 'Day'),
(6, 3, 'Gear Box', 110, 46000, '2025-01-06', 'Night'),
(7, 4, 'Piston', 130, 60000, '2025-01-07', 'Day'),
(8, 4, 'Cylinder', 95, 52000, '2025-01-08', 'Night'),
(9, 5, 'Engine Block', 70, 90000, '2025-01-09', 'Day'),
(10, 5, 'Crank Shaft', 60, 85000, '2025-01-10', 'Night'),
(11, 1, 'Brake Pad', 210, 31000, '2025-01-11', 'Day'),
(12, 2, 'Gear Box', 140, 47000, '2025-01-12', 'Night'),
(13, 3, 'Piston', 125, 61000, '2025-01-13', 'Day'),
(14, 4, 'Clutch Plate', 155, 56000, '2025-01-14', 'Night'),
(15, 5, 'Axle Rod', 100, 42000, '2025-01-15', 'Day'),
(16, 1, 'Cylinder', 85, 50000, '2025-01-16', 'Night'),
(17, 2, 'Engine Part', 95, 74000, '2025-01-17', 'Day'),
(18, 3, 'Brake Pad', 220, 33000, '2025-01-18', 'Night'),
(19, 4, 'Gear Box', 115, 48000, '2025-01-19', 'Day'),
(20, 5, 'Piston', 105, 62000, '2025-01-20', 'Night');
select * from production;
select product_name, quantity_produced from production;
select product_name from production where quantity_produced >150;
select * from production where production_cost <50000;
select product_name, quantity_produced from production where quantity_produced between 80 and 120;
select * from production where product_name = 'Gear box';
select * from production where shift = 'Day';
select product_name from production where shift = 'night';
select distinct product_name from production;
select distinct shift from production;
select production_cost from production order by production_cost asc;
select quantity_produced from production order by quantity_produced desc;
select production_date from production order by production_date desc;
select * from production order by limit 5;
select * from production order by quantity_produced desc limit 3;
select * from production limit 5 offset 5;
select factory_name, product_name, quantity_produced, production_cost, production_date from production join factory;
select factory_name, sum(quantity_produced) as total_quantity from production join factory group by factory_name;
select product_name from production join factory where location = "Pune";
select factory_name, production_cost from production join factory having production_cost > 60000;
select f.factory_name,
       p.product_name,
       p.production_cost
 from production p 
 join factory f  
 on p.factory_id = f.factory_id
 where p.shift="Day" 
 order by p.production_cost desc limit 5;
 select distinct p.product_name, f.location 
 from production p 
 join factory f
 on p.factory_id = f.factory_id
 where location = "bangalore" or "Pune";
 select f.factory_name,
       p.product_name,
       p.quantity_produced
 from production p 
 join factory f  
 on p.factory_id = f.factory_id
 where p.shift="Day" 
 order by p.quantity_produced desc limit 5 offset 3;
 select f.location,
       p.product_name,
       p.production_cost,
       p.shift
 from production p 
 join factory f  
 on p.factory_id = f.factory_id
 where production_cost between 40000 and 70000  
   and shift = "Night"
   and location in ("Hyderabad", "Chennai");
select f.factory_name,
       p.product_name,
       p.quantity_produced
 from production p 
 join factory f  
 on p.factory_id = f.factory_id
 where p.quantity_produced >100
  and p.product_name <> "brake pad"
order by f.factory_name asc,
         p.quantity_produced desc;
   
 