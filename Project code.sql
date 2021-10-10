create database project;
use project;

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema project
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema project
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `project` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs ;
USE `project` ;

-- -----------------------------------------------------
-- Table `project`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`Customer` (
    `Customer_ID` INT NOT NULL,
    `Customer_Name` VARCHAR(45) NULL,
    `Customer_Mob` VARCHAR(45) NULL,
    PRIMARY KEY (`Customer_ID`)
)  ENGINE=INNODB;


-- -----------------------------------------------------
-- Table `project`.`Branch`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`Branch` (
    `Branch_ID` INT NOT NULL,
    `Branch_Name` VARCHAR(45) NULL,
    `IFIC` INT NULL,
    `Branch_Location` VARCHAR(45) NULL,
    PRIMARY KEY (`Branch_ID`)
)  ENGINE=INNODB;


-- -----------------------------------------------------
-- Table `project`.`Account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`Account` (
  `Account_No.` INT NOT NULL,
  `Account_Type` VARCHAR(45) NULL,
  `Account_Balance` INT NULL,
  `Customer_Customer_ID` INT NOT NULL,
  `Branch_Branch_ID` INT NOT NULL,
  PRIMARY KEY (`Account_No.`),
  INDEX `fk_Account_Customer_idx` (`Customer_Customer_ID` ASC) VISIBLE,
  INDEX `fk_Account_Branch1_idx` (`Branch_Branch_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Account_Customer`
    FOREIGN KEY (`Customer_Customer_ID`)
    REFERENCES `project`.`Customer` (`Customer_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Account_Branch1`
    FOREIGN KEY (`Branch_Branch_ID`)
    REFERENCES `project`.`Branch` (`Branch_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project`.`Loan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`Loan` (
  `Loan_No.` INT NOT NULL,
  `Loan_Amount` INT NULL,
  `Customer_Customer_ID` INT NOT NULL,
  `Branch_Branch_ID` INT NOT NULL,
  PRIMARY KEY (`Loan_No.`),
  INDEX `fk_Loan_Customer1_idx` (`Customer_Customer_ID` ASC) VISIBLE,
  INDEX `fk_Loan_Branch1_idx` (`Branch_Branch_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Loan_Customer1`
    FOREIGN KEY (`Customer_Customer_ID`)
    REFERENCES `project`.`Customer` (`Customer_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Loan_Branch1`
    FOREIGN KEY (`Branch_Branch_ID`)
    REFERENCES `project`.`Branch` (`Branch_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project`.`Installment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`Installment` (
    `Installment_No.` INT NOT NULL,
    `Installment_Amount` INT NULL,
    `Installment_Date` DATETIME NULL,
    PRIMARY KEY (`Installment_No.`)
)  ENGINE=INNODB;


-- -----------------------------------------------------
-- Table `project`.`Loan_has_Installment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`Loan_has_Installment` (
  `Loan_Loan_No.` INT NOT NULL,
  `Installment_Installment_No.` INT NOT NULL,
  PRIMARY KEY (`Loan_Loan_No.`, `Installment_Installment_No.`),
  INDEX `fk_Loan_has_Installment_Installment1_idx` (`Installment_Installment_No.` ASC) VISIBLE,
  INDEX `fk_Loan_has_Installment_Loan1_idx` (`Loan_Loan_No.` ASC) VISIBLE,
  CONSTRAINT `fk_Loan_has_Installment_Loan1`
    FOREIGN KEY (`Loan_Loan_No.`)
    REFERENCES `project`.`Loan` (`Loan_No.`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Loan_has_Installment_Installment1`
    FOREIGN KEY (`Installment_Installment_No.`)
    REFERENCES `project`.`Installment` (`Installment_No.`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


insert into customer values (1, 'Zahid', '018********');
insert into customer values (2, 'Tanvir', '019********');
insert into customer values (3, 'Rony', '013********');
insert into customer values (4, 'Kafi', '015********');
insert into customer values (5, 'Leo', '012********');
insert into customer values (6, 'Shawn', '019********');
insert into customer values (7, 'Ruhi', '014********');
insert into customer values (8, 'Rajib', '015********');
insert into customer values (9, 'Hasan', '014********');

insert into branch values (1, 'Mirpur_Br', 8764156, 'Dhaka');
insert into branch values (2, 'Gazipur_Br', 6543132, 'Gazipur');
insert into branch values (3, 'Uttara_Br', 5656413, 'Uttara');
insert into branch values (4, 'Mollartek_Br', 2654123, 'Dhaka');
INSERT INTO `project`.`branch` (`Branch_ID`, `Branch_Name`, `IFIC`, `Branch_Location`) VALUES ('5', 'Dhama_Br', '9545313', 'Dhaka');
INSERT INTO `project`.`branch` (`Branch_ID`, `Branch_Name`, `IFIC`, `Branch_Location`) VALUES ('6', 'Uttara_Br', '1564686', 'Uttara');
INSERT INTO `project`.`branch` (`Branch_ID`, `Branch_Name`, `IFIC`, `Branch_Location`) VALUES ('7', 'Gazipur_Br', '5463131', 'Gazipur');
insert into branch values (8, 'Khilkhet_Br', 4135356, 'Dhaka');
insert into branch values (9, 'Dhanmondi_Br', 2654123, 'Dhaka');
insert into branch values (10, 'Mirpur_Br', 5444545, 'Dhaka');
insert into branch values (11, 'Mirpur_Br', 2654123, 'Dhaka');
insert into branch values (12, 'Mirpur_Br', 89873132, 'Dhaka');

insert into account values (1, 'Current', 5656413, 1, 1);
insert into account values (2, 'Saving', 6442136, 2, 2);
insert into account values (3, 'Current', 6562241, 3, 3);
INSERT INTO `project`.`account` (`Account_No`, `Account_Type`, `Account_Balance`, `Customer_Customer_ID`, `Branch_Branch_ID`) VALUES ('4', 'Current', '1235451', '4', '4');
INSERT INTO `project`.`account` (`Account_No`, `Account_Type`, `Account_Balance`, `Customer_Customer_ID`, `Branch_Branch_ID`) VALUES ('5', 'Current', '58763', '5', '5');
INSERT INTO `project`.`account` (`Account_No`, `Account_Type`, `Account_Balance`, `Customer_Customer_ID`, `Branch_Branch_ID`) VALUES ('6', 'Current', '452569', '6', '6');
INSERT INTO `project`.`account` (`Account_No`, `Account_Type`, `Account_Balance`, `Customer_Customer_ID`, `Branch_Branch_ID`) VALUES ('7', 'Current', '42787', '7', '7');
INSERT INTO `project`.`account` (`Account_No`, `Account_Type`, `Account_Balance`, `Customer_Customer_ID`, `Branch_Branch_ID`) VALUES ('8', 'Current', '74556', '8', '8');
INSERT INTO `project`.`account` (`Account_No`, `Account_Type`, `Account_Balance`, `Customer_Customer_ID`, `Branch_Branch_ID`) VALUES ('9', 'Saving', '42563', '9', '9');


insert into loan values (1, 62241, 1, 1);
insert into loan values (2, 73513, 2, 2);
insert into loan values (3, 69124, 3, 3);

insert into installment values (1, 59624, "2017-06-15");
insert into installment values (2, 60862, "2018-11-15");
insert into installment values (2, 60862, "2018-11-15");

insert into loan_has_installment values (1,1);
insert into loan_has_installment values (2,2);
insert into loan_has_installment values (3,3);

SELECT 
    *
FROM
    account;
SELECT 
    *
FROM
    branch;
SELECT 
    *
FROM
    customer;
SELECT 
    *
FROM
    installment;
SELECT 
    *
FROM
    loan;
SELECT 
    *
FROM
    loan_has_installment;


CREATE VIEW Account_View AS
    SELECT 
        *
    FROM
        account;
CREATE VIEW Branch_View AS
    SELECT 
        *
    FROM
        branch;
CREATE VIEW Customer_View AS
    SELECT 
        *
    FROM
        customer;
CREATE VIEW Installment_View AS
    SELECT 
        *
    FROM
        installment;
CREATE VIEW Loan_View AS
    SELECT 
        *
    FROM
        loan;
CREATE VIEW loan_has_installment_View AS
    SELECT 
        *
    FROM
        loan_has_installment;

ALTER TABLE `project`.`installment` 
CHANGE COLUMN `Installment_No.` `Installment_No` INT NOT NULL ;

ALTER TABLE `project`.`loan` 
CHANGE COLUMN `Loan_No.` `Loan_No` INT NOT NULL ;

ALTER TABLE `project`.`account` 
CHANGE COLUMN `Account_No.` `Account_No` INT NOT NULL ;

ALTER TABLE `project`.`loan_has_installment` 
DROP FOREIGN KEY `fk_Loan_has_Installment_Installment1`,
DROP FOREIGN KEY `fk_Loan_has_Installment_Loan1`;
ALTER TABLE `project`.`loan_has_installment` 
CHANGE COLUMN `Loan_Loan_No.` `Loan_Loan_No` INT NOT NULL ,
CHANGE COLUMN `Installment_Installment_No.` `Installment_Installment_No` INT NOT NULL ;
ALTER TABLE `project`.`loan_has_installment` 
ADD CONSTRAINT `fk_Loan_has_Installment_Installment1`
  FOREIGN KEY (`Installment_Installment_No`)
  REFERENCES `project`.`installment` (`Installment_No.`),
ADD CONSTRAINT `fk_Loan_has_Installment_Loan1`
  FOREIGN KEY (`Loan_Loan_No`)
  REFERENCES `project`.`loan` (`Loan_No.`);

-- Customer ID, and Name from 3 tables:
SELECT 
    Customer.Customer_ID, Customer.Customer_Name
FROM
    Customer
        JOIN
    account ON Customer.Customer_ID = Account.Customer_Customer_ID
        JOIN
    branch ON branch.Branch_ID = Account.Branch_Branch_ID;
                                                
CREATE VIEW Customer_ID_Name AS
    SELECT 
        Customer.Customer_ID, Customer.Customer_Name
    FROM
        Customer
            JOIN
        account ON Customer.Customer_ID = Account.Customer_Customer_ID
            JOIN
        branch ON branch.Branch_ID = Account.Branch_Branch_ID;


-- Find out the customer id and name of branch 2:
SELECT 
    Customer.Customer_ID, Customer.Customer_Name
FROM
    Customer
        JOIN
    account ON Customer.Customer_ID = Account.Customer_Customer_ID
        JOIN
    branch ON branch.Branch_ID = Account.Branch_Branch_ID
WHERE
    branch.Branch_ID = 2;

-- List of Customers who have taken loan and their amount:
SELECT 
    customer.Customer_ID,
    customer.Customer_Name,
    loan.Loan_Amount
FROM
    customer
        JOIN
    loan ON Customer.Customer_ID = loan.Customer_Customer_ID;

-- List of Customers and their loan. Besides their installment amount:
SELECT 
    customer.Customer_ID,
    customer.Customer_Name,
    loan.Loan_Amount,
    installment.Installment_Amount
FROM
    customer
        JOIN
    loan ON Customer.Customer_ID = loan.Customer_Customer_ID
        JOIN
    loan_has_installment ON loan_has_installment.Loan_Loan_No = Loan.Loan_No
        JOIN
    Installment ON Installment.Installment_No = loan_has_installment.Installment_Installment_No;
                                                    
-- Name of the Customers and id and their loan and from which branch do they take the loan:
SELECT 
    customer.Customer_ID,
    Customer.Customer_Name,
    loan.loan_Amount,
    branch.Branch_ID
FROM
    customer
        JOIN
    loan ON Customer.Customer_ID = loan.Customer_Customer_ID
        JOIN
    branch ON loan.Branch_Branch_ID = branch.Branch_ID;

-- Number of branch in a city:
SELECT 
    Branch_Location, COUNT(*) AS Count_Branch
FROM
    branch
GROUP BY Branch_Location;
CREATE VIEW Br_Location_Count AS
    SELECT 
        Branch_Location, COUNT(*) AS Count_Branch
    FROM
        branch
    GROUP BY Branch_Location;


-- Customer info from their branch:
SELECT 
    customer.customer_ID,
    Customer.Customer_Name,
    branch.Branch_Location
FROM
    customer
        JOIN
    account ON customer.customer_ID = account.Customer_Customer_ID
        JOIN
    branch ON account.Branch_Branch_ID = branch.Branch_ID;
                                                
-- Customers account no.:
SELECT 
    account.Account_No,
    customer.Customer_ID,
    customer.Customer_Name
FROM
    account
        INNER JOIN
    customer ON account.Account_No = customer.Customer_ID;
                                            
-- Customers id branch id and loan amount:
SELECT 
    customer.Customer_ID,
    customer.Customer_Name,
    branch.Branch_ID,
    loan.Loan_Amount
FROM
    ((loan
    INNER JOIN customer ON loan.Customer_Customer_ID = customer.Customer_ID)
    INNER JOIN branch ON loan.Branch_Branch_ID = branch.Branch_ID);
                            
-- Customer info whose account type is Current:
SELECT 
    account.Account_No,
    customer.Customer_Name,
    customer.Customer_Mob
FROM
    account,
    customer
WHERE
    account.Customer_Customer_ID = customer.Customer_ID
        AND account.Account_Type = 'Current';
  
-- Customer info whose account type is Saving:
SELECT 
    account.Account_No,
    customer.Customer_Name,
    customer.Customer_Mob
FROM
    account,
    customer
WHERE
    account.Customer_Customer_ID = customer.Customer_ID
        AND account.Account_Type = 'Saving';
                            
                            
 -- views                           
SELECT 
    *
FROM
    Customer_ID_Name;
SELECT 
    *
FROM
    br_location_count;
SELECT 
    *
FROM
    Account_View;
SELECT 
    *
FROM
    Branch_View;
SELECT 
    *
FROM
    Customer_View;
SELECT 
    *
FROM
    Installment_View;
SELECT 
    *
FROM
    Loan_View;
SELECT 
    *
FROM
    loan_has_installment_View;

-- PL/SQL
DELIMITER //
CREATE PROCEDURE GetCust_ID_Name(
	IN Br_Name VARCHAR(255)
)
BEGIN
	select Customer.Customer_ID, Customer.Customer_Name from Customer join account on Customer.Customer_ID=Account.Customer_Customer_ID join branch on branch.Branch_ID = Account.Branch_Branch_ID where branch.Branch_Name=Br_Name;
    
END //
DELIMITER ;

call GetCust_ID_Name('Mirpur_Br');


DELIMITER //
CREATE PROCEDURE Get_Cust_LoanAmount()
BEGIN
	select customer.Customer_ID, customer.Customer_Name, loan.Loan_Amount from customer join loan on Customer.Customer_ID=loan.Customer_Customer_ID;

END //
DELIMITER ;

call Get_Cust_LoanAmount;

DELIMITER //
CREATE PROCEDURE Get_Cust_Loan_and_installment()
BEGIN
	select customer.Customer_ID, customer.Customer_Name, loan.Loan_Amount, installment.Installment_Amount from customer 
											join loan on Customer.Customer_ID=loan.Customer_Customer_ID 
												join loan_has_installment on loan_has_installment.Loan_Loan_No=Loan.Loan_No
													join Installment on Installment.Installment_No=loan_has_installment.Installment_Installment_No;

END //
DELIMITER ;

call Get_Cust_Loan_and_installment;

DELIMITER ??
CREATE PROCEDURE Get_Cust_Loan_and_Branch()
BEGIN
	select customer.Customer_ID, Customer.Customer_Name, loan.loan_Amount, branch.Branch_ID from customer
											join loan on Customer.Customer_ID=loan.Customer_Customer_ID
												join branch on loan.Branch_Branch_ID=branch.Branch_ID;
END ??
DELIMITER ;

call Get_Cust_Loan_and_Branch;

DELIMITER $$
CREATE PROCEDURE Get_Cust_AccountNo()
BEGIN
	SELECT account.Account_No, customer.Customer_ID, customer.Customer_Name FROM account
											INNER JOIN customer ON account.Account_No = customer.Customer_ID;
END $$
DELIMITER ;

call Get_Cust_AccountNo;

DELIMITER $$
CREATE PROCEDURE Branch_Count()
BEGIN
	SELECT Branch_Location, count(*) AS Count_Branch FROM branch Group By Branch_Location;
END $$
DELIMITER ;

call Branch_Count;
                                                
DELIMITER $$
CREATE PROCEDURE Cust_Br_Location()
BEGIN
	Select customer.customer_ID, Customer.Customer_Name, branch.Branch_Location from customer 
											join account on customer.customer_ID=account.Customer_Customer_ID 
												join branch on account.Branch_Branch_ID=branch.Branch_ID;
END $$
DELIMITER ;

call Cust_Br_Location;

                                            
DELIMITER $$
CREATE PROCEDURE Cust_AC_No()
BEGIN
	SELECT account.Account_No, customer.Customer_ID, customer.Customer_Name FROM account
											INNER JOIN customer ON account.Account_No = customer.Customer_ID;
END $$
DELIMITER ;

call Cust_AC_No;

DELIMITER $$
CREATE PROCEDURE Cust_Branch_Loan()
BEGIN
	SELECT customer.Customer_ID, customer.Customer_Name, branch.Branch_ID, loan.Loan_Amount
						FROM ((loan INNER JOIN customer ON loan.Customer_Customer_ID=customer.Customer_ID) 
							INNER JOIN branch ON loan.Branch_Branch_ID=branch.Branch_ID);
END $$
DELIMITER ;

call Cust_Branch_Loan;

DELIMITER $$
CREATE PROCEDURE Current_Cust()
BEGIN
	SELECT account.Account_No, customer.Customer_Name, customer.Customer_Mob FROM account, customer 
						WHERE account.Customer_Customer_ID = customer.Customer_ID
							AND account.Account_Type = 'Current';
END $$
DELIMITER ;

call Current_Cust;

DELIMITER $$
CREATE PROCEDURE Saving_Cust()
BEGIN
	SELECT account.Account_No, customer.Customer_Name, customer.Customer_Mob FROM account, customer 
						WHERE account.Customer_Customer_ID = customer.Customer_ID
							AND account.Account_Type = 'Saving';
END $$
DELIMITER ;

call Saving_Cust;


SELECT 
    customer.Customer_Name
FROM
    customer,
    loan
WHERE
    loan.Loan_Amount > ALL (SELECT 
            AVG(loan.Loan_Amount)
        FROM
            loan,
            branch
        WHERE
            branch.Branch_ID = 2);