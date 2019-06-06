use real_estate;
#Індекси таблиць user i estate
SHOW INDEX FROM estate;
SHOW INDEX FROM user;

#Cтворимо індекс для поля login на таблиці user
CREATE INDEX userINDX3 ON user (userID, login);
SHOW INDEX FROM user;

#Виконаємо аналіз виконання складного запиту (Вивести операції над нерухомістю з юзерами для яких роль User or Moderator) з однієї з попередніх робіт використовуючи EXPLAIN
EXPLAIN SELECT  real_estate.estate.estateID, real_estate.estate.type, real_estate.user_operation.operationID, real_estate.user.login, real_estate.role.role_name from real_estate.estate, real_estate.role,
(real_estate.user INNER JOIN real_estate.user_role) inner join real_estate.user_operation on real_estate.user.userID = real_estate.user_role.userID
and real_estate.user_operation.userID = user.userID where real_estate.user_role.roleID = real_estate.role.roleID and real_estate.role.role_name in ('User', 'Moderator')
                                                      and real_estate.user_operation.estateID = real_estate.estate.estateID;

EXPLAIN SELECT STRAIGHT_JOIN  real_estate.estate.estateID, real_estate.estate.type, real_estate.user_operation.operationID, real_estate.user.login, real_estate.role.role_name from real_estate.estate, real_estate.role,
(real_estate.user INNER JOIN real_estate.user_role) inner join real_estate.user_operation on real_estate.user.userID = real_estate.user_role.userID
and real_estate.user_operation.userID = user.userID where real_estate.user_role.roleID = real_estate.role.roleID and real_estate.role.role_name in ('User', 'Moderator')
                                                      and real_estate.user_operation.estateID = real_estate.estate.estateID;