CREATE DATABASE IF NOT EXISTS Bank;
USE BANK;
CREATE TABLE `account` (
  `amount` int NOT NULL,
  `acc_num` int NOT NULL,
  `cust_id` int NOT NULL,
  PRIMARY KEY (`acc_num`),
  KEY `cust_id_idx` (`cust_id`),
  CONSTRAINT `cust_id` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `banker` (
  `banker_id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `branch_num` int DEFAULT NULL,
  PRIMARY KEY (`banker_id`),
  KEY `branch_num_idx` (`branch_num`),
  CONSTRAINT `branch_num` FOREIGN KEY (`branch_num`) REFERENCES `branch` (`branch_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `branch` (
  `branch_num` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `location` varchar(45) NOT NULL,
  PRIMARY KEY (`branch_num`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `customer` (
  `cust_id` int NOT NULL,
  `cust_name` varchar(45) NOT NULL,
  `cust_address` varchar(45) DEFAULT NULL,
  `cust_phone` int NOT NULL,
  `branch_num` int NOT NULL,
  PRIMARY KEY (`cust_id`),
  KEY `branch_num_idx` (`branch_num`),
  CONSTRAINT `bra_num` FOREIGN KEY (`branch_num`) REFERENCES `branch` (`branch_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `loan` (
  `amount` int NOT NULL,
  `type` varchar(45) NOT NULL,
  `loan_id` int NOT NULL,
  `branch_num` int DEFAULT NULL,
  `account_num` int DEFAULT NULL,
  PRIMARY KEY (`loan_id`),
  KEY `branch_no_idx` (`branch_num`),
  KEY `account_num_idx` (`account_num`),
  CONSTRAINT `account_num` FOREIGN KEY (`account_num`) REFERENCES `account` (`acc_num`),
  CONSTRAINT `branch_no` FOREIGN KEY (`branch_num`) REFERENCES `branch` (`branch_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `transaction` (
  `id` int NOT NULL,
  `account_num` int NOT NULL,
  `amount` decimal(10,3) DEFAULT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_num` (`account_num`),
  CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`account_num`) REFERENCES `account` (`acc_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `bank`.`branch`
(`branch_num`,
`name`,
`location`)
VALUES
(1,'Branch1','Branch1Address'),(2,'Branch1','Branch1Address');
INSERT INTO `bank`.`customer`
(`cust_id`,
`cust_name`,
`cust_address`,
`cust_phone`,
`branch_num`)
VALUES
(1,'John','1056 ave lane',1234567,1),(2,'Eric','1492 Lane Drv',58938274,1),(3,'Haley','5839 terrace',1234567,2),(4,'Jinny','1056 lane',12345647,2);
INSERT INTO `bank`.`banker`
(`banker_id`,
`name`,
`branch_num`)
VALUES
(1,'banker1',1),(2,'banker2',2);

INSERT INTO `bank`.`account`
(`amount`,
`acc_num`,
`cust_id`)
VALUES
( 500.33,1,1),( 20,2,2),( 10000,3,3),( 800,4,4),(450,5,4);
INSERT INTO `bank`.`loan`
(`amount`,
`type`,
`loan_id`,
`branch_num`,
`account_num`)
VALUES
(10000,'subsadized',1,1,1);
INSERT INTO `bank`.`transaction`
(`id`,
`account_num`,
`amount`,
`date`)
VALUES
(1,1,50.33,'2002-08-09');


