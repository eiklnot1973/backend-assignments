CREATE TABLE `users` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `user_id` VARCHAR(50) NOT NULL,
    `user_password` VARCHAR(50) NOT NULL,
    `user_nickname` VARCHAR(50) NOT NULL,
    `profile_image_url` VARCHAR(100),
    `profile_state_message` VARCHAR(300),
    `left_messenger` TINYINT(1) NOT NULL DEFAULT 0,
    `signup_date` DATE NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `channels` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `channel_name` VARCHAR(50) NOT NULL,
    `channel_creator` VARCHAR(50) NOT NULL,
    `channel_url` VARCHAR(100) NOT NULL,
    `maximum_members` INT NOT NULL,
    `left_messenger` TINYINT(1) NOT NULL DEFAULT 0,
    `channel_creation_date` DATE NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`channel_creator`) REFERENCES `users`(`user_id`) ON DELETE CASCADE,
    UNIQUE KEY (`channel_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `chats` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `chat_content` VARCHAR(300) NOT NULL,
    `chat_author` VARCHAR(50) NOT NULL,
    `chat_channel` VARCHAR(50) NOT NULL,
    `chat_creation_date` DATE NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`chat_author`) REFERENCES `users`(`user_id`) ON DELETE CASCADE,
    FOREIGN KEY (`chat_channel`) REFERENCES `channels`(`channel_name`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `follows` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `follower` VARCHAR(50) NOT NULL,
    `followee` VARCHAR(50) NOT NULL,
    `follow_date` DATE NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`follower`) REFERENCES `users`(`user_id`) ON DELETE CASCADE,
    FOREIGN KEY (`followee`) REFERENCES `users`(`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `blocks` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `user_who_blocked_other` VARCHAR(50) NOT NULL,
    `user_who_blocked_by_other` VARCHAR(50) NOT NULL,
    `block_date` DATE NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_who_blocked_other`) REFERENCES `users`(`user_id`) ON DELETE CASCADE,
    FOREIGN KEY (`user_who_blocked_by_other`) REFERENCES `users`(`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;