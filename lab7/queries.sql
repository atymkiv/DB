SELECT password FROM real_estate.user
WHERE userID = 2;

#LEFT JOIN
SELECT real_estate.user.userID, real_estate.user.login, real_estate.user_operation.estateID
from real_estate.user RIght JOIN real_estate.user_operation ON user.userID = user_operation.userID;

#INNER JOIN
SELECT real_estate.user.login, real_estate.role.role_name from real_estate.role, real_estate.user inner join real_estate.user_role on real_estate.user_role.userID = real_estate.user.userID
where real_estate.user_role.roleID = real_estate.role.roleID and real_estate.role.roleID in (select roleID from real_estate.role where role_name = 'User');

SELECT  real_estate.estate.estateID, real_estate.estate.type, real_estate.user_operation.operationID, real_estate.user.login, real_estate.role.role_name from real_estate.estate, real_estate.role,
(real_estate.user INNER JOIN real_estate.user_role) inner join real_estate.user_operation on real_estate.user.userID = real_estate.user_role.userID
and real_estate.user_operation.userID = user.userID where real_estate.user_role.roleID = real_estate.role.roleID and real_estate.role.role_name in ('User', 'Moderator')
                                                      and real_estate.user_operation.estateID = real_estate.estate.estateID

SELECT userID, login from real_estate.user
where not exists(select * from real_estate.user_operation where real_estate.user_operation.userID = real_estate.user.userID)