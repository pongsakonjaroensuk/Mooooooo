# ---------------------------------------------------------------------- #
# Script generated with: DeZign for Databases V9.0.0                     #
# Target DBMS:           MySQL 5                                         #
# Project file:          Moooo (1).dez                                   #
# Project name:                                                          #
# Author:                                                                #
# Script type:           Database creation script                        #
# Created on:            2015-11-26 22:47                                #
# ---------------------------------------------------------------------- #


# ---------------------------------------------------------------------- #
# Add tables                                                             #
# ---------------------------------------------------------------------- #

# ---------------------------------------------------------------------- #
# Add table "Productdetail"                                              #
# ---------------------------------------------------------------------- #

CREATE TABLE `Productdetail` (
    `Code_Name` VARCHAR(40) NOT NULL,
    `Brand` VARCHAR(40),
    `Version` VARCHAR(40),
    `Price` VARCHAR(40),
    PRIMARY KEY (`Code_Name`)
);

# ---------------------------------------------------------------------- #
# Add table "Sender"                                                     #
# ---------------------------------------------------------------------- #

CREATE TABLE `Sender` (
    `S_Name` VARCHAR(40),
    `S_Adderss` VARCHAR(200),
    `Company` VARCHAR(40),
    `Deliver` VARCHAR(40),
    `S_Id` VARCHAR(40) NOT NULL,
    PRIMARY KEY (`S_Id`)
);

# ---------------------------------------------------------------------- #
# Add table "Deliverdetail"                                              #
# ---------------------------------------------------------------------- #

CREATE TABLE `Deliverdetail` (
    `Code_Number` CHAR(40) NOT NULL,
    `Customer_Receiver` VARCHAR(40),
    `Customer_Name` VARCHAR(40),
    `Customer_Adderss` VARCHAR(40),
    `Code_Name` VARCHAR(40),
    `S_Id` VARCHAR(40),
    PRIMARY KEY (`Code_Number`)
);

# ---------------------------------------------------------------------- #
# Add table "customer"                                                   #
# ---------------------------------------------------------------------- #

INSERT INTO <customer>
VALUES (<Pongsakon Jaroemsuk,bag,17/4 Village No.5 Bamroongrat Road Pibulsongkram Sub-district Muang District Chiang Rai,1001,9001>)
CREATE TABLE `customer` (
    `C_Name` VARCHAR(40),
    `C_Product` VARCHAR(40),
    `C_Address` VARCHAR(200),
    `C_Id` VARCHAR(40) NOT NULL,
    `S_Id` VARCHAR(40) NOT NULL,
    PRIMARY KEY (`C_Id`, `S_Id`)
);

# ---------------------------------------------------------------------- #
# Add table "Paid"                                                       #
# ---------------------------------------------------------------------- #

CREATE TABLE `Paid` (
    `Account_Number` VARCHAR(40) NOT NULL,
    `amount` VARCHAR(40),
    `C_Id` VARCHAR(40) NOT NULL,
    `S_Id` VARCHAR(40) NOT NULL,
    PRIMARY KEY (`Account_Number`, `C_Id`, `S_Id`)
);

# ---------------------------------------------------------------------- #
# Add foreign key constraints                                            #
# ---------------------------------------------------------------------- #

ALTER TABLE `customer` ADD CONSTRAINT `Sender_customer` 
    FOREIGN KEY (`S_Id`) REFERENCES `Sender` (`S_Id`);

ALTER TABLE `Deliverdetail` ADD CONSTRAINT `Productdetail_Deliverdetail` 
    FOREIGN KEY (`Code_Name`) REFERENCES `Productdetail` (`Code_Name`);

ALTER TABLE `Deliverdetail` ADD CONSTRAINT `Sender_Deliverdetail` 
    FOREIGN KEY (`S_Id`) REFERENCES `Sender` (`S_Id`);

ALTER TABLE `Paid` ADD CONSTRAINT `customer_Paid` 
    FOREIGN KEY (`C_Id`, `S_Id`) REFERENCES `customer` (`C_Id`,`S_Id`);
