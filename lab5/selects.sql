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

select userID from real_estate.user_role where roleID = 3;

select userID, real_estate.estate.estateID, type from real_estate.user_operation, real_estate.estate where real_estate.estate.estateID = real_estate.user_operation.estateID in (
select estateID from real_estate.user_operation where userID in(select userID from real_estate.user_role where roleID = 3));



select * from real_estate.user_operation where real_estate.user_operation.estateID in (
select estateID from real_estate.user_operation where userID in(select userID from real_estate.user_role where roleID = 3));

select real_estate.estate.estateID, type, owner_id from real_estate.estate where real_estate.estate.estateID in (
select estateID from real_estate.user_operation where userID in(select userID from real_estate.user_role where roleID = 3));

select type from real_estate.estate, real_estate.user_operation, real_estate.user, real_estate.user_role where real_estate.estate.estateID = real_estate.user_operation.estateID
and real_estate.user_operation.userID=real_estate.user.userID and real_estate.user.userID=real_estate.user_role.userID and real_estate.user_role.roleID in(select roleID from real_estate.role where role_name = 'User');


