create table users
(
    id        serial unique primary key,
    username  varchar(140)        not null,
    firstName varchar(200)        not null,
    lastName  varchar(200)        not null,
    email     varchar(200) unique not null,
    createdAt timestamp           not null default now()
);

create table user_auth
(
    id        integer references users (id)            not null,
    email     varchar(200) references users (email) not null,
    password  text                                  not null,
    createdAt timestamp                             not null default now()
);

create table cities
(
    id   serial primary key,
    name varchar(200) not null
);

create table locations
(
    id        serial primary key,
    name      varchar(250)                not null,
    cityId    integer references cities (id) not null,
    createdAt timestamp                   not null default now()
);

create table pairs
(
    firstUserId    integer references users (id) not null,
    secondUserId   integer references users (id) not null,
    visitTimestamp timestamp                  not null,
    pairName       varchar(250)               not null,
    createdAt      timestamp                  not null default now(),
    isCancelled    boolean                             default false,
    cancelledBy    integer references users (id)
);

create table pair_requests
(
    id         uuid primary key,
    userId     integer references users (id)     not null,
    locationId integer references locations (id) not null,
    visitTime  tsrange                        not null
);