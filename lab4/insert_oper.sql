INSERT INTO real_estate.role VALUES (1, "Admin", "full");

INSERT INTO  real_estate.role
VALUES (NULL, "Moderator", "read, write, changeown"),
(NULL,"Group2", "read, write, changeown"),
(NULL, "Guest", "read");

SHOW VARIABLES LIKE "secure_file_priv";

LOAD DATA INFILE '/var/lib/mysql-files/operation.tbl' INTO TABLE real_estate.operation LINES
TERMINATED BY '\r\n';