use real_estate;

CREATE
TRIGGER user_password BEFORE INSERT
    ON real_estate.user FOR
EACH ROW
SET NEW.password = real_estate_encode(NEW.password);


 INSERT INTO real_estate.user (login, password, created, email, firstName, lastName, deleted_at)
        VALUES ( 'aleksa', 'foobar', '2019-05-23', 'aleksa@gmail.com', 'Andriy', 'Alekseev', null);