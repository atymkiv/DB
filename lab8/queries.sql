SELECT userId, login, firstName, lastName from real_estate.user
where lastName like '%iy' order by login desc ;

select login, created from real_estate.user order by created desc limit 3;

select real_estate.estate.estateID, real_estate.estate.type, real_estate.operation.type as operationType
from (real_estate.estate inner join real_estate.user_operation) inner join real_estate.operation
on real_estate.estate.estateID=real_estate.user_operation.estateID
       and real_estate.user_operation.operationID=real_estate.operation.operationID order by estateID;

SELECT count(real_estate.estate.estateID) as numberOfEstates, real_estate.estate.district, real_estate.operation.type as operationType, avg(real_estate.estate.price/real_estate.estate.size) as averagePricesPerM2
          from real_estate.estate inner join real_estate.operation on real_estate.estate.operation_id = real_estate.operation.operationID and real_estate.estate.type = 'residential' and real_estate.operation.type = 'buy'
 group by district
order by averagePricesPerM2
