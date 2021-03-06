CREATE TABLE AUTHOR(
 NAME VARCHAR(255) PRIMARY KEY NOT NULL,
 ADDRESS VARCHAR(255) UNIQUE NOT NULL,
 URL VARCHAR(255) NOT NULL,
);
CREATE TABLE PUBLISHER
(
NAME VARCHAR(255) PRIMARY KEY NOT NULL,
ADDRESS VARCHAR(255) NOT NULL,
PHONE VARCHAR(255) NOT NULL,
URL varchar(255) NOT NULL
);

CREATE TABLE BOOK(
ISBN VARCHAR(255),
PUBLISHERNAME VARCHAR(255),
YEAR INTEGER(10) NOT NULL,
TITLE VARCHAR(255) NOT NULL,
PRICE NUMERIC(19,0) NOT NULL,
AUTHORNAME VARCHAR(255) REFERENCES AUTHOR(NAME),
AUTHORADDRESS VARCHAR(255) REFERENCES AUTHOR(ADDRESS),
PUBLISHERNAME VARCHAR(255) REFERENCES PUBLISHER(NAME),
PRIMARY KEY(ISBN)
);

CREATE TABLE CUSTOMER
(
EMAIL VARCHAR(255) PRIMARY KEY,
NAME VARCHAR(255) NOT NULL,
PHONE VARCHAR(255) NOT NULL,
ADDRESS VARCHAR(255) NOT NULL
);

CREATE TABLE SHOPPINGBASKET
(
ID INTEGER PRIMARY KEY,
CUSTOMEREMAIL VARCHAR(255) REFERENCES CUSTOMER(EMAIL)
);

CREATE TABLE SHOPPINGBASKET_BOOK
(
 SHOPPINGBASKETID INTEGER REFERENCES SHOPPINGBASKET(ID),
 BOOKISBN VARCHAR(255) REFERENCES BOOK(ISBN),
 COUNT INTEGER NOT NULL
);
CREATE TABLE WAREHOUSE
(
  CODE INTEGER PRIMARY KEY,
  PHONE VARCHAR(255) NOT NULL,
  ADDRESS VARCHAR(255) NOT NULL
);
CREATE TABLE WAREHOUSE_BOOK
(
 WAREHOUSECODE INTEGER REFERENCES WAREHOUSE(CODE),
 BOOKISBN VARCHAR(255) REFERENCES BOOK(ISBN),
 COUNT INTEGER NOT NULL
);
 