CREATE TABLE `demo`.`shop_stock` (
                                     `id` INT NOT NULL,
                                     `name` VARCHAR(45) NULL,
                                     `content` VARCHAR(45) NULL,
                                     `img` VARCHAR(45) NULL,
                                     `price` VARCHAR(45) NULL,
                                     `stock` INT NULL,
                                     `reg_date` DATETIME NULL DEFAULT current_timestamp(),
                                     PRIMARY KEY (`id`));


CREATE TABLE `demo`.`shop_sold` (
                                    `id` INT NOT NULL AUTO_INCREMENT,
                                    `goods_id` INT NULL,
                                    `purchase_account` VARCHAR(45) NULL,
                                    `recipient` VARCHAR(45) NULL,
                                    `delivery_address` VARCHAR(45) NULL,
                                    `purchase_complete` TINYINT NULL DEFAULT 0,
                                    `reg_date` DATETIME NULL DEFAULT current_timestamp(),
                                    PRIMARY KEY (`id`));

