CREATE DATABASE real_estate;

CREATE TABLE real_estate.user (
	userID INT UNSIGNED NOT NULL AUTO_INCREMENT, 
	name nvarchar(50) NOT NULL,
	login nvarchar(50) NOT NULL,
	password nvarchar(50) NOT NULL,
	created date,
	email nvarchar(50) NOT NULL,
	PRIMARY KEY (userID)
);

CREATE TABLE real_estate.role (
roleID SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
role_name CHAR(19) NOT NULL,
permissions VARCHAR(255) NOT NULL,
PRIMARY KEY (roleID) 
);

CREATE TABLE real_estate.user_role(
	userID int unsigned not null,
    roleID SMALLINT unsigned not null,
    CONSTRAINT const_role foreign key (roleID) references real_estate.role (roleID)
    ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT const_user foreign key (userID) references real_estate.user (userID)
    ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE real_estate.operation (
operationID INT UNSIGNED NOT NULL AUTO_INCREMENT, 
type nvarchar(50) NOT NULL,
PRIMARY KEY (operationID) 
);


Drop table real_estate.user_operation;

CREATE TABLE real_estate.user_operation(
	userID int unsigned not null,
    operationID int unsigned not null,
    estateID int unsigned not null,
    CONSTRAINT const_usop_operation foreign key (operationID) references real_estate.operation (operationID)
    ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT const_usop_user foreign key (userID) references real_estate.user (userID)
    ON DELETE NO ACTION ON UPDATE NO ACTION,
    constraint fk_const_usop_estate foreign key (estateID) references real_estate.estate (estateID)
	ON DELETE NO ACTION ON UPDATE NO ACTION,
    PRIMARY KEY (userID, operationID, estateID) 
);

CREATE TABLE real_estate.estate (
	estateID INT UNSIGNED NOT NULL AUTO_INCREMENT, 
	type nvarchar(50) NOT NULL,
	size float,
	number_of_bedrooms int,
	number_of_floors int,
	operation_id int unsigned not null,
    owner_id int unsigned not null,
    condit nvarchar(50),
    PRIMARY KEY (estateID),
    constraint owner_estate foreign key (owner_id) references real_estate.user (userID) ON DELETE NO ACTION ON
UPDATE NO ACTION,
	constraint operation_estate foreign key (operation_id) references real_estate.operation (operationID) ON DELETE NO ACTION ON
UPDATE NO ACTION
);


