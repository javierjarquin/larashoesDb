create database laraShoesDB;
use laraShoesDB;
create table brand
(
  id   int(10) auto_increment,
  name varchar(150) not null,
  primary key(id)
);

create table model
(
  id int auto_increment,
  brandId int not null,
  name varchar(150) not null,
  version varchar(150) not null,
  gender varchar(2),
  primary key(id),
  foreign key(brandId) references brand(id)
);

create table user
(
  id int auto_increment,
  name varchar(100) not null,
  lastName varchar(150) not null,
  email varchar(150) not null,
  phone varchar(12) not null,
  login varchar(100) unique not null,
  password varchar(1000) not null,
  rol varchar(3),
  primary key(id)
); 
insert into user 
  (id, name, lastName, email, phone, login, password, rol) 
  values
  (null, 'Javier', 'Jarquin', 'javier.jarquin.chooc@gmail.com', '9982129593', 'jjavier', 'lara1234*', 'ADM');

create table session
(
  id int auto_increment,
  userId int not null,
  creationDate datetime not null,
  ip varchar(10),
  description varchar(300),
  primary key(id)
);

create table product
(
  id int auto_increment,
  name varchar(150) not null,
  description varchar(150) not null,
  modelId int not null,
  typeProduct varchar(2) not null,
  Status Varchar(2) not null,
  unit varchar(2) not null,
  primary key(id),
  foreign key(modelId) references model(id)
);

create table provider
(
  id int auto_increment,
  commercialName varchar(200) not null,
  fiscalName varchar(200) not null,
  rfc varchar(12),
  address varchar(500), 
  phone varchar(12) not null,
  isCredit boolean,
  creditDay int,
  typeProvider varchar(150) not null,
  account varchar(25),
  primary key(id)
);

create table orders
(
  id int auto_increment,
  code varchar(100) not null,
  creationDate datetime not null,
  status varchar(2) not null,
  totalOrder double not null,
  guide varchar(20),
  totalImport double not null,
  arrivalDate datetime,
  providerId int not null,
  creationUserId int not null,
  primary key(id),
  foreign key(providerId) references provider(id),
  foreign key(creationUserId) references user(id)
);

create table orderProduct
(
  id int auto_increment,
  productId int not null,
  orderId int not null,
  creationUserId int not null,
  quantity double not null,
  unit varchar(2) not null,
  unitCost double not null,
  totalCost double not null,
  guide varchar(20),
  arrivalDate datetime,
  isShippet boolean,
  isReceive boolean,
  quoteCharge boolean,
  isPayment boolean,
  primary key(id),
  foreign key(productId) references product(id),
  foreign key(orderId) references orders(id),
  foreign key(creationUserId) references user(id)
);
