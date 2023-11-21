CREATE TABLE `category` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name_category` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`id`)
) 

CREATE TABLE `news` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `text` text CHARACTER SET utf8mb4 NULL,
  `category` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category` (`name_category`),
  CONSTRAINT `fk_news_category` FOREIGN KEY (`news_category`) REFERENCES `category` (`id`)
)

CREATE TABLE `news_comments` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `comments` text CHARACTER SET utf8mb4 NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `news_id` int(10) NOT NULL,
  `date` DATE NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `news_id` (`news_id`),
  CONSTRAINT `fk_news_comments_news` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`),
  CONSTRAINT `fk_news_comments_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
)

CREATE TABLE `rate` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `date` DATE NOT NULL,
  `user_id` int(10) NOT NULL,
  `news_id` int(10) NOT NULL,
  `user_ip` varchar(45) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `news_id` (`news_id`),
  CONSTRAINT `fk_rate_news` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`),
  CONSTRAINT `fk_rate_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) 

CREATE TABLE `users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `user_ip` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_ip` (`user_ip`)
) 
