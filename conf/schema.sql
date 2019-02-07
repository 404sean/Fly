CREATE TABLE user
(
	username VARCHAR(64) NOT NULL,
	passwd_hash VARCHAR(64) NOT NULL,
	first_name VARCHAR(64) DEFAULT NULL,
	last_name VARCHAR(64) DEFAULT NULL,
	email VARCHAR(128) DeFAULT NULL
); 

INSERT INTO user (username, passwd_hash, first_name,last_name, email) VALUES ('mathieu_carneiro', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'mathieu', 'carneiro', 'mathieu.carneiro@icloud.com');

INSERT INTO user (username, passwd_hash, first_name,last_name, email) VALUES ('ratroi','7110eda4d09e062aa5e4a390b0a572ac0d2c0220','jonas','harbarth','lalala@gmail.com');

INSERT INTO user (username, passwd_hash, first_name,last_name,email) VALUES ('pizzaiolo','7110eda4d09e062aa5e4a390b0a572ac0d2c0220','sean','perazzolo','lolipop@gmail.com');