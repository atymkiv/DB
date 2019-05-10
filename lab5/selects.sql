CREATE TABLE real_estate.user1 AS SELECT userID, login, created
FROM user WHERE created < '2019-03-15';

CREATE TABLE real_estate.user2 AS SELECT userID, login, created
FROM user WHERE created < '2019-05-03';

#Union
SELECT * FROM user1
    UNION SELECT * FROM user2;

#Перетин user1 i user2
SELECT * FROM user1
WHERE userID IN (SELECT userID FROM user2);

#Різниця user 2 i user1
SELECT * FROM user2
WHERE userID NOT IN (SELECT userID FROM user1);

#Декартовий добуток
SELECT * FROM user1, user2;