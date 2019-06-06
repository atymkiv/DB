use real_estate;

CREATE FUNCTION real_estate_encode (pass varchar(48))
RETURNS varchar(50)
RETURN sha1(pass);

create function mycms_encode(pass varchar(50))
returns varchar(50)
return des_encrypt(pass);

CREATE FUNCTION mycms_decode (pass TINYBLOB)
RETURNS varchar(48)
RETURN des_decrypt(pass);

#Вивести кількість нерухомостей у районі та середню вартість за квадратний метр
DELIMITER //
CREATE PROCEDURE real_estate_district_count (IN districtName varCHAR(19), IN operationtType varchar(10))
BEGIN
        CREATE TABLE IF NOT EXISTS real_estate.estate_stats (disrtict CHAR(20), averagePrice INT UNSIGNED);
    INSERT INTO real_estate.estate_stats SELECT real_estate.estate.district, avg(real_estate.estate.price/real_estate.estate.size) as averagePricesPerM2
          from real_estate.estate inner join real_estate.operation on real_estate.estate.operation_id = real_estate.operation.operationID and real_estate.operation.type = operationtType
    and real_estate.estate.district = districtName
 group by district;
END//
DELIMITER ;

call real_estate_district_count('Levandivka', 'buy');

select * from real_estate.stats;

SELECT login, mycms_encode(password) FROM real_estate.user;

SELECT login, mycms_decode(mycms_encode(password)) FROM real_estate.user;

SELECT login, real_estate_encode(password) FROM real_estate.user;

