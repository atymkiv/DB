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


SELECT login, mycms_encode(password) FROM real_estate.user;

SELECT login, mycms_decode(mycms_encode(password)) FROM real_estate.user;

SELECT login, real_estate_encode(password) FROM real_estate.user;

