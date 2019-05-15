SELECT userId, login, firstName, lastName from real_estate.user
where lastName like '%iy' order by login desc ;

select login, created from real_estate.user order by created desc limit 3;

select real_estate.estate.estateID, real_estate.estate.type, real_estate.operation.type as operationType
from (real_estate.estate inner join real_estate.user_operation) inner join real_estate.operation
on real_estate.estate.estateID=real_estate.user_operation.estateID
       and real_estate.user_operation.operationID=real_estate.operation.operationID order by estateID;

