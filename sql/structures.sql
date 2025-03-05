CREATE TABLE `users` (
    `id`            INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `username`      VARCHAR(255) NOT NULL,
    `email`         VARCHAR(255) NOT NULL,
    `password`      VARCHAR(255) NOT NULL,
    `administrator` BOOLEAN DEFAULT FALSE,
    `active`        BOOLEAN DEFAULT FALSE,
    `deleted`       BOOLEAN DEFAULT FALSE,
    `created_at`    DATETIME DEFAULT CURRENT_TIMESTAMP,
    `updated_at`    DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE `images` (
    `id`         INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `name`       VARCHAR(255) NOT NULL,
    `type`       VARCHAR(255) NOT NULL,
    `content`    LONGTEXT NOT NULL,
    `public`     BOOLEAN DEFAULT FALSE,
    `user_id`    INT UNSIGNED NOT NULL,
    `deleted`    BOOLEAN DEFAULT FALSE,
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
);

CREATE VIEW `v_images` AS
    SELECT `images`.`id`,
           `images`.`name`,
           `images`.`type`,
           `images`.`content`,
           `images`.`public`,
           `images`.`user_id`,
           `images`.`deleted`,
           `images`.`created_at`,
           `images`.`updated_at`,
           `users`.`username`
    FROM `images`
    INNER JOIN `users` ON `images`.`user_id` = `users`.`id`;