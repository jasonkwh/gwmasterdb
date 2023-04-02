CREATE TABLE `EquipFunction` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Description` text,
  PRIMARY KEY (`Id`)
);

CREATE TABLE `EquipFunctionSet` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `FunctionId` int NOT NULL,
  `TypeId` int DEFAULT NULL,
  PRIMARY KEY (`Id`)
);

CREATE TABLE `Equipment` (
  `Id` varchar(10) NOT NULL,
  `ModelId` int NOT NULL,
  `InspectionDate` date DEFAULT NULL,
  `Comment` text,
  PRIMARY KEY (`Id`)
);

CREATE TABLE `Gear` (
  `Id` varchar(10) NOT NULL,
  `LocationId` int NOT NULL,
  `ProductId` int NOT NULL,
  `Status` tinyint NOT NULL,
  `InspectionDate` datetime DEFAULT NULL,
  `AddDate` datetime NOT NULL,
  PRIMARY KEY (`Id`)
);

CREATE TABLE `GearLocation` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Location` varchar(100) NOT NULL,
  `AddDate` datetime NOT NULL,
  PRIMARY KEY (`Id`)
);

CREATE TABLE `GearManufacturer` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Manufacturer` varchar(100) NOT NULL,
  `AddDate` datetime NOT NULL,
  PRIMARY KEY (`Id`)
);

CREATE TABLE `GearProduct` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ManufacturerId` int NOT NULL,
  `TypeId` int NOT NULL,
  `WLL` decimal(10,2) NOT NULL,
  `EffLength` int DEFAULT NULL,
  `Size` tinyint DEFAULT NULL,
  `Grade` tinyint DEFAULT NULL,
  `Description` varchar(100) NOT NULL,
  `AddDate` datetime NOT NULL,
  PRIMARY KEY (`Id`)
);

CREATE TABLE `GearSupplier` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Supplier` varchar(100) NOT NULL,
  `AddDate` datetime NOT NULL,
  PRIMARY KEY (`Id`)
);

CREATE TABLE `GearType` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Type` varchar(100) NOT NULL,
  `AddDate` datetime NOT NULL,
  PRIMARY KEY (`Id`)
);

CREATE TABLE `Model` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Description` text,
  `Length` int DEFAULT NULL,
  `Wll` varchar(50) DEFAULT NULL,
  `TypeId` int NOT NULL,
  PRIMARY KEY (`Id`)
);

CREATE TABLE `ModelType` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
);

CREATE TABLE `QuantitySet` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `FunctionSetId` int NOT NULL,
  `Quantity` int DEFAULT NULL,
  PRIMARY KEY (`Id`)
);

DELIMITER $$
CREATE FUNCTION `GetGearLocation`(LocName varchar(100)) RETURNS int
    DETERMINISTIC
BEGIN
DECLARE Loc_id INT;
	set LocName = trim(LocName);
    if (LocName = "") then
		return 0;
	end if;
    SELECT Id into Loc_id FROM GearLocation WHERE `Location` LIKE concat('%',LocName,'%');
    RETURN Loc_id; 
END$$
DELIMITER ;

DELIMITER $$
CREATE FUNCTION `GetGearManufacturer`(MfName varchar(100)) RETURNS int
    DETERMINISTIC
BEGIN
DECLARE Mf_id INT;
	set MfName = trim(MfName);
	if (MfName = "") then
		return 0;
	end if;
    SELECT Id into Mf_id FROM GearManufacturer WHERE `Manufacturer` LIKE concat('%',MfName,'%');
    RETURN Mf_id; 
END$$
DELIMITER ;

DELIMITER $$
CREATE FUNCTION `GetGearSupplier`(SupName varchar(100)) RETURNS int
    DETERMINISTIC
BEGIN
DECLARE Sup_id INT;
	set SupName = trim(SupName);
	if (SupName = "") then
		return 0;
	end if;
    SELECT Id into Sup_id FROM GearSupplier WHERE `Supplier` LIKE concat('%',SupName,'%');
    RETURN Sup_id; 
END$$
DELIMITER ;

DELIMITER $$
CREATE FUNCTION `GetGearType`(TypeName varchar(100)) RETURNS int
    DETERMINISTIC
BEGIN
DECLARE Type_id INT;
	set TypeName = trim(TypeName);
	if (TypeName = "") then
		return 0;
	end if;
    SELECT Id into type_id FROM GearType WHERE lower(`Type`) = lower(trim(TypeName));
    RETURN Type_id; 
END$$
DELIMITER ;
