-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2019-03-21 13:07:03.039

-- tables


-----
-- Table: airport
CREATE TABLE airport (
    id varchar(3) NOT NULL,
    city varchar(64) NOT NULL,
    country varchar(64) NOT NULL,
    time_zone varchar(5) NOT NULL
);

-- Table: company
CREATE TABLE company (
	 id int NOT NULL,
    name varchar(64) NOT NULL,
    website varchar(150) NOT NULL    
);

-- Table: flight
CREATE TABLE flight (
    id int NOT NULL,
    destination_id varchar(4) NOT NULL,
    departure_id varchar(4) NOT NULL,
    schedule_id int NOT NULL,
    company_id int NOT NULL,
    plane_id int NOT NULL
);


-- Table: plane
CREATE TABLE plane (
    id int NOT NULL,
    plane_model varchar(64) NOT NULL,
    seats numeric(1000,1) NOT NULL
);

-- Table: role
CREATE TABLE role (
    id int NOT NULL,
    name int NOT NULL,
    description int NOT NULL
);

--- 

-- Table: schedule
CREATE TABLE schedule (
    id int NOT NULL,
    departure_time time NOT NULL,
    arrival_time time NOT NULL,
    duration timestamp NOT NULL,
    regularity numeric(365,1) NOT NULL
);

-- Table: user
CREATE TABLE user (
    username varchar(64) NOT NULL,
    passwd_hash varchar(64) NOT NULL,
    role_id int NOT NULL,
    first_name varchar(64) NOT NULL,
    last_name varchar(64) NOT NULL,
    email varchar(64) NOT NULL
);

-- Table: user_favorite_flight
CREATE TABLE user_favorite_flight (
    user_role_id int NOT NULL,
    user_id int NOT NULL,
    flight_id varchar(64) NOT NULL
);

-- End of file.

-- add 2 roles

INSERT INTO role (id, name, description) VALUES (1, 'admin', 'role admin');
INSERT INTO role (id, name, description) VALUES (2, 'user', 'role user');

-- add 3 users

INSERT INTO user (username, passwd_hash, first_name,last_name, email, role_id) VALUES ('mathieu_carneiro', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'mathieu', 'carneiro', 'mathieu.carneiro@icloud.com',1);
INSERT INTO user (username, passwd_hash, first_name,last_name, email, role_id) VALUES ('ratroi','7110eda4d09e062aa5e4a390b0a572ac0d2c0220','jonas','harbarth','lalala@gmail.com',1);
INSERT INTO user (username, passwd_hash, first_name,last_name,email, role_id) VALUES ('pizzaiolo','7110eda4d09e062aa5e4a390b0a572ac0d2c0220','sean','perazzolo','lolipop@gmail.com',1);


-- add 22 airports manually 

