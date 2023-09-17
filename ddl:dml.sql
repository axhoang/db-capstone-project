-- Populating the Customer Table
INSERT INTO `LittleLemonDM`.`Customer` (`CustomerID`, `CustomerName`, `City`, `Country`, `PostalCode`, `CountryCode`) VALUES ('72-055-7985', 'Laney Fadden', 'Daruoyan', 'China', '993-0031', 'CN');
INSERT INTO `LittleLemonDM`.`Customer` (`CustomerID`, `CustomerName`, `City`, `Country`, `PostalCode`, `CountryCode`) VALUES ('65-353-0657', 'Giacopo Bramich', 'Ongjin', 'North Korea', '216282', 'KP');
INSERT INTO `LittleLemonDM`.`Customer` (`CustomerID`, `CustomerName`, `City`, `Country`, `PostalCode`, `CountryCode`) VALUES ('90-876-6799', 'Lia Bonar', 'Quince Mil', 'Peru', '663246', 'PE');
INSERT INTO `LittleLemonDM`.`Customer` (`CustomerID`, `CustomerName`, `City`, `Country`, `PostalCode`, `CountryCode`) VALUES ('73-873-4827', 'Merrill Baudon', 'Susaki', 'Japan', '987-0352', 'JP');
INSERT INTO `LittleLemonDM`.`Customer` (`CustomerID`, `CustomerName`, `City`, `Country`, `PostalCode`, `CountryCode`) VALUES ('80-927-5246', 'Tasia Fautly', 'Tobruk', 'Libya', '351 01', 'LY');


ALTER TABLE `LittleLemonDM`.`Customer` MODIFY `CustomerID` VARCHAR(50) NOT NULL;

-- Change the data type of the 'PostalCode' column to VARCHAR
ALTER TABLE `LittleLemonDM`.`Customer` MODIFY `PostalCode` VARCHAR(50) NOT NULL;

-- Change the data type of the 'CountryCode' column to VARCHAR
ALTER TABLE `LittleLemonDM`.`Customer` MODIFY `CountryCode` VARCHAR(50) NOT NULL;

-- Populating the Courses Table
INSERT INTO `LittleLemonDM`.`Courses` (`OrderID`, `CourseName`, `Cuisine_Name`) VALUES ('54-366-6861', 'Greek salad', 'Greek');
INSERT INTO `LittleLemonDM`.`Courses` (`OrderID`, `CourseName`, `Cuisine_Name`) VALUES ('63-761-3686', 'Bean soup', 'Italian');
INSERT INTO `LittleLemonDM`.`Courses` (`OrderID`, `CourseName`, `Cuisine_Name`) VALUES ('65-351-6434', 'Pizza', 'Italian');
INSERT INTO `LittleLemonDM`.`Courses` (`OrderID`, `CourseName`, `Cuisine_Name`) VALUES ('36-917-2834', 'Carbonara', 'Turkish');
INSERT INTO `LittleLemonDM`.`Courses` (`OrderID`, `CourseName`, `Cuisine_Name`) VALUES ('86-114-9232', 'Kabasa', 'Greek');

-- Changing the data type of the 'OrderID' column to VARCHAR
ALTER TABLE `LittleLemonDM`.`Courses` MODIFY `OrderID` VARCHAR(50) NOT NULL;

-- enable auto-increment for the CourseID column
ALTER TABLE `LittleLemonDM`.`Courses` MODIFY `CourseID` INT NOT NULL AUTO_INCREMENT;

-- Temporarily Remove Foreign Key Constraint: You can temporarily remove the foreign key constraint from the Orders table, alter the CourseID column in the Courses table, and then re-add the foreign key constraint.
ALTER TABLE `LittleLemonDM`.`Orders` DROP FOREIGN KEY `Course_FK`;
ALTER TABLE `LittleLemonDM`.`Courses` MODIFY `CourseID` INT NOT NULL AUTO_INCREMENT;
ALTER TABLE `LittleLemonDM`.`Orders` ADD CONSTRAINT `Course_FK` FOREIGN KEY (`CourseID`) REFERENCES `LittleLemonDM`.`Courses` (`CourseID`);


-- Populating the Extras Table
INSERT INTO `LittleLemonDM`.`Extras` (`StarterName`, `DessertName`, `DrinkName`, `SidesName`) VALUES ('Olives', 'Greek yoghurt', 'Athens White wine', 'Tapas');
INSERT INTO `LittleLemonDM`.`Extras` (`StarterName`, `DessertName`, `DrinkName`, `SidesName`) VALUES ('Flatbread', 'Ice cream', 'Corfu Red Wine', 'Potato salad');
INSERT INTO `LittleLemonDM`.`Extras` (`StarterName`, `DessertName`, `DrinkName`, `SidesName`) VALUES ('Minestrone', 'Cheesecake', 'Italian Coffee', 'Bruschetta');
INSERT INTO `LittleLemonDM`.`Extras` (`StarterName`, `DessertName`, `DrinkName`, `SidesName`) VALUES ('Tomato bread', 'Affogato', 'Roma Red wine', 'Focaccia');
INSERT INTO `LittleLemonDM`.`Extras` (`StarterName`, `DessertName`, `DrinkName`, `SidesName`) VALUES ('Falafel', 'Turkish yoghurt', 'Ankara White Wine', 'Meatballs');

