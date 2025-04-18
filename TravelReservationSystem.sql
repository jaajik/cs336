CREATE DATABASE `travelreservation` /*!40100 DEFAULT CHARACTER SET latin1 */ /*!80016 DEFAULT ENCRYPTION='N' */;

CREATE TABLE `airlinecompany` (
  `airlineID` char(2) NOT NULL,
  PRIMARY KEY (`airlineID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `airport` (
  `airportID` char(3) NOT NULL,
  PRIMARY KEY (`airportID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `operatesin` (
  `airlineID` char(2) NOT NULL,
  `airportID` char(2) NOT NULL,
  PRIMARY KEY (`airlineID`,`airportID`),
  foreign key (airportID) references airport(airportID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `aircraft` (
  `aircraftID` varchar(10) NOT NULL,
  `numOfSeats` int DEFAULT NULL,
  `operationDay1` varchar(9) DEFAULT NULL,
  `operationDay2` varchar(9) DEFAULT NULL,
  `operationDay3` varchar(9) DEFAULT NULL,
  `operationDay4` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`aircraftID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `aircraftowned` (
  `aircraftID` varchar(10) NOT NULL,
  `airlineID` char(2) NOT NULL,
  PRIMARY KEY (`aircraftID`,`airlineID`),
  foreign key (airlineID) references airlinecompany (airlineID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `customer` (
  `customerID` varchar(10) NOT NULL,
  `firstName` varchar(20) DEFAULT NULL,
  `lastName` varchar(20) DEFAULT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`customerID`,`password`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `reservationaccount` (
  `customerID` varchar(10) NOT NULL,
  `accountNum` int NOT NULL,
  `flightHistoryPast1-4` varchar(20) DEFAULT NULL,
  `flightHistoryUpcoming1-4` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`customerID`,`accountNum`), 
  foreign key (customerID) references customer (customerID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `tickets` (
  `ticketNum` int NOT NULL,
  `firstName` varchar(20) DEFAULT NULL,
  `lastName` varchar(20) DEFAULT NULL,
  `customerID` varchar(10) DEFAULT NULL,
  `seatNum` varchar(3) DEFAULT NULL,
  `class` varchar(8) DEFAULT NULL,
  `totalFare` float DEFAULT NULL,
  `bookingfee` float DEFAULT NULL,
  `purchaseDate` datetime DEFAULT NULL,
  `numOfStops` int DEFAULT NULL,
  `flightNum1-5` int DEFAULT NULL,
  PRIMARY KEY (`ticketNum`), 
  foreign key (customerID) references customer (customerID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `flights` (
  `airlineID` char(2) NOT NULL,
  `aircraftID` varchar(10) NOT NULL,
  `ticketNum` int NOT NULL,
  `flightNum` int NOT NULL,
  `depTime` datetime DEFAULT NULL,
  `arrivalTime` datetime DEFAULT NULL,
  `depAirport` char(3) DEFAULT NULL,
  `arrivalAirport` char(3) DEFAULT NULL,
  `typeDomInternational` varchar(13) DEFAULT NULL,
  `typeTrip` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`airlineID`,`aircraftID`,`ticketNum`,`flightNum`), 
  foreign key (airlineID) references airlinecompany(airlineID), 
  foreign key (aircraftID) references aircraft(aircraftID), 
  foreign key (ticketNum) references tickets(ticketNum)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `waitinglist` (
  `airlineID` char(2) NOT NULL,
  `aircraftID` varchar(10) NOT NULL,
  `ticketNum` int NOT NULL,
  `flightNum` int NOT NULL,
  `customerID` varchar(10) NOT NULL,
  PRIMARY KEY (`ticketNum`,`flightNum`,`airlineID`,`aircraftID`,`customerID`),
  foreign key (airlineID, aircraftID, ticketNum, flightNum) references flights (airlineID, aircraftID, ticketNum, flightNum),
  foreign key (customerID) references customer (customerID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

insert into customer values ('traveler1', 'traveler1FN', 'traveler1LN', 'password1');
insert into customer values ('robin', 'Richard', 'Grayson', 'bluejay');