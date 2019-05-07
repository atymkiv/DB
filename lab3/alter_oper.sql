alter table real_estate.user 
add column modifyDate date;



alter table real_estate.user 
add column surname nvarchar(50) NOT NULL;

alter table real_estate.user 
modify column modifyDate datetime;

alter table real_estate.user 
modify column login nvarchar(50) NOT NULL unique;

alter table real_estate.user
add constraint UQ_Email unique (email);

alter table real_estate.user drop column modifyDate;


alter table real_estate.user_operation
modify column userID int unsigned not null unique,
modify column estateID int unsigned not null unique;



