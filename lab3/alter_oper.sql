alter table real_estate.user 
add column modifyDate date;

alter table real_estate.user 
modify column modifyDate datetime;

alter table real_estate.user
add constraint UQ_Email unique (email);

alter table real_estate.user drop column modifyDate;