CREATE TABLE `students` (
    `name` VARCHAR(50) NOT NULL,
    `entrance_year` INT NOT NULL,
    `college_code` VARCHAR(2) NOT NULL,
    `student_number` INT NOT NULL,
    `major_dept` VARCHAR(16) NOT NULL,
    `phone_number` VARCHAR(16),
    `address` VARCHAR(100),
    `cumulative_credits` INT NOT NULL DEFAULT 0,
    `gpa` FLOAT NOT NULL DEFAULT 0.0,
    `is_in_school` TINYINT(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;