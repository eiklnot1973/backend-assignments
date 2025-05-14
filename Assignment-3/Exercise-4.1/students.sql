CREATE TABLE `students` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `entrance_year` YEAR NOT NULL,
    `college_code` VARCHAR(2) NOT NULL,  -- 국내대학 학점교류학생은 단과대 코드가 KU이므로 VARCHAR(2)로 설정
    `student_number` INT NOT NULL,
    `major_dept` VARCHAR(16) NOT NULL,  -- 단과대 정보와 전공학과 정보는 다르고, 전과한 학생의 경우 학번에 나온 단과대와 실제 단과대가 다를 수 있으므로 중복된 정보가 아님
    `phone_number` VARCHAR(16),
    `address` VARCHAR(100),
    `cumulative_credits` INT NOT NULL DEFAULT 0,
    `gpa` FLOAT NOT NULL DEFAULT 0.0,
    `is_in_school` TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;