INSERT INTO airport (id, city, country, time_zone ) VALUES ('LHR', 'Londres', 'Royaume-Uni', '-1');
INSERT INTO airport (id, city, country, time_zone ) VALUES ('CDG', 'Paris', 'France', '0');
INSERT INTO airport (id, city, country, time_zone ) VALUES ('NCE', 'Nice', 'France', '0');
INSERT INTO airport (id, city, country, time_zone ) VALUES ('BOD', 'Bordeaux', 'France', '0');
INSERT INTO airport (id, city, country, time_zone ) VALUES ('BCN', 'Barcelone', 'Espagne', '0');
INSERT INTO airport (id, city, country, time_zone ) VALUES ('MAD', 'Madrid','Espagne', '0');
INSERT INTO airport (id, city, country, time_zone ) VALUES ('AMS', 'Amsterdam', 'Pays-Bas', '0');
INSERT INTO airport (id, city, country, time_zone ) VALUES ('SVO', 'Moscou', 'Russie', '+1');
INSERT INTO airport (id, city, country, time_zone ) VALUES ('DXB', 'Dubai', 'Emirats Arabes Unis', '+2');
INSERT INTO airport (id, city, country, time_zone ) VALUES ('ARN', 'Stockholm', 'Suède', '0');
INSERT INTO airport (id, city, country, time_zone ) VALUES ('ZRH', 'Zurich', 'Suisse', '0');
INSERT INTO airport (id, city, country, time_zone ) VALUES ('IST', 'Istanbul', 'Turquie', '+1');
INSERT INTO airport (id, city, country, time_zone ) VALUES ('BRU', 'Brussels', 'Belgique', '0');
INSERT INTO airport (id, city, country, time_zone ) VALUES ('FRA', 'Francfort', 'Allemagne', '0');
INSERT INTO airport (id, city, country, time_zone ) VALUES ('MUC', 'Munich', 'Allemagne', '0');
INSERT INTO airport (id, city, country, time_zone ) VALUES ('SXF', 'Berlin', 'Allemagne', '0');
INSERT INTO airport (id, city, country, time_zone ) VALUES ('JFK', 'New york', 'Etats-Unis', '-6');
INSERT INTO airport (id, city, country, time_zone ) VALUES ('YYZ', 'Toronto', 'Canada', '-6');
INSERT INTO airport (id, city, country, time_zone ) VALUES ('RAK', 'Marrakech', 'Maroc', '-2');
INSERT INTO airport (id, city, country, time_zone ) VALUES ('FCO', 'Rome', 'Italie', '0');
INSERT INTO airport (id, city, country, time_zone ) VALUES ('PEK', 'Pékin', 'Chine', '+6');
INSERT INTO airport (id, city, country, time_zone ) VALUES ('DOH', 'Doha', 'Qatar', '+1');
INSERT INTO airport (id, city, country, time_zone ) VALUES ('CPH', 'Copenhague', 'Danemark', '0');


-- add company 

INSERT INTO company (id, name, website ) VALUES (1, 'easyjet', 'easyjet.com');
INSERT INTO company (id, name, website ) VALUES (2, 'Air France', 'airfrance.com');
INSERT INTO company (id, name, website ) VALUES (3, 'SWISS', 'swiss.com');
INSERT INTO company (id, name, website ) VALUES (4, 'British Airways', 'Britishairways.com');
INSERT INTO company (id, name, website ) VALUES (5, 'Lufthansa', 'Lufthansa.com');
INSERT INTO company (id, name, website ) VALUES (6, 'KLM', 'klm.fr');
INSERT INTO company (id, name, website ) VALUES (7, 'Emirates', 'Emirates.com');
INSERT INTO company (id, name, website ) VALUES (8, 'Iberia', 'Iberia.com');
INSERT INTO company (id, name, website ) VALUES (9, 'TAP', 'flytap.com');
INSERT INTO company (id, name, website ) VALUES (10, 'Qatar Airways', 'Qatar.com');
INSERT INTO company (id, name, website ) VALUES (11, 'Brussels Airlines', 'Brusselsairlines.com');
INSERT INTO company (id, name, website ) VALUES (12, 'Turkish Airlines', 'Turkishairlines.com');
INSERT INTO company (id, name, website ) VALUES (13, 'Air China', 'Airchina.com');
INSERT INTO company (id, name, website ) VALUES (14, 'Aeroflot', 'Aeroflot.com');

-- add planes

INSERT INTO plane (id, plane_model, seats ) VALUES (1, 'Airbus A320', '185');

-- add flights

