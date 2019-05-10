INSERT INTO real_estate.role VALUES (1, "Admin", "full");

INSERT INTO  real_estate.role
VALUES (NULL, "Moderator", "read, write, changeown"),
(NULL,"Group2", "read, write, changeown"),
(NULL, "Guest", "read");


INSERT INTO  real_estate.user
VALUE ("1", "atyma", "123", NULL, "atymkiv@gmail.com", "Andriy", "Tymkiv", NULL);

INSERT INTO  real_estate.user
       values ("2", "ljoha", "123", "2019-12-05", "ljoha@gmail.com", "Olexii", "Sechko", NULL),
       ("3", "a.vui", "123", "2019-12-05", "vui@gmail.com", "Andriy", "Vui", NULL);
INSERT INTO real_estate.user
VALUES ("4", "viktor", "123", "2019-10-04", "viktor@gmail.com", "Viktor", "Rachitskiy", NULL),
        ("5", "sasha", "123", "2019-5-05", "sasha@gmail.com", "Olexandr", "Kravchuk", NULL);
INSERT INTO real_estate.user
    VALUE ("7", "losa", "123", NOW(), "los@gmail.com", "Nazar", "Los", NULL);
SHOW VARIABLES LIKE "secure_file_priv";

LOAD DATA INFILE '/var/lib/mysql-files/operation.tbl' INTO TABLE real_estate.operation
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n';

LOAD DATA INFILE '/var/lib/mysql-files/estate.tbl' INTO TABLE real_estate.estate
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n';

LOAD DATA INFILE '/var/lib/mysql-files/user_operation.tbl' INTO TABLE real_estate.user_operation
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n';

LOAD DATA INFILE '/var/lib/mysql-files/user_role.tbl' INTO TABLE real_estate.user_role
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n';

SELECT * from real_estate.user;

UPDATE real_estate.user set email="los_nazar@gmail.com" where login ="losa";