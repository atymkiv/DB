use real_estate;

CREATE
TRIGGER user_password BEFORE INSERT
    ON real_estate.user FOR
EACH ROW
SET NEW.password = real_estate_encode(NEW.password);


INSERT INTO real_estate.user (login, password, created, email, firstName, lastName, deleted_at)
        VALUES ( 'olek', '12345', '2019-05-25', 'olek@gmail.com', 'Oleksandr', 'Kravchuk', null);