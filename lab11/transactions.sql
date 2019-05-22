use real_estate;

#Transaction fail
START TRANSACTION;
    INSERT INTO real_estate.user (login, password, created, email, firstName, lastName, deleted_at)
        VALUES ('user8', 'qwerty', NOW(), 'uesr8@gmail.com', 'N', 'L', null);
    INSERT INTO real_estate.user_role (userID, roleID) VALUES (8, 3);
    INSERT INTO real_estate.user (login, password, created, email, firstName, lastName, deleted_at)
        VALUES ('user8', 'qwerty', NOW(), 'uesr9@gmail.com', 'A', 'I', null);
    INSERT INTO real_estate.user_role (userID, roleID) VALUES (8, 4);
COMMIT;

# Transaction succeed
START TRANSACTION;
    INSERT INTO real_estate.user (userID, login, password, created, email, firstName, lastName, deleted_at)
        VALUES (8, 'jarvizz', 'asdewf', '2019-05-23', 'jarwizz@gmail.com', 'Rostyslav', 'Hlynka', null);
    INSERT INTO real_estate.user_role (userID, roleID) VALUES (8, 3);
    INSERT INTO real_estate.user (userID, login, password, created, email, firstName, lastName, deleted_at)
        VALUES (9, 'vasarostik', 'qwedsfwe', '2019-01-23', 'vasarostik@gmail.com', 'Rostyslav', 'Vasylyk', null);
    INSERT INTO real_estate.user_role (userID, roleID) VALUES (9, 2);
COMMIT;

