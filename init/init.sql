create table operation
(
    operationID int unsigned auto_increment
        primary key,
    type        varchar(50) charset utf8 not null
);

create table role
(
    roleID      smallint(5) unsigned auto_increment
        primary key,
    role_name   char(19)     not null,
    permissions varchar(255) not null
);

create table user
(
    userID     int unsigned auto_increment
        primary key,
    login      varchar(50) charset utf8 not null,
    password   varchar(50) charset utf8 not null,
    created    date                     null,
    email      varchar(50) charset utf8 not null,
    firstName  varchar(50) charset utf8 null,
    lastName   varchar(50) charset utf8 null,
    deleted_at datetime                 null,
    constraint UQ_Email
        unique (email),
    constraint email
        unique (email),
    constraint login
        unique (login)
);

create table estate
(
    estateID           int unsigned auto_increment
        primary key,
    type               varchar(50) charset utf8 not null,
    size               float                    null,
    number_of_bedrooms int                      null,
    number_of_floors   int                      null,
    operation_id       int unsigned             not null,
    owner_id           int unsigned             not null,
    condit             varchar(50) charset utf8 null,
    district           varchar(50)              null,
    price              int                      null,
    constraint operation_estate
        foreign key (operation_id) references operation (operationID),
    constraint owner_estate
        foreign key (owner_id) references user (userID)
);

create table user1
(
    userID  int unsigned default 0   not null,
    login   varchar(50) charset utf8 not null,
    created date                     null
);

create table user2
(
    userID  int unsigned default 0   not null,
    login   varchar(50) charset utf8 not null,
    created date                     null
);

create table user_operation
(
    userID      int unsigned not null,
    operationID int unsigned not null,
    estateID    int unsigned not null,
    primary key (userID, operationID, estateID),
    constraint const_usop_operation
        foreign key (operationID) references operation (operationID),
    constraint const_usop_user
        foreign key (userID) references user (userID),
    constraint fk_const_usop_estate
        foreign key (estateID) references estate (estateID)
);

create table user_role
(
    userID int unsigned         not null,
    roleID smallint(5) unsigned not null,
    constraint const_role
        foreign key (roleID) references role (roleID),
    constraint const_user
        foreign key (userID) references user (userID)
);

