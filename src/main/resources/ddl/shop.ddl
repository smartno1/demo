CREATE TABLE `demo`.`shop_stock` (
                                     `id` INT NOT NULL,
                                     `name` VARCHAR(45) NOT NULL ,
                                     `content` VARCHAR(45) NULL,
                                     `img` VARCHAR(45) NULL,
                                     `price` VARCHAR(45) NOT NULL DEFAULT 0,
                                     `stock` BIGINT(30) NOT NULL DEFAULT 0,
                                     `origin` VARCHAR(45) NULL,
                                     `sold` BIGINT(30) NOT NULL DEFAULT 0,
                                     `reg_date` DATETIME DEFAULT CURRENT_TIMESTAMP(),
                                     PRIMARY KEY (`id`));


CREATE TABLE `demo`.`shop_sold` (
                                    `id` INT NOT NULL AUTO_INCREMENT,
                                    `goods_id` INT NOT NULL,
                                    `purchase_account` VARCHAR(45) NOT NULL,
                                    `recipient` VARCHAR(45) NOT NULL,
                                    `delivery_address` VARCHAR(45) NOT NULL,
                                    `purchase_complete` VARCHAR(45) NOT NULL DEFAULT "BASKET",
                                    `reg_date` DATETIME DEFAULT CURRENT_TIMESTAMP(),
                                    `count` INT NOT NULL ,
                                    `price` INT NOT NULL ,
                                    `total_price` INT NOT NULL ,
                                    PRIMARY KEY (`id`));

