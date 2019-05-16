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
    code varchar(10) NOT NULL,
    company_id int NOT NULL,
    plane_id int NOT NULL
);


-- Table: plane
CREATE TABLE plane (
    id int NOT NULL,
    plane_model varchar(64) NOT NULL,
    nb_seats numeric(1000,1) NOT NULL
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
INSERT INTO company (id, name, website ) VALUES (14, 'Air China', 'Airchina.com');
INSERT INTO company (id, name, website ) VALUES (15, 'Aeroflot', 'Aeroflot.com');

-- add planes

INSERT INTO plane (id, plane_model, nb_seats ) VALUES (, 'A320', '165');
INSERT INTO plane (id, plane_model, nb_seats ) VALUES (, 'A319', '143');
INSERT INTO plane (id, plane_model, nb_seats ) VALUES (, 'A321', '180');



-- INSERT INTO flight  (flight_id, desination_id, departure_id, schedule_id, company_id, plane_id) VALUES (1, 'MAD', 'GVA', 1, 1, 320 );
