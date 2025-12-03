-- 1. CREATE THE TABLE
-- This schema is designed to work across most major SQL database systems (MySQL, PostgreSQL, SQL Server, etc.)
-- Note: 'profit' is included as a virtual/generated column for convenience if supported by your database.

CREATE TABLE AirlineRoutes (
    flightid VARCHAR(20) PRIMARY KEY,
    routecode VARCHAR(30), -- Used for grouping analytics per route (e.g., AA101-LAX-JFK)
    origin CHAR(3),        -- IATA Airport Code
    destination CHAR(3),  -- IATA Airport Code
    flight_date DATE,
    flight_duration_min INT,
    aircraft_type VARCHAR(50),
    seats_available INT,
    seats_sold INT,
    revenue DECIMAL(10, 2),
    operational_cost DECIMAL(10, 2));
    -- Add a 'profit' column definition if your SQL dialect supports GENERATED columns (e.g., MySQL 5.7+, PostgreSQL 12+)
    -- profit DECIMAL(10, 2) GENERATED ALWAYS AS (revenue - operational_cost) STORED 

-- 2. INSERT THE 50 ROWS OF DATA
INSERT INTO AirlineRoutes (flightid, routecode, origin, destination, flight_date, flight_duration_min, aircraft_type, seats_available, seats_sold, revenue, operational_cost) VALUES
('AA101-01', 'AA101-LAX-JFK', 'LAX', 'JFK', '2025-12-01', 310, 'Boeing 737', 150, 130, 45100.00, 31000.00),
('AA101-02', 'AA101-LAX-JFK', 'LAX', 'JFK', '2025-12-02', 315, 'Boeing 737', 150, 140, 48300.00, 31500.00),
('AA101-03', 'AA101-LAX-JFK', 'LAX', 'JFK', '2025-12-03', 320, 'Boeing 737', 150, 145, 50100.00, 32000.00),
('AA101-04', 'AA101-LAX-JFK', 'LAX', 'JFK', '2025-12-04', 312, 'Boeing 737', 150, 110, 38000.00, 31200.00),
('DL245-01', 'DL245-ATL-MCO', 'ATL', 'MCO', '2025-12-01', 85, 'Airbus A320', 180, 172, 31000.00, 18500.00),
('DL245-02', 'DL245-ATL-MCO', 'ATL', 'MCO', '2025-12-02', 88, 'Airbus A320', 180, 160, 29000.00, 18800.00),
('DL245-03', 'DL245-ATL-MCO', 'ATL', 'MCO', '2025-12-03', 84, 'Airbus A320', 180, 180, 33000.00, 18400.00),
('DL245-04', 'DL245-ATL-MCO', 'ATL', 'MCO', '2025-12-04', 90, 'Airbus A320', 180, 150, 26000.00, 19000.00),
('UAL380-01', 'UAL380-ORD-DFW', 'ORD', 'DFW', '2025-12-01', 140, 'Boeing 737', 150, 148, 39000.00, 29000.00),
('UAL380-02', 'UAL380-ORD-DFW', 'ORD', 'DFW', '2025-12-02', 135, 'Boeing 737', 150, 120, 31000.00, 28500.00),
('UAL380-03', 'UAL380-ORD-DFW', 'ORD', 'DFW', '2025-12-03', 142, 'Boeing 737', 150, 150, 40000.00, 29200.00),
('UAL380-04', 'UAL380-ORD-DFW', 'ORD', 'DFW', '2025-12-04', 138, 'Boeing 737', 150, 90, 21000.00, 28800.00),
('QTR789-01', 'QTR789-DOH-SYD', 'DOH', 'SYD', '2025-12-01', 980, 'Boeing 777', 350, 340, 255000.00, 180000.00),
('QTR789-02', 'QTR789-DOH-SYD', 'DOH', 'SYD', '2025-12-03', 990, 'Boeing 777', 350, 310, 230000.00, 185000.00),
('QTR789-03', 'QTR789-DOH-SYD', 'DOH', 'SYD', '2025-12-05', 985, 'Boeing 777', 350, 345, 260000.00, 182000.00),
('BAW555-01', 'BAW555-DXB-JFK', 'DXB', 'JFK', '2025-12-02', 810, 'Airbus A380', 500, 480, 410000.00, 290000.00),
('BAW555-02', 'BAW555-DXB-JFK', 'DXB', 'JFK', '2025-12-04', 805, 'Airbus A380', 500, 410, 350000.00, 288000.00),
('BAW555-03', 'BAW555-DXB-JFK', 'DXB', 'JFK', '2025-12-06', 820, 'Airbus A380', 500, 490, 425000.00, 295000.00),
('ACA402-01', 'ACA402-YYZ-YVR', 'YYZ', 'YVR', '2025-12-01', 280, 'Boeing 787', 250, 220, 135000.00, 95000.00),
('ACA402-02', 'ACA402-YYZ-YVR', 'YYZ', 'YVR', '2025-12-05', 285, 'Boeing 787', 250, 245, 150000.00, 96000.00),
('ACA402-03', 'ACA402-YYZ-YVR', 'YYZ', 'YVR', '2025-12-06', 275, 'Boeing 787', 250, 180, 105000.00, 94000.00),
('AFR123-01', 'AFR123-ORY-NCE', 'ORY', 'NCE', '2025-12-01', 90, 'Embraer E-Jets', 100, 98, 15000.00, 9000.00),
('AFR123-02', 'AFR123-ORY-NCE', 'ORY', 'NCE', '2025-12-03', 92, 'Embraer E-Jets', 100, 85, 13000.00, 9100.00),
('AFR123-03', 'AFR123-ORY-NCE', 'ORY', 'NCE', '2025-12-05', 88, 'Embraer E-Jets', 100, 100, 16000.00, 8800.00),
('JAL767-01', 'JAL767-HND-ICN', 'HND', 'ICN', '2025-12-01', 120, 'Boeing 767', 200, 195, 65000.00, 42000.00),
('JAL767-02', 'JAL767-HND-ICN', 'HND', 'ICN', '2025-12-04', 118, 'Boeing 767', 200, 170, 58000.00, 41000.00),
('JAL767-03', 'JAL767-HND-ICN', 'HND', 'ICN', '2025-12-06', 125, 'Boeing 767', 200, 200, 68000.00, 43000.00),
('SAS999-01', 'SAS999-CPH-ARN', 'CPH', 'ARN', '2025-12-01', 65, 'ATR 72', 70, 68, 8500.00, 5000.00),
('SAS999-02', 'SAS999-CPH-ARN', 'CPH', 'ARN', '2025-12-05', 68, 'ATR 72', 70, 55, 7000.00, 5100.00),
('SAS999-03', 'SAS999-CPH-ARN', 'CPH', 'ARN', '2025-12-07', 63, 'ATR 72', 70, 70, 9000.00, 4900.00),
('AA500-01', 'AA500-MIA-DFW', 'MIA', 'DFW', '2025-12-01', 170, 'Boeing 737', 150, 145, 40000.00, 31000.00),
('AA500-02', 'AA500-MIA-DFW', 'MIA', 'DFW', '2025-12-03', 165, 'Boeing 737', 150, 130, 36000.00, 30500.00),
('AA500-03', 'AA500-MIA-DFW', 'MIA', 'DFW', '2025-12-05', 175, 'Boeing 737', 150, 150, 42000.00, 31500.00),
('SWA911-01', 'SWA911-LHR-CDG', 'LHR', 'CDG', '2025-12-01', 75, 'Airbus A320', 180, 165, 28000.00, 17000.00),
('SWA911-02', 'SWA911-LHR-CDG', 'LHR', 'CDG', '2025-12-02', 78, 'Airbus A320', 180, 180, 31000.00, 17500.00),
('SWA911-03', 'SWA911-LHR-CDG', 'LHR', 'CDG', '2025-12-04', 74, 'Airbus A320', 180, 150, 25000.00, 16800.00),
('DL190-01', 'DL190-JFK-LAX', 'JFK', 'LAX', '2025-12-01', 320, 'Airbus A321', 190, 180, 51000.00, 34000.00),
('DL190-02', 'DL190-JFK-LAX', 'JFK', 'LAX', '2025-12-03', 318, 'Airbus A321', 190, 170, 48000.00, 33500.00),
('DL190-03', 'DL190-JFK-LAX', 'JFK', 'LAX', '2025-12-05', 325, 'Airbus A321', 190, 190, 54000.00, 34500.00),
('UAL505-01', 'UAL505-SFO-ORD', 'SFO', 'ORD', '2025-12-01', 240, 'Boeing 737', 150, 140, 38000.00, 27000.00),
('UAL505-02', 'UAL505-SFO-ORD', 'SFO', 'ORD', '2025-12-02', 235, 'Boeing 737', 150, 120, 31000.00, 26500.00),
('UAL505-03', 'UAL505-SFO-ORD', 'SFO', 'ORD', '2025-12-04', 245, 'Boeing 737', 150, 150, 42000.00, 27500.00),
('BAW201-01', 'BAW201-LHR-BOS', 'LHR', 'BOS', '2025-12-01', 410, 'Boeing 787', 250, 230, 145000.00, 105000.00),
('BAW201-02', 'BAW201-LHR-BOS', 'LHR', 'BOS', '2025-12-03', 405, 'Boeing 787', 250, 210, 130000.00, 102000.00),
('QTR111-01', 'QTR111-DOH-LHR', 'DOH', 'LHR', '2025-12-01', 430, 'Airbus A350', 300, 290, 190000.00, 120000.00),
('QTR111-02', 'QTR111-DOH-LHR', 'DOH', 'LHR', '2025-12-02', 425, 'Airbus A350', 300, 250, 160000.00, 118000.00),
('SWA444-01', 'SWA444-LAS-SEA', 'LAS', 'SEA', '2025-12-01', 145, 'Boeing 737', 150, 150, 42000.00, 30000.00),
('SWA444-02', 'SWA444-LAS-SEA', 'LAS', 'SEA', '2025-12-03', 140, 'Boeing 737', 150, 120, 31000.00, 29000.00),
('SWA444-03', 'SWA444-LAS-SEA', 'LAS', 'SEA', '2025-12-05', 150, 'Boeing 737', 150, 140, 39000.00, 30500.00),
('JAL333-01', 'JAL333-NRT-LAX', 'NRT', 'LAX', '2025-12-01', 660, 'Boeing 777', 350, 330, 240000.00, 170000.00);





select count(routecode) from AirLineRoutes ;




select routecode,count(flightid) as flights from 
AirLineRoutes group by routecode order by flights limit 10;




select routecode,avg(revenue) as avgrevenue from AirLineRoutes group by routecode;
select routecode,avg(operational_cost) as avgcost from AirLineRoutes group by routecode;
select routecode,avg(revenue-operational_cost) as profit from AirLineRoutes
group by routecode;



select routecode , avg(revenue-operational_cost) as profit from AirLineRoutes
group by routecode
having avg(revenue-operational_cost) <0;



select routecode ,(sum(seats_sold)/ sum(seats_available)) * 100 as seats_occupied from AirLineRoutes
group by routecode;




select routecode , month(sum(revenue-operational_cost)) as monthly_profit from AirLineRoutes
group by routecode;




select routecode, sum(revenue) as totalrevenue
, sum(flight_duration_min) as totaltime,
sum(revenue)/sum(flight_duration_min) as revenueperminute
from AirLineRoutes
group by routecode
order by revenueperminute desc;