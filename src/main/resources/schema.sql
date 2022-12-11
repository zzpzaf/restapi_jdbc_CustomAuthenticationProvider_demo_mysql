
-- ------------------------------------------
-- Table: `users`
-- ------------------------------------------

DROP TABLE IF EXISTS `users`;
@
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `username` varchar(20) NOT NULL UNIQUE,
  `password` varchar(80) NOT NULL,
  `email` varchar(40) NOT NULL UNIQUE,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
);


-- ------------------------------------------
-- Table: `autorities` (for users' roles)
-- ------------------------------------------

@
DROP TABLE IF EXISTS `authorities`;
@
CREATE TABLE `authorities` (
  `username` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL
);
@




-- ----------------------------
-- Table `items`
-- ----------------------------
DROP TABLE IF EXISTS `items`;
@
CREATE TABLE `items` (
  `itemId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `itemName` varchar(100) NOT NULL,
  `itemVendorId` int(10) unsigned NOT NULL,
  `itemModelYear` int(4) unsigned DEFAULT NULL,
  `itemListPrice` decimal(10,2) NOT NULL,
  PRIMARY KEY (`itemId`)
); 
@




-- ------------------------------------------
-- Triggers for password salting and hashing
-- ------------------------------------------

DROP TRIGGER IF EXISTS `INS_USER_PASSW`;
@
--DELIMITER //
CREATE TRIGGER `INS_USER_TIMESTAMP_UUID_PASSW` 
BEFORE INSERT ON `users`
FOR EACH ROW

 BEGIN

    DECLARE salt VARCHAR(16); 
   
    SET salt = (SELECT SUBSTRING(SHA2(RAND(),256), 1, 16)); 
   
    SET NEW.`password` = CONCAT(salt,SHA2(CONCAT(salt, NEW.`password`), 256)); 
 
 END; 
--//
--DELIMITER;
@

DROP TRIGGER IF EXISTS `UPD_USER_PASSW`;
@
CREATE TRIGGER `UPD_USER_PASSW` 
BEFORE UPDATE ON `users`
FOR EACH ROW

 BEGIN

    DECLARE salt VARCHAR(16); 
   
    SET salt = (SELECT SUBSTRING(SHA2(RAND(),256), 1, 16)); 
   
    SET NEW.`password` = CONCAT(salt,SHA2(CONCAT(salt, NEW.`password`), 256)); 
 
 END; 
@



-- ----------------------------------------------
-- Function for password verification/validation
-- ----------------------------------------------

DROP FUNCTION IF EXISTS `IsUserPasswordValid`;
@
CREATE FUNCTION `IsUserPasswordValid`(`uname` VARCHAR(20), `upassw` VARCHAR(32)) RETURNS tinyint(1)
    NO SQL
BEGIN
    DECLARE hashedPassword VARCHAR(64);
    DECLARE fullPassword VARCHAR(80);
    DECLARE salt VARCHAR(16);
    -- DECLARE retVal boolean DEFAULT FALSE;   
    DECLARE retVal tinyint(1) DEFAULT 0; 
        
    SELECT password INTO fullPassword from users where username = uname; 
	
    SET salt = SUBSTRING(fullPassword, 1, 16);
    SET hashedPassword = SUBSTRING(fullPassword, 17);
    IF hashedPassword = SHA2(CONCAT(salt, upassw), 256) THEN 
    	-- SET retVal = TRUE;
      SET retVal = 1;
    END IF;
    
    RETURN retVal;

END;
@