

-- ----------------------------
-- Data for Table `users`
-- ----------------------------

INSERT INTO `users` (`username`, `password`, `email`) VALUES ('admin', 'admin_passw', 'admin@genmail.com');
INSERT INTO `users` (`username`, `password`, `email`) VALUES ('peter', 'peter_passw', 'peter@genmail.com');
INSERT INTO `users` (`username`, `password`, `email`, `enabled`) VALUES ('panos', 'panos_passw', 'panos@genmail.com',  0);

-- ----------------------------
-- Data for Table `authorities`
-- ----------------------------

INSERT INTO authorities (username, role) values ('peter', 'ROLE_USER');
INSERT INTO authorities (username, role) values ('admin', 'ROLE_USER');
INSERT INTO authorities (username, role)values ('admin', 'ROLE_ADMIN');



-- ----------------------------
-- Data for Table `items`
-- ----------------------------

INSERT INTO `items` (`itemName`, `itemVendorId`, `itemModelYear`, `itemListPrice`) VALUES ('Wooden Pencil', 2, 1998, 2.65);
INSERT INTO `items` (`itemName`, `itemVendorId`, `itemModelYear`, `itemListPrice`) VALUES ('Basic Notebook', 6, 2005, 3.75);
INSERT INTO `items` (`itemName`, `itemVendorId`, `itemModelYear`, `itemListPrice`) VALUES ('Silica Eraser', 1, 2007, 1.15);
INSERT INTO `items` (`itemName`, `itemVendorId`, `itemModelYear`, `itemListPrice`) VALUES ('Soft Polymer Eraser', 8, 2020, 1.05);
INSERT INTO `items` (`itemName`, `itemVendorId`, `itemModelYear`, `itemListPrice`) VALUES ('Soft Ballpoint Pen', 9, 2019, 2.95);
INSERT INTO `items` (`itemName`, `itemVendorId`, `itemModelYear`, `itemListPrice`) VALUES ('Paper Dossier', 7, 2019, 3.70);
INSERT INTO `items` (`itemName`, `itemVendorId`, `itemModelYear`, `itemListPrice`) VALUES ('A4 Glossy Paper Pack 250', 10, 2019, 6.15);
INSERT INTO `items` (`itemName`, `itemVendorId`, `itemModelYear`, `itemListPrice`) VALUES ('Rubber Bands Small Pack', 6, 2019, 0.50);
INSERT INTO `items` (`itemName`, `itemVendorId`, `itemModelYear`, `itemListPrice`) VALUES ('Fancy Jotter Notepad', 7, 2021, 1.65);
INSERT INTO `items` (`itemName`, `itemVendorId`, `itemModelYear`, `itemListPrice`) VALUES ('Fountain Metal Brass Pen', 2, 2018, 5.10);
INSERT INTO `items` (`itemName`, `itemVendorId`, `itemModelYear`, `itemListPrice`) VALUES ('Permanent Marker Black', 1, 2017, 3.40);
INSERT INTO `items` (`itemName`, `itemVendorId`, `itemModelYear`, `itemListPrice`) VALUES ('Rubber Pencil', 2, 2019, 2.80);
INSERT INTO `items` (`itemName`, `itemVendorId`, `itemModelYear`, `itemListPrice`) VALUES ('Metal Pen Cup', 2, 2021, 12.13);


