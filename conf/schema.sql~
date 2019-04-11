-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2019-03-21 13:07:03.039

-- tables
-- Table: airport
CREATE TABLE airport (
    id varchar(3) NOT NULL,
    city varchar(64) NOT NULL,
    country varchar(64) NOT NULL,
    time_zone time NOT NULL,
    CONSTRAINT airport_pk PRIMARY KEY (id)
);

-- Table: company
CREATE TABLE company (
    name varchar(64) NOT NULL,
    city varchar(64) NOT NULL,
    country varchar(64) NOT NULL,
    website varchar(150) NOT NULL,
    rate numeric(100,1) NOT NULL,
    id int NOT NULL,
    CONSTRAINT company_pk PRIMARY KEY (id)
);

-- Table: flight
CREATE TABLE flight (
    id varchar(64) NOT NULL,
    destination_id varchar(3) NOT NULL,
    departure_id varchar(3) NOT NULL DEFAULT GVA,
    schedule_id int NOT NULL,
    code varchar(8) NOT NULL,
    company_id int NOT NULL,
    plane_id int NOT NULL,
    CONSTRAINT flight_pk PRIMARY KEY (id)
);

-- Table: plane
CREATE TABLE plane (
    id int NOT NULL,
    plane_model int NOT NULL,
    places numeric(1000,1) NOT NULL,
    CONSTRAINT plane_pk PRIMARY KEY (id)
);

-- Table: role
CREATE TABLE role (
    id int NOT NULL,
    name int NOT NULL,
    description int NOT NULL,
    CONSTRAINT role_pk PRIMARY KEY (id)
);

-- Table: schedule
CREATE TABLE schedule (
    departure_time time NOT NULL,
    arrival_time time NOT NULL,
    duration timestamp NOT NULL,
    regularity numeric(365,1) NOT NULL,
    id int NOT NULL,
    CONSTRAINT schedule_pk PRIMARY KEY (id)
);

-- Table: user
CREATE TABLE user (
    username varchar(64) NOT NULL,
    passwd_hash varchar(64) NOT NULL,
    role_id int NOT NULL,
    first_name varchar(64) NOT NULL,
    last_name varchar(64) NOT NULL,
    email varchar(64) NOT NULL,
    id int NOT NULL,
    CONSTRAINT user_pk PRIMARY KEY (role_id,id)
);

-- Table: user_favorite_flight
CREATE TABLE user_favorite_flight (
    user_role_id int NOT NULL,
    user_id int NOT NULL,
    flight_id varchar(64) NOT NULL,
    CONSTRAINT user_favorite_flight_pk PRIMARY KEY (user_role_id)
);

-- foreign keys
-- Reference: Table_22_flight (table: flight)
ALTER TABLE flight ADD CONSTRAINT Table_22_flight FOREIGN KEY Table_22_flight (destination_id)
    REFERENCES airport (id);

-- Reference: flight_Table_23 (table: flight)
ALTER TABLE flight ADD CONSTRAINT flight_Table_23 FOREIGN KEY flight_Table_23 (schedule_id)
    REFERENCES schedule (id);

-- Reference: flight_Table_24 (table: flight)
ALTER TABLE flight ADD CONSTRAINT flight_Table_24 FOREIGN KEY flight_Table_24 (company_id)
    REFERENCES company (id);

-- Reference: flight_user_favorite_flight (table: user_favorite_flight)
ALTER TABLE user_favorite_flight ADD CONSTRAINT flight_user_favorite_flight FOREIGN KEY flight_user_favorite_flight (flight_id)
    REFERENCES flight (id);

-- Reference: plane_flight (table: flight)
ALTER TABLE flight ADD CONSTRAINT plane_flight FOREIGN KEY plane_flight (plane_id)
    REFERENCES plane (id);

-- Reference: user_Table_35 (table: user)
ALTER TABLE user ADD CONSTRAINT user_Table_35 FOREIGN KEY user_Table_35 (role_id)
    REFERENCES role (id);

-- Reference: user_flight (table: user_favorite_flight)
ALTER TABLE user_favorite_flight ADD CONSTRAINT user_flight FOREIGN KEY user_flight (user_role_id,user_id)
    REFERENCES user (role_id,id);

-- End of file.

-- add 2 roles

INSERT INTO role (id, name, description) VALUES (1, 'admin', 'role admin');
INSERT INTO role (id, name, description) VALUES (2, 'user', 'role user');

-- add 3 users

INSERT INTO user (username, passwd_hash, first_name,last_name, email, role_id) VALUES ('mathieu_carneiro', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'mathieu', 'carneiro', 'mathieu.carneiro@icloud.com',1);
INSERT INTO user (username, passwd_hash, first_name,last_name, email, role_id) VALUES ('ratroi','7110eda4d09e062aa5e4a390b0a572ac0d2c0220','jonas','harbarth','lalala@gmail.com',1);
INSERT INTO user (username, passwd_hash, first_name,last_name,email, role_id) VALUES ('pizzaiolo','7110eda4d09e062aa5e4a390b0a572ac0d2c0220','sean','perazzolo','lolipop@gmail.com',1);

