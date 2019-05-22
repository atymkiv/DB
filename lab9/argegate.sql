#Визначити кількість нерухомостей у кожному районі
Select district, count(real_estate.estate.estateID) as numberOfEstates from real_estate.estate
GROUP BY district;

#Визначити кількість нерухомостей на продаж у кожному районі
SELECT count(real_estate.estate.estateID) as numberOfEstates, real_estate.estate.district, real_estate.operation.type as operationType
          from real_estate.estate inner join real_estate.operation on real_estate.estate.operation_id = real_estate.operation.operationID and real_estate.estate.type = 'residential' and real_estate.operation.type = 'buy'
 group by district;

#Визначити середню вартість квадратного метра для нерухомості на продаж у кожному районі
SELECT real_estate.estate.district, avg(real_estate.estate.price/real_estate.estate.size) as averagePricesPerM2
          from real_estate.estate inner join real_estate.operation on real_estate.estate.operation_id = real_estate.operation.operationID and real_estate.operation.type = 'buy'
 group by district
order by averagePricesPerM2 DESC;

