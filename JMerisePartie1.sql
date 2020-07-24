#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------

CREATE DATABASE `realEstate`
CHARACTER SET 'utf8';
USE `realEstate`;
#------------------------------------------------------------
# Table: m8h2n_timeSlots
#------------------------------------------------------------

CREATE TABLE `m8h2n_timeSlots`(
        `id`        Int  Auto_increment  NOT NULL ,
        `startTime` Time NOT NULL ,
        `endTime`   Time NOT NULL
	,CONSTRAINT timeSlots_PK PRIMARY KEY (`id`)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: m8h2n_propertyTypes
#------------------------------------------------------------

CREATE TABLE `m8h2n_propertyTypes`(
        `id`   Int  Auto_increment  NOT NULL ,
        `name` Varchar (5) NOT NULL
	,CONSTRAINT propertyTypes_PK PRIMARY KEY (`id`)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: m8h2n_properties
#------------------------------------------------------------

CREATE TABLE `m8h2n_properties`(
        `id`                     Int  Auto_increment  NOT NULL ,
        `name`                   Varchar (255) NOT NULL ,
        `zipCode`                Varchar (5) NOT NULL ,
        `price`                  Int NOT NULL ,
        `id_propertyTypes` Int NOT NULL
	,CONSTRAINT properties_PK PRIMARY KEY (`id`)

	,CONSTRAINT properties_propertyTypes_FK FOREIGN KEY (`id_propertyTypes`) REFERENCES `m8h2n_propertyTypes`(`id`)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: m8h2n_clients
#------------------------------------------------------------

CREATE TABLE `m8h2n_clients`(
        `id`                     Int  Auto_increment  NOT NULL ,
        `lastname`               Varchar (50) NOT NULL ,
        `firstname`              Varchar (50) NOT NULL ,
        `birthDate`              Date NOT NULL ,
        `mail`                   Varchar (255) NOT NULL ,
        `budget`                 Int NOT NULL ,
        `id_propertyTypes` Int NOT NULL
	,CONSTRAINT clients_PK PRIMARY KEY (`id`)

	,CONSTRAINT clients_propertyTypes_FK FOREIGN KEY (`id_propertyTypes`) REFERENCES `m8h2n_propertyTypes`(`id`)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: m8h2n_appointments
#------------------------------------------------------------

CREATE TABLE `m8h2n_appointments`(
        `id`                  Int  Auto_increment  NOT NULL ,
        `date`                Date NOT NULL ,
        `id_timeSlots`  Int NOT NULL ,
        `id_clients`    Int NOT NULL ,
        `id_properties` Int NOT NULL
	,CONSTRAINT appointments_PK PRIMARY KEY (`id`)

	,CONSTRAINT appointments_timeSlots_FK FOREIGN KEY (`id_timeSlots`) REFERENCES `m8h2n_timeSlots`(`id`)
	,CONSTRAINT appointments_clients_FK FOREIGN KEY (`id_clients`) REFERENCES `m8h2n_clients`(`id`)
	,CONSTRAINT appointments_properties_FK FOREIGN KEY (`id_properties`) REFERENCES `m8h2n_properties`(`id`)
)ENGINE=InnoDB;
--DATA propertyTypes--
INSERT INTO `m8h2n_propertyTypes` (`id`, `name`) VALUES (NULL, 'Maison'), (NULL, 'Appartement'), (NULL, 'Terrain');
--DATA timeSlots--
INSERT INTO `m8h2n_timeSlots` (`id`, `startTime`, `endTime`) VALUES (NULL, '09:00:00', '10:00'), (NULL, '10:00', '11:00'), (NULL, '11:00', '12:00'), (NULL, '14:00', '15:00'), (NULL, '15:00', '16:00'), (NULL, '16:00', '17:00');
--DATA clients--
INSERT INTO `m8h2n_clients` (`lastname`,`firstname`,`birthdate`,`mail`,`budget`,`id_propertyTypes`) VALUES ("Stone","Finn","1988-04-16","habitant@hymenaeos.co.uk",194701,2),("Stewart","Halla","1972-03-13","vehicula.Pellentesque.tincidunt@arcueuodio.co.uk",183377,3),("Humphrey","Leah","1995-03-21","posuere.cubilia.Curae@magna.net",196595,1),("Cain","Cedric","1973-06-21","sagittis.Duis@turpisegestas.org",183327,3),("Todd","Ila","1981-08-16","nisl.Quisque@Aenean.org",185934,2),("Lara","Cassandra","1976-03-28","odio.Aliquam.vulputate@ametconsectetueradipiscing.org",198445,1),("Shepard","Aline","1982-01-13","ipsum@maurisrhoncusid.co.uk",188121,2),("Wells","Owen","2001-07-12","urna.Nunc@convallis.net",180669,1),("Gamble","Kaseem","1990-03-19","turpis@viverra.net",197959,1),("Dejesus","Benjamin","1981-04-10","turpis.In@eu.co.uk",186628,2);
INSERT INTO `m8h2n_clients` (`lastname`,`firstname`,`birthdate`,`mail`,`budget`,`id_propertyTypes`) VALUES ("Navarro","Merrill","1972-03-06","diam@Phasellus.com",180712,2),("Melton","Rose","1970-05-03","Duis.risus@Morbivehicula.edu",191072,2),("Wright","Sonya","1990-02-10","pellentesque.massa.lobortis@lorem.org",184883,1),("Ramos","Brendan","1988-07-01","rhoncus@tristiquesenectus.ca",197584,2),("Dyer","Caldwell","1975-12-16","dictum.augue.malesuada@mollisnon.org",191476,3),("Larson","Fritz","2000-01-13","fringilla.porttitor.vulputate@maurisaliquam.edu",185450,3),("Burch","Brock","1999-02-08","orci.tincidunt.adipiscing@faucibuslectus.net",183683,1),("Bishop","Rogan","1985-12-21","Mauris.nulla.Integer@nonmagnaNam.net",181844,2),("Duran","Mohammad","1991-07-16","ac.libero@sagittislobortis.ca",196194,1),("Guerrero","Diana","1987-08-26","interdum@nascetur.co.uk",193045,1);
--DATA properties--
INSERT INTO `m8h2n_properties` (`name`,`zipCode`,`price`,`id_propertyTypes`) VALUES ("egestas. Duis ac arcu.",63306,185385,2),("Mauris vestibulum, neque sed",74328,108402,1),("ut nisi a odio",79951,131973,1),("eu nibh vulputate mauris",70132,154282,3),("eget tincidunt dui augue",74686,176201,3),("enim. Etiam imperdiet dictum",69275,146993,1),("Suspendisse tristique neque venenatis",60782,110489,2),("non magna. Nam ligula",70628,132112,1),("vulputate mauris sagittis placerat.",76774,167077,3),("aliquet, metus urna convallis",68646,172057,3);
INSERT INTO `m8h2n_properties` (`name`,`zipCode`,`price`,`id_propertyTypes`) VALUES ("Mauris ut quam vel",63348,113013,1),("eget, venenatis a, magna.",62929,138790,3),("quam. Pellentesque habitant morbi",65814,127984,1),("nisl. Quisque fringilla euismod",75480,110970,3),("velit dui, semper et,",79532,196817,2),("morbi tristique senectus et",60494,154382,1),("convallis convallis dolor. Quisque",75788,104507,3),("eget ipsum. Suspendisse sagittis.",72835,133280,2),("lorem, luctus ut, pellentesque",71936,101879,3),("tincidunt pede ac urna.",66613,163055,1);
INSERT INTO `m8h2n_properties` (`name`,`zipCode`,`price`,`id_propertyTypes`) VALUES ("at, velit. Pellentesque ultricies",72383,140937,2),("Cras vulputate velit eu",73271,142131,2),("penatibus et magnis dis",68204,180854,2),("Donec egestas. Aliquam nec",62962,197837,1),("amet massa. Quisque porttitor",74697,114070,2),("ullamcorper magna. Sed eu",70482,103444,2),("imperdiet ullamcorper. Duis at",65266,190399,3),("adipiscing non, luctus sit",79151,194442,1),("Fusce aliquam, enim nec",71460,184597,3),("eu tempor erat neque",69215,118522,3);
--DATA appointments--
INSERT INTO `m8h2n_appointments` (`date`,`id_timeSlots`,`id_clients`,`id_properties`) VALUES ("2021-06-07",3,18,20),("2020-09-24",4,4,28),("2021-06-02",2,6,22),("2020-11-04",4,15,14),("2020-11-18",6,17,17),("2020-08-17",6,18,13),("2021-11-06",1,13,26),("2021-06-11",4,5,1),("2021-06-03",5,4,18),("2020-11-06",1,7,15);

--1--
SELECT `pro`.`name`,`pro`.`zipCode`,`pro`.`price`, `proTyp`.`name` 
FROM `m8h2n_properties` as `pro` 
INNER JOIN `m8h2n_propertyTypes` AS `proTyp` 
ON `pro`.`id_propertyTypes` = `proTyp`.`id` 
ORDER BY `pro`.`price` 

--2--
SELECT `app`.`date`, `cli`.`lastname`, `cli`.`firstname`, `tim`.`startTime`, `tim`.`endTime`, `pro`.`name`, `pro`.`price`, 
`pro`.`zipCode`, `proTyp`.`name` 
FROM `m8h2n_appointments` AS `app` 
INNER JOIN `m8h2n_clients` AS `cli` ON `app`.`id_clients` = `cli`.`id` 
INNER JOIN `m8h2n_timeSlots` AS `tim` ON `app`.`id_timeSlots` = `tim`.`id` 
INNER JOIN `m8h2n_properties` AS `pro` ON `app`.`id_properties` = `pro`.`id` 
INNER JOIN `m8h2n_propertyTypes` AS `proTyp` ON `pro`.`id_propertyTypes` = `proTyp`.`id` 
ORDER BY `app`.`date` ASC, `tim`.`startTime` ASC ; 

--3--
SELECT `cli`.`lastname`,`cli`.`firstname`, `proTyp`.`name`, 
FROM `m8h2n_clients` AS `cli`
INNER JOIN `m8h2n_propertyTypes` AS `proTyp`
ON `cli`.`id_propertyTypes` = `proTyp`.`id`
INNER JOIN `m8h2n_propertyTypes` AS `bud`
ON `cli`.`m8h2n_propertyTypes` =
ORDER BY `cli`.`lastname` ASC, `cli`.`firstname` ASC;