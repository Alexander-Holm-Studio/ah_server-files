CREATE TABLE IF NOT EXISTS `lb_news_profiles` (
    `id` VARCHAR(100) PRIMARY KEY, -- the player identifier, named id since esx_multicharacter will throw errors otherwise
    `avatar` VARCHAR(500),
    `display_name` VARCHAR(100) NOT NULL,
    `email` VARCHAR(100),
    `phone_number` VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS `lb_news_categories` (
    `category` VARCHAR(100) NOT NULL PRIMARY KEY,
    `article_count` INT UNSIGNED NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS `lb_news_articles` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `author` VARCHAR(100) NOT NULL,

    `category` VARCHAR(100) NOT NULL,
    `title` VARCHAR(100) NOT NULL,
    `content` LONGTEXT NOT NULL,

    `published` BOOLEAN NOT NULL DEFAULT FALSE,
    `notified` BOOLEAN NOT NULL DEFAULT FALSE,
    `published_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    FOREIGN KEY (`author`) REFERENCES `lb_news_profiles`(`id`) ON UPDATE CASCADE ON DELETE NO ACTION,
    FOREIGN KEY (`category`) REFERENCES `lb_news_categories`(`category`) ON UPDATE CASCADE ON DELETE NO ACTION
);
