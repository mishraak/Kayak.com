DROP DATABASE  IF EXISTS KAYAK;
CREATE DATABASE KAYAK;

USE KAYAK;

DROP TABLE IF EXISTS USERS;
DROP TABLE IF EXISTS FLIGHTS;
DROP TABLE IF EXISTS ROOMS;
DROP TABLE IF EXISTS CLASSES;
DROP TABLE IF EXISTS HOTELS;


CREATE TABLE USERS (
    USER_ID INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    FIRST_NAME VARCHAR(30) NOT NULL,
    LAST_NAME VARCHAR(30) NOT NULL,
    EMAIL VARCHAR(50) NOT NULL,
    ADDRESS VARCHAR(50) NOT NULL,
    CITY VARCHAR(50) NOT NULL,
    STATE VARCHAR(50) NOT NULL,
    ZIP_CODE INT(6) NOT NULL,
    PHONE INT(15) NOT NULL,
    TRIP_ID INT(15),
    IMAGE VARCHAR(500),
    CREDIT_CARD INT(20) NOT NULL,
    USER_STATUS INT(1) NOT NULL
);



CREATE TABLE HOTELS (
    HOTEL_ID INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    HOTEL_NAME VARCHAR(30) NOT NULL,    
    ADDRESS VARCHAR(50) NOT NULL,
    CITY VARCHAR(50) NOT NULL,
    STATE VARCHAR(50) NOT NULL,
    ZIP_CODE INT(6) NOT NULL,
    STARS INT(5) NOT NULL,
    ROOMS INT(3) NOT NULL,
    RATINGS INT(5) NOT NULL,
    REVIEWS INT(1) NOT NULL
);


CREATE TABLE ROOMS (
    ROOM_ID INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    ROOM_TYPE VARCHAR(30) NOT NULL,     
    PRICE INT(5) NOT NULL,    
    HOTEL_ID INT(6) UNSIGNED 
);




ALTER TABLE ROOMS
ADD FOREIGN KEY (HOTEL_ID) REFERENCES HOTELS(HOTEL_ID) 
ON DELETE CASCADE;




CREATE TABLE FLIGHTS (
    FLIGHT_ID INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    AIRLINE VARCHAR(30) NOT NULL,   
    DEPARTURE TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ARRIVAL TIMESTAMP  DEFAULT CURRENT_TIMESTAMP,
    ORIGIN VARCHAR(50) NOT NULL,
    DETINATION VARCHAR(50) NOT NULL
);



CREATE TABLE CLASSES (
    CLASS_ID INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    FLIGHT_ID INT(6) UNSIGNED NOT NULL,
    CLASS_NAME VARCHAR(30) NOT NULL,    
    PRICES INT(5) NOT NULL
);

ALTER TABLE CLASSES
ADD FOREIGN KEY (FLIGHT_ID) REFERENCES FLIGHTS(FLIGHT_ID) 
ON DELETE CASCADE;



CREATE TABLE CARS (
    CAR_ID INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,    
    CAR_NAME VARCHAR(30) NOT NULL,  
    CAR_TYPE VARCHAR(20) NOT NULL,  
    PRICE INT(5) NOT NULL,
    DETAILS VARCHAR(500)
);


CREATE TABLE BILLING (
    BILLING_ID INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,    
    BILLING_DATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP,   
    BOOKING_TYPE VARCHAR(20) NOT NULL,  
    AMOUNT INT(5) NOT NULL,
    USER_ID INT(6) UNSIGNED 
);

ALTER TABLE BILLING
ADD FOREIGN KEY (USER_ID) REFERENCES USERS(USER_ID) 
ON DELETE CASCADE;


CREATE TABLE ADMINS (
    USER_ID INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    FIRST_NAME VARCHAR(30) NOT NULL,
    LAST_NAME VARCHAR(30) NOT NULL,
    EMAIL VARCHAR(50) NOT NULL,
    ADDRESS VARCHAR(50) NOT NULL,
    CITY VARCHAR(50) NOT NULL,
    STATE VARCHAR(50) NOT NULL,
    ZIP_CODE INT(6) NOT NULL
);



ALTER TABLE CLASSES 
DROP FOREIGN KEY CLASSES_IBFK_1;

ALTER TABLE FLIGHTS
CHANGE FLIGHT_ID FLIGHT_ID VARCHAR(6),
CHANGE DETINATION DESTINATION VARCHAR(50);

ALTER TABLE CLASSES
CHANGE FLIGHT_ID FLIGHT_ID VARCHAR(6);

ALTER TABLE CLASSES
ADD FOREIGN KEY (FLIGHT_ID) REFERENCES FLIGHTS(FLIGHT_ID) 
ON DELETE CASCADE;

ALTER TABLE USERS ADD COLUMN PASSWORD VARCHAR(300) NOT NULL;


ALTER TABLE CARS ADD COLUMN LOCATION VARCHAR(300) NOT NULL


ALTER TABLE ROOMS 
DROP FOREIGN KEY ROOMS_IBFK_1;

ALTER TABLE ROOMS
DROP HOTEL_ID;

ALTER TABLE ROOMS
ADD COLUMN HOTEL_ID VARCHAR(6);

ALTER TABLE HOTELS
CHANGE HOTEL_ID HOTEL_ID VARCHAR(6);

ALTER TABLE ROOMS
ADD FOREIGN KEY (HOTEL_ID) REFERENCES HOTELS(HOTEL_ID) 
ON DELETE CASCADE;


ALTER TABLE CARS ADD COLUMN LOCATION VARCHAR(300) NOT NULL;

