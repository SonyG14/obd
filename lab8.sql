CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL
)

CREATE TABLE Projects (
    project_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
)
CREATE TABLE Tasks (
    task_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    user_id INT,
    project_id INT,
    deadline DATE,
    status VARCHAR(50),
    priority INT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (project_id) REFERENCES Projects(project_id)
);

CREATE TABLE Task_Comments (
    comment_id INT PRIMARY KEY AUTO_INCREMENT,
    task_id INT,
    user_id INT,
    comment TEXT,
    comment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (task_id) REFERENCES Tasks(task_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);


CREATE TABLE Task_Users (
    task_user_id INT PRIMARY KEY AUTO_INCREMENT,
    task_id INT,
    user_id INT,
    FOREIGN KEY (task_id) REFERENCES Tasks(task_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
)

CREATE TABLE Files (
    file_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    url VARCHAR(255) NOT NULL,
    project_id INT,
    task_id INT,
    FOREIGN KEY (project_id) REFERENCES Projects(project_id),
    FOREIGN KEY (task_id) REFERENCES Tasks(task_id)
);

-- Додавання файлу до проекту--
INSERT INTO Files (file_name, file_url, project_id, task_id) VALUES ('Файл для проекту', 'http://example.com/projectfile', 1, NULL);

-- Додавання файлу до завдання--
INSERT INTO Files (file_name, file_url, project_id, task_id) VALUES ('Файл для завдання', 'http://example.com/taskfile', NULL, 1);