INSERT INTO flight (id, destination_id, departure_id, schedule_id, company_id, plane_id) VALUES (1, 'MAD', 'GVA', 1, 1, 1 );
INSERT INTO flight (id, destination_id, departure_id, schedule_id, company_id, plane_id) VALUES (2, 'LHR', 'GVA', 2, 4, 1 );
INSERT INTO flight (id, destination_id, departure_id, schedule_id, company_id, plane_id) VALUES (3, 'ZRH', 'GVA', 3, 3, 1 );
INSERT INTO flight (id, destination_id, departure_id, schedule_id, company_id, plane_id) VALUES (4, 'LHR', 'GVA', 4, 3, 1 );
INSERT INTO flight (id, destination_id, departure_id, schedule_id, company_id, plane_id) VALUES (5, 'LHR', 'GVA', 5, 4, 1 );
INSERT INTO flight (id, destination_id, departure_id, schedule_id, company_id, plane_id) VALUES (6, 'DXB', 'GVA', 6, 7, 1 );
INSERT INTO flight (id, destination_id, departure_id, schedule_id, company_id, plane_id) VALUES (7, 'CPH', 'GVA', 7, 1, 1 );
INSERT INTO flight (id, destination_id, departure_id, schedule_id, company_id, plane_id) VALUES (8, 'PEK', 'GVA', 8, 13, 1 );
INSERT INTO flight (id, destination_id, departure_id, schedule_id, company_id, plane_id) VALUES (9, 'DOH', 'GVA', 9, 10, 1 );
INSERT INTO flight (id, destination_id, departure_id, schedule_id, company_id, plane_id) VALUES (10, 'CDG', 'GVA', 10, 2, 1 );
INSERT INTO flight (id, destination_id, departure_id, schedule_id, company_id, plane_id) VALUES (11, 'DOH', 'GVA', 11, 10, 1 );
INSERT INTO flight (id, destination_id, departure_id, schedule_id, company_id, plane_id) VALUES (12, 'DOH', 'GVA', 12, 10, 1 );
INSERT INTO flight (id, destination_id, departure_id, schedule_id, company_id, plane_id) VALUES (13, 'DOH', 'GVA', 13, 10, 1 );
INSERT INTO flight (id, destination_id, departure_id, schedule_id, company_id, plane_id) VALUES (14, 'DOH', 'GVA', 14, 10, 1 );
INSERT INTO flight (id, destination_id, departure_id, schedule_id, company_id, plane_id) VALUES (15, 'DOH', 'GVA', 15, 10, 1 );
INSERT INTO flight (id, destination_id, departure_id, schedule_id, company_id, plane_id) VALUES (16, 'DOH', 'GVA', 16, 10, 1 );
INSERT INTO flight (id, destination_id, departure_id, schedule_id, company_id, plane_id) VALUES (17, 'DOH', 'GVA', 17, 10, 1 );


-- schedule 

INSERT INTO schedule (id, departure_time, arrival_time, duration, regularity) VALUES (1, '07:35', '09:15', '1:40', '365');
INSERT INTO schedule (id, departure_time, arrival_time, duration, regularity) VALUES (2, '08:35', '10:10', '1:35', '365');
INSERT INTO schedule (id, departure_time, arrival_time, duration, regularity) VALUES (3, '10:00', '10:45', '0:45', '365');
INSERT INTO schedule (id, departure_time, arrival_time, duration, regularity) VALUES (4, '07:10', '08:55', '1:45', '365');
INSERT INTO schedule (id, departure_time, arrival_time, duration, regularity) VALUES (5, '17:20', '18:55', '1:45', '365');
INSERT INTO schedule (id, departure_time, arrival_time, duration, regularity) VALUES (6, '15:15', '21:45', '6:30', '365');
INSERT INTO schedule (id, departure_time, arrival_time, duration, regularity) VALUES (7, '16:00', '18:00', '2:00', '365');
INSERT INTO schedule (id, departure_time, arrival_time, duration, regularity) VALUES (8, '13:20', '23:30', '10:10', '365');
INSERT INTO schedule (id, departure_time, arrival_time, duration, regularity) VALUES (9, '16:55', '22:59', '6:04', '365');
INSERT INTO schedule (id, departure_time, arrival_time, duration, regularity) VALUES (10, '16:55', '22:59', '6:04', '365');
INSERT INTO schedule (id, departure_time, arrival_time, duration, regularity) VALUES (11, '16:55', '22:59', '6:04', '365');
INSERT INTO schedule (id, departure_time, arrival_time, duration, regularity) VALUES (12, '16:55', '22:59', '6:04', '365');
INSERT INTO schedule (id, departure_time, arrival_time, duration, regularity) VALUES (13, '16:55', '22:59', '6:04', '365');
INSERT INTO schedule (id, departure_time, arrival_time, duration, regularity) VALUES (14, '16:55', '22:59', '6:04', '365');
INSERT INTO schedule (id, departure_time, arrival_time, duration, regularity) VALUES (15, '16:55', '22:59', '6:04', '365');
INSERT INTO schedule (id, departure_time, arrival_time, duration, regularity) VALUES (16, '16:55', '22:59', '6:04', '365');
INSERT INTO schedule (id, departure_time, arrival_time, duration, regularity) VALUES (17, '16:55', '22:59', '6:04', '365');













