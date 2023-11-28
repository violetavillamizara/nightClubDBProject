CREATE TABLE `employee_schedule`(
    `id` INT NOT NULL PRIMARY KEY,
    `type` ENUM('full-time','part-time') NOT NULL,
    `hours` INT NOT NULL,
    `enter_hour` TIME NOT NULL,
    `exit_hour` TIME NOT NULL
);
CREATE TABLE `disco_table`(
    `tableId` INT NOT NULL PRIMARY KEY,
    `location` VARCHAR(20) NOT NULL
);
CREATE TABLE `reservation`(
    `id` INT NOT NULL PRIMARY KEY,
    `customer_id` INT NOT NULL,
    `event_id` INT NOT NULL,
    `date` DATE NOT NULL,
    `table_id` INT NOT NULL,
    `number_of_people` INT NOT NULL,
    `payment_status` INT NOT NULL
);
CREATE TABLE `event`(
    `id` INT NOT NULL PRIMARY KEY,
    `name` VARCHAR(20) NOT NULL,
    `date` DATE NOT NULL,
    `start_time` TIME NOT NULL,
    `end_time` TIME NOT NULL,
    `description` VARCHAR(50) NOT NULL,
    `entry_fee` INT NOT NULL,
    `artist_id` INT NOT NULL
);
CREATE TABLE `consumption`(
    `id` INT NOT NULL PRIMARY KEY,
    `item_id` INT NOT NULL,
    `quantity` INT NOT NULL,
    `receipt_id` INT NOT NULL
);
CREATE TABLE `artist`(
    `id` INT NOT NULL PRIMARY KEY,
    `name` VARCHAR(20) NOT NULL,
    `description` VARCHAR(50) NOT NULL,
    `phone` INT NOT NULL,
    `music_gender` VARCHAR(20) NOT NULL
);
ALTER TABLE
    `artist` ADD UNIQUE `artist_phone_unique`(`phone`);
CREATE TABLE `membership`(
    `id` INT NOT NULL PRIMARY KEY,
    `type` VARCHAR(20) NOT NULL,
    `description` VARCHAR(50) NOT NULL,
    `preferences` VARCHAR(50) NOT NULL,
    `status` VARCHAR(10) NOT NULL
);
CREATE TABLE `event_employee`(
    `id` INT NOT NULL PRIMARY KEY,
    `event_id` INT NOT NULL,
    `employee_id` INT NOT NULL
);
CREATE TABLE `receipt`(
    `id` INT NOT NULL PRIMARY KEY,
    `table_id` INT NOT NULL,
    `datetime` DATETIME NOT NULL,
    `payment_method` ENUM('cash','credit card') NOT NULL
);
CREATE TABLE `employee`(
    `id` INT NOT NULL PRIMARY KEY,
    `name` VARCHAR(20) NOT NULL,
    `last_name` VARCHAR(30) NOT NULL,
    `role` VARCHAR(10) NOT NULL,
    `phone` INT NOT NULL,
    `email` VARCHAR(30) NOT NULL,
    `gender` VARCHAR(10) NULL,
    `date_of_birth` DATE NOT NULL,
    `address` VARCHAR(30) NOT NULL,
    `schedule_id` INT NOT NULL
);
ALTER TABLE
    `employee` ADD UNIQUE `employee_phone_unique`(`phone`);
ALTER TABLE
    `employee` ADD UNIQUE `employee_email_unique`(`email`);
CREATE TABLE `customer`(
    `id` INT NOT NULL PRIMARY KEY,
    `name` VARCHAR(20) NOT NULL,
    `last_name` VARCHAR(20) NOT NULL,
    `gender` VARCHAR(10) NULL,
    `date_of_birth` DATE NOT NULL,
    `phone` INT NOT NULL,
    `email` VARCHAR(30) NOT NULL,
    `address` VARCHAR(30) NOT NULL,
    `membership_id` INT NOT NULL
);
ALTER TABLE
    `customer` ADD UNIQUE `customer_phone_unique`(`phone`);
ALTER TABLE
    `customer` ADD UNIQUE `customer_email_unique`(`email`);
CREATE TABLE `inventory`(
    `itemId` INT NOT NULL PRIMARY KEY,
    `item_name` VARCHAR(40) NOT NULL,
    `item_type` VARCHAR(40) NOT NULL,
    `item_code` INT NOT NULL,
    `quantity` INT NOT NULL,
    `price` INT NOT NULL
);
ALTER TABLE
    `inventory` ADD UNIQUE `inventory_item_code_unique`(`item_code`);
ALTER TABLE
    `event_employee` ADD CONSTRAINT `event_employee_event_id_foreign` FOREIGN KEY(`event_id`) REFERENCES `event`(`id`);
ALTER TABLE
    `consumption` ADD CONSTRAINT `consumption_receipt_id_foreign` FOREIGN KEY(`receipt_id`) REFERENCES `receipt`(`id`);
ALTER TABLE
    `event` ADD CONSTRAINT `event_artist_id_foreign` FOREIGN KEY(`artist_id`) REFERENCES `artist`(`id`);
ALTER TABLE
    `employee` ADD CONSTRAINT `employee_schedule_id_foreign` FOREIGN KEY(`schedule_id`) REFERENCES `employee_schedule`(`id`);
ALTER TABLE
    `reservation` ADD CONSTRAINT `reservation_event_id_foreign` FOREIGN KEY(`event_id`) REFERENCES `event`(`id`);
ALTER TABLE
    `receipt` ADD CONSTRAINT `receipt_table_id_foreign` FOREIGN KEY(`table_id`) REFERENCES `disco_table`(`tableId`);
ALTER TABLE
    `customer` ADD CONSTRAINT `customer_membership_id_foreign` FOREIGN KEY(`membership_id`) REFERENCES `membership`(`id`);
ALTER TABLE
    `reservation` ADD CONSTRAINT `reservation_table_id_foreign` FOREIGN KEY(`table_id`) REFERENCES `disco_table`(`tableId`);
ALTER TABLE
    `reservation` ADD CONSTRAINT `reservation_customer_id_foreign` FOREIGN KEY(`customer_id`) REFERENCES `customer`(`id`);
ALTER TABLE
    `event_employee` ADD CONSTRAINT `event_employee_employee_id_foreign` FOREIGN KEY(`employee_id`) REFERENCES `employee`(`id`);
ALTER TABLE
    `consumption` ADD CONSTRAINT `consumption_item_id_foreign` FOREIGN KEY(`item_id`) REFERENCES `inventory`(`itemId`);