-- Step 1: Temporarily remove the foreign key constraint
ALTER TABLE `LittleLemonDM`.`Orders` DROP FOREIGN KEY `DrinkID_Fk`;

-- Step 2: Modify `ExtraID` to be an auto-increment field
ALTER TABLE `LittleLemonDM`.`Extras` MODIFY `ExtraID` INT NOT NULL AUTO_INCREMENT;

-- Step 3: Re-add the foreign key constraint
ALTER TABLE `LittleLemonDM`.`Orders` 
    ADD CONSTRAINT `DrinkID_Fk` 
    FOREIGN KEY (`ExtraID`) 
    REFERENCES `LittleLemonDM`.`Extras` (`ExtraID`);

-- Populating the Orders table
INSERT INTO `LittleLemonDM`.`Orders` (`OrderDate`, `DeliveryDate`, `Quantity`, `TotalCost`, `Discount`, `DeliveryCost`, `CustomerID`, `CourseID`, `ExtraID`) VALUES ('2022-01-15 18:30:00', '2022-01-16 19:00:00', 2, 55.00, 5.00, 10.00, 1, 1, 1);
INSERT INTO `LittleLemonDM`.`Orders` (`OrderDate`, `DeliveryDate`, `Quantity`, `TotalCost`, `Discount`, `DeliveryCost`, `CustomerID`, `CourseID`, `ExtraID`) VALUES ('2022-02-10 12:45:00', '2022-02-11 13:15:00', 4, 80.00, 8.00, 15.00, 2, 2, 2);
INSERT INTO `LittleLemonDM`.`Orders` (`OrderDate`, `DeliveryDate`, `Quantity`, `TotalCost`, `Discount`, `DeliveryCost`, `CustomerID`, `CourseID`, `ExtraID`) VALUES ('2022-03-05 20:00:00', '2022-03-06 21:00:00', 1, 25.00, 2.50, 5.00, 3, 3, 3);
INSERT INTO `LittleLemonDM`.`Orders` (`OrderDate`, `DeliveryDate`, `Quantity`, `TotalCost`, `Discount`, `DeliveryCost`, `CustomerID`, `CourseID`, `ExtraID`) VALUES ('2022-04-20 14:20:00', '2022-04-21 15:20:00', 3, 75.00, 7.50, 12.00, 4, 4, 4);
INSERT INTO `LittleLemonDM`.`Orders` (`OrderDate`, `DeliveryDate`, `Quantity`, `TotalCost`, `Discount`, `DeliveryCost`, `CustomerID`, `CourseID`, `ExtraID`) VALUES ('2022-05-15 16:15:00', '2022-05-16 17:15:00', 5, 100.00, 10.00, 20.00, 5, 5, 5);

-- Adding DeliveryDate and DelieveryCost column to Orders Table
ALTER TABLE `LittleLemonDM`.`Orders` ADD `DeliveryDate` DATETIME NULL;
ALTER TABLE `LittleLemonDM`.`Orders` ADD `DeliveryCost` DECIMAL(10,2) NULL;

-- OrderID needs to be defined as a autoincremented field
ALTER TABLE `LittleLemonDM`.`Orders` MODIFY `OrderID` INT NOT NULL AUTO_INCREMENT;

-- Test queries : query results should equal to 5 

-- Check the number of rows in the Customer table
SELECT COUNT(*) FROM `LittleLemonDM`.`Customer`;

-- Check the number of rows in the Courses table
SELECT COUNT(*) FROM `LittleLemonDM`.`Courses`;

-- Check the number of rows in the Extras table
SELECT COUNT(*) FROM `LittleLemonDM`.`Extras`;

-- Check the number of rows in the Orders table
SELECT COUNT(*) FROM `LittleLemonDM`.`Orders`;

-- Filtering queries
SELECT * FROM `LittleLemonDM`.`Orders`
WHERE `TotalCost` > 20;

SELECT * FROM `LittleLemonDM`.`Customer`
WHERE `Country` = 'China';

SELECT * FROM `LittleLemonDM`.`Customer`
WHERE `CustomerName` LIKE 'L%';

SELECT AVG(`TotalCost`) as average_cost FROM `LittleLemonDM`.`Orders`;


SELECT o.`OrderID`, co.`CourseName`, co.`Cuisine_Name`
FROM `LittleLemonDM`.`Orders` o
JOIN `LittleLemonDM`.`Courses` co ON o.`CourseID` = co.`CourseID`;

SELECT o.`OrderID`, e.`StarterName`, e.`DessertName`
FROM `LittleLemonDM`.`Orders` o
JOIN `LittleLemonDM`.`Extras` e ON o.`ExtraID` = e.`ExtraID`;

-- Find Orders That Include a Specific Extra and Have a Discount
SELECT o.`OrderID`, e.`StarterName`, o.`Discount`
FROM `LittleLemonDM`.`Orders` o
JOIN `LittleLemonDM`.`Extras` e ON o.`ExtraID` = e.`ExtraID`
WHERE o.`Discount` IS NOT NULL AND e.`StarterName` = 'Olives';

-- List courses and their orders but exclude a specific cuisine(e.g Greek)
SELECT o.`OrderID`, co.`CourseName`
FROM `LittleLemonDM`.`Orders` o
JOIN `LittleLemonDM`.`Courses` co ON o.`CourseID` = co.`CourseID`
WHERE co.`Cuisine_Name` != 'Greek';
















